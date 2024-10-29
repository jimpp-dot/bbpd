///
//  Generated code. Do not modify.
//  source: exhibit.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ExhibitTabData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ExhibitTabData',
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
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..hasRequiredFields = false;

  ExhibitTabData._() : super();
  factory ExhibitTabData({
    $core.String? name,
    $core.String? type,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory ExhibitTabData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ExhibitTabData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ExhibitTabData clone() => ExhibitTabData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ExhibitTabData copyWith(void Function(ExhibitTabData) updates) =>
      super.copyWith((message) => updates(message as ExhibitTabData))
          as ExhibitTabData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExhibitTabData create() => ExhibitTabData._();
  ExhibitTabData createEmptyInstance() => create();
  static $pb.PbList<ExhibitTabData> createRepeated() =>
      $pb.PbList<ExhibitTabData>();
  @$core.pragma('dart2js:noInline')
  static ExhibitTabData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExhibitTabData>(create);
  static ExhibitTabData? _defaultInstance;

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
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);
}

class ResExhibitTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResExhibitTab',
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
    ..pc<ExhibitTabData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: ExhibitTabData.create)
    ..hasRequiredFields = false;

  ResExhibitTab._() : super();
  factory ResExhibitTab({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<ExhibitTabData>? data,
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
  factory ResExhibitTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResExhibitTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResExhibitTab clone() => ResExhibitTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResExhibitTab copyWith(void Function(ResExhibitTab) updates) =>
      super.copyWith((message) => updates(message as ResExhibitTab))
          as ResExhibitTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResExhibitTab create() => ResExhibitTab._();
  ResExhibitTab createEmptyInstance() => create();
  static $pb.PbList<ResExhibitTab> createRepeated() =>
      $pb.PbList<ResExhibitTab>();
  @$core.pragma('dart2js:noInline')
  static ResExhibitTab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResExhibitTab>(create);
  static ResExhibitTab? _defaultInstance;

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
  $core.List<ExhibitTabData> get data => $_getList(2);
}

class ExhibitCommodityItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ExhibitCommodityItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'condition')
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
            : 'type')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'imageBg')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grade')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gradeIcon')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lock',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'getTime',
        $pb.PbFieldType.OU3)
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pinned',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vapSize',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ExhibitCommodityItem._() : super();
  factory ExhibitCommodityItem({
    $core.String? condition,
    $core.int? cid,
    $core.String? type,
    $core.String? name,
    $core.String? image,
    $core.String? imageBg,
    $core.String? grade,
    $core.String? gradeIcon,
    $core.int? lock,
    $core.int? getTime,
    $core.String? desc,
    $core.int? pinned,
    $core.int? vapSize,
    $core.int? giftId,
  }) {
    final _result = create();
    if (condition != null) {
      _result.condition = condition;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (type != null) {
      _result.type = type;
    }
    if (name != null) {
      _result.name = name;
    }
    if (image != null) {
      _result.image = image;
    }
    if (imageBg != null) {
      _result.imageBg = imageBg;
    }
    if (grade != null) {
      _result.grade = grade;
    }
    if (gradeIcon != null) {
      _result.gradeIcon = gradeIcon;
    }
    if (lock != null) {
      _result.lock = lock;
    }
    if (getTime != null) {
      _result.getTime = getTime;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (pinned != null) {
      _result.pinned = pinned;
    }
    if (vapSize != null) {
      _result.vapSize = vapSize;
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    return _result;
  }
  factory ExhibitCommodityItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ExhibitCommodityItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ExhibitCommodityItem clone() =>
      ExhibitCommodityItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ExhibitCommodityItem copyWith(void Function(ExhibitCommodityItem) updates) =>
      super.copyWith((message) => updates(message as ExhibitCommodityItem))
          as ExhibitCommodityItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExhibitCommodityItem create() => ExhibitCommodityItem._();
  ExhibitCommodityItem createEmptyInstance() => create();
  static $pb.PbList<ExhibitCommodityItem> createRepeated() =>
      $pb.PbList<ExhibitCommodityItem>();
  @$core.pragma('dart2js:noInline')
  static ExhibitCommodityItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExhibitCommodityItem>(create);
  static ExhibitCommodityItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get condition => $_getSZ(0);
  @$pb.TagNumber(1)
  set condition($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCondition() => $_has(0);
  @$pb.TagNumber(1)
  void clearCondition() => clearField(1);

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
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

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
  $core.String get imageBg => $_getSZ(5);
  @$pb.TagNumber(6)
  set imageBg($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasImageBg() => $_has(5);
  @$pb.TagNumber(6)
  void clearImageBg() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get grade => $_getSZ(6);
  @$pb.TagNumber(7)
  set grade($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGrade() => $_has(6);
  @$pb.TagNumber(7)
  void clearGrade() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get gradeIcon => $_getSZ(7);
  @$pb.TagNumber(8)
  set gradeIcon($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasGradeIcon() => $_has(7);
  @$pb.TagNumber(8)
  void clearGradeIcon() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get lock => $_getIZ(8);
  @$pb.TagNumber(9)
  set lock($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasLock() => $_has(8);
  @$pb.TagNumber(9)
  void clearLock() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get getTime => $_getIZ(9);
  @$pb.TagNumber(10)
  set getTime($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasGetTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearGetTime() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get desc => $_getSZ(10);
  @$pb.TagNumber(11)
  set desc($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasDesc() => $_has(10);
  @$pb.TagNumber(11)
  void clearDesc() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get pinned => $_getIZ(11);
  @$pb.TagNumber(12)
  set pinned($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasPinned() => $_has(11);
  @$pb.TagNumber(12)
  void clearPinned() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get vapSize => $_getIZ(12);
  @$pb.TagNumber(13)
  set vapSize($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasVapSize() => $_has(12);
  @$pb.TagNumber(13)
  void clearVapSize() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get giftId => $_getIZ(13);
  @$pb.TagNumber(14)
  set giftId($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasGiftId() => $_has(13);
  @$pb.TagNumber(14)
  void clearGiftId() => clearField(14);
}

class ExhibitIndexData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ExhibitIndexData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grade')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gradeIcon')
    ..pc<ExhibitCommodityItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gradeCommodity',
        $pb.PbFieldType.PM,
        subBuilder: ExhibitCommodityItem.create)
    ..hasRequiredFields = false;

  ExhibitIndexData._() : super();
  factory ExhibitIndexData({
    $core.String? grade,
    $core.String? gradeIcon,
    $core.Iterable<ExhibitCommodityItem>? gradeCommodity,
  }) {
    final _result = create();
    if (grade != null) {
      _result.grade = grade;
    }
    if (gradeIcon != null) {
      _result.gradeIcon = gradeIcon;
    }
    if (gradeCommodity != null) {
      _result.gradeCommodity.addAll(gradeCommodity);
    }
    return _result;
  }
  factory ExhibitIndexData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ExhibitIndexData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ExhibitIndexData clone() => ExhibitIndexData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ExhibitIndexData copyWith(void Function(ExhibitIndexData) updates) =>
      super.copyWith((message) => updates(message as ExhibitIndexData))
          as ExhibitIndexData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExhibitIndexData create() => ExhibitIndexData._();
  ExhibitIndexData createEmptyInstance() => create();
  static $pb.PbList<ExhibitIndexData> createRepeated() =>
      $pb.PbList<ExhibitIndexData>();
  @$core.pragma('dart2js:noInline')
  static ExhibitIndexData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExhibitIndexData>(create);
  static ExhibitIndexData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get grade => $_getSZ(0);
  @$pb.TagNumber(1)
  set grade($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGrade() => $_has(0);
  @$pb.TagNumber(1)
  void clearGrade() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get gradeIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set gradeIcon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGradeIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearGradeIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<ExhibitCommodityItem> get gradeCommodity => $_getList(2);
}

class ResExhibitIndex extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResExhibitIndex',
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
    ..pc<ExhibitIndexData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: ExhibitIndexData.create)
    ..hasRequiredFields = false;

  ResExhibitIndex._() : super();
  factory ResExhibitIndex({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<ExhibitIndexData>? data,
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
  factory ResExhibitIndex.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResExhibitIndex.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResExhibitIndex clone() => ResExhibitIndex()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResExhibitIndex copyWith(void Function(ResExhibitIndex) updates) =>
      super.copyWith((message) => updates(message as ResExhibitIndex))
          as ResExhibitIndex; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResExhibitIndex create() => ResExhibitIndex._();
  ResExhibitIndex createEmptyInstance() => create();
  static $pb.PbList<ResExhibitIndex> createRepeated() =>
      $pb.PbList<ResExhibitIndex>();
  @$core.pragma('dart2js:noInline')
  static ResExhibitIndex getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResExhibitIndex>(create);
  static ResExhibitIndex? _defaultInstance;

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
  $core.List<ExhibitIndexData> get data => $_getList(2);
}

class ResExhibitMore extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResExhibitMore',
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
    ..pc<ExhibitCommodityItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: ExhibitCommodityItem.create)
    ..hasRequiredFields = false;

  ResExhibitMore._() : super();
  factory ResExhibitMore({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<ExhibitCommodityItem>? data,
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
  factory ResExhibitMore.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResExhibitMore.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResExhibitMore clone() => ResExhibitMore()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResExhibitMore copyWith(void Function(ResExhibitMore) updates) =>
      super.copyWith((message) => updates(message as ResExhibitMore))
          as ResExhibitMore; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResExhibitMore create() => ResExhibitMore._();
  ResExhibitMore createEmptyInstance() => create();
  static $pb.PbList<ResExhibitMore> createRepeated() =>
      $pb.PbList<ResExhibitMore>();
  @$core.pragma('dart2js:noInline')
  static ResExhibitMore getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResExhibitMore>(create);
  static ResExhibitMore? _defaultInstance;

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
  $core.List<ExhibitCommodityItem> get data => $_getList(2);
}

class ResExhibitRecommend extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResExhibitRecommend',
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
    ..pc<ExhibitCommodityItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: ExhibitCommodityItem.create)
    ..hasRequiredFields = false;

  ResExhibitRecommend._() : super();
  factory ResExhibitRecommend({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<ExhibitCommodityItem>? data,
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
  factory ResExhibitRecommend.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResExhibitRecommend.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResExhibitRecommend clone() => ResExhibitRecommend()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResExhibitRecommend copyWith(void Function(ResExhibitRecommend) updates) =>
      super.copyWith((message) => updates(message as ResExhibitRecommend))
          as ResExhibitRecommend; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResExhibitRecommend create() => ResExhibitRecommend._();
  ResExhibitRecommend createEmptyInstance() => create();
  static $pb.PbList<ResExhibitRecommend> createRepeated() =>
      $pb.PbList<ResExhibitRecommend>();
  @$core.pragma('dart2js:noInline')
  static ResExhibitRecommend getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResExhibitRecommend>(create);
  static ResExhibitRecommend? _defaultInstance;

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
  $core.List<ExhibitCommodityItem> get data => $_getList(2);
}
