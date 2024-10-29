///
//  Generated code. Do not modify.
//  source: live.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ContributeTop extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ContributeTop',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
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
            : 'sex')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ContributeTop._() : super();
  factory ContributeTop({
    $core.String? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? sex,
    $core.int? money,
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
    if (money != null) {
      _result.money = money;
    }
    return _result;
  }
  factory ContributeTop.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ContributeTop.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ContributeTop clone() => ContributeTop()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ContributeTop copyWith(void Function(ContributeTop) updates) =>
      super.copyWith((message) => updates(message as ContributeTop))
          as ContributeTop; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContributeTop create() => ContributeTop._();
  ContributeTop createEmptyInstance() => create();
  static $pb.PbList<ContributeTop> createRepeated() =>
      $pb.PbList<ContributeTop>();
  @$core.pragma('dart2js:noInline')
  static ContributeTop getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ContributeTop>(create);
  static ContributeTop? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) {
    $_setString(0, v);
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
  $core.String get sex => $_getSZ(3);
  @$pb.TagNumber(4)
  set sex($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get money => $_getIZ(4);
  @$pb.TagNumber(5)
  set money($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMoney() => $_has(4);
  @$pb.TagNumber(5)
  void clearMoney() => clearField(5);
}

class FanLabel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FanLabel',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'join',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'labelImage')
    ..pPS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'labelColors')
    ..hasRequiredFields = false;

  FanLabel._() : super();
  factory FanLabel({
    $core.int? join,
    $core.int? level,
    $core.String? label,
    $core.String? labelImage,
    $core.Iterable<$core.String>? labelColors,
  }) {
    final _result = create();
    if (join != null) {
      _result.join = join;
    }
    if (level != null) {
      _result.level = level;
    }
    if (label != null) {
      _result.label = label;
    }
    if (labelImage != null) {
      _result.labelImage = labelImage;
    }
    if (labelColors != null) {
      _result.labelColors.addAll(labelColors);
    }
    return _result;
  }
  factory FanLabel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FanLabel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FanLabel clone() => FanLabel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FanLabel copyWith(void Function(FanLabel) updates) =>
      super.copyWith((message) => updates(message as FanLabel))
          as FanLabel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FanLabel create() => FanLabel._();
  FanLabel createEmptyInstance() => create();
  static $pb.PbList<FanLabel> createRepeated() => $pb.PbList<FanLabel>();
  @$core.pragma('dart2js:noInline')
  static FanLabel getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FanLabel>(create);
  static FanLabel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get join => $_getIZ(0);
  @$pb.TagNumber(1)
  set join($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasJoin() => $_has(0);
  @$pb.TagNumber(1)
  void clearJoin() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get level => $_getIZ(1);
  @$pb.TagNumber(2)
  set level($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevel() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get label => $_getSZ(2);
  @$pb.TagNumber(3)
  set label($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLabel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLabel() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get labelImage => $_getSZ(3);
  @$pb.TagNumber(4)
  set labelImage($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLabelImage() => $_has(3);
  @$pb.TagNumber(4)
  void clearLabelImage() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get labelColors => $_getList(4);
}

class LiveConfigData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LiveConfigData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ContributeTop>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'contributeTopThree',
        $pb.PbFieldType.PM,
        subBuilder: ContributeTop.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveRank',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'link')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pkRank',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pkCriticalValue',
        $pb.PbFieldType.OU3)
    ..aOM<FanLabel>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fansLabel',
        subBuilder: FanLabel.create)
    ..hasRequiredFields = false;

  LiveConfigData._() : super();
  factory LiveConfigData({
    $core.Iterable<ContributeTop>? contributeTopThree,
    $core.int? liveRank,
    $core.String? link,
    $core.int? pkRank,
    $core.int? pkCriticalValue,
    FanLabel? fansLabel,
  }) {
    final _result = create();
    if (contributeTopThree != null) {
      _result.contributeTopThree.addAll(contributeTopThree);
    }
    if (liveRank != null) {
      _result.liveRank = liveRank;
    }
    if (link != null) {
      _result.link = link;
    }
    if (pkRank != null) {
      _result.pkRank = pkRank;
    }
    if (pkCriticalValue != null) {
      _result.pkCriticalValue = pkCriticalValue;
    }
    if (fansLabel != null) {
      _result.fansLabel = fansLabel;
    }
    return _result;
  }
  factory LiveConfigData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LiveConfigData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LiveConfigData clone() => LiveConfigData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LiveConfigData copyWith(void Function(LiveConfigData) updates) =>
      super.copyWith((message) => updates(message as LiveConfigData))
          as LiveConfigData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LiveConfigData create() => LiveConfigData._();
  LiveConfigData createEmptyInstance() => create();
  static $pb.PbList<LiveConfigData> createRepeated() =>
      $pb.PbList<LiveConfigData>();
  @$core.pragma('dart2js:noInline')
  static LiveConfigData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LiveConfigData>(create);
  static LiveConfigData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ContributeTop> get contributeTopThree => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get liveRank => $_getIZ(1);
  @$pb.TagNumber(2)
  set liveRank($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLiveRank() => $_has(1);
  @$pb.TagNumber(2)
  void clearLiveRank() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get link => $_getSZ(2);
  @$pb.TagNumber(3)
  set link($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLink() => $_has(2);
  @$pb.TagNumber(3)
  void clearLink() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get pkRank => $_getIZ(3);
  @$pb.TagNumber(4)
  set pkRank($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPkRank() => $_has(3);
  @$pb.TagNumber(4)
  void clearPkRank() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get pkCriticalValue => $_getIZ(4);
  @$pb.TagNumber(5)
  set pkCriticalValue($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPkCriticalValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearPkCriticalValue() => clearField(5);

  @$pb.TagNumber(6)
  FanLabel get fansLabel => $_getN(5);
  @$pb.TagNumber(6)
  set fansLabel(FanLabel v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasFansLabel() => $_has(5);
  @$pb.TagNumber(6)
  void clearFansLabel() => clearField(6);
  @$pb.TagNumber(6)
  FanLabel ensureFansLabel() => $_ensure(5);
}

class ResLiveConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResLiveConfig',
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
    ..aOM<LiveConfigData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: LiveConfigData.create)
    ..hasRequiredFields = false;

  ResLiveConfig._() : super();
  factory ResLiveConfig({
    $core.bool? success,
    $core.String? msg,
    LiveConfigData? data,
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
  factory ResLiveConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResLiveConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResLiveConfig clone() => ResLiveConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResLiveConfig copyWith(void Function(ResLiveConfig) updates) =>
      super.copyWith((message) => updates(message as ResLiveConfig))
          as ResLiveConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResLiveConfig create() => ResLiveConfig._();
  ResLiveConfig createEmptyInstance() => create();
  static $pb.PbList<ResLiveConfig> createRepeated() =>
      $pb.PbList<ResLiveConfig>();
  @$core.pragma('dart2js:noInline')
  static ResLiveConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResLiveConfig>(create);
  static ResLiveConfig? _defaultInstance;

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
  LiveConfigData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(LiveConfigData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  LiveConfigData ensureData() => $_ensure(2);
}

class ResLiveTagRoomList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResLiveTagRoomList',
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
    ..pc<TagRoomListItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: TagRoomListItem.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nextId',
        $pb.PbFieldType.OU3)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasMore')
    ..hasRequiredFields = false;

  ResLiveTagRoomList._() : super();
  factory ResLiveTagRoomList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<TagRoomListItem>? data,
    $core.int? nextId,
    $core.bool? hasMore,
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
    if (nextId != null) {
      _result.nextId = nextId;
    }
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    return _result;
  }
  factory ResLiveTagRoomList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResLiveTagRoomList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResLiveTagRoomList clone() => ResLiveTagRoomList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResLiveTagRoomList copyWith(void Function(ResLiveTagRoomList) updates) =>
      super.copyWith((message) => updates(message as ResLiveTagRoomList))
          as ResLiveTagRoomList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResLiveTagRoomList create() => ResLiveTagRoomList._();
  ResLiveTagRoomList createEmptyInstance() => create();
  static $pb.PbList<ResLiveTagRoomList> createRepeated() =>
      $pb.PbList<ResLiveTagRoomList>();
  @$core.pragma('dart2js:noInline')
  static ResLiveTagRoomList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResLiveTagRoomList>(create);
  static ResLiveTagRoomList? _defaultInstance;

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
  $core.List<TagRoomListItem> get data => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get nextId => $_getIZ(3);
  @$pb.TagNumber(4)
  set nextId($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNextId() => $_has(3);
  @$pb.TagNumber(4)
  void clearNextId() => clearField(4);

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
}

class TagRoomListItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TagRoomListItem',
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
            : 'tagText')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isFollow')
    ..hasRequiredFields = false;

  TagRoomListItem._() : super();
  factory TagRoomListItem({
    $core.int? rid,
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? tagText,
    $core.String? desc,
    $core.bool? isFollow,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
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
    if (tagText != null) {
      _result.tagText = tagText;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (isFollow != null) {
      _result.isFollow = isFollow;
    }
    return _result;
  }
  factory TagRoomListItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TagRoomListItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TagRoomListItem clone() => TagRoomListItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TagRoomListItem copyWith(void Function(TagRoomListItem) updates) =>
      super.copyWith((message) => updates(message as TagRoomListItem))
          as TagRoomListItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TagRoomListItem create() => TagRoomListItem._();
  TagRoomListItem createEmptyInstance() => create();
  static $pb.PbList<TagRoomListItem> createRepeated() =>
      $pb.PbList<TagRoomListItem>();
  @$core.pragma('dart2js:noInline')
  static TagRoomListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TagRoomListItem>(create);
  static TagRoomListItem? _defaultInstance;

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
  $core.String get tagText => $_getSZ(4);
  @$pb.TagNumber(5)
  set tagText($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTagText() => $_has(4);
  @$pb.TagNumber(5)
  void clearTagText() => clearField(5);

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
  $core.bool get isFollow => $_getBF(6);
  @$pb.TagNumber(7)
  set isFollow($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIsFollow() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsFollow() => clearField(7);
}

class ResLiveTagTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResLiveTagTab',
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
    ..pc<LiveTagItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: LiveTagItem.create)
    ..hasRequiredFields = false;

  ResLiveTagTab._() : super();
  factory ResLiveTagTab({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<LiveTagItem>? data,
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
  factory ResLiveTagTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResLiveTagTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResLiveTagTab clone() => ResLiveTagTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResLiveTagTab copyWith(void Function(ResLiveTagTab) updates) =>
      super.copyWith((message) => updates(message as ResLiveTagTab))
          as ResLiveTagTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResLiveTagTab create() => ResLiveTagTab._();
  ResLiveTagTab createEmptyInstance() => create();
  static $pb.PbList<ResLiveTagTab> createRepeated() =>
      $pb.PbList<ResLiveTagTab>();
  @$core.pragma('dart2js:noInline')
  static ResLiveTagTab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResLiveTagTab>(create);
  static ResLiveTagTab? _defaultInstance;

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
  $core.List<LiveTagItem> get data => $_getList(2);
}

class LiveTagItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LiveTagItem',
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
    ..hasRequiredFields = false;

  LiveTagItem._() : super();
  factory LiveTagItem({
    $core.int? id,
    $core.String? name,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory LiveTagItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LiveTagItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LiveTagItem clone() => LiveTagItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LiveTagItem copyWith(void Function(LiveTagItem) updates) =>
      super.copyWith((message) => updates(message as LiveTagItem))
          as LiveTagItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LiveTagItem create() => LiveTagItem._();
  LiveTagItem createEmptyInstance() => create();
  static $pb.PbList<LiveTagItem> createRepeated() => $pb.PbList<LiveTagItem>();
  @$core.pragma('dart2js:noInline')
  static LiveTagItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LiveTagItem>(create);
  static LiveTagItem? _defaultInstance;

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
}
