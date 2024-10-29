///
//  Generated code. Do not modify.
//  source: slp_godcard.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResGodCardCategory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGodCardCategory',
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
    ..pc<GodCardCategory>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godCategory',
        $pb.PbFieldType.PM,
        subBuilder: GodCardCategory.create)
    ..hasRequiredFields = false;

  ResGodCardCategory._() : super();
  factory ResGodCardCategory({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<GodCardCategory>? godCategory,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (godCategory != null) {
      _result.godCategory.addAll(godCategory);
    }
    return _result;
  }
  factory ResGodCardCategory.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGodCardCategory.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGodCardCategory clone() => ResGodCardCategory()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGodCardCategory copyWith(void Function(ResGodCardCategory) updates) =>
      super.copyWith((message) => updates(message as ResGodCardCategory))
          as ResGodCardCategory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGodCardCategory create() => ResGodCardCategory._();
  ResGodCardCategory createEmptyInstance() => create();
  static $pb.PbList<ResGodCardCategory> createRepeated() =>
      $pb.PbList<ResGodCardCategory>();
  @$core.pragma('dart2js:noInline')
  static ResGodCardCategory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGodCardCategory>(create);
  static ResGodCardCategory? _defaultInstance;

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
  $core.List<GodCardCategory> get godCategory => $_getList(2);
}

class GodCardCategory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GodCardCategory',
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
    ..pc<GodCardCategoryItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: GodCardCategoryItem.create)
    ..hasRequiredFields = false;

  GodCardCategory._() : super();
  factory GodCardCategory({
    $core.String? title,
    $core.Iterable<GodCardCategoryItem>? list,
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
  factory GodCardCategory.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GodCardCategory.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GodCardCategory clone() => GodCardCategory()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GodCardCategory copyWith(void Function(GodCardCategory) updates) =>
      super.copyWith((message) => updates(message as GodCardCategory))
          as GodCardCategory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GodCardCategory create() => GodCardCategory._();
  GodCardCategory createEmptyInstance() => create();
  static $pb.PbList<GodCardCategory> createRepeated() =>
      $pb.PbList<GodCardCategory>();
  @$core.pragma('dart2js:noInline')
  static GodCardCategory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GodCardCategory>(create);
  static GodCardCategory? _defaultInstance;

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

  @$pb.TagNumber(4)
  $core.List<GodCardCategoryItem> get list => $_getList(1);
}

class GodCardCategoryItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GodCardCategoryItem',
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
    ..hasRequiredFields = false;

  GodCardCategoryItem._() : super();
  factory GodCardCategoryItem({
    $core.int? id,
    $core.String? name,
    $core.String? icon,
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
    return _result;
  }
  factory GodCardCategoryItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GodCardCategoryItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GodCardCategoryItem clone() => GodCardCategoryItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GodCardCategoryItem copyWith(void Function(GodCardCategoryItem) updates) =>
      super.copyWith((message) => updates(message as GodCardCategoryItem))
          as GodCardCategoryItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GodCardCategoryItem create() => GodCardCategoryItem._();
  GodCardCategoryItem createEmptyInstance() => create();
  static $pb.PbList<GodCardCategoryItem> createRepeated() =>
      $pb.PbList<GodCardCategoryItem>();
  @$core.pragma('dart2js:noInline')
  static GodCardCategoryItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GodCardCategoryItem>(create);
  static GodCardCategoryItem? _defaultInstance;

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
}

class ResGodCardCategoryDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGodCardCategoryDetail',
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
            : 'id',
        $pb.PbFieldType.OU3)
    ..pc<GodCardCategoryDetail>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godCategory',
        $pb.PbFieldType.PM,
        subBuilder: GodCardCategoryDetail.create)
    ..hasRequiredFields = false;

  ResGodCardCategoryDetail._() : super();
  factory ResGodCardCategoryDetail({
    $core.bool? success,
    $core.String? msg,
    $core.int? id,
    $core.Iterable<GodCardCategoryDetail>? godCategory,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (id != null) {
      _result.id = id;
    }
    if (godCategory != null) {
      _result.godCategory.addAll(godCategory);
    }
    return _result;
  }
  factory ResGodCardCategoryDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGodCardCategoryDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGodCardCategoryDetail clone() =>
      ResGodCardCategoryDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGodCardCategoryDetail copyWith(
          void Function(ResGodCardCategoryDetail) updates) =>
      super.copyWith((message) => updates(message as ResGodCardCategoryDetail))
          as ResGodCardCategoryDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGodCardCategoryDetail create() => ResGodCardCategoryDetail._();
  ResGodCardCategoryDetail createEmptyInstance() => create();
  static $pb.PbList<ResGodCardCategoryDetail> createRepeated() =>
      $pb.PbList<ResGodCardCategoryDetail>();
  @$core.pragma('dart2js:noInline')
  static ResGodCardCategoryDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGodCardCategoryDetail>(create);
  static ResGodCardCategoryDetail? _defaultInstance;

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
  $core.int get id => $_getIZ(2);
  @$pb.TagNumber(3)
  set id($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<GodCardCategoryDetail> get godCategory => $_getList(3);
}

class GodCardCategoryDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GodCardCategoryDetail',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..pc<GodCardSubCate>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subCate',
        $pb.PbFieldType.PM,
        subBuilder: GodCardSubCate.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value')
    ..hasRequiredFields = false;

  GodCardCategoryDetail._() : super();
  factory GodCardCategoryDetail({
    $core.int? type,
    $core.String? name,
    $core.Iterable<GodCardSubCate>? subCate,
    $core.int? id,
    $core.String? value,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (name != null) {
      _result.name = name;
    }
    if (subCate != null) {
      _result.subCate.addAll(subCate);
    }
    if (id != null) {
      _result.id = id;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory GodCardCategoryDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GodCardCategoryDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GodCardCategoryDetail clone() =>
      GodCardCategoryDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GodCardCategoryDetail copyWith(
          void Function(GodCardCategoryDetail) updates) =>
      super.copyWith((message) => updates(message as GodCardCategoryDetail))
          as GodCardCategoryDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GodCardCategoryDetail create() => GodCardCategoryDetail._();
  GodCardCategoryDetail createEmptyInstance() => create();
  static $pb.PbList<GodCardCategoryDetail> createRepeated() =>
      $pb.PbList<GodCardCategoryDetail>();
  @$core.pragma('dart2js:noInline')
  static GodCardCategoryDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GodCardCategoryDetail>(create);
  static GodCardCategoryDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

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
  $core.List<GodCardSubCate> get subCate => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get id => $_getIZ(3);
  @$pb.TagNumber(4)
  set id($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(4)
  void clearId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get value => $_getSZ(4);
  @$pb.TagNumber(5)
  set value($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearValue() => clearField(5);
}

class GodCardSubCate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GodCardSubCate',
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
    ..hasRequiredFields = false;

  GodCardSubCate._() : super();
  factory GodCardSubCate({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory GodCardSubCate.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GodCardSubCate.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GodCardSubCate clone() => GodCardSubCate()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GodCardSubCate copyWith(void Function(GodCardSubCate) updates) =>
      super.copyWith((message) => updates(message as GodCardSubCate))
          as GodCardSubCate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GodCardSubCate create() => GodCardSubCate._();
  GodCardSubCate createEmptyInstance() => create();
  static $pb.PbList<GodCardSubCate> createRepeated() =>
      $pb.PbList<GodCardSubCate>();
  @$core.pragma('dart2js:noInline')
  static GodCardSubCate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GodCardSubCate>(create);
  static GodCardSubCate? _defaultInstance;

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
}

class ResGodCardList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGodCardList',
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
    ..pc<GodCardList>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: GodCardList.create)
    ..hasRequiredFields = false;

  ResGodCardList._() : super();
  factory ResGodCardList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<GodCardList>? list,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory ResGodCardList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGodCardList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGodCardList clone() => ResGodCardList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGodCardList copyWith(void Function(ResGodCardList) updates) =>
      super.copyWith((message) => updates(message as ResGodCardList))
          as ResGodCardList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGodCardList create() => ResGodCardList._();
  ResGodCardList createEmptyInstance() => create();
  static $pb.PbList<ResGodCardList> createRepeated() =>
      $pb.PbList<ResGodCardList>();
  @$core.pragma('dart2js:noInline')
  static ResGodCardList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGodCardList>(create);
  static ResGodCardList? _defaultInstance;

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

  @$pb.TagNumber(4)
  $core.List<GodCardList> get list => $_getList(2);
}

class GodCardList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GodCardList',
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
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gameId')
    ..pc<GodCardCategoryDetail>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gameSubCate',
        $pb.PbFieldType.PM,
        subBuilder: GodCardCategoryDetail.create)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cardBg')
    ..hasRequiredFields = false;

  GodCardList._() : super();
  factory GodCardList({
    $core.int? id,
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? gameId,
    $core.Iterable<GodCardCategoryDetail>? gameSubCate,
    $core.String? cardBg,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (gameId != null) {
      _result.gameId = gameId;
    }
    if (gameSubCate != null) {
      _result.gameSubCate.addAll(gameSubCate);
    }
    if (cardBg != null) {
      _result.cardBg = cardBg;
    }
    return _result;
  }
  factory GodCardList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GodCardList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GodCardList clone() => GodCardList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GodCardList copyWith(void Function(GodCardList) updates) =>
      super.copyWith((message) => updates(message as GodCardList))
          as GodCardList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GodCardList create() => GodCardList._();
  GodCardList createEmptyInstance() => create();
  static $pb.PbList<GodCardList> createRepeated() => $pb.PbList<GodCardList>();
  @$core.pragma('dart2js:noInline')
  static GodCardList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GodCardList>(create);
  static GodCardList? _defaultInstance;

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
  $core.String get gameId => $_getSZ(4);
  @$pb.TagNumber(5)
  set gameId($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGameId() => $_has(4);
  @$pb.TagNumber(5)
  void clearGameId() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<GodCardCategoryDetail> get gameSubCate => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get cardBg => $_getSZ(6);
  @$pb.TagNumber(7)
  set cardBg($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCardBg() => $_has(6);
  @$pb.TagNumber(7)
  void clearCardBg() => clearField(7);
}

class ResRecommendGodList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRecommendGodList',
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
    ..pc<RecommendGodList>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RecommendGodList.create)
    ..hasRequiredFields = false;

  ResRecommendGodList._() : super();
  factory ResRecommendGodList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<RecommendGodList>? list,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory ResRecommendGodList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRecommendGodList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRecommendGodList clone() => ResRecommendGodList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRecommendGodList copyWith(void Function(ResRecommendGodList) updates) =>
      super.copyWith((message) => updates(message as ResRecommendGodList))
          as ResRecommendGodList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRecommendGodList create() => ResRecommendGodList._();
  ResRecommendGodList createEmptyInstance() => create();
  static $pb.PbList<ResRecommendGodList> createRepeated() =>
      $pb.PbList<ResRecommendGodList>();
  @$core.pragma('dart2js:noInline')
  static ResRecommendGodList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRecommendGodList>(create);
  static ResRecommendGodList? _defaultInstance;

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

  @$pb.TagNumber(4)
  $core.List<RecommendGodList> get list => $_getList(2);
}

class RecommendGodList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RecommendGodList',
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
            : 'level')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineStatus',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagIcon')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RecommendGodList._() : super();
  factory RecommendGodList({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? level,
    $core.int? onlineStatus,
    $core.String? tagIcon,
    $core.int? sex,
    $core.int? age,
    $core.int? rid,
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
    if (level != null) {
      _result.level = level;
    }
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (tagIcon != null) {
      _result.tagIcon = tagIcon;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (age != null) {
      _result.age = age;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    return _result;
  }
  factory RecommendGodList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RecommendGodList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RecommendGodList clone() => RecommendGodList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RecommendGodList copyWith(void Function(RecommendGodList) updates) =>
      super.copyWith((message) => updates(message as RecommendGodList))
          as RecommendGodList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RecommendGodList create() => RecommendGodList._();
  RecommendGodList createEmptyInstance() => create();
  static $pb.PbList<RecommendGodList> createRepeated() =>
      $pb.PbList<RecommendGodList>();
  @$core.pragma('dart2js:noInline')
  static RecommendGodList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecommendGodList>(create);
  static RecommendGodList? _defaultInstance;

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
  $core.String get level => $_getSZ(3);
  @$pb.TagNumber(4)
  set level($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevel() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get onlineStatus => $_getIZ(4);
  @$pb.TagNumber(5)
  set onlineStatus($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOnlineStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnlineStatus() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get tagIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set tagIcon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTagIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearTagIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get sex => $_getIZ(6);
  @$pb.TagNumber(7)
  set sex($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSex() => $_has(6);
  @$pb.TagNumber(7)
  void clearSex() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get age => $_getIZ(7);
  @$pb.TagNumber(8)
  set age($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasAge() => $_has(7);
  @$pb.TagNumber(8)
  void clearAge() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get rid => $_getIZ(8);
  @$pb.TagNumber(9)
  set rid($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasRid() => $_has(8);
  @$pb.TagNumber(9)
  void clearRid() => clearField(9);
}

class ResGodLevelProgress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGodLevelProgress',
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
    ..aOM<GodLevelProgressData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GodLevelProgressData.create)
    ..hasRequiredFields = false;

  ResGodLevelProgress._() : super();
  factory ResGodLevelProgress({
    $core.bool? success,
    $core.String? msg,
    GodLevelProgressData? data,
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
  factory ResGodLevelProgress.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGodLevelProgress.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGodLevelProgress clone() => ResGodLevelProgress()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGodLevelProgress copyWith(void Function(ResGodLevelProgress) updates) =>
      super.copyWith((message) => updates(message as ResGodLevelProgress))
          as ResGodLevelProgress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGodLevelProgress create() => ResGodLevelProgress._();
  ResGodLevelProgress createEmptyInstance() => create();
  static $pb.PbList<ResGodLevelProgress> createRepeated() =>
      $pb.PbList<ResGodLevelProgress>();
  @$core.pragma('dart2js:noInline')
  static ResGodLevelProgress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGodLevelProgress>(create);
  static ResGodLevelProgress? _defaultInstance;

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
  GodLevelProgressData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GodLevelProgressData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GodLevelProgressData ensureData() => $_ensure(2);
}

class GodLevelProgressData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GodLevelProgressData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level')
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
            : 'upgradeGiftNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'upgradeMoney',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'macTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'upgradeMacTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bossNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'upgradeBossNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GodLevelProgressData._() : super();
  factory GodLevelProgressData({
    $core.String? level,
    $core.int? giftNum,
    $core.int? upgradeGiftNum,
    $core.int? money,
    $core.int? upgradeMoney,
    $core.int? macTime,
    $core.int? upgradeMacTime,
    $core.int? bossNum,
    $core.int? upgradeBossNum,
  }) {
    final _result = create();
    if (level != null) {
      _result.level = level;
    }
    if (giftNum != null) {
      _result.giftNum = giftNum;
    }
    if (upgradeGiftNum != null) {
      _result.upgradeGiftNum = upgradeGiftNum;
    }
    if (money != null) {
      _result.money = money;
    }
    if (upgradeMoney != null) {
      _result.upgradeMoney = upgradeMoney;
    }
    if (macTime != null) {
      _result.macTime = macTime;
    }
    if (upgradeMacTime != null) {
      _result.upgradeMacTime = upgradeMacTime;
    }
    if (bossNum != null) {
      _result.bossNum = bossNum;
    }
    if (upgradeBossNum != null) {
      _result.upgradeBossNum = upgradeBossNum;
    }
    return _result;
  }
  factory GodLevelProgressData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GodLevelProgressData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GodLevelProgressData clone() =>
      GodLevelProgressData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GodLevelProgressData copyWith(void Function(GodLevelProgressData) updates) =>
      super.copyWith((message) => updates(message as GodLevelProgressData))
          as GodLevelProgressData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GodLevelProgressData create() => GodLevelProgressData._();
  GodLevelProgressData createEmptyInstance() => create();
  static $pb.PbList<GodLevelProgressData> createRepeated() =>
      $pb.PbList<GodLevelProgressData>();
  @$core.pragma('dart2js:noInline')
  static GodLevelProgressData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GodLevelProgressData>(create);
  static GodLevelProgressData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get level => $_getSZ(0);
  @$pb.TagNumber(1)
  set level($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => clearField(1);

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
  $core.int get upgradeGiftNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set upgradeGiftNum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUpgradeGiftNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpgradeGiftNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get money => $_getIZ(3);
  @$pb.TagNumber(4)
  set money($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMoney() => $_has(3);
  @$pb.TagNumber(4)
  void clearMoney() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get upgradeMoney => $_getIZ(4);
  @$pb.TagNumber(5)
  set upgradeMoney($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUpgradeMoney() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpgradeMoney() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get macTime => $_getIZ(5);
  @$pb.TagNumber(6)
  set macTime($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMacTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearMacTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get upgradeMacTime => $_getIZ(6);
  @$pb.TagNumber(7)
  set upgradeMacTime($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUpgradeMacTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpgradeMacTime() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get bossNum => $_getIZ(7);
  @$pb.TagNumber(8)
  set bossNum($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasBossNum() => $_has(7);
  @$pb.TagNumber(8)
  void clearBossNum() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get upgradeBossNum => $_getIZ(8);
  @$pb.TagNumber(9)
  set upgradeBossNum($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasUpgradeBossNum() => $_has(8);
  @$pb.TagNumber(9)
  void clearUpgradeBossNum() => clearField(9);
}
