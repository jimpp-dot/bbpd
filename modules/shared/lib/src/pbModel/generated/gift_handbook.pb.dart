///
//  Generated code. Do not modify.
//  source: gift_handbook.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GiftBookBriefInfoRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftBookBriefInfoRsp',
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
    ..aOM<GiftBookBriefInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GiftBookBriefInfo.create)
    ..hasRequiredFields = false;

  GiftBookBriefInfoRsp._() : super();
  factory GiftBookBriefInfoRsp({
    $core.bool? success,
    $core.String? msg,
    GiftBookBriefInfo? data,
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
  factory GiftBookBriefInfoRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftBookBriefInfoRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftBookBriefInfoRsp clone() =>
      GiftBookBriefInfoRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftBookBriefInfoRsp copyWith(void Function(GiftBookBriefInfoRsp) updates) =>
      super.copyWith((message) => updates(message as GiftBookBriefInfoRsp))
          as GiftBookBriefInfoRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftBookBriefInfoRsp create() => GiftBookBriefInfoRsp._();
  GiftBookBriefInfoRsp createEmptyInstance() => create();
  static $pb.PbList<GiftBookBriefInfoRsp> createRepeated() =>
      $pb.PbList<GiftBookBriefInfoRsp>();
  @$core.pragma('dart2js:noInline')
  static GiftBookBriefInfoRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftBookBriefInfoRsp>(create);
  static GiftBookBriefInfoRsp? _defaultInstance;

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
  GiftBookBriefInfo get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GiftBookBriefInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GiftBookBriefInfo ensureData() => $_ensure(2);
}

class GiftBookBriefInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftBookBriefInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lightNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awakeNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awakeTotal',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..pc<GiftQualityMeta>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelList',
        $pb.PbFieldType.PM,
        subBuilder: GiftQualityMeta.create)
    ..hasRequiredFields = false;

  GiftBookBriefInfo._() : super();
  factory GiftBookBriefInfo({
    $core.int? lightNum,
    $core.int? awakeNum,
    $core.int? total,
    $core.String? title,
    $core.int? rank,
    $core.int? awakeTotal,
    $core.String? icon,
    $core.Iterable<GiftQualityMeta>? levelList,
  }) {
    final _result = create();
    if (lightNum != null) {
      _result.lightNum = lightNum;
    }
    if (awakeNum != null) {
      _result.awakeNum = awakeNum;
    }
    if (total != null) {
      _result.total = total;
    }
    if (title != null) {
      _result.title = title;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (awakeTotal != null) {
      _result.awakeTotal = awakeTotal;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (levelList != null) {
      _result.levelList.addAll(levelList);
    }
    return _result;
  }
  factory GiftBookBriefInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftBookBriefInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftBookBriefInfo clone() => GiftBookBriefInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftBookBriefInfo copyWith(void Function(GiftBookBriefInfo) updates) =>
      super.copyWith((message) => updates(message as GiftBookBriefInfo))
          as GiftBookBriefInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftBookBriefInfo create() => GiftBookBriefInfo._();
  GiftBookBriefInfo createEmptyInstance() => create();
  static $pb.PbList<GiftBookBriefInfo> createRepeated() =>
      $pb.PbList<GiftBookBriefInfo>();
  @$core.pragma('dart2js:noInline')
  static GiftBookBriefInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftBookBriefInfo>(create);
  static GiftBookBriefInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get lightNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set lightNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLightNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearLightNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get awakeNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set awakeNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAwakeNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearAwakeNum() => clearField(2);

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
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get rank => $_getIZ(4);
  @$pb.TagNumber(5)
  set rank($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRank() => $_has(4);
  @$pb.TagNumber(5)
  void clearRank() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get awakeTotal => $_getIZ(5);
  @$pb.TagNumber(6)
  set awakeTotal($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAwakeTotal() => $_has(5);
  @$pb.TagNumber(6)
  void clearAwakeTotal() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get icon => $_getSZ(6);
  @$pb.TagNumber(7)
  set icon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearIcon() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<GiftQualityMeta> get levelList => $_getList(7);
}

class GiftBookUserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftBookUserInfo',
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
            : 'roomId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GiftBookUserInfo._() : super();
  factory GiftBookUserInfo({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? roomId,
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
    if (roomId != null) {
      _result.roomId = roomId;
    }
    return _result;
  }
  factory GiftBookUserInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftBookUserInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftBookUserInfo clone() => GiftBookUserInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftBookUserInfo copyWith(void Function(GiftBookUserInfo) updates) =>
      super.copyWith((message) => updates(message as GiftBookUserInfo))
          as GiftBookUserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftBookUserInfo create() => GiftBookUserInfo._();
  GiftBookUserInfo createEmptyInstance() => create();
  static $pb.PbList<GiftBookUserInfo> createRepeated() =>
      $pb.PbList<GiftBookUserInfo>();
  @$core.pragma('dart2js:noInline')
  static GiftBookUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftBookUserInfo>(create);
  static GiftBookUserInfo? _defaultInstance;

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
  $core.int get roomId => $_getIZ(3);
  @$pb.TagNumber(4)
  set roomId($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRoomId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomId() => clearField(4);
}

class SeriesMeta extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SeriesMeta',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typ')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lightNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'iconWebp')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  SeriesMeta._() : super();
  factory SeriesMeta({
    $core.String? typ,
    $core.String? icon,
    $core.int? lightNum,
    $core.int? total,
    $core.String? iconWebp,
    $core.String? name,
    $core.String? desc,
  }) {
    final _result = create();
    if (typ != null) {
      _result.typ = typ;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (lightNum != null) {
      _result.lightNum = lightNum;
    }
    if (total != null) {
      _result.total = total;
    }
    if (iconWebp != null) {
      _result.iconWebp = iconWebp;
    }
    if (name != null) {
      _result.name = name;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory SeriesMeta.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SeriesMeta.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SeriesMeta clone() => SeriesMeta()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SeriesMeta copyWith(void Function(SeriesMeta) updates) =>
      super.copyWith((message) => updates(message as SeriesMeta))
          as SeriesMeta; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SeriesMeta create() => SeriesMeta._();
  SeriesMeta createEmptyInstance() => create();
  static $pb.PbList<SeriesMeta> createRepeated() => $pb.PbList<SeriesMeta>();
  @$core.pragma('dart2js:noInline')
  static SeriesMeta getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SeriesMeta>(create);
  static SeriesMeta? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get typ => $_getSZ(0);
  @$pb.TagNumber(1)
  set typ($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTyp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTyp() => clearField(1);

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
  $core.int get lightNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set lightNum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLightNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearLightNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get total => $_getIZ(3);
  @$pb.TagNumber(4)
  set total($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTotal() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotal() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get iconWebp => $_getSZ(4);
  @$pb.TagNumber(5)
  set iconWebp($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIconWebp() => $_has(4);
  @$pb.TagNumber(5)
  void clearIconWebp() => clearField(5);

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
  $core.String get desc => $_getSZ(6);
  @$pb.TagNumber(7)
  set desc($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDesc() => $_has(6);
  @$pb.TagNumber(7)
  void clearDesc() => clearField(7);
}

class RuleMeta extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RuleMeta',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'k')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'val')
    ..hasRequiredFields = false;

  RuleMeta._() : super();
  factory RuleMeta({
    $core.String? k,
    $core.String? val,
  }) {
    final _result = create();
    if (k != null) {
      _result.k = k;
    }
    if (val != null) {
      _result.val = val;
    }
    return _result;
  }
  factory RuleMeta.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RuleMeta.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RuleMeta clone() => RuleMeta()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RuleMeta copyWith(void Function(RuleMeta) updates) =>
      super.copyWith((message) => updates(message as RuleMeta))
          as RuleMeta; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RuleMeta create() => RuleMeta._();
  RuleMeta createEmptyInstance() => create();
  static $pb.PbList<RuleMeta> createRepeated() => $pb.PbList<RuleMeta>();
  @$core.pragma('dart2js:noInline')
  static RuleMeta getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RuleMeta>(create);
  static RuleMeta? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get k => $_getSZ(0);
  @$pb.TagNumber(1)
  set k($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasK() => $_has(0);
  @$pb.TagNumber(1)
  void clearK() => clearField(1);

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
}

class GiftBookRuleInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftBookRuleInfo',
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
    ..pc<RuleMeta>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RuleMeta.create)
    ..hasRequiredFields = false;

  GiftBookRuleInfo._() : super();
  factory GiftBookRuleInfo({
    $core.String? title,
    $core.Iterable<RuleMeta>? list,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory GiftBookRuleInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftBookRuleInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftBookRuleInfo clone() => GiftBookRuleInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftBookRuleInfo copyWith(void Function(GiftBookRuleInfo) updates) =>
      super.copyWith((message) => updates(message as GiftBookRuleInfo))
          as GiftBookRuleInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftBookRuleInfo create() => GiftBookRuleInfo._();
  GiftBookRuleInfo createEmptyInstance() => create();
  static $pb.PbList<GiftBookRuleInfo> createRepeated() =>
      $pb.PbList<GiftBookRuleInfo>();
  @$core.pragma('dart2js:noInline')
  static GiftBookRuleInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftBookRuleInfo>(create);
  static GiftBookRuleInfo? _defaultInstance;

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
  $core.List<RuleMeta> get list => $_getList(1);
}

class GiftMeta extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftMeta',
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
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isOn')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'startNum',
        $pb.PbFieldType.OU3)
    ..aOM<GiftBookUserInfo>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'namingUser',
        subBuilder: GiftBookUserInfo.create)
    ..aOM<GiftBookUserInfo>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lightUser',
        subBuilder: GiftBookUserInfo.create)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awakeStatus',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOM<GiftBookRuleInfo>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ruleInfo',
        subBuilder: GiftBookRuleInfo.create)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lightTime',
        $pb.PbFieldType.OU3)
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelUpInfo')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awakeVapSize',
        $pb.PbFieldType.O3)
    ..aOB(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isCanSend')
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'qualityLevel',
        $pb.PbFieldType.OU3)
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'qualityName')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sourceDesc')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'seriesType')
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'eraserRemoveMoney',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'eraserRestoreMoney',
        $pb.PbFieldType.OU3)
    ..aOB(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isErased')
    ..hasRequiredFields = false;

  GiftMeta._() : super();
  factory GiftMeta({
    $core.int? id,
    $core.String? name,
    $core.String? icon,
    $core.int? num,
    $core.bool? isOn,
    $core.int? startNum,
    GiftBookUserInfo? namingUser,
    GiftBookUserInfo? lightUser,
    $core.int? awakeStatus,
    $core.int? price,
    GiftBookRuleInfo? ruleInfo,
    $core.int? lightTime,
    $core.String? levelUpInfo,
    $core.int? awakeVapSize,
    $core.bool? isCanSend,
    $core.int? qualityLevel,
    $core.String? qualityName,
    $core.String? sourceDesc,
    $core.String? seriesType,
    $core.int? eraserRemoveMoney,
    $core.int? eraserRestoreMoney,
    $core.bool? isErased,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (num != null) {
      _result.num = num;
    }
    if (isOn != null) {
      _result.isOn = isOn;
    }
    if (startNum != null) {
      _result.startNum = startNum;
    }
    if (namingUser != null) {
      _result.namingUser = namingUser;
    }
    if (lightUser != null) {
      _result.lightUser = lightUser;
    }
    if (awakeStatus != null) {
      _result.awakeStatus = awakeStatus;
    }
    if (price != null) {
      _result.price = price;
    }
    if (ruleInfo != null) {
      _result.ruleInfo = ruleInfo;
    }
    if (lightTime != null) {
      _result.lightTime = lightTime;
    }
    if (levelUpInfo != null) {
      _result.levelUpInfo = levelUpInfo;
    }
    if (awakeVapSize != null) {
      _result.awakeVapSize = awakeVapSize;
    }
    if (isCanSend != null) {
      _result.isCanSend = isCanSend;
    }
    if (qualityLevel != null) {
      _result.qualityLevel = qualityLevel;
    }
    if (qualityName != null) {
      _result.qualityName = qualityName;
    }
    if (sourceDesc != null) {
      _result.sourceDesc = sourceDesc;
    }
    if (seriesType != null) {
      _result.seriesType = seriesType;
    }
    if (eraserRemoveMoney != null) {
      _result.eraserRemoveMoney = eraserRemoveMoney;
    }
    if (eraserRestoreMoney != null) {
      _result.eraserRestoreMoney = eraserRestoreMoney;
    }
    if (isErased != null) {
      _result.isErased = isErased;
    }
    return _result;
  }
  factory GiftMeta.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftMeta.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftMeta clone() => GiftMeta()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftMeta copyWith(void Function(GiftMeta) updates) =>
      super.copyWith((message) => updates(message as GiftMeta))
          as GiftMeta; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftMeta create() => GiftMeta._();
  GiftMeta createEmptyInstance() => create();
  static $pb.PbList<GiftMeta> createRepeated() => $pb.PbList<GiftMeta>();
  @$core.pragma('dart2js:noInline')
  static GiftMeta getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GiftMeta>(create);
  static GiftMeta? _defaultInstance;

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
  $core.bool get isOn => $_getBF(4);
  @$pb.TagNumber(5)
  set isOn($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIsOn() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsOn() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get startNum => $_getIZ(5);
  @$pb.TagNumber(6)
  set startNum($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasStartNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearStartNum() => clearField(6);

  @$pb.TagNumber(7)
  GiftBookUserInfo get namingUser => $_getN(6);
  @$pb.TagNumber(7)
  set namingUser(GiftBookUserInfo v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasNamingUser() => $_has(6);
  @$pb.TagNumber(7)
  void clearNamingUser() => clearField(7);
  @$pb.TagNumber(7)
  GiftBookUserInfo ensureNamingUser() => $_ensure(6);

  @$pb.TagNumber(8)
  GiftBookUserInfo get lightUser => $_getN(7);
  @$pb.TagNumber(8)
  set lightUser(GiftBookUserInfo v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLightUser() => $_has(7);
  @$pb.TagNumber(8)
  void clearLightUser() => clearField(8);
  @$pb.TagNumber(8)
  GiftBookUserInfo ensureLightUser() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.int get awakeStatus => $_getIZ(8);
  @$pb.TagNumber(9)
  set awakeStatus($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasAwakeStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearAwakeStatus() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get price => $_getIZ(9);
  @$pb.TagNumber(10)
  set price($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasPrice() => $_has(9);
  @$pb.TagNumber(10)
  void clearPrice() => clearField(10);

  @$pb.TagNumber(11)
  GiftBookRuleInfo get ruleInfo => $_getN(10);
  @$pb.TagNumber(11)
  set ruleInfo(GiftBookRuleInfo v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasRuleInfo() => $_has(10);
  @$pb.TagNumber(11)
  void clearRuleInfo() => clearField(11);
  @$pb.TagNumber(11)
  GiftBookRuleInfo ensureRuleInfo() => $_ensure(10);

  @$pb.TagNumber(12)
  $core.int get lightTime => $_getIZ(11);
  @$pb.TagNumber(12)
  set lightTime($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasLightTime() => $_has(11);
  @$pb.TagNumber(12)
  void clearLightTime() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get levelUpInfo => $_getSZ(12);
  @$pb.TagNumber(13)
  set levelUpInfo($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasLevelUpInfo() => $_has(12);
  @$pb.TagNumber(13)
  void clearLevelUpInfo() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get awakeVapSize => $_getIZ(13);
  @$pb.TagNumber(14)
  set awakeVapSize($core.int v) {
    $_setSignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasAwakeVapSize() => $_has(13);
  @$pb.TagNumber(14)
  void clearAwakeVapSize() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get isCanSend => $_getBF(14);
  @$pb.TagNumber(15)
  set isCanSend($core.bool v) {
    $_setBool(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasIsCanSend() => $_has(14);
  @$pb.TagNumber(15)
  void clearIsCanSend() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get qualityLevel => $_getIZ(15);
  @$pb.TagNumber(16)
  set qualityLevel($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasQualityLevel() => $_has(15);
  @$pb.TagNumber(16)
  void clearQualityLevel() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get qualityName => $_getSZ(16);
  @$pb.TagNumber(17)
  set qualityName($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasQualityName() => $_has(16);
  @$pb.TagNumber(17)
  void clearQualityName() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get sourceDesc => $_getSZ(17);
  @$pb.TagNumber(18)
  set sourceDesc($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasSourceDesc() => $_has(17);
  @$pb.TagNumber(18)
  void clearSourceDesc() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get seriesType => $_getSZ(18);
  @$pb.TagNumber(19)
  set seriesType($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasSeriesType() => $_has(18);
  @$pb.TagNumber(19)
  void clearSeriesType() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get eraserRemoveMoney => $_getIZ(19);
  @$pb.TagNumber(20)
  set eraserRemoveMoney($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasEraserRemoveMoney() => $_has(19);
  @$pb.TagNumber(20)
  void clearEraserRemoveMoney() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get eraserRestoreMoney => $_getIZ(20);
  @$pb.TagNumber(21)
  set eraserRestoreMoney($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasEraserRestoreMoney() => $_has(20);
  @$pb.TagNumber(21)
  void clearEraserRestoreMoney() => clearField(21);

  @$pb.TagNumber(22)
  $core.bool get isErased => $_getBF(21);
  @$pb.TagNumber(22)
  set isErased($core.bool v) {
    $_setBool(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasIsErased() => $_has(21);
  @$pb.TagNumber(22)
  void clearIsErased() => clearField(22);
}

class GiftQualityMeta extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftQualityMeta',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'qualityName')
    ..hasRequiredFields = false;

  GiftQualityMeta._() : super();
  factory GiftQualityMeta({
    $core.int? num,
    $core.int? total,
    $core.String? qualityName,
  }) {
    final _result = create();
    if (num != null) {
      _result.num = num;
    }
    if (total != null) {
      _result.total = total;
    }
    if (qualityName != null) {
      _result.qualityName = qualityName;
    }
    return _result;
  }
  factory GiftQualityMeta.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftQualityMeta.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftQualityMeta clone() => GiftQualityMeta()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftQualityMeta copyWith(void Function(GiftQualityMeta) updates) =>
      super.copyWith((message) => updates(message as GiftQualityMeta))
          as GiftQualityMeta; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftQualityMeta create() => GiftQualityMeta._();
  GiftQualityMeta createEmptyInstance() => create();
  static $pb.PbList<GiftQualityMeta> createRepeated() =>
      $pb.PbList<GiftQualityMeta>();
  @$core.pragma('dart2js:noInline')
  static GiftQualityMeta getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftQualityMeta>(create);
  static GiftQualityMeta? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get num => $_getIZ(0);
  @$pb.TagNumber(1)
  set num($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get qualityName => $_getSZ(2);
  @$pb.TagNumber(3)
  set qualityName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasQualityName() => $_has(2);
  @$pb.TagNumber(3)
  void clearQualityName() => clearField(3);
}

class GiftBookLevelExp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftBookLevelExp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextLevelName')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'curLevel')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  GiftBookLevelExp._() : super();
  factory GiftBookLevelExp({
    $core.int? score,
    $core.int? total,
    $core.String? nextLevelName,
    $core.String? curLevel,
    $core.String? icon,
  }) {
    final _result = create();
    if (score != null) {
      _result.score = score;
    }
    if (total != null) {
      _result.total = total;
    }
    if (nextLevelName != null) {
      _result.nextLevelName = nextLevelName;
    }
    if (curLevel != null) {
      _result.curLevel = curLevel;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory GiftBookLevelExp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftBookLevelExp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftBookLevelExp clone() => GiftBookLevelExp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftBookLevelExp copyWith(void Function(GiftBookLevelExp) updates) =>
      super.copyWith((message) => updates(message as GiftBookLevelExp))
          as GiftBookLevelExp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftBookLevelExp create() => GiftBookLevelExp._();
  GiftBookLevelExp createEmptyInstance() => create();
  static $pb.PbList<GiftBookLevelExp> createRepeated() =>
      $pb.PbList<GiftBookLevelExp>();
  @$core.pragma('dart2js:noInline')
  static GiftBookLevelExp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftBookLevelExp>(create);
  static GiftBookLevelExp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get score => $_getIZ(0);
  @$pb.TagNumber(1)
  set score($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasScore() => $_has(0);
  @$pb.TagNumber(1)
  void clearScore() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get nextLevelName => $_getSZ(2);
  @$pb.TagNumber(3)
  set nextLevelName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNextLevelName() => $_has(2);
  @$pb.TagNumber(3)
  void clearNextLevelName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get curLevel => $_getSZ(3);
  @$pb.TagNumber(4)
  set curLevel($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCurLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurLevel() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);
}

class GiftHandbookHomeRsp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftHandbookHomeRsp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typ')
    ..aOM<GiftBookUserInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'me',
        subBuilder: GiftBookUserInfo.create)
    ..aOM<GiftBookBriefInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'briefInfo',
        subBuilder: GiftBookBriefInfo.create)
    ..pc<SeriesMeta>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'seriesList',
        $pb.PbFieldType.PM,
        subBuilder: SeriesMeta.create)
    ..m<$core.int, GiftBookRuleInfo>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ruleInfoMap',
        entryClassName: 'GiftHandbookHomeRsp.Data.RuleInfoMapEntry',
        keyFieldType: $pb.PbFieldType.OU3,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: GiftBookRuleInfo.create,
        packageName: const $pb.PackageName('pb'))
    ..pc<GiftQualityMeta>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelList',
        $pb.PbFieldType.PM,
        subBuilder: GiftQualityMeta.create)
    ..aOM<GiftBookLevelExp>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelExp',
        subBuilder: GiftBookLevelExp.create)
    ..pc<GiftBookUserInfo>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankTop',
        $pb.PbFieldType.PM,
        subBuilder: GiftBookUserInfo.create)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankUrl')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ruleUrl')
    ..aOB(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isCanSelect')
    ..aOB(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isHideIntimateList')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'intimateUrl')
    ..aOB(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'canAwakeReward')
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awakeRewardToast')
    ..aOB(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awakeRoadSwitchOn')
    ..hasRequiredFields = false;

  GiftHandbookHomeRsp_Data._() : super();
  factory GiftHandbookHomeRsp_Data({
    $core.String? typ,
    GiftBookUserInfo? me,
    GiftBookBriefInfo? briefInfo,
    $core.Iterable<SeriesMeta>? seriesList,
    $core.Map<$core.int, GiftBookRuleInfo>? ruleInfoMap,
    $core.Iterable<GiftQualityMeta>? levelList,
    GiftBookLevelExp? levelExp,
    $core.Iterable<GiftBookUserInfo>? rankTop,
    $core.String? rankUrl,
    $core.String? ruleUrl,
    $core.bool? isCanSelect,
    $core.bool? isHideIntimateList,
    $core.String? intimateUrl,
    $core.bool? canAwakeReward,
    $core.String? awakeRewardToast,
    $core.bool? awakeRoadSwitchOn,
  }) {
    final _result = create();
    if (typ != null) {
      _result.typ = typ;
    }
    if (me != null) {
      _result.me = me;
    }
    if (briefInfo != null) {
      _result.briefInfo = briefInfo;
    }
    if (seriesList != null) {
      _result.seriesList.addAll(seriesList);
    }
    if (ruleInfoMap != null) {
      _result.ruleInfoMap.addAll(ruleInfoMap);
    }
    if (levelList != null) {
      _result.levelList.addAll(levelList);
    }
    if (levelExp != null) {
      _result.levelExp = levelExp;
    }
    if (rankTop != null) {
      _result.rankTop.addAll(rankTop);
    }
    if (rankUrl != null) {
      _result.rankUrl = rankUrl;
    }
    if (ruleUrl != null) {
      _result.ruleUrl = ruleUrl;
    }
    if (isCanSelect != null) {
      _result.isCanSelect = isCanSelect;
    }
    if (isHideIntimateList != null) {
      _result.isHideIntimateList = isHideIntimateList;
    }
    if (intimateUrl != null) {
      _result.intimateUrl = intimateUrl;
    }
    if (canAwakeReward != null) {
      _result.canAwakeReward = canAwakeReward;
    }
    if (awakeRewardToast != null) {
      _result.awakeRewardToast = awakeRewardToast;
    }
    if (awakeRoadSwitchOn != null) {
      _result.awakeRoadSwitchOn = awakeRoadSwitchOn;
    }
    return _result;
  }
  factory GiftHandbookHomeRsp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftHandbookHomeRsp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftHandbookHomeRsp_Data clone() =>
      GiftHandbookHomeRsp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftHandbookHomeRsp_Data copyWith(
          void Function(GiftHandbookHomeRsp_Data) updates) =>
      super.copyWith((message) => updates(message as GiftHandbookHomeRsp_Data))
          as GiftHandbookHomeRsp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftHandbookHomeRsp_Data create() => GiftHandbookHomeRsp_Data._();
  GiftHandbookHomeRsp_Data createEmptyInstance() => create();
  static $pb.PbList<GiftHandbookHomeRsp_Data> createRepeated() =>
      $pb.PbList<GiftHandbookHomeRsp_Data>();
  @$core.pragma('dart2js:noInline')
  static GiftHandbookHomeRsp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftHandbookHomeRsp_Data>(create);
  static GiftHandbookHomeRsp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get typ => $_getSZ(0);
  @$pb.TagNumber(1)
  set typ($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTyp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTyp() => clearField(1);

  @$pb.TagNumber(2)
  GiftBookUserInfo get me => $_getN(1);
  @$pb.TagNumber(2)
  set me(GiftBookUserInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMe() => $_has(1);
  @$pb.TagNumber(2)
  void clearMe() => clearField(2);
  @$pb.TagNumber(2)
  GiftBookUserInfo ensureMe() => $_ensure(1);

  @$pb.TagNumber(3)
  GiftBookBriefInfo get briefInfo => $_getN(2);
  @$pb.TagNumber(3)
  set briefInfo(GiftBookBriefInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBriefInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearBriefInfo() => clearField(3);
  @$pb.TagNumber(3)
  GiftBookBriefInfo ensureBriefInfo() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<SeriesMeta> get seriesList => $_getList(3);

  @$pb.TagNumber(5)
  $core.Map<$core.int, GiftBookRuleInfo> get ruleInfoMap => $_getMap(4);

  @$pb.TagNumber(6)
  $core.List<GiftQualityMeta> get levelList => $_getList(5);

  @$pb.TagNumber(7)
  GiftBookLevelExp get levelExp => $_getN(6);
  @$pb.TagNumber(7)
  set levelExp(GiftBookLevelExp v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasLevelExp() => $_has(6);
  @$pb.TagNumber(7)
  void clearLevelExp() => clearField(7);
  @$pb.TagNumber(7)
  GiftBookLevelExp ensureLevelExp() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.List<GiftBookUserInfo> get rankTop => $_getList(7);

  @$pb.TagNumber(9)
  $core.String get rankUrl => $_getSZ(8);
  @$pb.TagNumber(9)
  set rankUrl($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasRankUrl() => $_has(8);
  @$pb.TagNumber(9)
  void clearRankUrl() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get ruleUrl => $_getSZ(9);
  @$pb.TagNumber(10)
  set ruleUrl($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasRuleUrl() => $_has(9);
  @$pb.TagNumber(10)
  void clearRuleUrl() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get isCanSelect => $_getBF(10);
  @$pb.TagNumber(11)
  set isCanSelect($core.bool v) {
    $_setBool(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasIsCanSelect() => $_has(10);
  @$pb.TagNumber(11)
  void clearIsCanSelect() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get isHideIntimateList => $_getBF(11);
  @$pb.TagNumber(12)
  set isHideIntimateList($core.bool v) {
    $_setBool(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasIsHideIntimateList() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsHideIntimateList() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get intimateUrl => $_getSZ(12);
  @$pb.TagNumber(13)
  set intimateUrl($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasIntimateUrl() => $_has(12);
  @$pb.TagNumber(13)
  void clearIntimateUrl() => clearField(13);

  @$pb.TagNumber(14)
  $core.bool get canAwakeReward => $_getBF(13);
  @$pb.TagNumber(14)
  set canAwakeReward($core.bool v) {
    $_setBool(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasCanAwakeReward() => $_has(13);
  @$pb.TagNumber(14)
  void clearCanAwakeReward() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get awakeRewardToast => $_getSZ(14);
  @$pb.TagNumber(15)
  set awakeRewardToast($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasAwakeRewardToast() => $_has(14);
  @$pb.TagNumber(15)
  void clearAwakeRewardToast() => clearField(15);

  @$pb.TagNumber(16)
  $core.bool get awakeRoadSwitchOn => $_getBF(15);
  @$pb.TagNumber(16)
  set awakeRoadSwitchOn($core.bool v) {
    $_setBool(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasAwakeRoadSwitchOn() => $_has(15);
  @$pb.TagNumber(16)
  void clearAwakeRoadSwitchOn() => clearField(16);
}

class GiftHandbookHomeRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftHandbookHomeRsp',
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
    ..aOM<GiftHandbookHomeRsp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GiftHandbookHomeRsp_Data.create)
    ..hasRequiredFields = false;

  GiftHandbookHomeRsp._() : super();
  factory GiftHandbookHomeRsp({
    $core.bool? success,
    $core.String? msg,
    GiftHandbookHomeRsp_Data? data,
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
  factory GiftHandbookHomeRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftHandbookHomeRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftHandbookHomeRsp clone() => GiftHandbookHomeRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftHandbookHomeRsp copyWith(void Function(GiftHandbookHomeRsp) updates) =>
      super.copyWith((message) => updates(message as GiftHandbookHomeRsp))
          as GiftHandbookHomeRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftHandbookHomeRsp create() => GiftHandbookHomeRsp._();
  GiftHandbookHomeRsp createEmptyInstance() => create();
  static $pb.PbList<GiftHandbookHomeRsp> createRepeated() =>
      $pb.PbList<GiftHandbookHomeRsp>();
  @$core.pragma('dart2js:noInline')
  static GiftHandbookHomeRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftHandbookHomeRsp>(create);
  static GiftHandbookHomeRsp? _defaultInstance;

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
  GiftHandbookHomeRsp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GiftHandbookHomeRsp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GiftHandbookHomeRsp_Data ensureData() => $_ensure(2);
}

class GiftHandbookGiftListRsp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftHandbookGiftListRsp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typ')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'seriesType')
    ..pc<GiftMeta>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftList',
        $pb.PbFieldType.PM,
        subBuilder: GiftMeta.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextPage',
        $pb.PbFieldType.O3)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasMore')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomId',
        $pb.PbFieldType.OU3)
    ..aOM<GiftMeta>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftInfo',
        subBuilder: GiftMeta.create)
    ..pPS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'richManAvatars')
    ..hasRequiredFields = false;

  GiftHandbookGiftListRsp_Data._() : super();
  factory GiftHandbookGiftListRsp_Data({
    $core.String? typ,
    $core.String? seriesType,
    $core.Iterable<GiftMeta>? giftList,
    $core.int? nextPage,
    $core.bool? hasMore,
    $core.int? roomId,
    GiftMeta? giftInfo,
    $core.Iterable<$core.String>? richManAvatars,
  }) {
    final _result = create();
    if (typ != null) {
      _result.typ = typ;
    }
    if (seriesType != null) {
      _result.seriesType = seriesType;
    }
    if (giftList != null) {
      _result.giftList.addAll(giftList);
    }
    if (nextPage != null) {
      _result.nextPage = nextPage;
    }
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (giftInfo != null) {
      _result.giftInfo = giftInfo;
    }
    if (richManAvatars != null) {
      _result.richManAvatars.addAll(richManAvatars);
    }
    return _result;
  }
  factory GiftHandbookGiftListRsp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftHandbookGiftListRsp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftHandbookGiftListRsp_Data clone() =>
      GiftHandbookGiftListRsp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftHandbookGiftListRsp_Data copyWith(
          void Function(GiftHandbookGiftListRsp_Data) updates) =>
      super.copyWith(
              (message) => updates(message as GiftHandbookGiftListRsp_Data))
          as GiftHandbookGiftListRsp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftHandbookGiftListRsp_Data create() =>
      GiftHandbookGiftListRsp_Data._();
  GiftHandbookGiftListRsp_Data createEmptyInstance() => create();
  static $pb.PbList<GiftHandbookGiftListRsp_Data> createRepeated() =>
      $pb.PbList<GiftHandbookGiftListRsp_Data>();
  @$core.pragma('dart2js:noInline')
  static GiftHandbookGiftListRsp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftHandbookGiftListRsp_Data>(create);
  static GiftHandbookGiftListRsp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get typ => $_getSZ(0);
  @$pb.TagNumber(1)
  set typ($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTyp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTyp() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get seriesType => $_getSZ(1);
  @$pb.TagNumber(2)
  set seriesType($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSeriesType() => $_has(1);
  @$pb.TagNumber(2)
  void clearSeriesType() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<GiftMeta> get giftList => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get nextPage => $_getIZ(3);
  @$pb.TagNumber(4)
  set nextPage($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNextPage() => $_has(3);
  @$pb.TagNumber(4)
  void clearNextPage() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get hasMore => $_getBF(4);
  @$pb.TagNumber(5)
  set hasMore($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHasMore() => $_has(4);
  @$pb.TagNumber(5)
  void clearHasMore() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get roomId => $_getIZ(5);
  @$pb.TagNumber(6)
  set roomId($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRoomId() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoomId() => clearField(6);

  @$pb.TagNumber(7)
  GiftMeta get giftInfo => $_getN(6);
  @$pb.TagNumber(7)
  set giftInfo(GiftMeta v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGiftInfo() => $_has(6);
  @$pb.TagNumber(7)
  void clearGiftInfo() => clearField(7);
  @$pb.TagNumber(7)
  GiftMeta ensureGiftInfo() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.List<$core.String> get richManAvatars => $_getList(7);
}

class GiftHandbookGiftListRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftHandbookGiftListRsp',
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
    ..aOM<GiftHandbookGiftListRsp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GiftHandbookGiftListRsp_Data.create)
    ..hasRequiredFields = false;

  GiftHandbookGiftListRsp._() : super();
  factory GiftHandbookGiftListRsp({
    $core.bool? success,
    $core.String? msg,
    GiftHandbookGiftListRsp_Data? data,
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
  factory GiftHandbookGiftListRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftHandbookGiftListRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftHandbookGiftListRsp clone() =>
      GiftHandbookGiftListRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftHandbookGiftListRsp copyWith(
          void Function(GiftHandbookGiftListRsp) updates) =>
      super.copyWith((message) => updates(message as GiftHandbookGiftListRsp))
          as GiftHandbookGiftListRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftHandbookGiftListRsp create() => GiftHandbookGiftListRsp._();
  GiftHandbookGiftListRsp createEmptyInstance() => create();
  static $pb.PbList<GiftHandbookGiftListRsp> createRepeated() =>
      $pb.PbList<GiftHandbookGiftListRsp>();
  @$core.pragma('dart2js:noInline')
  static GiftHandbookGiftListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftHandbookGiftListRsp>(create);
  static GiftHandbookGiftListRsp? _defaultInstance;

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
  GiftHandbookGiftListRsp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GiftHandbookGiftListRsp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GiftHandbookGiftListRsp_Data ensureData() => $_ensure(2);
}

class WealthyCollectorRankRsp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WealthyCollectorRankRsp.Data',
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
            : 'rank',
        $pb.PbFieldType.O3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time')
    ..hasRequiredFields = false;

  WealthyCollectorRankRsp_Data._() : super();
  factory WealthyCollectorRankRsp_Data({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? rank,
    $core.String? time,
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
    if (rank != null) {
      _result.rank = rank;
    }
    if (time != null) {
      _result.time = time;
    }
    return _result;
  }
  factory WealthyCollectorRankRsp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WealthyCollectorRankRsp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WealthyCollectorRankRsp_Data clone() =>
      WealthyCollectorRankRsp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WealthyCollectorRankRsp_Data copyWith(
          void Function(WealthyCollectorRankRsp_Data) updates) =>
      super.copyWith(
              (message) => updates(message as WealthyCollectorRankRsp_Data))
          as WealthyCollectorRankRsp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WealthyCollectorRankRsp_Data create() =>
      WealthyCollectorRankRsp_Data._();
  WealthyCollectorRankRsp_Data createEmptyInstance() => create();
  static $pb.PbList<WealthyCollectorRankRsp_Data> createRepeated() =>
      $pb.PbList<WealthyCollectorRankRsp_Data>();
  @$core.pragma('dart2js:noInline')
  static WealthyCollectorRankRsp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WealthyCollectorRankRsp_Data>(create);
  static WealthyCollectorRankRsp_Data? _defaultInstance;

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
  $core.int get rank => $_getIZ(3);
  @$pb.TagNumber(4)
  set rank($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRank() => $_has(3);
  @$pb.TagNumber(4)
  void clearRank() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get time => $_getSZ(4);
  @$pb.TagNumber(5)
  set time($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearTime() => clearField(5);
}

class WealthyCollectorRankRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WealthyCollectorRankRsp',
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
    ..pc<WealthyCollectorRankRsp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: WealthyCollectorRankRsp_Data.create)
    ..hasRequiredFields = false;

  WealthyCollectorRankRsp._() : super();
  factory WealthyCollectorRankRsp({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<WealthyCollectorRankRsp_Data>? data,
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
  factory WealthyCollectorRankRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WealthyCollectorRankRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WealthyCollectorRankRsp clone() =>
      WealthyCollectorRankRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WealthyCollectorRankRsp copyWith(
          void Function(WealthyCollectorRankRsp) updates) =>
      super.copyWith((message) => updates(message as WealthyCollectorRankRsp))
          as WealthyCollectorRankRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WealthyCollectorRankRsp create() => WealthyCollectorRankRsp._();
  WealthyCollectorRankRsp createEmptyInstance() => create();
  static $pb.PbList<WealthyCollectorRankRsp> createRepeated() =>
      $pb.PbList<WealthyCollectorRankRsp>();
  @$core.pragma('dart2js:noInline')
  static WealthyCollectorRankRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WealthyCollectorRankRsp>(create);
  static WealthyCollectorRankRsp? _defaultInstance;

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
  $core.List<WealthyCollectorRankRsp_Data> get data => $_getList(2);
}

class GiftBookAwakeRsp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftBookAwakeRsp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'effectUrl')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'effectSize',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toast')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelNew',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GiftBookAwakeRsp_Data._() : super();
  factory GiftBookAwakeRsp_Data({
    $core.String? effectUrl,
    $core.int? effectSize,
    $core.String? toast,
    $core.int? levelNew,
  }) {
    final _result = create();
    if (effectUrl != null) {
      _result.effectUrl = effectUrl;
    }
    if (effectSize != null) {
      _result.effectSize = effectSize;
    }
    if (toast != null) {
      _result.toast = toast;
    }
    if (levelNew != null) {
      _result.levelNew = levelNew;
    }
    return _result;
  }
  factory GiftBookAwakeRsp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftBookAwakeRsp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftBookAwakeRsp_Data clone() =>
      GiftBookAwakeRsp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftBookAwakeRsp_Data copyWith(
          void Function(GiftBookAwakeRsp_Data) updates) =>
      super.copyWith((message) => updates(message as GiftBookAwakeRsp_Data))
          as GiftBookAwakeRsp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftBookAwakeRsp_Data create() => GiftBookAwakeRsp_Data._();
  GiftBookAwakeRsp_Data createEmptyInstance() => create();
  static $pb.PbList<GiftBookAwakeRsp_Data> createRepeated() =>
      $pb.PbList<GiftBookAwakeRsp_Data>();
  @$core.pragma('dart2js:noInline')
  static GiftBookAwakeRsp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftBookAwakeRsp_Data>(create);
  static GiftBookAwakeRsp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get effectUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set effectUrl($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEffectUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearEffectUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get effectSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set effectSize($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEffectSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearEffectSize() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get toast => $_getSZ(2);
  @$pb.TagNumber(3)
  set toast($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasToast() => $_has(2);
  @$pb.TagNumber(3)
  void clearToast() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get levelNew => $_getIZ(3);
  @$pb.TagNumber(4)
  set levelNew($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLevelNew() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevelNew() => clearField(4);
}

class GiftBookAwakeRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GiftBookAwakeRsp',
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
    ..aOM<GiftBookAwakeRsp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GiftBookAwakeRsp_Data.create)
    ..hasRequiredFields = false;

  GiftBookAwakeRsp._() : super();
  factory GiftBookAwakeRsp({
    $core.bool? success,
    $core.String? msg,
    GiftBookAwakeRsp_Data? data,
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
  factory GiftBookAwakeRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GiftBookAwakeRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GiftBookAwakeRsp clone() => GiftBookAwakeRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GiftBookAwakeRsp copyWith(void Function(GiftBookAwakeRsp) updates) =>
      super.copyWith((message) => updates(message as GiftBookAwakeRsp))
          as GiftBookAwakeRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GiftBookAwakeRsp create() => GiftBookAwakeRsp._();
  GiftBookAwakeRsp createEmptyInstance() => create();
  static $pb.PbList<GiftBookAwakeRsp> createRepeated() =>
      $pb.PbList<GiftBookAwakeRsp>();
  @$core.pragma('dart2js:noInline')
  static GiftBookAwakeRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftBookAwakeRsp>(create);
  static GiftBookAwakeRsp? _defaultInstance;

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
  GiftBookAwakeRsp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GiftBookAwakeRsp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GiftBookAwakeRsp_Data ensureData() => $_ensure(2);
}

class CommonRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CommonRsp',
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
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'code')
    ..hasRequiredFields = false;

  CommonRsp._() : super();
  factory CommonRsp({
    $core.bool? success,
    $core.String? msg,
    $core.String? code,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (code != null) {
      _result.code = code;
    }
    return _result;
  }
  factory CommonRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommonRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommonRsp clone() => CommonRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommonRsp copyWith(void Function(CommonRsp) updates) =>
      super.copyWith((message) => updates(message as CommonRsp))
          as CommonRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommonRsp create() => CommonRsp._();
  CommonRsp createEmptyInstance() => create();
  static $pb.PbList<CommonRsp> createRepeated() => $pb.PbList<CommonRsp>();
  @$core.pragma('dart2js:noInline')
  static CommonRsp getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CommonRsp>(create);
  static CommonRsp? _defaultInstance;

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
  $core.String get code => $_getSZ(2);
  @$pb.TagNumber(3)
  set code($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearCode() => clearField(3);
}

class AwakeTaskRsp_Data_Reward extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AwakeTaskRsp.Data.Reward',
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
            : 'gid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AwakeTaskRsp_Data_Reward._() : super();
  factory AwakeTaskRsp_Data_Reward({
    $core.int? cid,
    $core.String? name,
    $core.String? icon,
    $core.int? gid,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (gid != null) {
      _result.gid = gid;
    }
    return _result;
  }
  factory AwakeTaskRsp_Data_Reward.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AwakeTaskRsp_Data_Reward.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AwakeTaskRsp_Data_Reward clone() =>
      AwakeTaskRsp_Data_Reward()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AwakeTaskRsp_Data_Reward copyWith(
          void Function(AwakeTaskRsp_Data_Reward) updates) =>
      super.copyWith((message) => updates(message as AwakeTaskRsp_Data_Reward))
          as AwakeTaskRsp_Data_Reward; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AwakeTaskRsp_Data_Reward create() => AwakeTaskRsp_Data_Reward._();
  AwakeTaskRsp_Data_Reward createEmptyInstance() => create();
  static $pb.PbList<AwakeTaskRsp_Data_Reward> createRepeated() =>
      $pb.PbList<AwakeTaskRsp_Data_Reward>();
  @$core.pragma('dart2js:noInline')
  static AwakeTaskRsp_Data_Reward getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AwakeTaskRsp_Data_Reward>(create);
  static AwakeTaskRsp_Data_Reward? _defaultInstance;

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
  $core.int get gid => $_getIZ(3);
  @$pb.TagNumber(4)
  set gid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGid() => $_has(3);
  @$pb.TagNumber(4)
  void clearGid() => clearField(4);
}

class AwakeTaskRsp_Data_LevelTaskItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AwakeTaskRsp.Data.LevelTaskItem',
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
            : 'awakeNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewardNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewardState',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AwakeTaskRsp_Data_LevelTaskItem._() : super();
  factory AwakeTaskRsp_Data_LevelTaskItem({
    $core.int? level,
    $core.int? awakeNum,
    $core.int? rewardNum,
    $core.int? rewardState,
  }) {
    final _result = create();
    if (level != null) {
      _result.level = level;
    }
    if (awakeNum != null) {
      _result.awakeNum = awakeNum;
    }
    if (rewardNum != null) {
      _result.rewardNum = rewardNum;
    }
    if (rewardState != null) {
      _result.rewardState = rewardState;
    }
    return _result;
  }
  factory AwakeTaskRsp_Data_LevelTaskItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AwakeTaskRsp_Data_LevelTaskItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AwakeTaskRsp_Data_LevelTaskItem clone() =>
      AwakeTaskRsp_Data_LevelTaskItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AwakeTaskRsp_Data_LevelTaskItem copyWith(
          void Function(AwakeTaskRsp_Data_LevelTaskItem) updates) =>
      super.copyWith(
              (message) => updates(message as AwakeTaskRsp_Data_LevelTaskItem))
          as AwakeTaskRsp_Data_LevelTaskItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AwakeTaskRsp_Data_LevelTaskItem create() =>
      AwakeTaskRsp_Data_LevelTaskItem._();
  AwakeTaskRsp_Data_LevelTaskItem createEmptyInstance() => create();
  static $pb.PbList<AwakeTaskRsp_Data_LevelTaskItem> createRepeated() =>
      $pb.PbList<AwakeTaskRsp_Data_LevelTaskItem>();
  @$core.pragma('dart2js:noInline')
  static AwakeTaskRsp_Data_LevelTaskItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AwakeTaskRsp_Data_LevelTaskItem>(
          create);
  static AwakeTaskRsp_Data_LevelTaskItem? _defaultInstance;

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
  $core.int get awakeNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set awakeNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAwakeNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearAwakeNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get rewardNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set rewardNum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRewardNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearRewardNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get rewardState => $_getIZ(3);
  @$pb.TagNumber(4)
  set rewardState($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRewardState() => $_has(3);
  @$pb.TagNumber(4)
  void clearRewardState() => clearField(4);
}

class AwakeTaskRsp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AwakeTaskRsp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<AwakeTaskRsp_Data_LevelTaskItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelTaskList',
        $pb.PbFieldType.PM,
        subBuilder: AwakeTaskRsp_Data_LevelTaskItem.create)
    ..aOM<AwakeTaskRsp_Data_Reward>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewardInfo',
        subBuilder: AwakeTaskRsp_Data_Reward.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awakeNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AwakeTaskRsp_Data._() : super();
  factory AwakeTaskRsp_Data({
    $core.Iterable<AwakeTaskRsp_Data_LevelTaskItem>? levelTaskList,
    AwakeTaskRsp_Data_Reward? rewardInfo,
    $core.int? awakeNum,
  }) {
    final _result = create();
    if (levelTaskList != null) {
      _result.levelTaskList.addAll(levelTaskList);
    }
    if (rewardInfo != null) {
      _result.rewardInfo = rewardInfo;
    }
    if (awakeNum != null) {
      _result.awakeNum = awakeNum;
    }
    return _result;
  }
  factory AwakeTaskRsp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AwakeTaskRsp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AwakeTaskRsp_Data clone() => AwakeTaskRsp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AwakeTaskRsp_Data copyWith(void Function(AwakeTaskRsp_Data) updates) =>
      super.copyWith((message) => updates(message as AwakeTaskRsp_Data))
          as AwakeTaskRsp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AwakeTaskRsp_Data create() => AwakeTaskRsp_Data._();
  AwakeTaskRsp_Data createEmptyInstance() => create();
  static $pb.PbList<AwakeTaskRsp_Data> createRepeated() =>
      $pb.PbList<AwakeTaskRsp_Data>();
  @$core.pragma('dart2js:noInline')
  static AwakeTaskRsp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AwakeTaskRsp_Data>(create);
  static AwakeTaskRsp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AwakeTaskRsp_Data_LevelTaskItem> get levelTaskList => $_getList(0);

  @$pb.TagNumber(2)
  AwakeTaskRsp_Data_Reward get rewardInfo => $_getN(1);
  @$pb.TagNumber(2)
  set rewardInfo(AwakeTaskRsp_Data_Reward v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRewardInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearRewardInfo() => clearField(2);
  @$pb.TagNumber(2)
  AwakeTaskRsp_Data_Reward ensureRewardInfo() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get awakeNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set awakeNum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAwakeNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearAwakeNum() => clearField(3);
}

class AwakeTaskRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AwakeTaskRsp',
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
    ..aOM<AwakeTaskRsp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AwakeTaskRsp_Data.create)
    ..hasRequiredFields = false;

  AwakeTaskRsp._() : super();
  factory AwakeTaskRsp({
    $core.bool? success,
    $core.String? msg,
    AwakeTaskRsp_Data? data,
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
  factory AwakeTaskRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AwakeTaskRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AwakeTaskRsp clone() => AwakeTaskRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AwakeTaskRsp copyWith(void Function(AwakeTaskRsp) updates) =>
      super.copyWith((message) => updates(message as AwakeTaskRsp))
          as AwakeTaskRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AwakeTaskRsp create() => AwakeTaskRsp._();
  AwakeTaskRsp createEmptyInstance() => create();
  static $pb.PbList<AwakeTaskRsp> createRepeated() =>
      $pb.PbList<AwakeTaskRsp>();
  @$core.pragma('dart2js:noInline')
  static AwakeTaskRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AwakeTaskRsp>(create);
  static AwakeTaskRsp? _defaultInstance;

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
  AwakeTaskRsp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AwakeTaskRsp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AwakeTaskRsp_Data ensureData() => $_ensure(2);
}

class LightJumpRsp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LightJumpRsp.Data',
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
    ..hasRequiredFields = false;

  LightJumpRsp_Data._() : super();
  factory LightJumpRsp_Data({
    $core.int? rid,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    return _result;
  }
  factory LightJumpRsp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LightJumpRsp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LightJumpRsp_Data clone() => LightJumpRsp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LightJumpRsp_Data copyWith(void Function(LightJumpRsp_Data) updates) =>
      super.copyWith((message) => updates(message as LightJumpRsp_Data))
          as LightJumpRsp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LightJumpRsp_Data create() => LightJumpRsp_Data._();
  LightJumpRsp_Data createEmptyInstance() => create();
  static $pb.PbList<LightJumpRsp_Data> createRepeated() =>
      $pb.PbList<LightJumpRsp_Data>();
  @$core.pragma('dart2js:noInline')
  static LightJumpRsp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LightJumpRsp_Data>(create);
  static LightJumpRsp_Data? _defaultInstance;

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
}

class LightJumpRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LightJumpRsp',
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
    ..aOM<LightJumpRsp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: LightJumpRsp_Data.create)
    ..hasRequiredFields = false;

  LightJumpRsp._() : super();
  factory LightJumpRsp({
    $core.bool? success,
    $core.String? msg,
    LightJumpRsp_Data? data,
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
  factory LightJumpRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LightJumpRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LightJumpRsp clone() => LightJumpRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LightJumpRsp copyWith(void Function(LightJumpRsp) updates) =>
      super.copyWith((message) => updates(message as LightJumpRsp))
          as LightJumpRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LightJumpRsp create() => LightJumpRsp._();
  LightJumpRsp createEmptyInstance() => create();
  static $pb.PbList<LightJumpRsp> createRepeated() =>
      $pb.PbList<LightJumpRsp>();
  @$core.pragma('dart2js:noInline')
  static LightJumpRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LightJumpRsp>(create);
  static LightJumpRsp? _defaultInstance;

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
  LightJumpRsp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(LightJumpRsp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  LightJumpRsp_Data ensureData() => $_ensure(2);
}

class AutoWakeInfoRsp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AutoWakeInfoRsp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftMoney',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AutoWakeInfoRsp_Data._() : super();
  factory AutoWakeInfoRsp_Data({
    $core.int? gid,
    $core.int? giftNum,
    $core.int? giftMoney,
  }) {
    final _result = create();
    if (gid != null) {
      _result.gid = gid;
    }
    if (giftNum != null) {
      _result.giftNum = giftNum;
    }
    if (giftMoney != null) {
      _result.giftMoney = giftMoney;
    }
    return _result;
  }
  factory AutoWakeInfoRsp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AutoWakeInfoRsp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AutoWakeInfoRsp_Data clone() =>
      AutoWakeInfoRsp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AutoWakeInfoRsp_Data copyWith(void Function(AutoWakeInfoRsp_Data) updates) =>
      super.copyWith((message) => updates(message as AutoWakeInfoRsp_Data))
          as AutoWakeInfoRsp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AutoWakeInfoRsp_Data create() => AutoWakeInfoRsp_Data._();
  AutoWakeInfoRsp_Data createEmptyInstance() => create();
  static $pb.PbList<AutoWakeInfoRsp_Data> createRepeated() =>
      $pb.PbList<AutoWakeInfoRsp_Data>();
  @$core.pragma('dart2js:noInline')
  static AutoWakeInfoRsp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AutoWakeInfoRsp_Data>(create);
  static AutoWakeInfoRsp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get gid => $_getIZ(0);
  @$pb.TagNumber(1)
  set gid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGid() => $_has(0);
  @$pb.TagNumber(1)
  void clearGid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get giftNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set giftNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGiftNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get giftMoney => $_getIZ(2);
  @$pb.TagNumber(3)
  set giftMoney($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGiftMoney() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftMoney() => clearField(3);
}

class AutoWakeInfoRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AutoWakeInfoRsp',
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
    ..aOM<AutoWakeInfoRsp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AutoWakeInfoRsp_Data.create)
    ..hasRequiredFields = false;

  AutoWakeInfoRsp._() : super();
  factory AutoWakeInfoRsp({
    $core.bool? success,
    $core.String? msg,
    AutoWakeInfoRsp_Data? data,
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
  factory AutoWakeInfoRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AutoWakeInfoRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AutoWakeInfoRsp clone() => AutoWakeInfoRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AutoWakeInfoRsp copyWith(void Function(AutoWakeInfoRsp) updates) =>
      super.copyWith((message) => updates(message as AutoWakeInfoRsp))
          as AutoWakeInfoRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AutoWakeInfoRsp create() => AutoWakeInfoRsp._();
  AutoWakeInfoRsp createEmptyInstance() => create();
  static $pb.PbList<AutoWakeInfoRsp> createRepeated() =>
      $pb.PbList<AutoWakeInfoRsp>();
  @$core.pragma('dart2js:noInline')
  static AutoWakeInfoRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AutoWakeInfoRsp>(create);
  static AutoWakeInfoRsp? _defaultInstance;

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
  AutoWakeInfoRsp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AutoWakeInfoRsp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AutoWakeInfoRsp_Data ensureData() => $_ensure(2);
}

class LightScoreHomeRsp_Data_UnlitGiftItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LightScoreHomeRsp.Data.UnlitGiftItem',
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
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'send')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'panelTab',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  LightScoreHomeRsp_Data_UnlitGiftItem._() : super();
  factory LightScoreHomeRsp_Data_UnlitGiftItem({
    $core.int? id,
    $core.String? name,
    $core.int? score,
    $core.String? url,
    $core.bool? send,
    $core.int? panelTab,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (score != null) {
      _result.score = score;
    }
    if (url != null) {
      _result.url = url;
    }
    if (send != null) {
      _result.send = send;
    }
    if (panelTab != null) {
      _result.panelTab = panelTab;
    }
    return _result;
  }
  factory LightScoreHomeRsp_Data_UnlitGiftItem.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LightScoreHomeRsp_Data_UnlitGiftItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LightScoreHomeRsp_Data_UnlitGiftItem clone() =>
      LightScoreHomeRsp_Data_UnlitGiftItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LightScoreHomeRsp_Data_UnlitGiftItem copyWith(
          void Function(LightScoreHomeRsp_Data_UnlitGiftItem) updates) =>
      super.copyWith((message) =>
              updates(message as LightScoreHomeRsp_Data_UnlitGiftItem))
          as LightScoreHomeRsp_Data_UnlitGiftItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LightScoreHomeRsp_Data_UnlitGiftItem create() =>
      LightScoreHomeRsp_Data_UnlitGiftItem._();
  LightScoreHomeRsp_Data_UnlitGiftItem createEmptyInstance() => create();
  static $pb.PbList<LightScoreHomeRsp_Data_UnlitGiftItem> createRepeated() =>
      $pb.PbList<LightScoreHomeRsp_Data_UnlitGiftItem>();
  @$core.pragma('dart2js:noInline')
  static LightScoreHomeRsp_Data_UnlitGiftItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          LightScoreHomeRsp_Data_UnlitGiftItem>(create);
  static LightScoreHomeRsp_Data_UnlitGiftItem? _defaultInstance;

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
  $core.int get score => $_getIZ(2);
  @$pb.TagNumber(3)
  set score($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearScore() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get url => $_getSZ(3);
  @$pb.TagNumber(4)
  set url($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get send => $_getBF(4);
  @$pb.TagNumber(5)
  set send($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSend() => $_has(4);
  @$pb.TagNumber(5)
  void clearSend() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get panelTab => $_getIZ(5);
  @$pb.TagNumber(6)
  set panelTab($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPanelTab() => $_has(5);
  @$pb.TagNumber(6)
  void clearPanelTab() => clearField(6);
}

class LightScoreHomeRsp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LightScoreHomeRsp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'selfScore',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalScore',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..pc<LightScoreHomeRsp_Data_UnlitGiftItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unlitList',
        $pb.PbFieldType.PM,
        subBuilder: LightScoreHomeRsp_Data_UnlitGiftItem.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpRid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  LightScoreHomeRsp_Data._() : super();
  factory LightScoreHomeRsp_Data({
    $core.int? selfScore,
    $core.int? totalScore,
    $core.String? description,
    $core.Iterable<LightScoreHomeRsp_Data_UnlitGiftItem>? unlitList,
    $core.int? jumpRid,
  }) {
    final _result = create();
    if (selfScore != null) {
      _result.selfScore = selfScore;
    }
    if (totalScore != null) {
      _result.totalScore = totalScore;
    }
    if (description != null) {
      _result.description = description;
    }
    if (unlitList != null) {
      _result.unlitList.addAll(unlitList);
    }
    if (jumpRid != null) {
      _result.jumpRid = jumpRid;
    }
    return _result;
  }
  factory LightScoreHomeRsp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LightScoreHomeRsp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LightScoreHomeRsp_Data clone() =>
      LightScoreHomeRsp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LightScoreHomeRsp_Data copyWith(
          void Function(LightScoreHomeRsp_Data) updates) =>
      super.copyWith((message) => updates(message as LightScoreHomeRsp_Data))
          as LightScoreHomeRsp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LightScoreHomeRsp_Data create() => LightScoreHomeRsp_Data._();
  LightScoreHomeRsp_Data createEmptyInstance() => create();
  static $pb.PbList<LightScoreHomeRsp_Data> createRepeated() =>
      $pb.PbList<LightScoreHomeRsp_Data>();
  @$core.pragma('dart2js:noInline')
  static LightScoreHomeRsp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LightScoreHomeRsp_Data>(create);
  static LightScoreHomeRsp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get selfScore => $_getIZ(0);
  @$pb.TagNumber(1)
  set selfScore($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSelfScore() => $_has(0);
  @$pb.TagNumber(1)
  void clearSelfScore() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get totalScore => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalScore($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTotalScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalScore() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<LightScoreHomeRsp_Data_UnlitGiftItem> get unlitList =>
      $_getList(3);

  @$pb.TagNumber(5)
  $core.int get jumpRid => $_getIZ(4);
  @$pb.TagNumber(5)
  set jumpRid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasJumpRid() => $_has(4);
  @$pb.TagNumber(5)
  void clearJumpRid() => clearField(5);
}

class LightScoreHomeRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LightScoreHomeRsp',
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
    ..aOM<LightScoreHomeRsp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: LightScoreHomeRsp_Data.create)
    ..hasRequiredFields = false;

  LightScoreHomeRsp._() : super();
  factory LightScoreHomeRsp({
    $core.bool? success,
    $core.String? msg,
    LightScoreHomeRsp_Data? data,
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
  factory LightScoreHomeRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LightScoreHomeRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LightScoreHomeRsp clone() => LightScoreHomeRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LightScoreHomeRsp copyWith(void Function(LightScoreHomeRsp) updates) =>
      super.copyWith((message) => updates(message as LightScoreHomeRsp))
          as LightScoreHomeRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LightScoreHomeRsp create() => LightScoreHomeRsp._();
  LightScoreHomeRsp createEmptyInstance() => create();
  static $pb.PbList<LightScoreHomeRsp> createRepeated() =>
      $pb.PbList<LightScoreHomeRsp>();
  @$core.pragma('dart2js:noInline')
  static LightScoreHomeRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LightScoreHomeRsp>(create);
  static LightScoreHomeRsp? _defaultInstance;

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
  LightScoreHomeRsp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(LightScoreHomeRsp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  LightScoreHomeRsp_Data ensureData() => $_ensure(2);
}

class LightScoreRankRsp_Data_Item extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LightScoreRankRsp.Data.Item',
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
            : 'score',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  LightScoreRankRsp_Data_Item._() : super();
  factory LightScoreRankRsp_Data_Item({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? score,
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
    if (score != null) {
      _result.score = score;
    }
    return _result;
  }
  factory LightScoreRankRsp_Data_Item.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LightScoreRankRsp_Data_Item.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LightScoreRankRsp_Data_Item clone() =>
      LightScoreRankRsp_Data_Item()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LightScoreRankRsp_Data_Item copyWith(
          void Function(LightScoreRankRsp_Data_Item) updates) =>
      super.copyWith(
              (message) => updates(message as LightScoreRankRsp_Data_Item))
          as LightScoreRankRsp_Data_Item; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LightScoreRankRsp_Data_Item create() =>
      LightScoreRankRsp_Data_Item._();
  LightScoreRankRsp_Data_Item createEmptyInstance() => create();
  static $pb.PbList<LightScoreRankRsp_Data_Item> createRepeated() =>
      $pb.PbList<LightScoreRankRsp_Data_Item>();
  @$core.pragma('dart2js:noInline')
  static LightScoreRankRsp_Data_Item getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LightScoreRankRsp_Data_Item>(create);
  static LightScoreRankRsp_Data_Item? _defaultInstance;

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
  $core.int get score => $_getIZ(3);
  @$pb.TagNumber(4)
  set score($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearScore() => clearField(4);
}

class LightScoreRankRsp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LightScoreRankRsp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<LightScoreRankRsp_Data_Item>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rankList',
        $pb.PbFieldType.PM,
        subBuilder: LightScoreRankRsp_Data_Item.create)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more')
    ..hasRequiredFields = false;

  LightScoreRankRsp_Data._() : super();
  factory LightScoreRankRsp_Data({
    $core.Iterable<LightScoreRankRsp_Data_Item>? rankList,
    $core.bool? more,
  }) {
    final _result = create();
    if (rankList != null) {
      _result.rankList.addAll(rankList);
    }
    if (more != null) {
      _result.more = more;
    }
    return _result;
  }
  factory LightScoreRankRsp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LightScoreRankRsp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LightScoreRankRsp_Data clone() =>
      LightScoreRankRsp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LightScoreRankRsp_Data copyWith(
          void Function(LightScoreRankRsp_Data) updates) =>
      super.copyWith((message) => updates(message as LightScoreRankRsp_Data))
          as LightScoreRankRsp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LightScoreRankRsp_Data create() => LightScoreRankRsp_Data._();
  LightScoreRankRsp_Data createEmptyInstance() => create();
  static $pb.PbList<LightScoreRankRsp_Data> createRepeated() =>
      $pb.PbList<LightScoreRankRsp_Data>();
  @$core.pragma('dart2js:noInline')
  static LightScoreRankRsp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LightScoreRankRsp_Data>(create);
  static LightScoreRankRsp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<LightScoreRankRsp_Data_Item> get rankList => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get more => $_getBF(1);
  @$pb.TagNumber(2)
  set more($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearMore() => clearField(2);
}

class LightScoreRankRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LightScoreRankRsp',
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
    ..aOM<LightScoreRankRsp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: LightScoreRankRsp_Data.create)
    ..hasRequiredFields = false;

  LightScoreRankRsp._() : super();
  factory LightScoreRankRsp({
    $core.bool? success,
    $core.String? msg,
    LightScoreRankRsp_Data? data,
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
  factory LightScoreRankRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LightScoreRankRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LightScoreRankRsp clone() => LightScoreRankRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LightScoreRankRsp copyWith(void Function(LightScoreRankRsp) updates) =>
      super.copyWith((message) => updates(message as LightScoreRankRsp))
          as LightScoreRankRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LightScoreRankRsp create() => LightScoreRankRsp._();
  LightScoreRankRsp createEmptyInstance() => create();
  static $pb.PbList<LightScoreRankRsp> createRepeated() =>
      $pb.PbList<LightScoreRankRsp>();
  @$core.pragma('dart2js:noInline')
  static LightScoreRankRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LightScoreRankRsp>(create);
  static LightScoreRankRsp? _defaultInstance;

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
  LightScoreRankRsp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(LightScoreRankRsp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  LightScoreRankRsp_Data ensureData() => $_ensure(2);
}
