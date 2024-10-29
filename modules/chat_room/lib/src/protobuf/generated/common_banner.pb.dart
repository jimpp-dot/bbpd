///
//  Generated code. Do not modify.
//  source: common_banner.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResBanner extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResBanner',
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
    ..aOM<BannerData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: BannerData.create)
    ..hasRequiredFields = false;

  ResBanner._() : super();
  factory ResBanner({
    $core.bool? success,
    $core.String? msg,
    BannerData? data,
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
  factory ResBanner.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResBanner.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResBanner clone() => ResBanner()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResBanner copyWith(void Function(ResBanner) updates) =>
      super.copyWith((message) => updates(message as ResBanner))
          as ResBanner; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResBanner create() => ResBanner._();
  ResBanner createEmptyInstance() => create();
  static $pb.PbList<ResBanner> createRepeated() => $pb.PbList<ResBanner>();
  @$core.pragma('dart2js:noInline')
  static ResBanner getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResBanner>(create);
  static ResBanner? _defaultInstance;

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
  BannerData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(BannerData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  BannerData ensureData() => $_ensure(2);
}

class BannerData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BannerData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<BannerItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'items',
        $pb.PbFieldType.PM,
        subBuilder: BannerItem.create)
    ..aOM<BannerOptionData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'opt',
        subBuilder: BannerOptionData.create)
    ..pc<BannerItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'verifyItems',
        $pb.PbFieldType.PM,
        subBuilder: BannerItem.create)
    ..hasRequiredFields = false;

  BannerData._() : super();
  factory BannerData({
    $core.Iterable<BannerItem>? items,
    BannerOptionData? opt,
    $core.Iterable<BannerItem>? verifyItems,
  }) {
    final _result = create();
    if (items != null) {
      _result.items.addAll(items);
    }
    if (opt != null) {
      _result.opt = opt;
    }
    if (verifyItems != null) {
      _result.verifyItems.addAll(verifyItems);
    }
    return _result;
  }
  factory BannerData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BannerData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BannerData clone() => BannerData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BannerData copyWith(void Function(BannerData) updates) =>
      super.copyWith((message) => updates(message as BannerData))
          as BannerData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BannerData create() => BannerData._();
  BannerData createEmptyInstance() => create();
  static $pb.PbList<BannerData> createRepeated() => $pb.PbList<BannerData>();
  @$core.pragma('dart2js:noInline')
  static BannerData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BannerData>(create);
  static BannerData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BannerItem> get items => $_getList(0);

  @$pb.TagNumber(2)
  BannerOptionData get opt => $_getN(1);
  @$pb.TagNumber(2)
  set opt(BannerOptionData v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOpt() => $_has(1);
  @$pb.TagNumber(2)
  void clearOpt() => clearField(2);
  @$pb.TagNumber(2)
  BannerOptionData ensureOpt() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<BannerItem> get verifyItems => $_getList(2);
}

class BannerItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BannerItem',
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
            : 'image')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'width',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'height',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOM<BannerOptionData>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'opt',
        subBuilder: BannerOptionData.create)
    ..aOM<BannerRoomInfo>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomInfo',
        subBuilder: BannerRoomInfo.create)
    ..hasRequiredFields = false;

  BannerItem._() : super();
  factory BannerItem({
    $core.int? id,
    $core.String? image,
    $core.int? width,
    $core.int? height,
    $core.int? duration,
    $core.String? url,
    $core.String? title,
    $core.String? position,
    $core.String? data,
    $core.String? type,
    BannerOptionData? opt,
    BannerRoomInfo? roomInfo,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (image != null) {
      _result.image = image;
    }
    if (width != null) {
      _result.width = width;
    }
    if (height != null) {
      _result.height = height;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (url != null) {
      _result.url = url;
    }
    if (title != null) {
      _result.title = title;
    }
    if (position != null) {
      _result.position = position;
    }
    if (data != null) {
      _result.data = data;
    }
    if (type != null) {
      _result.type = type;
    }
    if (opt != null) {
      _result.opt = opt;
    }
    if (roomInfo != null) {
      _result.roomInfo = roomInfo;
    }
    return _result;
  }
  factory BannerItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BannerItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BannerItem clone() => BannerItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BannerItem copyWith(void Function(BannerItem) updates) =>
      super.copyWith((message) => updates(message as BannerItem))
          as BannerItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BannerItem create() => BannerItem._();
  BannerItem createEmptyInstance() => create();
  static $pb.PbList<BannerItem> createRepeated() => $pb.PbList<BannerItem>();
  @$core.pragma('dart2js:noInline')
  static BannerItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BannerItem>(create);
  static BannerItem? _defaultInstance;

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
  $core.String get image => $_getSZ(1);
  @$pb.TagNumber(2)
  set image($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get width => $_getIZ(2);
  @$pb.TagNumber(3)
  set width($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get height => $_getIZ(3);
  @$pb.TagNumber(4)
  set height($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get duration => $_getIZ(4);
  @$pb.TagNumber(5)
  set duration($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDuration() => $_has(4);
  @$pb.TagNumber(5)
  void clearDuration() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get url => $_getSZ(5);
  @$pb.TagNumber(6)
  set url($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearUrl() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get title => $_getSZ(6);
  @$pb.TagNumber(7)
  set title($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTitle() => $_has(6);
  @$pb.TagNumber(7)
  void clearTitle() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get position => $_getSZ(7);
  @$pb.TagNumber(8)
  set position($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPosition() => $_has(7);
  @$pb.TagNumber(8)
  void clearPosition() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get data => $_getSZ(8);
  @$pb.TagNumber(9)
  set data($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasData() => $_has(8);
  @$pb.TagNumber(9)
  void clearData() => clearField(9);

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
  BannerOptionData get opt => $_getN(10);
  @$pb.TagNumber(11)
  set opt(BannerOptionData v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasOpt() => $_has(10);
  @$pb.TagNumber(11)
  void clearOpt() => clearField(11);
  @$pb.TagNumber(11)
  BannerOptionData ensureOpt() => $_ensure(10);

  @$pb.TagNumber(12)
  BannerRoomInfo get roomInfo => $_getN(11);
  @$pb.TagNumber(12)
  set roomInfo(BannerRoomInfo v) {
    setField(12, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasRoomInfo() => $_has(11);
  @$pb.TagNumber(12)
  void clearRoomInfo() => clearField(12);
  @$pb.TagNumber(12)
  BannerRoomInfo ensureRoomInfo() => $_ensure(11);
}

class BannerOptionData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BannerOptionData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showClose')
    ..hasRequiredFields = false;

  BannerOptionData._() : super();
  factory BannerOptionData({
    $core.bool? showClose,
  }) {
    final _result = create();
    if (showClose != null) {
      _result.showClose = showClose;
    }
    return _result;
  }
  factory BannerOptionData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BannerOptionData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BannerOptionData clone() => BannerOptionData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BannerOptionData copyWith(void Function(BannerOptionData) updates) =>
      super.copyWith((message) => updates(message as BannerOptionData))
          as BannerOptionData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BannerOptionData create() => BannerOptionData._();
  BannerOptionData createEmptyInstance() => create();
  static $pb.PbList<BannerOptionData> createRepeated() =>
      $pb.PbList<BannerOptionData>();
  @$core.pragma('dart2js:noInline')
  static BannerOptionData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BannerOptionData>(create);
  static BannerOptionData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get showClose => $_getBF(0);
  @$pb.TagNumber(1)
  set showClose($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShowClose() => $_has(0);
  @$pb.TagNumber(1)
  void clearShowClose() => clearField(1);
}

class BannerRoomInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BannerRoomInfo',
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
    ..pPS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icons')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeIcon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'labelType')
    ..pPS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeBg')
    ..hasRequiredFields = false;

  BannerRoomInfo._() : super();
  factory BannerRoomInfo({
    $core.int? rid,
    $core.Iterable<$core.String>? icons,
    $core.String? typeIcon,
    $core.String? name,
    $core.String? labelType,
    $core.Iterable<$core.String>? typeBg,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (icons != null) {
      _result.icons.addAll(icons);
    }
    if (typeIcon != null) {
      _result.typeIcon = typeIcon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (labelType != null) {
      _result.labelType = labelType;
    }
    if (typeBg != null) {
      _result.typeBg.addAll(typeBg);
    }
    return _result;
  }
  factory BannerRoomInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BannerRoomInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BannerRoomInfo clone() => BannerRoomInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BannerRoomInfo copyWith(void Function(BannerRoomInfo) updates) =>
      super.copyWith((message) => updates(message as BannerRoomInfo))
          as BannerRoomInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BannerRoomInfo create() => BannerRoomInfo._();
  BannerRoomInfo createEmptyInstance() => create();
  static $pb.PbList<BannerRoomInfo> createRepeated() =>
      $pb.PbList<BannerRoomInfo>();
  @$core.pragma('dart2js:noInline')
  static BannerRoomInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BannerRoomInfo>(create);
  static BannerRoomInfo? _defaultInstance;

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
  $core.List<$core.String> get icons => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get typeIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set typeIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTypeIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearTypeIcon() => clearField(3);

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
  $core.String get labelType => $_getSZ(4);
  @$pb.TagNumber(5)
  set labelType($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLabelType() => $_has(4);
  @$pb.TagNumber(5)
  void clearLabelType() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get typeBg => $_getList(5);
}
