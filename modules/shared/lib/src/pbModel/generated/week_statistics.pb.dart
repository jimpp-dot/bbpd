///
//  Generated code. Do not modify.
//  source: week_statistics.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class RespGetWeekInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespGetWeekInfo',
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
    ..aOM<GetWeekInfoData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GetWeekInfoData.create)
    ..hasRequiredFields = false;

  RespGetWeekInfo._() : super();
  factory RespGetWeekInfo({
    $core.bool? success,
    $core.String? msg,
    GetWeekInfoData? data,
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
  factory RespGetWeekInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespGetWeekInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespGetWeekInfo clone() => RespGetWeekInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespGetWeekInfo copyWith(void Function(RespGetWeekInfo) updates) =>
      super.copyWith((message) => updates(message as RespGetWeekInfo))
          as RespGetWeekInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespGetWeekInfo create() => RespGetWeekInfo._();
  RespGetWeekInfo createEmptyInstance() => create();
  static $pb.PbList<RespGetWeekInfo> createRepeated() =>
      $pb.PbList<RespGetWeekInfo>();
  @$core.pragma('dart2js:noInline')
  static RespGetWeekInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespGetWeekInfo>(create);
  static RespGetWeekInfo? _defaultInstance;

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
  GetWeekInfoData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GetWeekInfoData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GetWeekInfoData ensureData() => $_ensure(2);
}

class GetWeekInfoData_popInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetWeekInfoData.popInfo',
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
    ..pc<ContentZone>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content',
        $pb.PbFieldType.PM,
        subBuilder: ContentZone.create)
    ..hasRequiredFields = false;

  GetWeekInfoData_popInfo._() : super();
  factory GetWeekInfoData_popInfo({
    $core.String? title,
    $core.Iterable<ContentZone>? content,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (content != null) {
      _result.content.addAll(content);
    }
    return _result;
  }
  factory GetWeekInfoData_popInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetWeekInfoData_popInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetWeekInfoData_popInfo clone() =>
      GetWeekInfoData_popInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetWeekInfoData_popInfo copyWith(
          void Function(GetWeekInfoData_popInfo) updates) =>
      super.copyWith((message) => updates(message as GetWeekInfoData_popInfo))
          as GetWeekInfoData_popInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetWeekInfoData_popInfo create() => GetWeekInfoData_popInfo._();
  GetWeekInfoData_popInfo createEmptyInstance() => create();
  static $pb.PbList<GetWeekInfoData_popInfo> createRepeated() =>
      $pb.PbList<GetWeekInfoData_popInfo>();
  @$core.pragma('dart2js:noInline')
  static GetWeekInfoData_popInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetWeekInfoData_popInfo>(create);
  static GetWeekInfoData_popInfo? _defaultInstance;

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
  $core.List<ContentZone> get content => $_getList(1);
}

class GetWeekInfoData_CircleWeekItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetWeekInfoData.CircleWeekItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<CircleItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'item',
        subBuilder: CircleItem.create)
    ..pc<ContentZone>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg',
        $pb.PbFieldType.PM,
        subBuilder: ContentZone.create)
    ..hasRequiredFields = false;

  GetWeekInfoData_CircleWeekItem._() : super();
  factory GetWeekInfoData_CircleWeekItem({
    CircleItem? item,
    $core.Iterable<ContentZone>? msg,
  }) {
    final _result = create();
    if (item != null) {
      _result.item = item;
    }
    if (msg != null) {
      _result.msg.addAll(msg);
    }
    return _result;
  }
  factory GetWeekInfoData_CircleWeekItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetWeekInfoData_CircleWeekItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetWeekInfoData_CircleWeekItem clone() =>
      GetWeekInfoData_CircleWeekItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetWeekInfoData_CircleWeekItem copyWith(
          void Function(GetWeekInfoData_CircleWeekItem) updates) =>
      super.copyWith(
              (message) => updates(message as GetWeekInfoData_CircleWeekItem))
          as GetWeekInfoData_CircleWeekItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetWeekInfoData_CircleWeekItem create() =>
      GetWeekInfoData_CircleWeekItem._();
  GetWeekInfoData_CircleWeekItem createEmptyInstance() => create();
  static $pb.PbList<GetWeekInfoData_CircleWeekItem> createRepeated() =>
      $pb.PbList<GetWeekInfoData_CircleWeekItem>();
  @$core.pragma('dart2js:noInline')
  static GetWeekInfoData_CircleWeekItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetWeekInfoData_CircleWeekItem>(create);
  static GetWeekInfoData_CircleWeekItem? _defaultInstance;

  @$pb.TagNumber(1)
  CircleItem get item => $_getN(0);
  @$pb.TagNumber(1)
  set item(CircleItem v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasItem() => $_has(0);
  @$pb.TagNumber(1)
  void clearItem() => clearField(1);
  @$pb.TagNumber(1)
  CircleItem ensureItem() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<ContentZone> get msg => $_getList(1);
}

class GetWeekInfoData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetWeekInfoData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<GetWeekInfoData_CircleWeekItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popularityTop',
        $pb.PbFieldType.PM,
        subBuilder: GetWeekInfoData_CircleWeekItem.create)
    ..pc<GetWeekInfoData_CircleWeekItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fansTop',
        $pb.PbFieldType.PM,
        subBuilder: GetWeekInfoData_CircleWeekItem.create)
    ..pc<GetWeekInfoData_CircleWeekItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'influenceTop',
        $pb.PbFieldType.PM,
        subBuilder: GetWeekInfoData_CircleWeekItem.create)
    ..aOM<GetWeekInfoData_popInfo>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pop',
        subBuilder: GetWeekInfoData_popInfo.create)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weekStar')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weekEnd')
    ..hasRequiredFields = false;

  GetWeekInfoData._() : super();
  factory GetWeekInfoData({
    $core.Iterable<GetWeekInfoData_CircleWeekItem>? popularityTop,
    $core.Iterable<GetWeekInfoData_CircleWeekItem>? fansTop,
    $core.Iterable<GetWeekInfoData_CircleWeekItem>? influenceTop,
    GetWeekInfoData_popInfo? pop,
    $core.String? title,
    $core.String? weekStar,
    $core.String? weekEnd,
  }) {
    final _result = create();
    if (popularityTop != null) {
      _result.popularityTop.addAll(popularityTop);
    }
    if (fansTop != null) {
      _result.fansTop.addAll(fansTop);
    }
    if (influenceTop != null) {
      _result.influenceTop.addAll(influenceTop);
    }
    if (pop != null) {
      _result.pop = pop;
    }
    if (title != null) {
      _result.title = title;
    }
    if (weekStar != null) {
      _result.weekStar = weekStar;
    }
    if (weekEnd != null) {
      _result.weekEnd = weekEnd;
    }
    return _result;
  }
  factory GetWeekInfoData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetWeekInfoData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetWeekInfoData clone() => GetWeekInfoData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetWeekInfoData copyWith(void Function(GetWeekInfoData) updates) =>
      super.copyWith((message) => updates(message as GetWeekInfoData))
          as GetWeekInfoData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetWeekInfoData create() => GetWeekInfoData._();
  GetWeekInfoData createEmptyInstance() => create();
  static $pb.PbList<GetWeekInfoData> createRepeated() =>
      $pb.PbList<GetWeekInfoData>();
  @$core.pragma('dart2js:noInline')
  static GetWeekInfoData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetWeekInfoData>(create);
  static GetWeekInfoData? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<GetWeekInfoData_CircleWeekItem> get popularityTop => $_getList(0);

  @$pb.TagNumber(3)
  $core.List<GetWeekInfoData_CircleWeekItem> get fansTop => $_getList(1);

  @$pb.TagNumber(4)
  $core.List<GetWeekInfoData_CircleWeekItem> get influenceTop => $_getList(2);

  @$pb.TagNumber(5)
  GetWeekInfoData_popInfo get pop => $_getN(3);
  @$pb.TagNumber(5)
  set pop(GetWeekInfoData_popInfo v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPop() => $_has(3);
  @$pb.TagNumber(5)
  void clearPop() => clearField(5);
  @$pb.TagNumber(5)
  GetWeekInfoData_popInfo ensurePop() => $_ensure(3);

  @$pb.TagNumber(6)
  $core.String get title => $_getSZ(4);
  @$pb.TagNumber(6)
  set title($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(6)
  void clearTitle() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get weekStar => $_getSZ(5);
  @$pb.TagNumber(7)
  set weekStar($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasWeekStar() => $_has(5);
  @$pb.TagNumber(7)
  void clearWeekStar() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get weekEnd => $_getSZ(6);
  @$pb.TagNumber(8)
  set weekEnd($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasWeekEnd() => $_has(6);
  @$pb.TagNumber(8)
  void clearWeekEnd() => clearField(8);
}

class ContentZone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ContentZone',
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
            : 'content')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'width',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'height',
        $pb.PbFieldType.OU3)
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isBold')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wordsLimit',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ContentZone._() : super();
  factory ContentZone({
    $core.int? type,
    $core.String? content,
    $core.String? color,
    $core.int? width,
    $core.int? height,
    $core.bool? isBold,
    $core.int? wordsLimit,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (content != null) {
      _result.content = content;
    }
    if (color != null) {
      _result.color = color;
    }
    if (width != null) {
      _result.width = width;
    }
    if (height != null) {
      _result.height = height;
    }
    if (isBold != null) {
      _result.isBold = isBold;
    }
    if (wordsLimit != null) {
      _result.wordsLimit = wordsLimit;
    }
    return _result;
  }
  factory ContentZone.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ContentZone.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ContentZone clone() => ContentZone()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ContentZone copyWith(void Function(ContentZone) updates) =>
      super.copyWith((message) => updates(message as ContentZone))
          as ContentZone; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContentZone create() => ContentZone._();
  ContentZone createEmptyInstance() => create();
  static $pb.PbList<ContentZone> createRepeated() => $pb.PbList<ContentZone>();
  @$core.pragma('dart2js:noInline')
  static ContentZone getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ContentZone>(create);
  static ContentZone? _defaultInstance;

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
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get color => $_getSZ(2);
  @$pb.TagNumber(3)
  set color($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasColor() => $_has(2);
  @$pb.TagNumber(3)
  void clearColor() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get width => $_getIZ(3);
  @$pb.TagNumber(4)
  set width($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasWidth() => $_has(3);
  @$pb.TagNumber(4)
  void clearWidth() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get height => $_getIZ(4);
  @$pb.TagNumber(5)
  set height($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeight() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isBold => $_getBF(5);
  @$pb.TagNumber(6)
  set isBold($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIsBold() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsBold() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get wordsLimit => $_getIZ(6);
  @$pb.TagNumber(7)
  set wordsLimit($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasWordsLimit() => $_has(6);
  @$pb.TagNumber(7)
  void clearWordsLimit() => clearField(7);
}

class CircleItem_User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CircleItem.User',
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
            : 'age',
        $pb.PbFieldType.OU3)
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
            : 'frame')
    ..hasRequiredFields = false;

  CircleItem_User._() : super();
  factory CircleItem_User({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? age,
    $core.int? sex,
    $core.String? frame,
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
    if (age != null) {
      _result.age = age;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    return _result;
  }
  factory CircleItem_User.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CircleItem_User.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CircleItem_User clone() => CircleItem_User()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CircleItem_User copyWith(void Function(CircleItem_User) updates) =>
      super.copyWith((message) => updates(message as CircleItem_User))
          as CircleItem_User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CircleItem_User create() => CircleItem_User._();
  CircleItem_User createEmptyInstance() => create();
  static $pb.PbList<CircleItem_User> createRepeated() =>
      $pb.PbList<CircleItem_User>();
  @$core.pragma('dart2js:noInline')
  static CircleItem_User getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CircleItem_User>(create);
  static CircleItem_User? _defaultInstance;

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
  $core.int get age => $_getIZ(3);
  @$pb.TagNumber(4)
  set age($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAge() => $_has(3);
  @$pb.TagNumber(4)
  void clearAge() => clearField(4);

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
  $core.String get frame => $_getSZ(5);
  @$pb.TagNumber(6)
  set frame($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasFrame() => $_has(5);
  @$pb.TagNumber(6)
  void clearFrame() => clearField(6);
}

class CircleItem_AtUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CircleItem.AtUser',
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
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pos',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  CircleItem_AtUser._() : super();
  factory CircleItem_AtUser({
    $core.int? uid,
    $core.String? name,
    $core.int? pos,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (pos != null) {
      _result.pos = pos;
    }
    return _result;
  }
  factory CircleItem_AtUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CircleItem_AtUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CircleItem_AtUser clone() => CircleItem_AtUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CircleItem_AtUser copyWith(void Function(CircleItem_AtUser) updates) =>
      super.copyWith((message) => updates(message as CircleItem_AtUser))
          as CircleItem_AtUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CircleItem_AtUser create() => CircleItem_AtUser._();
  CircleItem_AtUser createEmptyInstance() => create();
  static $pb.PbList<CircleItem_AtUser> createRepeated() =>
      $pb.PbList<CircleItem_AtUser>();
  @$core.pragma('dart2js:noInline')
  static CircleItem_AtUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CircleItem_AtUser>(create);
  static CircleItem_AtUser? _defaultInstance;

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
  $core.int get pos => $_getIZ(2);
  @$pb.TagNumber(3)
  set pos($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPos() => $_has(2);
  @$pb.TagNumber(3)
  void clearPos() => clearField(3);
}

class CircleItem_Audio extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CircleItem.Audio',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  CircleItem_Audio._() : super();
  factory CircleItem_Audio({
    $core.String? url,
    $core.int? duration,
  }) {
    final _result = create();
    if (url != null) {
      _result.url = url;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    return _result;
  }
  factory CircleItem_Audio.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CircleItem_Audio.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CircleItem_Audio clone() => CircleItem_Audio()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CircleItem_Audio copyWith(void Function(CircleItem_Audio) updates) =>
      super.copyWith((message) => updates(message as CircleItem_Audio))
          as CircleItem_Audio; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CircleItem_Audio create() => CircleItem_Audio._();
  CircleItem_Audio createEmptyInstance() => create();
  static $pb.PbList<CircleItem_Audio> createRepeated() =>
      $pb.PbList<CircleItem_Audio>();
  @$core.pragma('dart2js:noInline')
  static CircleItem_Audio getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CircleItem_Audio>(create);
  static CircleItem_Audio? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get duration => $_getIZ(1);
  @$pb.TagNumber(2)
  set duration($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDuration() => $_has(1);
  @$pb.TagNumber(2)
  void clearDuration() => clearField(2);
}

class CircleItem_Tag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CircleItem.Tag',
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
            : 'tag')
    ..hasRequiredFields = false;

  CircleItem_Tag._() : super();
  factory CircleItem_Tag({
    $core.int? id,
    $core.String? tag,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (tag != null) {
      _result.tag = tag;
    }
    return _result;
  }
  factory CircleItem_Tag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CircleItem_Tag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CircleItem_Tag clone() => CircleItem_Tag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CircleItem_Tag copyWith(void Function(CircleItem_Tag) updates) =>
      super.copyWith((message) => updates(message as CircleItem_Tag))
          as CircleItem_Tag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CircleItem_Tag create() => CircleItem_Tag._();
  CircleItem_Tag createEmptyInstance() => create();
  static $pb.PbList<CircleItem_Tag> createRepeated() =>
      $pb.PbList<CircleItem_Tag>();
  @$core.pragma('dart2js:noInline')
  static CircleItem_Tag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CircleItem_Tag>(create);
  static CircleItem_Tag? _defaultInstance;

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
  $core.String get tag => $_getSZ(1);
  @$pb.TagNumber(2)
  set tag($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTag() => $_has(1);
  @$pb.TagNumber(2)
  void clearTag() => clearField(2);
}

class CircleItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CircleItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topicId',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'aType')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..aInt64(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createTime')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cover')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cmtNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'likeNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'location')
    ..a<$core.double>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'longitude',
        $pb.PbFieldType.OF)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasLike',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.OU3)
    ..pc<CircleItem_AtUser>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'atUids',
        $pb.PbFieldType.PM,
        subBuilder: CircleItem_AtUser.create)
    ..aOM<CircleItem_User>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: CircleItem_User.create)
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status')
    ..aOM<CircleItem_Audio>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audio',
        subBuilder: CircleItem_Audio.create)
    ..pc<CircleItem_Tag>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagstp',
        $pb.PbFieldType.PM,
        subBuilder: CircleItem_Tag.create)
    ..hasRequiredFields = false;

  CircleItem._() : super();
  factory CircleItem({
    $fixnum.Int64? topicId,
    $core.String? aType,
    $core.String? content,
    $fixnum.Int64? createTime,
    $core.String? cover,
    $core.int? cmtNum,
    $core.int? likeNum,
    $core.String? location,
    $core.double? longitude,
    $core.int? hasLike,
    $core.int? rank,
    $core.Iterable<CircleItem_AtUser>? atUids,
    CircleItem_User? user,
    $core.String? status,
    CircleItem_Audio? audio,
    $core.Iterable<CircleItem_Tag>? tagstp,
  }) {
    final _result = create();
    if (topicId != null) {
      _result.topicId = topicId;
    }
    if (aType != null) {
      _result.aType = aType;
    }
    if (content != null) {
      _result.content = content;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (cover != null) {
      _result.cover = cover;
    }
    if (cmtNum != null) {
      _result.cmtNum = cmtNum;
    }
    if (likeNum != null) {
      _result.likeNum = likeNum;
    }
    if (location != null) {
      _result.location = location;
    }
    if (longitude != null) {
      _result.longitude = longitude;
    }
    if (hasLike != null) {
      _result.hasLike = hasLike;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (atUids != null) {
      _result.atUids.addAll(atUids);
    }
    if (user != null) {
      _result.user = user;
    }
    if (status != null) {
      _result.status = status;
    }
    if (audio != null) {
      _result.audio = audio;
    }
    if (tagstp != null) {
      _result.tagstp.addAll(tagstp);
    }
    return _result;
  }
  factory CircleItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CircleItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CircleItem clone() => CircleItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CircleItem copyWith(void Function(CircleItem) updates) =>
      super.copyWith((message) => updates(message as CircleItem))
          as CircleItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CircleItem create() => CircleItem._();
  CircleItem createEmptyInstance() => create();
  static $pb.PbList<CircleItem> createRepeated() => $pb.PbList<CircleItem>();
  @$core.pragma('dart2js:noInline')
  static CircleItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CircleItem>(create);
  static CircleItem? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get topicId => $_getI64(0);
  @$pb.TagNumber(1)
  set topicId($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTopicId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTopicId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get aType => $_getSZ(1);
  @$pb.TagNumber(2)
  set aType($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAType() => $_has(1);
  @$pb.TagNumber(2)
  void clearAType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get createTime => $_getI64(3);
  @$pb.TagNumber(4)
  set createTime($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCreateTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreateTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get cover => $_getSZ(4);
  @$pb.TagNumber(5)
  set cover($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCover() => $_has(4);
  @$pb.TagNumber(5)
  void clearCover() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get cmtNum => $_getIZ(5);
  @$pb.TagNumber(6)
  set cmtNum($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCmtNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearCmtNum() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get likeNum => $_getIZ(6);
  @$pb.TagNumber(7)
  set likeNum($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasLikeNum() => $_has(6);
  @$pb.TagNumber(7)
  void clearLikeNum() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get location => $_getSZ(7);
  @$pb.TagNumber(8)
  set location($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLocation() => $_has(7);
  @$pb.TagNumber(8)
  void clearLocation() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get longitude => $_getN(8);
  @$pb.TagNumber(9)
  set longitude($core.double v) {
    $_setFloat(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasLongitude() => $_has(8);
  @$pb.TagNumber(9)
  void clearLongitude() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get hasLike => $_getIZ(9);
  @$pb.TagNumber(10)
  set hasLike($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasHasLike() => $_has(9);
  @$pb.TagNumber(10)
  void clearHasLike() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get rank => $_getIZ(10);
  @$pb.TagNumber(11)
  set rank($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasRank() => $_has(10);
  @$pb.TagNumber(11)
  void clearRank() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<CircleItem_AtUser> get atUids => $_getList(11);

  @$pb.TagNumber(13)
  CircleItem_User get user => $_getN(12);
  @$pb.TagNumber(13)
  set user(CircleItem_User v) {
    setField(13, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasUser() => $_has(12);
  @$pb.TagNumber(13)
  void clearUser() => clearField(13);
  @$pb.TagNumber(13)
  CircleItem_User ensureUser() => $_ensure(12);

  @$pb.TagNumber(14)
  $core.String get status => $_getSZ(13);
  @$pb.TagNumber(14)
  set status($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasStatus() => $_has(13);
  @$pb.TagNumber(14)
  void clearStatus() => clearField(14);

  @$pb.TagNumber(15)
  CircleItem_Audio get audio => $_getN(14);
  @$pb.TagNumber(15)
  set audio(CircleItem_Audio v) {
    setField(15, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasAudio() => $_has(14);
  @$pb.TagNumber(15)
  void clearAudio() => clearField(15);
  @$pb.TagNumber(15)
  CircleItem_Audio ensureAudio() => $_ensure(14);

  @$pb.TagNumber(17)
  $core.List<CircleItem_Tag> get tagstp => $_getList(15);
}

class RespGetCfg_GetCfgData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespGetCfg.GetCfgData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isOpen')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weekStar')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weekEnd')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  RespGetCfg_GetCfgData._() : super();
  factory RespGetCfg_GetCfgData({
    $core.bool? isOpen,
    $core.String? weekStar,
    $core.String? weekEnd,
    $core.String? desc,
  }) {
    final _result = create();
    if (isOpen != null) {
      _result.isOpen = isOpen;
    }
    if (weekStar != null) {
      _result.weekStar = weekStar;
    }
    if (weekEnd != null) {
      _result.weekEnd = weekEnd;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory RespGetCfg_GetCfgData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespGetCfg_GetCfgData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespGetCfg_GetCfgData clone() =>
      RespGetCfg_GetCfgData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespGetCfg_GetCfgData copyWith(
          void Function(RespGetCfg_GetCfgData) updates) =>
      super.copyWith((message) => updates(message as RespGetCfg_GetCfgData))
          as RespGetCfg_GetCfgData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespGetCfg_GetCfgData create() => RespGetCfg_GetCfgData._();
  RespGetCfg_GetCfgData createEmptyInstance() => create();
  static $pb.PbList<RespGetCfg_GetCfgData> createRepeated() =>
      $pb.PbList<RespGetCfg_GetCfgData>();
  @$core.pragma('dart2js:noInline')
  static RespGetCfg_GetCfgData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespGetCfg_GetCfgData>(create);
  static RespGetCfg_GetCfgData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isOpen => $_getBF(0);
  @$pb.TagNumber(1)
  set isOpen($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIsOpen() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsOpen() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get weekStar => $_getSZ(1);
  @$pb.TagNumber(2)
  set weekStar($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasWeekStar() => $_has(1);
  @$pb.TagNumber(2)
  void clearWeekStar() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get weekEnd => $_getSZ(2);
  @$pb.TagNumber(3)
  set weekEnd($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasWeekEnd() => $_has(2);
  @$pb.TagNumber(3)
  void clearWeekEnd() => clearField(3);

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

class RespGetCfg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespGetCfg',
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
    ..aOM<RespGetCfg_GetCfgData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RespGetCfg_GetCfgData.create)
    ..hasRequiredFields = false;

  RespGetCfg._() : super();
  factory RespGetCfg({
    $core.bool? success,
    $core.String? msg,
    RespGetCfg_GetCfgData? data,
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
  factory RespGetCfg.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespGetCfg.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespGetCfg clone() => RespGetCfg()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespGetCfg copyWith(void Function(RespGetCfg) updates) =>
      super.copyWith((message) => updates(message as RespGetCfg))
          as RespGetCfg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespGetCfg create() => RespGetCfg._();
  RespGetCfg createEmptyInstance() => create();
  static $pb.PbList<RespGetCfg> createRepeated() => $pb.PbList<RespGetCfg>();
  @$core.pragma('dart2js:noInline')
  static RespGetCfg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespGetCfg>(create);
  static RespGetCfg? _defaultInstance;

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
  RespGetCfg_GetCfgData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RespGetCfg_GetCfgData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RespGetCfg_GetCfgData ensureData() => $_ensure(2);
}
