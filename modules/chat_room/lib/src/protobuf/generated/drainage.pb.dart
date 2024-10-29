///
//  Generated code. Do not modify.
//  source: drainage.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'drainage.pbenum.dart';

export 'drainage.pbenum.dart';

class ResDrainageCreate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResDrainageCreate',
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
            : 'message')
    ..aOM<InviteData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: InviteData.create)
    ..hasRequiredFields = false;

  ResDrainageCreate._() : super();
  factory ResDrainageCreate({
    $core.bool? success,
    $core.String? message,
    InviteData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ResDrainageCreate.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResDrainageCreate.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResDrainageCreate clone() => ResDrainageCreate()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResDrainageCreate copyWith(void Function(ResDrainageCreate) updates) =>
      super.copyWith((message) => updates(message as ResDrainageCreate))
          as ResDrainageCreate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResDrainageCreate create() => ResDrainageCreate._();
  ResDrainageCreate createEmptyInstance() => create();
  static $pb.PbList<ResDrainageCreate> createRepeated() =>
      $pb.PbList<ResDrainageCreate>();
  @$core.pragma('dart2js:noInline')
  static ResDrainageCreate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResDrainageCreate>(create);
  static ResDrainageCreate? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  InviteData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(InviteData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  InviteData ensureData() => $_ensure(2);
}

class InviteData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'InviteData',
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

  InviteData._() : super();
  factory InviteData({
    $core.int? rid,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    return _result;
  }
  factory InviteData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory InviteData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  InviteData clone() => InviteData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  InviteData copyWith(void Function(InviteData) updates) =>
      super.copyWith((message) => updates(message as InviteData))
          as InviteData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InviteData create() => InviteData._();
  InviteData createEmptyInstance() => create();
  static $pb.PbList<InviteData> createRepeated() => $pb.PbList<InviteData>();
  @$core.pragma('dart2js:noInline')
  static InviteData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteData>(create);
  static InviteData? _defaultInstance;

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

class ResDrainageInviteReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResDrainageInviteReply',
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
            : 'message')
    ..aOM<InviteReplyData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: InviteReplyData.create)
    ..hasRequiredFields = false;

  ResDrainageInviteReply._() : super();
  factory ResDrainageInviteReply({
    $core.bool? success,
    $core.String? message,
    InviteReplyData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ResDrainageInviteReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResDrainageInviteReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResDrainageInviteReply clone() =>
      ResDrainageInviteReply()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResDrainageInviteReply copyWith(
          void Function(ResDrainageInviteReply) updates) =>
      super.copyWith((message) => updates(message as ResDrainageInviteReply))
          as ResDrainageInviteReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResDrainageInviteReply create() => ResDrainageInviteReply._();
  ResDrainageInviteReply createEmptyInstance() => create();
  static $pb.PbList<ResDrainageInviteReply> createRepeated() =>
      $pb.PbList<ResDrainageInviteReply>();
  @$core.pragma('dart2js:noInline')
  static ResDrainageInviteReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResDrainageInviteReply>(create);
  static ResDrainageInviteReply? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  InviteReplyData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(InviteReplyData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  InviteReplyData ensureData() => $_ensure(2);
}

class InviteReplyData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'InviteReplyData',
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

  InviteReplyData._() : super();
  factory InviteReplyData({
    $core.int? rid,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    return _result;
  }
  factory InviteReplyData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory InviteReplyData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  InviteReplyData clone() => InviteReplyData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  InviteReplyData copyWith(void Function(InviteReplyData) updates) =>
      super.copyWith((message) => updates(message as InviteReplyData))
          as InviteReplyData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InviteReplyData create() => InviteReplyData._();
  InviteReplyData createEmptyInstance() => create();
  static $pb.PbList<InviteReplyData> createRepeated() =>
      $pb.PbList<InviteReplyData>();
  @$core.pragma('dart2js:noInline')
  static InviteReplyData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteReplyData>(create);
  static InviteReplyData? _defaultInstance;

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

class ResDrainagePreview extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResDrainagePreview',
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
            : 'message')
    ..aOM<DrainagePreviewData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: DrainagePreviewData.create)
    ..hasRequiredFields = false;

  ResDrainagePreview._() : super();
  factory ResDrainagePreview({
    $core.bool? success,
    $core.String? message,
    DrainagePreviewData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ResDrainagePreview.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResDrainagePreview.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResDrainagePreview clone() => ResDrainagePreview()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResDrainagePreview copyWith(void Function(ResDrainagePreview) updates) =>
      super.copyWith((message) => updates(message as ResDrainagePreview))
          as ResDrainagePreview; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResDrainagePreview create() => ResDrainagePreview._();
  ResDrainagePreview createEmptyInstance() => create();
  static $pb.PbList<ResDrainagePreview> createRepeated() =>
      $pb.PbList<ResDrainagePreview>();
  @$core.pragma('dart2js:noInline')
  static ResDrainagePreview getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResDrainagePreview>(create);
  static ResDrainagePreview? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  DrainagePreviewData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(DrainagePreviewData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  DrainagePreviewData ensureData() => $_ensure(2);
}

class DrainagePreviewData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DrainagePreviewData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pullMsgInterval',
        $pb.PbFieldType.O3)
    ..pc<RoomDrainageData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'drainageRoom',
        $pb.PbFieldType.PM,
        subBuilder: RoomDrainageData.create)
    ..aOM<MasterRoomInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'masterRoom',
        subBuilder: MasterRoomInfo.create)
    ..pc<RoomDrainageLocking>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'locking',
        $pb.PbFieldType.PM,
        subBuilder: RoomDrainageLocking.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  DrainagePreviewData._() : super();
  factory DrainagePreviewData({
    $core.int? pullMsgInterval,
    $core.Iterable<RoomDrainageData>? drainageRoom,
    MasterRoomInfo? masterRoom,
    $core.Iterable<RoomDrainageLocking>? locking,
    $core.int? giftId,
  }) {
    final _result = create();
    if (pullMsgInterval != null) {
      _result.pullMsgInterval = pullMsgInterval;
    }
    if (drainageRoom != null) {
      _result.drainageRoom.addAll(drainageRoom);
    }
    if (masterRoom != null) {
      _result.masterRoom = masterRoom;
    }
    if (locking != null) {
      _result.locking.addAll(locking);
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    return _result;
  }
  factory DrainagePreviewData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DrainagePreviewData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DrainagePreviewData clone() => DrainagePreviewData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DrainagePreviewData copyWith(void Function(DrainagePreviewData) updates) =>
      super.copyWith((message) => updates(message as DrainagePreviewData))
          as DrainagePreviewData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DrainagePreviewData create() => DrainagePreviewData._();
  DrainagePreviewData createEmptyInstance() => create();
  static $pb.PbList<DrainagePreviewData> createRepeated() =>
      $pb.PbList<DrainagePreviewData>();
  @$core.pragma('dart2js:noInline')
  static DrainagePreviewData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DrainagePreviewData>(create);
  static DrainagePreviewData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pullMsgInterval => $_getIZ(0);
  @$pb.TagNumber(1)
  set pullMsgInterval($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPullMsgInterval() => $_has(0);
  @$pb.TagNumber(1)
  void clearPullMsgInterval() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<RoomDrainageData> get drainageRoom => $_getList(1);

  @$pb.TagNumber(3)
  MasterRoomInfo get masterRoom => $_getN(2);
  @$pb.TagNumber(3)
  set masterRoom(MasterRoomInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMasterRoom() => $_has(2);
  @$pb.TagNumber(3)
  void clearMasterRoom() => clearField(3);
  @$pb.TagNumber(3)
  MasterRoomInfo ensureMasterRoom() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<RoomDrainageLocking> get locking => $_getList(3);

  @$pb.TagNumber(5)
  $core.int get giftId => $_getIZ(4);
  @$pb.TagNumber(5)
  set giftId($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGiftId() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftId() => clearField(5);
}

class MasterRoomInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MasterRoomInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'masterRid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'masterIcon')
    ..hasRequiredFields = false;

  MasterRoomInfo._() : super();
  factory MasterRoomInfo({
    $core.int? masterRid,
    $core.String? masterIcon,
  }) {
    final _result = create();
    if (masterRid != null) {
      _result.masterRid = masterRid;
    }
    if (masterIcon != null) {
      _result.masterIcon = masterIcon;
    }
    return _result;
  }
  factory MasterRoomInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MasterRoomInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MasterRoomInfo clone() => MasterRoomInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MasterRoomInfo copyWith(void Function(MasterRoomInfo) updates) =>
      super.copyWith((message) => updates(message as MasterRoomInfo))
          as MasterRoomInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MasterRoomInfo create() => MasterRoomInfo._();
  MasterRoomInfo createEmptyInstance() => create();
  static $pb.PbList<MasterRoomInfo> createRepeated() =>
      $pb.PbList<MasterRoomInfo>();
  @$core.pragma('dart2js:noInline')
  static MasterRoomInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MasterRoomInfo>(create);
  static MasterRoomInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get masterRid => $_getIZ(0);
  @$pb.TagNumber(1)
  set masterRid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMasterRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearMasterRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get masterIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set masterIcon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMasterIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearMasterIcon() => clearField(2);
}

class RoomDrainageData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomDrainageData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..e<DrainageRoomType>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OE,
        defaultOrMaker: DrainageRoomType.DrainageRoomTypeNone,
        valueOf: DrainageRoomType.valueOf,
        enumValues: DrainageRoomType.values)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
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
            : 'showType',
        $pb.PbFieldType.O3)
    ..pc<DrainagePermission>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'permission',
        $pb.PbFieldType.PM,
        subBuilder: DrainagePermission.create)
    ..hasRequiredFields = false;

  RoomDrainageData._() : super();
  factory RoomDrainageData({
    DrainageRoomType? type,
    $core.int? rid,
    $core.String? name,
    $core.int? showType,
    $core.Iterable<DrainagePermission>? permission,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (showType != null) {
      _result.showType = showType;
    }
    if (permission != null) {
      _result.permission.addAll(permission);
    }
    return _result;
  }
  factory RoomDrainageData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomDrainageData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomDrainageData clone() => RoomDrainageData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomDrainageData copyWith(void Function(RoomDrainageData) updates) =>
      super.copyWith((message) => updates(message as RoomDrainageData))
          as RoomDrainageData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomDrainageData create() => RoomDrainageData._();
  RoomDrainageData createEmptyInstance() => create();
  static $pb.PbList<RoomDrainageData> createRepeated() =>
      $pb.PbList<RoomDrainageData>();
  @$core.pragma('dart2js:noInline')
  static RoomDrainageData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomDrainageData>(create);
  static RoomDrainageData? _defaultInstance;

  @$pb.TagNumber(1)
  DrainageRoomType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(DrainageRoomType v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rid => $_getIZ(1);
  @$pb.TagNumber(2)
  set rid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRid() => clearField(2);

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
  $core.int get showType => $_getIZ(3);
  @$pb.TagNumber(4)
  set showType($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasShowType() => $_has(3);
  @$pb.TagNumber(4)
  void clearShowType() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<DrainagePermission> get permission => $_getList(4);
}

class DrainagePermission extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DrainagePermission',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..e<RoomDrainageOperation>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'operation',
        $pb.PbFieldType.OE,
        defaultOrMaker: RoomDrainageOperation.RoomDrainageEnter,
        valueOf: RoomDrainageOperation.valueOf,
        enumValues: RoomDrainageOperation.values)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'copywriting')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'targetRid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  DrainagePermission._() : super();
  factory DrainagePermission({
    RoomDrainageOperation? operation,
    $core.String? copywriting,
    $core.int? targetRid,
  }) {
    final _result = create();
    if (operation != null) {
      _result.operation = operation;
    }
    if (copywriting != null) {
      _result.copywriting = copywriting;
    }
    if (targetRid != null) {
      _result.targetRid = targetRid;
    }
    return _result;
  }
  factory DrainagePermission.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DrainagePermission.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DrainagePermission clone() => DrainagePermission()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DrainagePermission copyWith(void Function(DrainagePermission) updates) =>
      super.copyWith((message) => updates(message as DrainagePermission))
          as DrainagePermission; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DrainagePermission create() => DrainagePermission._();
  DrainagePermission createEmptyInstance() => create();
  static $pb.PbList<DrainagePermission> createRepeated() =>
      $pb.PbList<DrainagePermission>();
  @$core.pragma('dart2js:noInline')
  static DrainagePermission getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DrainagePermission>(create);
  static DrainagePermission? _defaultInstance;

  @$pb.TagNumber(1)
  RoomDrainageOperation get operation => $_getN(0);
  @$pb.TagNumber(1)
  set operation(RoomDrainageOperation v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOperation() => $_has(0);
  @$pb.TagNumber(1)
  void clearOperation() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get copywriting => $_getSZ(1);
  @$pb.TagNumber(2)
  set copywriting($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCopywriting() => $_has(1);
  @$pb.TagNumber(2)
  void clearCopywriting() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get targetRid => $_getIZ(2);
  @$pb.TagNumber(3)
  set targetRid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTargetRid() => $_has(2);
  @$pb.TagNumber(3)
  void clearTargetRid() => clearField(3);
}

class RoomDrainageLocking extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomDrainageLocking',
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
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'locked')
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
    ..hasRequiredFields = false;

  RoomDrainageLocking._() : super();
  factory RoomDrainageLocking({
    $core.int? rid,
    $core.bool? locked,
    $core.String? name,
    $core.String? icon,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (locked != null) {
      _result.locked = locked;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory RoomDrainageLocking.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomDrainageLocking.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomDrainageLocking clone() => RoomDrainageLocking()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomDrainageLocking copyWith(void Function(RoomDrainageLocking) updates) =>
      super.copyWith((message) => updates(message as RoomDrainageLocking))
          as RoomDrainageLocking; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomDrainageLocking create() => RoomDrainageLocking._();
  RoomDrainageLocking createEmptyInstance() => create();
  static $pb.PbList<RoomDrainageLocking> createRepeated() =>
      $pb.PbList<RoomDrainageLocking>();
  @$core.pragma('dart2js:noInline')
  static RoomDrainageLocking getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomDrainageLocking>(create);
  static RoomDrainageLocking? _defaultInstance;

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
  $core.bool get locked => $_getBF(1);
  @$pb.TagNumber(2)
  set locked($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLocked() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocked() => clearField(2);

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
}

class ResDrainageOperate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResDrainageOperate',
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
            : 'message')
    ..hasRequiredFields = false;

  ResDrainageOperate._() : super();
  factory ResDrainageOperate({
    $core.bool? success,
    $core.String? message,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory ResDrainageOperate.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResDrainageOperate.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResDrainageOperate clone() => ResDrainageOperate()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResDrainageOperate copyWith(void Function(ResDrainageOperate) updates) =>
      super.copyWith((message) => updates(message as ResDrainageOperate))
          as ResDrainageOperate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResDrainageOperate create() => ResDrainageOperate._();
  ResDrainageOperate createEmptyInstance() => create();
  static $pb.PbList<ResDrainageOperate> createRepeated() =>
      $pb.PbList<ResDrainageOperate>();
  @$core.pragma('dart2js:noInline')
  static ResDrainageOperate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResDrainageOperate>(create);
  static ResDrainageOperate? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class RoomDrainageEventData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomDrainageEventData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'refreshInterval',
        $pb.PbFieldType.O3,
        protoName: 'refreshInterval')
    ..hasRequiredFields = false;

  RoomDrainageEventData._() : super();
  factory RoomDrainageEventData({
    $core.int? refreshInterval,
  }) {
    final _result = create();
    if (refreshInterval != null) {
      _result.refreshInterval = refreshInterval;
    }
    return _result;
  }
  factory RoomDrainageEventData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomDrainageEventData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomDrainageEventData clone() =>
      RoomDrainageEventData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomDrainageEventData copyWith(
          void Function(RoomDrainageEventData) updates) =>
      super.copyWith((message) => updates(message as RoomDrainageEventData))
          as RoomDrainageEventData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomDrainageEventData create() => RoomDrainageEventData._();
  RoomDrainageEventData createEmptyInstance() => create();
  static $pb.PbList<RoomDrainageEventData> createRepeated() =>
      $pb.PbList<RoomDrainageEventData>();
  @$core.pragma('dart2js:noInline')
  static RoomDrainageEventData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomDrainageEventData>(create);
  static RoomDrainageEventData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get refreshInterval => $_getIZ(0);
  @$pb.TagNumber(1)
  set refreshInterval($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRefreshInterval() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefreshInterval() => clearField(1);
}

class ResDrainagePreferences extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResDrainagePreferences',
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
            : 'message')
    ..aOM<DrainagePreferencesData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: DrainagePreferencesData.create)
    ..hasRequiredFields = false;

  ResDrainagePreferences._() : super();
  factory ResDrainagePreferences({
    $core.bool? success,
    $core.String? message,
    DrainagePreferencesData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ResDrainagePreferences.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResDrainagePreferences.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResDrainagePreferences clone() =>
      ResDrainagePreferences()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResDrainagePreferences copyWith(
          void Function(ResDrainagePreferences) updates) =>
      super.copyWith((message) => updates(message as ResDrainagePreferences))
          as ResDrainagePreferences; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResDrainagePreferences create() => ResDrainagePreferences._();
  ResDrainagePreferences createEmptyInstance() => create();
  static $pb.PbList<ResDrainagePreferences> createRepeated() =>
      $pb.PbList<ResDrainagePreferences>();
  @$core.pragma('dart2js:noInline')
  static ResDrainagePreferences getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResDrainagePreferences>(create);
  static ResDrainagePreferences? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  DrainagePreferencesData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(DrainagePreferencesData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  DrainagePreferencesData ensureData() => $_ensure(2);
}

class DrainagePreferencesData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DrainagePreferencesData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showNoPermission',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  DrainagePreferencesData._() : super();
  factory DrainagePreferencesData({
    $core.int? showNoPermission,
  }) {
    final _result = create();
    if (showNoPermission != null) {
      _result.showNoPermission = showNoPermission;
    }
    return _result;
  }
  factory DrainagePreferencesData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DrainagePreferencesData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DrainagePreferencesData clone() =>
      DrainagePreferencesData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DrainagePreferencesData copyWith(
          void Function(DrainagePreferencesData) updates) =>
      super.copyWith((message) => updates(message as DrainagePreferencesData))
          as DrainagePreferencesData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DrainagePreferencesData create() => DrainagePreferencesData._();
  DrainagePreferencesData createEmptyInstance() => create();
  static $pb.PbList<DrainagePreferencesData> createRepeated() =>
      $pb.PbList<DrainagePreferencesData>();
  @$core.pragma('dart2js:noInline')
  static DrainagePreferencesData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DrainagePreferencesData>(create);
  static DrainagePreferencesData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get showNoPermission => $_getIZ(0);
  @$pb.TagNumber(1)
  set showNoPermission($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShowNoPermission() => $_has(0);
  @$pb.TagNumber(1)
  void clearShowNoPermission() => clearField(1);
}
