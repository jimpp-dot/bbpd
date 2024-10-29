///
//  Generated code. Do not modify.
//  source: gift_red_packet.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ResRedPacketHome extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRedPacketHome',
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
    ..aOM<RedPacketHomeData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RedPacketHomeData.create)
    ..hasRequiredFields = false;

  ResRedPacketHome._() : super();
  factory ResRedPacketHome({
    $core.bool? success,
    $core.String? msg,
    RedPacketHomeData? data,
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
  factory ResRedPacketHome.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRedPacketHome.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRedPacketHome clone() => ResRedPacketHome()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRedPacketHome copyWith(void Function(ResRedPacketHome) updates) =>
      super.copyWith((message) => updates(message as ResRedPacketHome))
          as ResRedPacketHome; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRedPacketHome create() => ResRedPacketHome._();
  ResRedPacketHome createEmptyInstance() => create();
  static $pb.PbList<ResRedPacketHome> createRepeated() =>
      $pb.PbList<ResRedPacketHome>();
  @$core.pragma('dart2js:noInline')
  static ResRedPacketHome getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRedPacketHome>(create);
  static ResRedPacketHome? _defaultInstance;

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
  RedPacketHomeData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RedPacketHomeData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RedPacketHomeData ensureData() => $_ensure(2);
}

class RedPacketHomeData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RedPacketHomeData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<RedPacket>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'redItems',
        $pb.PbFieldType.PM,
        subBuilder: RedPacket.create)
    ..aOM<RedPacketDurationCfg>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'durationConfig',
        subBuilder: RedPacketDurationCfg.create)
    ..aOM<RedPacketBeginTimeCfg>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'beginTimeConfig',
        subBuilder: RedPacketBeginTimeCfg.create)
    ..hasRequiredFields = false;

  RedPacketHomeData._() : super();
  factory RedPacketHomeData({
    $core.Iterable<RedPacket>? redItems,
    RedPacketDurationCfg? durationConfig,
    RedPacketBeginTimeCfg? beginTimeConfig,
  }) {
    final _result = create();
    if (redItems != null) {
      _result.redItems.addAll(redItems);
    }
    if (durationConfig != null) {
      _result.durationConfig = durationConfig;
    }
    if (beginTimeConfig != null) {
      _result.beginTimeConfig = beginTimeConfig;
    }
    return _result;
  }
  factory RedPacketHomeData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RedPacketHomeData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RedPacketHomeData clone() => RedPacketHomeData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RedPacketHomeData copyWith(void Function(RedPacketHomeData) updates) =>
      super.copyWith((message) => updates(message as RedPacketHomeData))
          as RedPacketHomeData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RedPacketHomeData create() => RedPacketHomeData._();
  RedPacketHomeData createEmptyInstance() => create();
  static $pb.PbList<RedPacketHomeData> createRepeated() =>
      $pb.PbList<RedPacketHomeData>();
  @$core.pragma('dart2js:noInline')
  static RedPacketHomeData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RedPacketHomeData>(create);
  static RedPacketHomeData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RedPacket> get redItems => $_getList(0);

  @$pb.TagNumber(2)
  RedPacketDurationCfg get durationConfig => $_getN(1);
  @$pb.TagNumber(2)
  set durationConfig(RedPacketDurationCfg v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDurationConfig() => $_has(1);
  @$pb.TagNumber(2)
  void clearDurationConfig() => clearField(2);
  @$pb.TagNumber(2)
  RedPacketDurationCfg ensureDurationConfig() => $_ensure(1);

  @$pb.TagNumber(3)
  RedPacketBeginTimeCfg get beginTimeConfig => $_getN(2);
  @$pb.TagNumber(3)
  set beginTimeConfig(RedPacketBeginTimeCfg v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBeginTimeConfig() => $_has(2);
  @$pb.TagNumber(3)
  void clearBeginTimeConfig() => clearField(3);
  @$pb.TagNumber(3)
  RedPacketBeginTimeCfg ensureBeginTimeConfig() => $_ensure(2);
}

class RedPacketDurationCfg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RedPacketDurationCfg',
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
    ..pc<RedPacketDuration>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'redPacketDuration',
        $pb.PbFieldType.PM,
        subBuilder: RedPacketDuration.create)
    ..hasRequiredFields = false;

  RedPacketDurationCfg._() : super();
  factory RedPacketDurationCfg({
    $core.String? name,
    $core.Iterable<RedPacketDuration>? redPacketDuration,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (redPacketDuration != null) {
      _result.redPacketDuration.addAll(redPacketDuration);
    }
    return _result;
  }
  factory RedPacketDurationCfg.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RedPacketDurationCfg.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RedPacketDurationCfg clone() =>
      RedPacketDurationCfg()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RedPacketDurationCfg copyWith(void Function(RedPacketDurationCfg) updates) =>
      super.copyWith((message) => updates(message as RedPacketDurationCfg))
          as RedPacketDurationCfg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RedPacketDurationCfg create() => RedPacketDurationCfg._();
  RedPacketDurationCfg createEmptyInstance() => create();
  static $pb.PbList<RedPacketDurationCfg> createRepeated() =>
      $pb.PbList<RedPacketDurationCfg>();
  @$core.pragma('dart2js:noInline')
  static RedPacketDurationCfg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RedPacketDurationCfg>(create);
  static RedPacketDurationCfg? _defaultInstance;

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
  $core.List<RedPacketDuration> get redPacketDuration => $_getList(1);
}

class RedPacketBeginTimeCfg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RedPacketBeginTimeCfg',
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
    ..pc<RedPacketBeginTime>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'redPacketBeginDuration',
        $pb.PbFieldType.PM,
        subBuilder: RedPacketBeginTime.create)
    ..hasRequiredFields = false;

  RedPacketBeginTimeCfg._() : super();
  factory RedPacketBeginTimeCfg({
    $core.String? name,
    $core.Iterable<RedPacketBeginTime>? redPacketBeginDuration,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (redPacketBeginDuration != null) {
      _result.redPacketBeginDuration.addAll(redPacketBeginDuration);
    }
    return _result;
  }
  factory RedPacketBeginTimeCfg.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RedPacketBeginTimeCfg.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RedPacketBeginTimeCfg clone() =>
      RedPacketBeginTimeCfg()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RedPacketBeginTimeCfg copyWith(
          void Function(RedPacketBeginTimeCfg) updates) =>
      super.copyWith((message) => updates(message as RedPacketBeginTimeCfg))
          as RedPacketBeginTimeCfg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RedPacketBeginTimeCfg create() => RedPacketBeginTimeCfg._();
  RedPacketBeginTimeCfg createEmptyInstance() => create();
  static $pb.PbList<RedPacketBeginTimeCfg> createRepeated() =>
      $pb.PbList<RedPacketBeginTimeCfg>();
  @$core.pragma('dart2js:noInline')
  static RedPacketBeginTimeCfg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RedPacketBeginTimeCfg>(create);
  static RedPacketBeginTimeCfg? _defaultInstance;

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
  $core.List<RedPacketBeginTime> get redPacketBeginDuration => $_getList(1);
}

class ResRobRedList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRobRedList',
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
    ..aOM<RedListData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RedListData.create)
    ..hasRequiredFields = false;

  ResRobRedList._() : super();
  factory ResRobRedList({
    $core.bool? success,
    $core.String? msg,
    RedListData? data,
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
  factory ResRobRedList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRobRedList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRobRedList clone() => ResRobRedList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRobRedList copyWith(void Function(ResRobRedList) updates) =>
      super.copyWith((message) => updates(message as ResRobRedList))
          as ResRobRedList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRobRedList create() => ResRobRedList._();
  ResRobRedList createEmptyInstance() => create();
  static $pb.PbList<ResRobRedList> createRepeated() =>
      $pb.PbList<ResRobRedList>();
  @$core.pragma('dart2js:noInline')
  static ResRobRedList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRobRedList>(create);
  static ResRobRedList? _defaultInstance;

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
  RedListData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RedListData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RedListData ensureData() => $_ensure(2);
}

class RedListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RedListData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<RobRedPacket>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'redList',
        $pb.PbFieldType.PM,
        subBuilder: RobRedPacket.create)
    ..hasRequiredFields = false;

  RedListData._() : super();
  factory RedListData({
    $core.Iterable<RobRedPacket>? redList,
  }) {
    final _result = create();
    if (redList != null) {
      _result.redList.addAll(redList);
    }
    return _result;
  }
  factory RedListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RedListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RedListData clone() => RedListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RedListData copyWith(void Function(RedListData) updates) =>
      super.copyWith((message) => updates(message as RedListData))
          as RedListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RedListData create() => RedListData._();
  RedListData createEmptyInstance() => create();
  static $pb.PbList<RedListData> createRepeated() => $pb.PbList<RedListData>();
  @$core.pragma('dart2js:noInline')
  static RedListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RedListData>(create);
  static RedListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RobRedPacket> get redList => $_getList(0);
}

class ResRedPacketDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRedPacketDetail',
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
    ..aOM<RedPacketDetailData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RedPacketDetailData.create)
    ..hasRequiredFields = false;

  ResRedPacketDetail._() : super();
  factory ResRedPacketDetail({
    $core.bool? success,
    $core.String? msg,
    RedPacketDetailData? data,
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
  factory ResRedPacketDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRedPacketDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRedPacketDetail clone() => ResRedPacketDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRedPacketDetail copyWith(void Function(ResRedPacketDetail) updates) =>
      super.copyWith((message) => updates(message as ResRedPacketDetail))
          as ResRedPacketDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRedPacketDetail create() => ResRedPacketDetail._();
  ResRedPacketDetail createEmptyInstance() => create();
  static $pb.PbList<ResRedPacketDetail> createRepeated() =>
      $pb.PbList<ResRedPacketDetail>();
  @$core.pragma('dart2js:noInline')
  static ResRedPacketDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRedPacketDetail>(create);
  static ResRedPacketDetail? _defaultInstance;

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
  RedPacketDetailData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RedPacketDetailData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RedPacketDetailData ensureData() => $_ensure(2);
}

class RedPacketDetailData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RedPacketDetailData',
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
            : 'redId',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'robNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'redSum',
        $pb.PbFieldType.OU3)
    ..pc<RedPacketUser>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        $pb.PbFieldType.PM,
        subBuilder: RedPacketUser.create)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'redAuthorText')
    ..aOB(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isAlreadyRob')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'goodsText')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'goodsIcon')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'goodsWhitherText')
    ..hasRequiredFields = false;

  RedPacketDetailData._() : super();
  factory RedPacketDetailData({
    $core.int? id,
    $core.int? redId,
    $core.String? name,
    $core.int? robNum,
    $core.int? redSum,
    $core.Iterable<RedPacketUser>? user,
    $core.String? redAuthorText,
    $core.bool? isAlreadyRob,
    $core.String? goodsText,
    $core.String? goodsIcon,
    $core.String? goodsWhitherText,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (redId != null) {
      _result.redId = redId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (robNum != null) {
      _result.robNum = robNum;
    }
    if (redSum != null) {
      _result.redSum = redSum;
    }
    if (user != null) {
      _result.user.addAll(user);
    }
    if (redAuthorText != null) {
      _result.redAuthorText = redAuthorText;
    }
    if (isAlreadyRob != null) {
      _result.isAlreadyRob = isAlreadyRob;
    }
    if (goodsText != null) {
      _result.goodsText = goodsText;
    }
    if (goodsIcon != null) {
      _result.goodsIcon = goodsIcon;
    }
    if (goodsWhitherText != null) {
      _result.goodsWhitherText = goodsWhitherText;
    }
    return _result;
  }
  factory RedPacketDetailData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RedPacketDetailData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RedPacketDetailData clone() => RedPacketDetailData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RedPacketDetailData copyWith(void Function(RedPacketDetailData) updates) =>
      super.copyWith((message) => updates(message as RedPacketDetailData))
          as RedPacketDetailData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RedPacketDetailData create() => RedPacketDetailData._();
  RedPacketDetailData createEmptyInstance() => create();
  static $pb.PbList<RedPacketDetailData> createRepeated() =>
      $pb.PbList<RedPacketDetailData>();
  @$core.pragma('dart2js:noInline')
  static RedPacketDetailData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RedPacketDetailData>(create);
  static RedPacketDetailData? _defaultInstance;

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
  $core.int get redId => $_getIZ(1);
  @$pb.TagNumber(2)
  set redId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRedId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRedId() => clearField(2);

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
  $core.int get robNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set robNum($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRobNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearRobNum() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get redSum => $_getIZ(4);
  @$pb.TagNumber(5)
  set redSum($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRedSum() => $_has(4);
  @$pb.TagNumber(5)
  void clearRedSum() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<RedPacketUser> get user => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get redAuthorText => $_getSZ(6);
  @$pb.TagNumber(7)
  set redAuthorText($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRedAuthorText() => $_has(6);
  @$pb.TagNumber(7)
  void clearRedAuthorText() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isAlreadyRob => $_getBF(7);
  @$pb.TagNumber(8)
  set isAlreadyRob($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasIsAlreadyRob() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsAlreadyRob() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get goodsText => $_getSZ(8);
  @$pb.TagNumber(9)
  set goodsText($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasGoodsText() => $_has(8);
  @$pb.TagNumber(9)
  void clearGoodsText() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get goodsIcon => $_getSZ(9);
  @$pb.TagNumber(10)
  set goodsIcon($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasGoodsIcon() => $_has(9);
  @$pb.TagNumber(10)
  void clearGoodsIcon() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get goodsWhitherText => $_getSZ(10);
  @$pb.TagNumber(11)
  set goodsWhitherText($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasGoodsWhitherText() => $_has(10);
  @$pb.TagNumber(11)
  void clearGoodsWhitherText() => clearField(11);
}

class ResRobRedPacket extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRobRedPacket',
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

  ResRobRedPacket._() : super();
  factory ResRobRedPacket({
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
  factory ResRobRedPacket.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRobRedPacket.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRobRedPacket clone() => ResRobRedPacket()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRobRedPacket copyWith(void Function(ResRobRedPacket) updates) =>
      super.copyWith((message) => updates(message as ResRobRedPacket))
          as ResRobRedPacket; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRobRedPacket create() => ResRobRedPacket._();
  ResRobRedPacket createEmptyInstance() => create();
  static $pb.PbList<ResRobRedPacket> createRepeated() =>
      $pb.PbList<ResRobRedPacket>();
  @$core.pragma('dart2js:noInline')
  static ResRobRedPacket getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRobRedPacket>(create);
  static ResRobRedPacket? _defaultInstance;

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

class RedPacketDuration extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RedPacketDuration',
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
    ..aInt64(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'seconds')
    ..hasRequiredFields = false;

  RedPacketDuration._() : super();
  factory RedPacketDuration({
    $core.int? id,
    $core.String? name,
    $fixnum.Int64? seconds,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (seconds != null) {
      _result.seconds = seconds;
    }
    return _result;
  }
  factory RedPacketDuration.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RedPacketDuration.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RedPacketDuration clone() => RedPacketDuration()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RedPacketDuration copyWith(void Function(RedPacketDuration) updates) =>
      super.copyWith((message) => updates(message as RedPacketDuration))
          as RedPacketDuration; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RedPacketDuration create() => RedPacketDuration._();
  RedPacketDuration createEmptyInstance() => create();
  static $pb.PbList<RedPacketDuration> createRepeated() =>
      $pb.PbList<RedPacketDuration>();
  @$core.pragma('dart2js:noInline')
  static RedPacketDuration getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RedPacketDuration>(create);
  static RedPacketDuration? _defaultInstance;

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
  $fixnum.Int64 get seconds => $_getI64(2);
  @$pb.TagNumber(3)
  set seconds($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSeconds() => $_has(2);
  @$pb.TagNumber(3)
  void clearSeconds() => clearField(3);
}

class RedPacketBeginTime extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RedPacketBeginTime',
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
    ..aInt64(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'seconds')
    ..hasRequiredFields = false;

  RedPacketBeginTime._() : super();
  factory RedPacketBeginTime({
    $core.int? id,
    $core.String? name,
    $fixnum.Int64? seconds,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (seconds != null) {
      _result.seconds = seconds;
    }
    return _result;
  }
  factory RedPacketBeginTime.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RedPacketBeginTime.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RedPacketBeginTime clone() => RedPacketBeginTime()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RedPacketBeginTime copyWith(void Function(RedPacketBeginTime) updates) =>
      super.copyWith((message) => updates(message as RedPacketBeginTime))
          as RedPacketBeginTime; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RedPacketBeginTime create() => RedPacketBeginTime._();
  RedPacketBeginTime createEmptyInstance() => create();
  static $pb.PbList<RedPacketBeginTime> createRepeated() =>
      $pb.PbList<RedPacketBeginTime>();
  @$core.pragma('dart2js:noInline')
  static RedPacketBeginTime getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RedPacketBeginTime>(create);
  static RedPacketBeginTime? _defaultInstance;

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
  $fixnum.Int64 get seconds => $_getI64(2);
  @$pb.TagNumber(3)
  set seconds($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSeconds() => $_has(2);
  @$pb.TagNumber(3)
  void clearSeconds() => clearField(3);
}

class RedPacket extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RedPacket',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'redId',
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
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fmtPriceText')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fmtDescText')
    ..pc<RedPacketMembers>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'members',
        $pb.PbFieldType.PM,
        subBuilder: RedPacketMembers.create)
    ..hasRequiredFields = false;

  RedPacket._() : super();
  factory RedPacket({
    $core.int? redId,
    $core.String? name,
    $core.int? price,
    $core.String? fmtPriceText,
    $core.String? fmtDescText,
    $core.Iterable<RedPacketMembers>? members,
  }) {
    final _result = create();
    if (redId != null) {
      _result.redId = redId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (price != null) {
      _result.price = price;
    }
    if (fmtPriceText != null) {
      _result.fmtPriceText = fmtPriceText;
    }
    if (fmtDescText != null) {
      _result.fmtDescText = fmtDescText;
    }
    if (members != null) {
      _result.members.addAll(members);
    }
    return _result;
  }
  factory RedPacket.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RedPacket.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RedPacket clone() => RedPacket()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RedPacket copyWith(void Function(RedPacket) updates) =>
      super.copyWith((message) => updates(message as RedPacket))
          as RedPacket; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RedPacket create() => RedPacket._();
  RedPacket createEmptyInstance() => create();
  static $pb.PbList<RedPacket> createRepeated() => $pb.PbList<RedPacket>();
  @$core.pragma('dart2js:noInline')
  static RedPacket getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RedPacket>(create);
  static RedPacket? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get redId => $_getIZ(0);
  @$pb.TagNumber(1)
  set redId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRedId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRedId() => clearField(1);

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
  $core.String get fmtPriceText => $_getSZ(3);
  @$pb.TagNumber(4)
  set fmtPriceText($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFmtPriceText() => $_has(3);
  @$pb.TagNumber(4)
  void clearFmtPriceText() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get fmtDescText => $_getSZ(4);
  @$pb.TagNumber(5)
  set fmtDescText($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFmtDescText() => $_has(4);
  @$pb.TagNumber(5)
  void clearFmtDescText() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<RedPacketMembers> get members => $_getList(5);
}

class RedPacketMembers extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RedPacketMembers',
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
            : 'sourceType',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
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
            : 'name')
    ..hasRequiredFields = false;

  RedPacketMembers._() : super();
  factory RedPacketMembers({
    $core.int? id,
    $core.int? sourceType,
    $core.int? num,
    $core.String? icon,
    $core.String? name,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (sourceType != null) {
      _result.sourceType = sourceType;
    }
    if (num != null) {
      _result.num = num;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory RedPacketMembers.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RedPacketMembers.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RedPacketMembers clone() => RedPacketMembers()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RedPacketMembers copyWith(void Function(RedPacketMembers) updates) =>
      super.copyWith((message) => updates(message as RedPacketMembers))
          as RedPacketMembers; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RedPacketMembers create() => RedPacketMembers._();
  RedPacketMembers createEmptyInstance() => create();
  static $pb.PbList<RedPacketMembers> createRepeated() =>
      $pb.PbList<RedPacketMembers>();
  @$core.pragma('dart2js:noInline')
  static RedPacketMembers getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RedPacketMembers>(create);
  static RedPacketMembers? _defaultInstance;

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
  $core.int get sourceType => $_getIZ(1);
  @$pb.TagNumber(2)
  set sourceType($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSourceType() => $_has(1);
  @$pb.TagNumber(2)
  void clearSourceType() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get num => $_getIZ(2);
  @$pb.TagNumber(3)
  set num($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearNum() => clearField(3);

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
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);
}

class RedPacketUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RedPacketUser',
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
            : 'giftIcon')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gotTime',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RedPacketUser._() : super();
  factory RedPacketUser({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? giftIcon,
    $core.int? gotTime,
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
    if (giftIcon != null) {
      _result.giftIcon = giftIcon;
    }
    if (gotTime != null) {
      _result.gotTime = gotTime;
    }
    return _result;
  }
  factory RedPacketUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RedPacketUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RedPacketUser clone() => RedPacketUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RedPacketUser copyWith(void Function(RedPacketUser) updates) =>
      super.copyWith((message) => updates(message as RedPacketUser))
          as RedPacketUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RedPacketUser create() => RedPacketUser._();
  RedPacketUser createEmptyInstance() => create();
  static $pb.PbList<RedPacketUser> createRepeated() =>
      $pb.PbList<RedPacketUser>();
  @$core.pragma('dart2js:noInline')
  static RedPacketUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RedPacketUser>(create);
  static RedPacketUser? _defaultInstance;

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
  $core.String get giftIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set giftIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGiftIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get gotTime => $_getIZ(4);
  @$pb.TagNumber(5)
  set gotTime($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGotTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearGotTime() => clearField(5);
}

class RobRedPacket extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RobRedPacket',
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
            : 'redId',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'startTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..aOM<RedPacketUser>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: RedPacketUser.create)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weight',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RobRedPacket._() : super();
  factory RobRedPacket({
    $core.int? id,
    $core.int? redId,
    $core.String? name,
    $core.int? startTime,
    $core.int? endTime,
    $core.int? state,
    RedPacketUser? user,
    $core.int? weight,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (redId != null) {
      _result.redId = redId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (startTime != null) {
      _result.startTime = startTime;
    }
    if (endTime != null) {
      _result.endTime = endTime;
    }
    if (state != null) {
      _result.state = state;
    }
    if (user != null) {
      _result.user = user;
    }
    if (weight != null) {
      _result.weight = weight;
    }
    return _result;
  }
  factory RobRedPacket.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RobRedPacket.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RobRedPacket clone() => RobRedPacket()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RobRedPacket copyWith(void Function(RobRedPacket) updates) =>
      super.copyWith((message) => updates(message as RobRedPacket))
          as RobRedPacket; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RobRedPacket create() => RobRedPacket._();
  RobRedPacket createEmptyInstance() => create();
  static $pb.PbList<RobRedPacket> createRepeated() =>
      $pb.PbList<RobRedPacket>();
  @$core.pragma('dart2js:noInline')
  static RobRedPacket getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RobRedPacket>(create);
  static RobRedPacket? _defaultInstance;

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
  $core.int get redId => $_getIZ(1);
  @$pb.TagNumber(2)
  set redId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRedId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRedId() => clearField(2);

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
  $core.int get startTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set startTime($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStartTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get endTime => $_getIZ(4);
  @$pb.TagNumber(5)
  set endTime($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasEndTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearEndTime() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get state => $_getIZ(5);
  @$pb.TagNumber(6)
  set state($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasState() => $_has(5);
  @$pb.TagNumber(6)
  void clearState() => clearField(6);

  @$pb.TagNumber(7)
  RedPacketUser get user => $_getN(6);
  @$pb.TagNumber(7)
  set user(RedPacketUser v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUser() => $_has(6);
  @$pb.TagNumber(7)
  void clearUser() => clearField(7);
  @$pb.TagNumber(7)
  RedPacketUser ensureUser() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.int get weight => $_getIZ(7);
  @$pb.TagNumber(8)
  set weight($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasWeight() => $_has(7);
  @$pb.TagNumber(8)
  void clearWeight() => clearField(8);
}
