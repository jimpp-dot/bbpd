///
//  Generated code. Do not modify.
//  source: common_invisible.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResInvisible extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResInvisible',
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
    ..aOM<InvisibleData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: InvisibleData.create)
    ..hasRequiredFields = false;

  ResInvisible._() : super();
  factory ResInvisible({
    $core.bool? success,
    $core.String? msg,
    InvisibleData? data,
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
  factory ResInvisible.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResInvisible.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResInvisible clone() => ResInvisible()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResInvisible copyWith(void Function(ResInvisible) updates) =>
      super.copyWith((message) => updates(message as ResInvisible))
          as ResInvisible; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResInvisible create() => ResInvisible._();
  ResInvisible createEmptyInstance() => create();
  static $pb.PbList<ResInvisible> createRepeated() =>
      $pb.PbList<ResInvisible>();
  @$core.pragma('dart2js:noInline')
  static ResInvisible getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResInvisible>(create);
  static ResInvisible? _defaultInstance;

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
  InvisibleData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(InvisibleData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  InvisibleData ensureData() => $_ensure(2);
}

class InvisibleData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'InvisibleData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'limited',
        $pb.PbFieldType.OU3)
    ..pc<InvisibleItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'myInvisibleList',
        $pb.PbFieldType.PM,
        subBuilder: InvisibleItem.create)
    ..pc<InvisiblePck>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'invisibleList',
        $pb.PbFieldType.PM,
        subBuilder: InvisiblePck.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defaultPackId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'progress',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  InvisibleData._() : super();
  factory InvisibleData({
    $core.int? limited,
    $core.Iterable<InvisibleItem>? myInvisibleList,
    $core.Iterable<InvisiblePck>? invisibleList,
    $core.int? defaultPackId,
    $core.int? progress,
  }) {
    final _result = create();
    if (limited != null) {
      _result.limited = limited;
    }
    if (myInvisibleList != null) {
      _result.myInvisibleList.addAll(myInvisibleList);
    }
    if (invisibleList != null) {
      _result.invisibleList.addAll(invisibleList);
    }
    if (defaultPackId != null) {
      _result.defaultPackId = defaultPackId;
    }
    if (progress != null) {
      _result.progress = progress;
    }
    return _result;
  }
  factory InvisibleData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory InvisibleData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  InvisibleData clone() => InvisibleData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  InvisibleData copyWith(void Function(InvisibleData) updates) =>
      super.copyWith((message) => updates(message as InvisibleData))
          as InvisibleData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InvisibleData create() => InvisibleData._();
  InvisibleData createEmptyInstance() => create();
  static $pb.PbList<InvisibleData> createRepeated() =>
      $pb.PbList<InvisibleData>();
  @$core.pragma('dart2js:noInline')
  static InvisibleData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InvisibleData>(create);
  static InvisibleData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get limited => $_getIZ(0);
  @$pb.TagNumber(1)
  set limited($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLimited() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimited() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<InvisibleItem> get myInvisibleList => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<InvisiblePck> get invisibleList => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get defaultPackId => $_getIZ(3);
  @$pb.TagNumber(4)
  set defaultPackId($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDefaultPackId() => $_has(3);
  @$pb.TagNumber(4)
  void clearDefaultPackId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get progress => $_getIZ(4);
  @$pb.TagNumber(5)
  set progress($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasProgress() => $_has(4);
  @$pb.TagNumber(5)
  void clearProgress() => clearField(5);
}

class InvisiblePck extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'InvisiblePck',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..pc<InvisibleItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'invisibleList',
        $pb.PbFieldType.PM,
        subBuilder: InvisibleItem.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pckType',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unit')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unitDays',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  InvisiblePck._() : super();
  factory InvisiblePck({
    $core.int? price,
    $core.Iterable<InvisibleItem>? invisibleList,
    $core.int? pckType,
    $core.String? name,
    $core.int? id,
    $core.String? desc,
    $core.String? unit,
    $core.int? unitDays,
  }) {
    final _result = create();
    if (price != null) {
      _result.price = price;
    }
    if (invisibleList != null) {
      _result.invisibleList.addAll(invisibleList);
    }
    if (pckType != null) {
      _result.pckType = pckType;
    }
    if (name != null) {
      _result.name = name;
    }
    if (id != null) {
      _result.id = id;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (unit != null) {
      _result.unit = unit;
    }
    if (unitDays != null) {
      _result.unitDays = unitDays;
    }
    return _result;
  }
  factory InvisiblePck.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory InvisiblePck.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  InvisiblePck clone() => InvisiblePck()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  InvisiblePck copyWith(void Function(InvisiblePck) updates) =>
      super.copyWith((message) => updates(message as InvisiblePck))
          as InvisiblePck; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InvisiblePck create() => InvisiblePck._();
  InvisiblePck createEmptyInstance() => create();
  static $pb.PbList<InvisiblePck> createRepeated() =>
      $pb.PbList<InvisiblePck>();
  @$core.pragma('dart2js:noInline')
  static InvisiblePck getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InvisiblePck>(create);
  static InvisiblePck? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get price => $_getIZ(0);
  @$pb.TagNumber(1)
  set price($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrice() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrice() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<InvisibleItem> get invisibleList => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get pckType => $_getIZ(2);
  @$pb.TagNumber(3)
  set pckType($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPckType() => $_has(2);
  @$pb.TagNumber(3)
  void clearPckType() => clearField(3);

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
  $core.int get id => $_getIZ(4);
  @$pb.TagNumber(5)
  set id($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasId() => $_has(4);
  @$pb.TagNumber(5)
  void clearId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get desc => $_getSZ(5);
  @$pb.TagNumber(6)
  set desc($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearDesc() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get unit => $_getSZ(6);
  @$pb.TagNumber(7)
  set unit($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUnit() => $_has(6);
  @$pb.TagNumber(7)
  void clearUnit() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get unitDays => $_getIZ(7);
  @$pb.TagNumber(8)
  set unitDays($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasUnitDays() => $_has(7);
  @$pb.TagNumber(8)
  void clearUnitDays() => clearField(8);
}

class InvisibleItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'InvisibleItem',
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
            : 'price',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expireTime',
        $pb.PbFieldType.OU3)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isOpen')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  InvisibleItem._() : super();
  factory InvisibleItem({
    $core.int? id,
    $core.String? name,
    $core.int? price,
    $core.int? expireTime,
    $core.bool? isOpen,
    $core.String? desc,
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
    if (expireTime != null) {
      _result.expireTime = expireTime;
    }
    if (isOpen != null) {
      _result.isOpen = isOpen;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory InvisibleItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory InvisibleItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  InvisibleItem clone() => InvisibleItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  InvisibleItem copyWith(void Function(InvisibleItem) updates) =>
      super.copyWith((message) => updates(message as InvisibleItem))
          as InvisibleItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InvisibleItem create() => InvisibleItem._();
  InvisibleItem createEmptyInstance() => create();
  static $pb.PbList<InvisibleItem> createRepeated() =>
      $pb.PbList<InvisibleItem>();
  @$core.pragma('dart2js:noInline')
  static InvisibleItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InvisibleItem>(create);
  static InvisibleItem? _defaultInstance;

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
  $core.int get price => $_getIZ(2);
  @$pb.TagNumber(3)
  set price($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get expireTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set expireTime($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasExpireTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpireTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isOpen => $_getBF(4);
  @$pb.TagNumber(5)
  set isOpen($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIsOpen() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsOpen() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get desc => $_getSZ(5);
  @$pb.TagNumber(6)
  set desc($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearDesc() => clearField(6);
}
