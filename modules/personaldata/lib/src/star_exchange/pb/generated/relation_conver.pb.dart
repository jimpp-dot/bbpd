///
//  Generated code. Do not modify.
//  source: relation_conver.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RelShop extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RelShop',
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
            : 'goodsType',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'goodsId',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeName')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sourceUrl')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'days',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RelShop._() : super();
  factory RelShop({
    $core.int? id,
    $core.int? goodsType,
    $core.int? goodsId,
    $core.String? typeName,
    $core.String? name,
    $core.String? sourceUrl,
    $core.int? starNum,
    $core.int? days,
    $core.int? num,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (goodsType != null) {
      _result.goodsType = goodsType;
    }
    if (goodsId != null) {
      _result.goodsId = goodsId;
    }
    if (typeName != null) {
      _result.typeName = typeName;
    }
    if (name != null) {
      _result.name = name;
    }
    if (sourceUrl != null) {
      _result.sourceUrl = sourceUrl;
    }
    if (starNum != null) {
      _result.starNum = starNum;
    }
    if (days != null) {
      _result.days = days;
    }
    if (num != null) {
      _result.num = num;
    }
    return _result;
  }
  factory RelShop.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RelShop.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RelShop clone() => RelShop()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RelShop copyWith(void Function(RelShop) updates) =>
      super.copyWith((message) => updates(message as RelShop))
          as RelShop; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RelShop create() => RelShop._();
  RelShop createEmptyInstance() => create();
  static $pb.PbList<RelShop> createRepeated() => $pb.PbList<RelShop>();
  @$core.pragma('dart2js:noInline')
  static RelShop getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RelShop>(create);
  static RelShop? _defaultInstance;

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
  $core.int get goodsType => $_getIZ(1);
  @$pb.TagNumber(2)
  set goodsType($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGoodsType() => $_has(1);
  @$pb.TagNumber(2)
  void clearGoodsType() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get goodsId => $_getIZ(2);
  @$pb.TagNumber(3)
  set goodsId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGoodsId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGoodsId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get typeName => $_getSZ(3);
  @$pb.TagNumber(4)
  set typeName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTypeName() => $_has(3);
  @$pb.TagNumber(4)
  void clearTypeName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get sourceUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set sourceUrl($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSourceUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearSourceUrl() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get starNum => $_getIZ(6);
  @$pb.TagNumber(7)
  set starNum($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasStarNum() => $_has(6);
  @$pb.TagNumber(7)
  void clearStarNum() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get days => $_getIZ(7);
  @$pb.TagNumber(8)
  set days($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDays() => $_has(7);
  @$pb.TagNumber(8)
  void clearDays() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get num => $_getIZ(8);
  @$pb.TagNumber(9)
  set num($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasNum() => $_has(8);
  @$pb.TagNumber(9)
  void clearNum() => clearField(9);
}

class RelConvertLog extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RelConvertLog',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fmtTime')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fmtConvert')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fmtStar')
    ..hasRequiredFields = false;

  RelConvertLog._() : super();
  factory RelConvertLog({
    $core.String? fmtTime,
    $core.String? fmtConvert,
    $core.String? fmtStar,
  }) {
    final _result = create();
    if (fmtTime != null) {
      _result.fmtTime = fmtTime;
    }
    if (fmtConvert != null) {
      _result.fmtConvert = fmtConvert;
    }
    if (fmtStar != null) {
      _result.fmtStar = fmtStar;
    }
    return _result;
  }
  factory RelConvertLog.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RelConvertLog.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RelConvertLog clone() => RelConvertLog()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RelConvertLog copyWith(void Function(RelConvertLog) updates) =>
      super.copyWith((message) => updates(message as RelConvertLog))
          as RelConvertLog; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RelConvertLog create() => RelConvertLog._();
  RelConvertLog createEmptyInstance() => create();
  static $pb.PbList<RelConvertLog> createRepeated() =>
      $pb.PbList<RelConvertLog>();
  @$core.pragma('dart2js:noInline')
  static RelConvertLog getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RelConvertLog>(create);
  static RelConvertLog? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fmtTime => $_getSZ(0);
  @$pb.TagNumber(1)
  set fmtTime($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFmtTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearFmtTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fmtConvert => $_getSZ(1);
  @$pb.TagNumber(2)
  set fmtConvert($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFmtConvert() => $_has(1);
  @$pb.TagNumber(2)
  void clearFmtConvert() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fmtStar => $_getSZ(2);
  @$pb.TagNumber(3)
  set fmtStar($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFmtStar() => $_has(2);
  @$pb.TagNumber(3)
  void clearFmtStar() => clearField(3);
}

class ConvertHomeData_TypeData_ShowItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConvertHomeData.TypeData.ShowItem',
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
            : 'goodsType',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'goodsId',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'buttonText')
    ..hasRequiredFields = false;

  ConvertHomeData_TypeData_ShowItem._() : super();
  factory ConvertHomeData_TypeData_ShowItem({
    $core.int? id,
    $core.int? goodsType,
    $core.int? goodsId,
    $core.String? icon,
    $core.String? desc,
    $core.String? buttonText,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (goodsType != null) {
      _result.goodsType = goodsType;
    }
    if (goodsId != null) {
      _result.goodsId = goodsId;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (buttonText != null) {
      _result.buttonText = buttonText;
    }
    return _result;
  }
  factory ConvertHomeData_TypeData_ShowItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConvertHomeData_TypeData_ShowItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConvertHomeData_TypeData_ShowItem clone() =>
      ConvertHomeData_TypeData_ShowItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConvertHomeData_TypeData_ShowItem copyWith(
          void Function(ConvertHomeData_TypeData_ShowItem) updates) =>
      super.copyWith((message) =>
              updates(message as ConvertHomeData_TypeData_ShowItem))
          as ConvertHomeData_TypeData_ShowItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConvertHomeData_TypeData_ShowItem create() =>
      ConvertHomeData_TypeData_ShowItem._();
  ConvertHomeData_TypeData_ShowItem createEmptyInstance() => create();
  static $pb.PbList<ConvertHomeData_TypeData_ShowItem> createRepeated() =>
      $pb.PbList<ConvertHomeData_TypeData_ShowItem>();
  @$core.pragma('dart2js:noInline')
  static ConvertHomeData_TypeData_ShowItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConvertHomeData_TypeData_ShowItem>(
          create);
  static ConvertHomeData_TypeData_ShowItem? _defaultInstance;

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
  $core.int get goodsType => $_getIZ(1);
  @$pb.TagNumber(2)
  set goodsType($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGoodsType() => $_has(1);
  @$pb.TagNumber(2)
  void clearGoodsType() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get goodsId => $_getIZ(2);
  @$pb.TagNumber(3)
  set goodsId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGoodsId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGoodsId() => clearField(3);

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
  $core.String get desc => $_getSZ(4);
  @$pb.TagNumber(5)
  set desc($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDesc() => $_has(4);
  @$pb.TagNumber(5)
  void clearDesc() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get buttonText => $_getSZ(5);
  @$pb.TagNumber(6)
  set buttonText($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasButtonText() => $_has(5);
  @$pb.TagNumber(6)
  void clearButtonText() => clearField(6);
}

class ConvertHomeData_TypeData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConvertHomeData.TypeData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeName')
    ..pc<ConvertHomeData_TypeData_ShowItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: ConvertHomeData_TypeData_ShowItem.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ConvertHomeData_TypeData._() : super();
  factory ConvertHomeData_TypeData({
    $core.String? typeName,
    $core.Iterable<ConvertHomeData_TypeData_ShowItem>? list,
    $core.int? typeId,
  }) {
    final _result = create();
    if (typeName != null) {
      _result.typeName = typeName;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (typeId != null) {
      _result.typeId = typeId;
    }
    return _result;
  }
  factory ConvertHomeData_TypeData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConvertHomeData_TypeData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConvertHomeData_TypeData clone() =>
      ConvertHomeData_TypeData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConvertHomeData_TypeData copyWith(
          void Function(ConvertHomeData_TypeData) updates) =>
      super.copyWith((message) => updates(message as ConvertHomeData_TypeData))
          as ConvertHomeData_TypeData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConvertHomeData_TypeData create() => ConvertHomeData_TypeData._();
  ConvertHomeData_TypeData createEmptyInstance() => create();
  static $pb.PbList<ConvertHomeData_TypeData> createRepeated() =>
      $pb.PbList<ConvertHomeData_TypeData>();
  @$core.pragma('dart2js:noInline')
  static ConvertHomeData_TypeData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConvertHomeData_TypeData>(create);
  static ConvertHomeData_TypeData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get typeName => $_getSZ(0);
  @$pb.TagNumber(1)
  set typeName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTypeName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTypeName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<ConvertHomeData_TypeData_ShowItem> get list => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get typeId => $_getIZ(2);
  @$pb.TagNumber(3)
  set typeId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTypeId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTypeId() => clearField(3);
}

class ConvertHomeData_CustomData_user extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConvertHomeData.CustomData.user',
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
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'relationName')
    ..hasRequiredFields = false;

  ConvertHomeData_CustomData_user._() : super();
  factory ConvertHomeData_CustomData_user({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? relationName,
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
    if (relationName != null) {
      _result.relationName = relationName;
    }
    return _result;
  }
  factory ConvertHomeData_CustomData_user.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConvertHomeData_CustomData_user.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConvertHomeData_CustomData_user clone() =>
      ConvertHomeData_CustomData_user()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConvertHomeData_CustomData_user copyWith(
          void Function(ConvertHomeData_CustomData_user) updates) =>
      super.copyWith(
              (message) => updates(message as ConvertHomeData_CustomData_user))
          as ConvertHomeData_CustomData_user; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConvertHomeData_CustomData_user create() =>
      ConvertHomeData_CustomData_user._();
  ConvertHomeData_CustomData_user createEmptyInstance() => create();
  static $pb.PbList<ConvertHomeData_CustomData_user> createRepeated() =>
      $pb.PbList<ConvertHomeData_CustomData_user>();
  @$core.pragma('dart2js:noInline')
  static ConvertHomeData_CustomData_user getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConvertHomeData_CustomData_user>(
          create);
  static ConvertHomeData_CustomData_user? _defaultInstance;

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
  $core.String get relationName => $_getSZ(3);
  @$pb.TagNumber(4)
  set relationName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRelationName() => $_has(3);
  @$pb.TagNumber(4)
  void clearRelationName() => clearField(4);
}

class ConvertHomeData_CustomData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConvertHomeData.CustomData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bg')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'reduceStarNum',
        $pb.PbFieldType.OU3)
    ..pc<ConvertHomeData_CustomData_user>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userList',
        $pb.PbFieldType.PM,
        subBuilder: ConvertHomeData_CustomData_user.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  ConvertHomeData_CustomData._() : super();
  factory ConvertHomeData_CustomData({
    $core.String? bg,
    $core.int? reduceStarNum,
    $core.Iterable<ConvertHomeData_CustomData_user>? userList,
    $core.String? desc,
  }) {
    final _result = create();
    if (bg != null) {
      _result.bg = bg;
    }
    if (reduceStarNum != null) {
      _result.reduceStarNum = reduceStarNum;
    }
    if (userList != null) {
      _result.userList.addAll(userList);
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory ConvertHomeData_CustomData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConvertHomeData_CustomData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConvertHomeData_CustomData clone() =>
      ConvertHomeData_CustomData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConvertHomeData_CustomData copyWith(
          void Function(ConvertHomeData_CustomData) updates) =>
      super.copyWith(
              (message) => updates(message as ConvertHomeData_CustomData))
          as ConvertHomeData_CustomData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConvertHomeData_CustomData create() => ConvertHomeData_CustomData._();
  ConvertHomeData_CustomData createEmptyInstance() => create();
  static $pb.PbList<ConvertHomeData_CustomData> createRepeated() =>
      $pb.PbList<ConvertHomeData_CustomData>();
  @$core.pragma('dart2js:noInline')
  static ConvertHomeData_CustomData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConvertHomeData_CustomData>(create);
  static ConvertHomeData_CustomData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bg => $_getSZ(0);
  @$pb.TagNumber(1)
  set bg($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBg() => $_has(0);
  @$pb.TagNumber(1)
  void clearBg() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get reduceStarNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set reduceStarNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasReduceStarNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearReduceStarNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<ConvertHomeData_CustomData_user> get userList => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get desc => $_getSZ(3);
  @$pb.TagNumber(4)
  set desc($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearDesc() => clearField(4);
}

class ConvertHomeData_CovertMy extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConvertHomeData.CovertMy',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expiredStarNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expiredTime',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ConvertHomeData_CovertMy._() : super();
  factory ConvertHomeData_CovertMy({
    $core.int? starNum,
    $core.int? expiredStarNum,
    $core.int? expiredTime,
  }) {
    final _result = create();
    if (starNum != null) {
      _result.starNum = starNum;
    }
    if (expiredStarNum != null) {
      _result.expiredStarNum = expiredStarNum;
    }
    if (expiredTime != null) {
      _result.expiredTime = expiredTime;
    }
    return _result;
  }
  factory ConvertHomeData_CovertMy.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConvertHomeData_CovertMy.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConvertHomeData_CovertMy clone() =>
      ConvertHomeData_CovertMy()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConvertHomeData_CovertMy copyWith(
          void Function(ConvertHomeData_CovertMy) updates) =>
      super.copyWith((message) => updates(message as ConvertHomeData_CovertMy))
          as ConvertHomeData_CovertMy; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConvertHomeData_CovertMy create() => ConvertHomeData_CovertMy._();
  ConvertHomeData_CovertMy createEmptyInstance() => create();
  static $pb.PbList<ConvertHomeData_CovertMy> createRepeated() =>
      $pb.PbList<ConvertHomeData_CovertMy>();
  @$core.pragma('dart2js:noInline')
  static ConvertHomeData_CovertMy getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConvertHomeData_CovertMy>(create);
  static ConvertHomeData_CovertMy? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get starNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set starNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStarNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearStarNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get expiredStarNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set expiredStarNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasExpiredStarNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpiredStarNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get expiredTime => $_getIZ(2);
  @$pb.TagNumber(3)
  set expiredTime($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasExpiredTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpiredTime() => clearField(3);
}

class ConvertHomeData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConvertHomeData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<ConvertHomeData_CovertMy>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'my',
        subBuilder: ConvertHomeData_CovertMy.create)
    ..pc<ConvertHomeData_TypeData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: ConvertHomeData_TypeData.create)
    ..aOM<ConvertHomeData_CustomData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'customData',
        subBuilder: ConvertHomeData_CustomData.create)
    ..hasRequiredFields = false;

  ConvertHomeData._() : super();
  factory ConvertHomeData({
    ConvertHomeData_CovertMy? my,
    $core.Iterable<ConvertHomeData_TypeData>? list,
    ConvertHomeData_CustomData? customData,
  }) {
    final _result = create();
    if (my != null) {
      _result.my = my;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (customData != null) {
      _result.customData = customData;
    }
    return _result;
  }
  factory ConvertHomeData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConvertHomeData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConvertHomeData clone() => ConvertHomeData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConvertHomeData copyWith(void Function(ConvertHomeData) updates) =>
      super.copyWith((message) => updates(message as ConvertHomeData))
          as ConvertHomeData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConvertHomeData create() => ConvertHomeData._();
  ConvertHomeData createEmptyInstance() => create();
  static $pb.PbList<ConvertHomeData> createRepeated() =>
      $pb.PbList<ConvertHomeData>();
  @$core.pragma('dart2js:noInline')
  static ConvertHomeData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConvertHomeData>(create);
  static ConvertHomeData? _defaultInstance;

  @$pb.TagNumber(1)
  ConvertHomeData_CovertMy get my => $_getN(0);
  @$pb.TagNumber(1)
  set my(ConvertHomeData_CovertMy v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMy() => $_has(0);
  @$pb.TagNumber(1)
  void clearMy() => clearField(1);
  @$pb.TagNumber(1)
  ConvertHomeData_CovertMy ensureMy() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<ConvertHomeData_TypeData> get list => $_getList(1);

  @$pb.TagNumber(3)
  ConvertHomeData_CustomData get customData => $_getN(2);
  @$pb.TagNumber(3)
  set customData(ConvertHomeData_CustomData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCustomData() => $_has(2);
  @$pb.TagNumber(3)
  void clearCustomData() => clearField(3);
  @$pb.TagNumber(3)
  ConvertHomeData_CustomData ensureCustomData() => $_ensure(2);
}

class RelConvertHomeRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RelConvertHomeRsp',
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
    ..aOM<ConvertHomeData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ConvertHomeData.create)
    ..hasRequiredFields = false;

  RelConvertHomeRsp._() : super();
  factory RelConvertHomeRsp({
    $core.bool? success,
    $core.String? msg,
    ConvertHomeData? data,
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
  factory RelConvertHomeRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RelConvertHomeRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RelConvertHomeRsp clone() => RelConvertHomeRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RelConvertHomeRsp copyWith(void Function(RelConvertHomeRsp) updates) =>
      super.copyWith((message) => updates(message as RelConvertHomeRsp))
          as RelConvertHomeRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RelConvertHomeRsp create() => RelConvertHomeRsp._();
  RelConvertHomeRsp createEmptyInstance() => create();
  static $pb.PbList<RelConvertHomeRsp> createRepeated() =>
      $pb.PbList<RelConvertHomeRsp>();
  @$core.pragma('dart2js:noInline')
  static RelConvertHomeRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RelConvertHomeRsp>(create);
  static RelConvertHomeRsp? _defaultInstance;

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
  ConvertHomeData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ConvertHomeData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ConvertHomeData ensureData() => $_ensure(2);
}

class RelConvertListRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RelConvertListRsp',
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
            : 'isMore')
    ..pc<RelShop>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RelShop.create)
    ..hasRequiredFields = false;

  RelConvertListRsp._() : super();
  factory RelConvertListRsp({
    $core.bool? success,
    $core.String? msg,
    $core.bool? isMore,
    $core.Iterable<RelShop>? list,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (isMore != null) {
      _result.isMore = isMore;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory RelConvertListRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RelConvertListRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RelConvertListRsp clone() => RelConvertListRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RelConvertListRsp copyWith(void Function(RelConvertListRsp) updates) =>
      super.copyWith((message) => updates(message as RelConvertListRsp))
          as RelConvertListRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RelConvertListRsp create() => RelConvertListRsp._();
  RelConvertListRsp createEmptyInstance() => create();
  static $pb.PbList<RelConvertListRsp> createRepeated() =>
      $pb.PbList<RelConvertListRsp>();
  @$core.pragma('dart2js:noInline')
  static RelConvertListRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RelConvertListRsp>(create);
  static RelConvertListRsp? _defaultInstance;

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
  $core.bool get isMore => $_getBF(2);
  @$pb.TagNumber(3)
  set isMore($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIsMore() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsMore() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<RelShop> get list => $_getList(3);
}

class RelConvertGoodsLogRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RelConvertGoodsLogRsp',
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
            : 'isMore')
    ..pc<RelConvertLog>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RelConvertLog.create)
    ..hasRequiredFields = false;

  RelConvertGoodsLogRsp._() : super();
  factory RelConvertGoodsLogRsp({
    $core.bool? success,
    $core.String? msg,
    $core.bool? isMore,
    $core.Iterable<RelConvertLog>? list,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (isMore != null) {
      _result.isMore = isMore;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory RelConvertGoodsLogRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RelConvertGoodsLogRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RelConvertGoodsLogRsp clone() =>
      RelConvertGoodsLogRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RelConvertGoodsLogRsp copyWith(
          void Function(RelConvertGoodsLogRsp) updates) =>
      super.copyWith((message) => updates(message as RelConvertGoodsLogRsp))
          as RelConvertGoodsLogRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RelConvertGoodsLogRsp create() => RelConvertGoodsLogRsp._();
  RelConvertGoodsLogRsp createEmptyInstance() => create();
  static $pb.PbList<RelConvertGoodsLogRsp> createRepeated() =>
      $pb.PbList<RelConvertGoodsLogRsp>();
  @$core.pragma('dart2js:noInline')
  static RelConvertGoodsLogRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RelConvertGoodsLogRsp>(create);
  static RelConvertGoodsLogRsp? _defaultInstance;

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
  $core.bool get isMore => $_getBF(2);
  @$pb.TagNumber(3)
  set isMore($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIsMore() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsMore() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<RelConvertLog> get list => $_getList(3);
}

class RelConvertGoodsRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RelConvertGoodsRsp',
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

  RelConvertGoodsRsp._() : super();
  factory RelConvertGoodsRsp({
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
  factory RelConvertGoodsRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RelConvertGoodsRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RelConvertGoodsRsp clone() => RelConvertGoodsRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RelConvertGoodsRsp copyWith(void Function(RelConvertGoodsRsp) updates) =>
      super.copyWith((message) => updates(message as RelConvertGoodsRsp))
          as RelConvertGoodsRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RelConvertGoodsRsp create() => RelConvertGoodsRsp._();
  RelConvertGoodsRsp createEmptyInstance() => create();
  static $pb.PbList<RelConvertGoodsRsp> createRepeated() =>
      $pb.PbList<RelConvertGoodsRsp>();
  @$core.pragma('dart2js:noInline')
  static RelConvertGoodsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RelConvertGoodsRsp>(create);
  static RelConvertGoodsRsp? _defaultInstance;

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
