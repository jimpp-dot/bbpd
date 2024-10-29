///
//  Generated code. Do not modify.
//  source: room_guess_song.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GuessGroupItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessGroupItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupName')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasSelect',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GuessGroupItem._() : super();
  factory GuessGroupItem({
    $core.int? groupId,
    $core.String? groupName,
    $core.int? hasSelect,
  }) {
    final _result = create();
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (groupName != null) {
      _result.groupName = groupName;
    }
    if (hasSelect != null) {
      _result.hasSelect = hasSelect;
    }
    return _result;
  }
  factory GuessGroupItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessGroupItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessGroupItem clone() => GuessGroupItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessGroupItem copyWith(void Function(GuessGroupItem) updates) =>
      super.copyWith((message) => updates(message as GuessGroupItem))
          as GuessGroupItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessGroupItem create() => GuessGroupItem._();
  GuessGroupItem createEmptyInstance() => create();
  static $pb.PbList<GuessGroupItem> createRepeated() =>
      $pb.PbList<GuessGroupItem>();
  @$core.pragma('dart2js:noInline')
  static GuessGroupItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessGroupItem>(create);
  static GuessGroupItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get groupId => $_getIZ(0);
  @$pb.TagNumber(1)
  set groupId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get groupName => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGroupName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get hasSelect => $_getIZ(2);
  @$pb.TagNumber(3)
  set hasSelect($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHasSelect() => $_has(2);
  @$pb.TagNumber(3)
  void clearHasSelect() => clearField(3);
}

class GuessAnswerItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessAnswerItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songName')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasSelect',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isRight',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GuessAnswerItem._() : super();
  factory GuessAnswerItem({
    $core.int? songId,
    $core.String? songName,
    $core.int? hasSelect,
    $core.int? isRight,
  }) {
    final _result = create();
    if (songId != null) {
      _result.songId = songId;
    }
    if (songName != null) {
      _result.songName = songName;
    }
    if (hasSelect != null) {
      _result.hasSelect = hasSelect;
    }
    if (isRight != null) {
      _result.isRight = isRight;
    }
    return _result;
  }
  factory GuessAnswerItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessAnswerItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessAnswerItem clone() => GuessAnswerItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessAnswerItem copyWith(void Function(GuessAnswerItem) updates) =>
      super.copyWith((message) => updates(message as GuessAnswerItem))
          as GuessAnswerItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessAnswerItem create() => GuessAnswerItem._();
  GuessAnswerItem createEmptyInstance() => create();
  static $pb.PbList<GuessAnswerItem> createRepeated() =>
      $pb.PbList<GuessAnswerItem>();
  @$core.pragma('dart2js:noInline')
  static GuessAnswerItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessAnswerItem>(create);
  static GuessAnswerItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get songId => $_getIZ(0);
  @$pb.TagNumber(1)
  set songId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSongId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSongId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get songName => $_getSZ(1);
  @$pb.TagNumber(2)
  set songName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSongName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSongName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get hasSelect => $_getIZ(2);
  @$pb.TagNumber(3)
  set hasSelect($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHasSelect() => $_has(2);
  @$pb.TagNumber(3)
  void clearHasSelect() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get isRight => $_getIZ(3);
  @$pb.TagNumber(4)
  set isRight($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsRight() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsRight() => clearField(4);
}

class GuessPubAnswerInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessPubAnswerInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rightName')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rightNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wrongNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isComplete',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GuessPubAnswerInfo._() : super();
  factory GuessPubAnswerInfo({
    $core.String? rightName,
    $core.int? rightNum,
    $core.int? wrongNum,
    $core.int? isComplete,
  }) {
    final _result = create();
    if (rightName != null) {
      _result.rightName = rightName;
    }
    if (rightNum != null) {
      _result.rightNum = rightNum;
    }
    if (wrongNum != null) {
      _result.wrongNum = wrongNum;
    }
    if (isComplete != null) {
      _result.isComplete = isComplete;
    }
    return _result;
  }
  factory GuessPubAnswerInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessPubAnswerInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessPubAnswerInfo clone() => GuessPubAnswerInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessPubAnswerInfo copyWith(void Function(GuessPubAnswerInfo) updates) =>
      super.copyWith((message) => updates(message as GuessPubAnswerInfo))
          as GuessPubAnswerInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessPubAnswerInfo create() => GuessPubAnswerInfo._();
  GuessPubAnswerInfo createEmptyInstance() => create();
  static $pb.PbList<GuessPubAnswerInfo> createRepeated() =>
      $pb.PbList<GuessPubAnswerInfo>();
  @$core.pragma('dart2js:noInline')
  static GuessPubAnswerInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessPubAnswerInfo>(create);
  static GuessPubAnswerInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get rightName => $_getSZ(0);
  @$pb.TagNumber(1)
  set rightName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRightName() => $_has(0);
  @$pb.TagNumber(1)
  void clearRightName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rightNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set rightNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRightNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearRightNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get wrongNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set wrongNum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasWrongNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearWrongNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get isComplete => $_getIZ(3);
  @$pb.TagNumber(4)
  set isComplete($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsComplete() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsComplete() => clearField(4);
}

class GuessSongConfigData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessSongConfigData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentState')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomScore',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentMode')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songIndex',
        $pb.PbFieldType.OU3)
    ..pc<GuessGroupItem>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupList',
        $pb.PbFieldType.PM,
        subBuilder: GuessGroupItem.create)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentDateline',
        $pb.PbFieldType.OU3)
    ..pc<GuessAnswerItem>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'answerList',
        $pb.PbFieldType.PM,
        subBuilder: GuessAnswerItem.create)
    ..aOM<GuessPubAnswerInfo>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pubAnswerInfo',
        subBuilder: GuessPubAnswerInfo.create)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupName')
    ..aOM<PlaySongItem>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songInfo',
        subBuilder: PlaySongItem.create)
    ..hasRequiredFields = false;

  GuessSongConfigData._() : super();
  factory GuessSongConfigData({
    $core.String? currentState,
    $core.int? roomScore,
    $core.String? currentMode,
    $core.int? songIndex,
    $core.Iterable<GuessGroupItem>? groupList,
    $core.int? currentDateline,
    $core.Iterable<GuessAnswerItem>? answerList,
    GuessPubAnswerInfo? pubAnswerInfo,
    $core.String? groupName,
    PlaySongItem? songInfo,
  }) {
    final _result = create();
    if (currentState != null) {
      _result.currentState = currentState;
    }
    if (roomScore != null) {
      _result.roomScore = roomScore;
    }
    if (currentMode != null) {
      _result.currentMode = currentMode;
    }
    if (songIndex != null) {
      _result.songIndex = songIndex;
    }
    if (groupList != null) {
      _result.groupList.addAll(groupList);
    }
    if (currentDateline != null) {
      _result.currentDateline = currentDateline;
    }
    if (answerList != null) {
      _result.answerList.addAll(answerList);
    }
    if (pubAnswerInfo != null) {
      _result.pubAnswerInfo = pubAnswerInfo;
    }
    if (groupName != null) {
      _result.groupName = groupName;
    }
    if (songInfo != null) {
      _result.songInfo = songInfo;
    }
    return _result;
  }
  factory GuessSongConfigData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessSongConfigData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessSongConfigData clone() => GuessSongConfigData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessSongConfigData copyWith(void Function(GuessSongConfigData) updates) =>
      super.copyWith((message) => updates(message as GuessSongConfigData))
          as GuessSongConfigData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessSongConfigData create() => GuessSongConfigData._();
  GuessSongConfigData createEmptyInstance() => create();
  static $pb.PbList<GuessSongConfigData> createRepeated() =>
      $pb.PbList<GuessSongConfigData>();
  @$core.pragma('dart2js:noInline')
  static GuessSongConfigData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessSongConfigData>(create);
  static GuessSongConfigData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get currentState => $_getSZ(0);
  @$pb.TagNumber(1)
  set currentState($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCurrentState() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentState() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get roomScore => $_getIZ(1);
  @$pb.TagNumber(2)
  set roomScore($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRoomScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomScore() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get currentMode => $_getSZ(2);
  @$pb.TagNumber(3)
  set currentMode($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCurrentMode() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentMode() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get songIndex => $_getIZ(3);
  @$pb.TagNumber(4)
  set songIndex($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSongIndex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSongIndex() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<GuessGroupItem> get groupList => $_getList(4);

  @$pb.TagNumber(6)
  $core.int get currentDateline => $_getIZ(5);
  @$pb.TagNumber(6)
  set currentDateline($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCurrentDateline() => $_has(5);
  @$pb.TagNumber(6)
  void clearCurrentDateline() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<GuessAnswerItem> get answerList => $_getList(6);

  @$pb.TagNumber(8)
  GuessPubAnswerInfo get pubAnswerInfo => $_getN(7);
  @$pb.TagNumber(8)
  set pubAnswerInfo(GuessPubAnswerInfo v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPubAnswerInfo() => $_has(7);
  @$pb.TagNumber(8)
  void clearPubAnswerInfo() => clearField(8);
  @$pb.TagNumber(8)
  GuessPubAnswerInfo ensurePubAnswerInfo() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.String get groupName => $_getSZ(8);
  @$pb.TagNumber(9)
  set groupName($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasGroupName() => $_has(8);
  @$pb.TagNumber(9)
  void clearGroupName() => clearField(9);

  @$pb.TagNumber(10)
  PlaySongItem get songInfo => $_getN(9);
  @$pb.TagNumber(10)
  set songInfo(PlaySongItem v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasSongInfo() => $_has(9);
  @$pb.TagNumber(10)
  void clearSongInfo() => clearField(10);
  @$pb.TagNumber(10)
  PlaySongItem ensureSongInfo() => $_ensure(9);
}

class GuessSongGiftToast extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessSongGiftToast',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewardType',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toastTitle')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toastText')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewardGiftIcon')
    ..p<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uidFilterList',
        $pb.PbFieldType.PU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'recordId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GuessSongGiftToast._() : super();
  factory GuessSongGiftToast({
    $core.int? rewardType,
    $core.String? toastTitle,
    $core.String? toastText,
    $core.String? rewardGiftIcon,
    $core.Iterable<$core.int>? uidFilterList,
    $core.int? recordId,
  }) {
    final _result = create();
    if (rewardType != null) {
      _result.rewardType = rewardType;
    }
    if (toastTitle != null) {
      _result.toastTitle = toastTitle;
    }
    if (toastText != null) {
      _result.toastText = toastText;
    }
    if (rewardGiftIcon != null) {
      _result.rewardGiftIcon = rewardGiftIcon;
    }
    if (uidFilterList != null) {
      _result.uidFilterList.addAll(uidFilterList);
    }
    if (recordId != null) {
      _result.recordId = recordId;
    }
    return _result;
  }
  factory GuessSongGiftToast.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessSongGiftToast.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessSongGiftToast clone() => GuessSongGiftToast()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessSongGiftToast copyWith(void Function(GuessSongGiftToast) updates) =>
      super.copyWith((message) => updates(message as GuessSongGiftToast))
          as GuessSongGiftToast; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessSongGiftToast create() => GuessSongGiftToast._();
  GuessSongGiftToast createEmptyInstance() => create();
  static $pb.PbList<GuessSongGiftToast> createRepeated() =>
      $pb.PbList<GuessSongGiftToast>();
  @$core.pragma('dart2js:noInline')
  static GuessSongGiftToast getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessSongGiftToast>(create);
  static GuessSongGiftToast? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rewardType => $_getIZ(0);
  @$pb.TagNumber(1)
  set rewardType($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRewardType() => $_has(0);
  @$pb.TagNumber(1)
  void clearRewardType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get toastTitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set toastTitle($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasToastTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearToastTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get toastText => $_getSZ(2);
  @$pb.TagNumber(3)
  set toastText($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasToastText() => $_has(2);
  @$pb.TagNumber(3)
  void clearToastText() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get rewardGiftIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set rewardGiftIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRewardGiftIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearRewardGiftIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get uidFilterList => $_getList(4);

  @$pb.TagNumber(6)
  $core.int get recordId => $_getIZ(5);
  @$pb.TagNumber(6)
  set recordId($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRecordId() => $_has(5);
  @$pb.TagNumber(6)
  void clearRecordId() => clearField(6);
}

class GuessSongConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessSongConfig',
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
    ..aOM<GuessSongConfigData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GuessSongConfigData.create)
    ..hasRequiredFields = false;

  GuessSongConfig._() : super();
  factory GuessSongConfig({
    $core.bool? success,
    $core.String? msg,
    GuessSongConfigData? data,
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
  factory GuessSongConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessSongConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessSongConfig clone() => GuessSongConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessSongConfig copyWith(void Function(GuessSongConfig) updates) =>
      super.copyWith((message) => updates(message as GuessSongConfig))
          as GuessSongConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessSongConfig create() => GuessSongConfig._();
  GuessSongConfig createEmptyInstance() => create();
  static $pb.PbList<GuessSongConfig> createRepeated() =>
      $pb.PbList<GuessSongConfig>();
  @$core.pragma('dart2js:noInline')
  static GuessSongConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessSongConfig>(create);
  static GuessSongConfig? _defaultInstance;

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
  GuessSongConfigData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GuessSongConfigData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GuessSongConfigData ensureData() => $_ensure(2);
}

class PlaySongItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PlaySongItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'songUrl')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PlaySongItem._() : super();
  factory PlaySongItem({
    $core.int? songId,
    $core.String? songUrl,
    $core.int? duration,
  }) {
    final _result = create();
    if (songId != null) {
      _result.songId = songId;
    }
    if (songUrl != null) {
      _result.songUrl = songUrl;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    return _result;
  }
  factory PlaySongItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PlaySongItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PlaySongItem clone() => PlaySongItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PlaySongItem copyWith(void Function(PlaySongItem) updates) =>
      super.copyWith((message) => updates(message as PlaySongItem))
          as PlaySongItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlaySongItem create() => PlaySongItem._();
  PlaySongItem createEmptyInstance() => create();
  static $pb.PbList<PlaySongItem> createRepeated() =>
      $pb.PbList<PlaySongItem>();
  @$core.pragma('dart2js:noInline')
  static PlaySongItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PlaySongItem>(create);
  static PlaySongItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get songId => $_getIZ(0);
  @$pb.TagNumber(1)
  set songId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSongId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSongId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get songUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set songUrl($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSongUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearSongUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get duration => $_getIZ(2);
  @$pb.TagNumber(3)
  set duration($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuration() => clearField(3);
}

class ResGuessStartPlay extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGuessStartPlay',
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
    ..pc<PlaySongItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: PlaySongItem.create)
    ..hasRequiredFields = false;

  ResGuessStartPlay._() : super();
  factory ResGuessStartPlay({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<PlaySongItem>? list,
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
  factory ResGuessStartPlay.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGuessStartPlay.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGuessStartPlay clone() => ResGuessStartPlay()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGuessStartPlay copyWith(void Function(ResGuessStartPlay) updates) =>
      super.copyWith((message) => updates(message as ResGuessStartPlay))
          as ResGuessStartPlay; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGuessStartPlay create() => ResGuessStartPlay._();
  ResGuessStartPlay createEmptyInstance() => create();
  static $pb.PbList<ResGuessStartPlay> createRepeated() =>
      $pb.PbList<ResGuessStartPlay>();
  @$core.pragma('dart2js:noInline')
  static ResGuessStartPlay getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGuessStartPlay>(create);
  static ResGuessStartPlay? _defaultInstance;

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
  $core.List<PlaySongItem> get list => $_getList(2);
}

class ResGuessAnswerSong extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGuessAnswerSong',
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
            : 'isRight')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rightSongName')
    ..hasRequiredFields = false;

  ResGuessAnswerSong._() : super();
  factory ResGuessAnswerSong({
    $core.bool? success,
    $core.String? msg,
    $core.bool? isRight,
    $core.String? rightSongName,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (isRight != null) {
      _result.isRight = isRight;
    }
    if (rightSongName != null) {
      _result.rightSongName = rightSongName;
    }
    return _result;
  }
  factory ResGuessAnswerSong.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGuessAnswerSong.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGuessAnswerSong clone() => ResGuessAnswerSong()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGuessAnswerSong copyWith(void Function(ResGuessAnswerSong) updates) =>
      super.copyWith((message) => updates(message as ResGuessAnswerSong))
          as ResGuessAnswerSong; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGuessAnswerSong create() => ResGuessAnswerSong._();
  ResGuessAnswerSong createEmptyInstance() => create();
  static $pb.PbList<ResGuessAnswerSong> createRepeated() =>
      $pb.PbList<ResGuessAnswerSong>();
  @$core.pragma('dart2js:noInline')
  static ResGuessAnswerSong getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGuessAnswerSong>(create);
  static ResGuessAnswerSong? _defaultInstance;

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
  $core.bool get isRight => $_getBF(2);
  @$pb.TagNumber(3)
  set isRight($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIsRight() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsRight() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get rightSongName => $_getSZ(3);
  @$pb.TagNumber(4)
  set rightSongName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRightSongName() => $_has(3);
  @$pb.TagNumber(4)
  void clearRightSongName() => clearField(4);
}

class GuessRankRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessRankRsp',
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
    ..pc<UserGuess>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userList',
        $pb.PbFieldType.PM,
        subBuilder: UserGuess.create)
    ..pc<RoomGuess>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomList',
        $pb.PbFieldType.PM,
        subBuilder: RoomGuess.create)
    ..aOM<UserGuess>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'personal',
        subBuilder: UserGuess.create)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'startId',
        $pb.PbFieldType.O3)
    ..aOM<RoomGuess>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'personalRoom',
        subBuilder: RoomGuess.create)
    ..hasRequiredFields = false;

  GuessRankRsp._() : super();
  factory GuessRankRsp({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<UserGuess>? userList,
    $core.Iterable<RoomGuess>? roomList,
    UserGuess? personal,
    $core.int? startId,
    RoomGuess? personalRoom,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (userList != null) {
      _result.userList.addAll(userList);
    }
    if (roomList != null) {
      _result.roomList.addAll(roomList);
    }
    if (personal != null) {
      _result.personal = personal;
    }
    if (startId != null) {
      _result.startId = startId;
    }
    if (personalRoom != null) {
      _result.personalRoom = personalRoom;
    }
    return _result;
  }
  factory GuessRankRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessRankRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessRankRsp clone() => GuessRankRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessRankRsp copyWith(void Function(GuessRankRsp) updates) =>
      super.copyWith((message) => updates(message as GuessRankRsp))
          as GuessRankRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessRankRsp create() => GuessRankRsp._();
  GuessRankRsp createEmptyInstance() => create();
  static $pb.PbList<GuessRankRsp> createRepeated() =>
      $pb.PbList<GuessRankRsp>();
  @$core.pragma('dart2js:noInline')
  static GuessRankRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessRankRsp>(create);
  static GuessRankRsp? _defaultInstance;

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
  $core.List<UserGuess> get userList => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<RoomGuess> get roomList => $_getList(3);

  @$pb.TagNumber(5)
  UserGuess get personal => $_getN(4);
  @$pb.TagNumber(5)
  set personal(UserGuess v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPersonal() => $_has(4);
  @$pb.TagNumber(5)
  void clearPersonal() => clearField(5);
  @$pb.TagNumber(5)
  UserGuess ensurePersonal() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.int get startId => $_getIZ(5);
  @$pb.TagNumber(6)
  set startId($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasStartId() => $_has(5);
  @$pb.TagNumber(6)
  void clearStartId() => clearField(6);

  @$pb.TagNumber(7)
  RoomGuess get personalRoom => $_getN(6);
  @$pb.TagNumber(7)
  set personalRoom(RoomGuess v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPersonalRoom() => $_has(6);
  @$pb.TagNumber(7)
  void clearPersonalRoom() => clearField(7);
  @$pb.TagNumber(7)
  RoomGuess ensurePersonalRoom() => $_ensure(6);
}

class UserGuess extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserGuess',
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
            : 'icon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weekGrade',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  UserGuess._() : super();
  factory UserGuess({
    $core.int? id,
    $core.String? icon,
    $core.String? name,
    $core.int? weekGrade,
    $core.int? uid,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (weekGrade != null) {
      _result.weekGrade = weekGrade;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory UserGuess.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserGuess.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserGuess clone() => UserGuess()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserGuess copyWith(void Function(UserGuess) updates) =>
      super.copyWith((message) => updates(message as UserGuess))
          as UserGuess; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserGuess create() => UserGuess._();
  UserGuess createEmptyInstance() => create();
  static $pb.PbList<UserGuess> createRepeated() => $pb.PbList<UserGuess>();
  @$core.pragma('dart2js:noInline')
  static UserGuess getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserGuess>(create);
  static UserGuess? _defaultInstance;

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
  $core.int get weekGrade => $_getIZ(3);
  @$pb.TagNumber(4)
  set weekGrade($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasWeekGrade() => $_has(3);
  @$pb.TagNumber(4)
  void clearWeekGrade() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get uid => $_getIZ(4);
  @$pb.TagNumber(5)
  set uid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearUid() => clearField(5);
}

class RoomGuess extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomGuess',
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
            : 'roomIcon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomName')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weekGrade',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomGuess._() : super();
  factory RoomGuess({
    $core.int? id,
    $core.String? roomIcon,
    $core.String? roomName,
    $core.int? weekGrade,
    $core.int? rid,
    $core.int? unId,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (roomIcon != null) {
      _result.roomIcon = roomIcon;
    }
    if (roomName != null) {
      _result.roomName = roomName;
    }
    if (weekGrade != null) {
      _result.weekGrade = weekGrade;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (unId != null) {
      _result.unId = unId;
    }
    return _result;
  }
  factory RoomGuess.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomGuess.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomGuess clone() => RoomGuess()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomGuess copyWith(void Function(RoomGuess) updates) =>
      super.copyWith((message) => updates(message as RoomGuess))
          as RoomGuess; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomGuess create() => RoomGuess._();
  RoomGuess createEmptyInstance() => create();
  static $pb.PbList<RoomGuess> createRepeated() => $pb.PbList<RoomGuess>();
  @$core.pragma('dart2js:noInline')
  static RoomGuess getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomGuess>(create);
  static RoomGuess? _defaultInstance;

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
  $core.String get roomIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomIcon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRoomIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomName => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRoomName() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get weekGrade => $_getIZ(3);
  @$pb.TagNumber(4)
  set weekGrade($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasWeekGrade() => $_has(3);
  @$pb.TagNumber(4)
  void clearWeekGrade() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get rid => $_getIZ(4);
  @$pb.TagNumber(5)
  set rid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRid() => $_has(4);
  @$pb.TagNumber(5)
  void clearRid() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get unId => $_getIZ(5);
  @$pb.TagNumber(6)
  set unId($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUnId() => $_has(5);
  @$pb.TagNumber(6)
  void clearUnId() => clearField(6);
}

class LucksRedPacketData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LucksRedPacketData',
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
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..pc<LuckRedPacketDataItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: LuckRedPacketDataItem.create)
    ..hasRequiredFields = false;

  LucksRedPacketData._() : super();
  factory LucksRedPacketData({
    $core.String? title,
    $core.String? content,
    $core.Iterable<LuckRedPacketDataItem>? list,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (content != null) {
      _result.content = content;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory LucksRedPacketData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LucksRedPacketData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LucksRedPacketData clone() => LucksRedPacketData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LucksRedPacketData copyWith(void Function(LucksRedPacketData) updates) =>
      super.copyWith((message) => updates(message as LucksRedPacketData))
          as LucksRedPacketData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LucksRedPacketData create() => LucksRedPacketData._();
  LucksRedPacketData createEmptyInstance() => create();
  static $pb.PbList<LucksRedPacketData> createRepeated() =>
      $pb.PbList<LucksRedPacketData>();
  @$core.pragma('dart2js:noInline')
  static LucksRedPacketData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LucksRedPacketData>(create);
  static LucksRedPacketData? _defaultInstance;

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
  $core.List<LuckRedPacketDataItem> get list => $_getList(2);
}

class LuckRedPacketDataItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LuckRedPacketDataItem',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poolId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'recordId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentScore',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  LuckRedPacketDataItem._() : super();
  factory LuckRedPacketDataItem({
    $core.String? name,
    $core.int? score,
    $core.String? desc,
    $core.int? status,
    $core.int? poolId,
    $core.int? price,
    $core.int? recordId,
    $core.int? currentScore,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (score != null) {
      _result.score = score;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (status != null) {
      _result.status = status;
    }
    if (poolId != null) {
      _result.poolId = poolId;
    }
    if (price != null) {
      _result.price = price;
    }
    if (recordId != null) {
      _result.recordId = recordId;
    }
    if (currentScore != null) {
      _result.currentScore = currentScore;
    }
    return _result;
  }
  factory LuckRedPacketDataItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LuckRedPacketDataItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LuckRedPacketDataItem clone() =>
      LuckRedPacketDataItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LuckRedPacketDataItem copyWith(
          void Function(LuckRedPacketDataItem) updates) =>
      super.copyWith((message) => updates(message as LuckRedPacketDataItem))
          as LuckRedPacketDataItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LuckRedPacketDataItem create() => LuckRedPacketDataItem._();
  LuckRedPacketDataItem createEmptyInstance() => create();
  static $pb.PbList<LuckRedPacketDataItem> createRepeated() =>
      $pb.PbList<LuckRedPacketDataItem>();
  @$core.pragma('dart2js:noInline')
  static LuckRedPacketDataItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LuckRedPacketDataItem>(create);
  static LuckRedPacketDataItem? _defaultInstance;

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
  $core.int get score => $_getIZ(1);
  @$pb.TagNumber(2)
  set score($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearScore() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get desc => $_getSZ(2);
  @$pb.TagNumber(3)
  set desc($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesc() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get status => $_getIZ(3);
  @$pb.TagNumber(4)
  set status($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get poolId => $_getIZ(4);
  @$pb.TagNumber(5)
  set poolId($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPoolId() => $_has(4);
  @$pb.TagNumber(5)
  void clearPoolId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get price => $_getIZ(5);
  @$pb.TagNumber(6)
  set price($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPrice() => $_has(5);
  @$pb.TagNumber(6)
  void clearPrice() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get recordId => $_getIZ(6);
  @$pb.TagNumber(7)
  set recordId($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRecordId() => $_has(6);
  @$pb.TagNumber(7)
  void clearRecordId() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get currentScore => $_getIZ(7);
  @$pb.TagNumber(8)
  set currentScore($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasCurrentScore() => $_has(7);
  @$pb.TagNumber(8)
  void clearCurrentScore() => clearField(8);
}

class ResLuckRedPacket extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResLuckRedPacket',
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
    ..aOM<LucksRedPacketData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: LucksRedPacketData.create)
    ..hasRequiredFields = false;

  ResLuckRedPacket._() : super();
  factory ResLuckRedPacket({
    $core.bool? success,
    $core.String? msg,
    LucksRedPacketData? data,
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
  factory ResLuckRedPacket.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResLuckRedPacket.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResLuckRedPacket clone() => ResLuckRedPacket()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResLuckRedPacket copyWith(void Function(ResLuckRedPacket) updates) =>
      super.copyWith((message) => updates(message as ResLuckRedPacket))
          as ResLuckRedPacket; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResLuckRedPacket create() => ResLuckRedPacket._();
  ResLuckRedPacket createEmptyInstance() => create();
  static $pb.PbList<ResLuckRedPacket> createRepeated() =>
      $pb.PbList<ResLuckRedPacket>();
  @$core.pragma('dart2js:noInline')
  static ResLuckRedPacket getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResLuckRedPacket>(create);
  static ResLuckRedPacket? _defaultInstance;

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
  LucksRedPacketData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(LucksRedPacketData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  LucksRedPacketData ensureData() => $_ensure(2);
}

class ResLuckRedPacketOpen extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResLuckRedPacketOpen',
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
    ..aOM<LuckRedPacketData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: LuckRedPacketData.create)
    ..hasRequiredFields = false;

  ResLuckRedPacketOpen._() : super();
  factory ResLuckRedPacketOpen({
    $core.bool? success,
    $core.String? msg,
    LuckRedPacketData? data,
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
  factory ResLuckRedPacketOpen.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResLuckRedPacketOpen.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResLuckRedPacketOpen clone() =>
      ResLuckRedPacketOpen()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResLuckRedPacketOpen copyWith(void Function(ResLuckRedPacketOpen) updates) =>
      super.copyWith((message) => updates(message as ResLuckRedPacketOpen))
          as ResLuckRedPacketOpen; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResLuckRedPacketOpen create() => ResLuckRedPacketOpen._();
  ResLuckRedPacketOpen createEmptyInstance() => create();
  static $pb.PbList<ResLuckRedPacketOpen> createRepeated() =>
      $pb.PbList<ResLuckRedPacketOpen>();
  @$core.pragma('dart2js:noInline')
  static ResLuckRedPacketOpen getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResLuckRedPacketOpen>(create);
  static ResLuckRedPacketOpen? _defaultInstance;

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
  LuckRedPacketData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(LuckRedPacketData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  LuckRedPacketData ensureData() => $_ensure(2);
}

class LuckRedPacketData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LuckRedPacketData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftName')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftIcon')
    ..hasRequiredFields = false;

  LuckRedPacketData._() : super();
  factory LuckRedPacketData({
    $core.String? giftName,
    $core.int? giftNum,
    $core.String? giftIcon,
  }) {
    final _result = create();
    if (giftName != null) {
      _result.giftName = giftName;
    }
    if (giftNum != null) {
      _result.giftNum = giftNum;
    }
    if (giftIcon != null) {
      _result.giftIcon = giftIcon;
    }
    return _result;
  }
  factory LuckRedPacketData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LuckRedPacketData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LuckRedPacketData clone() => LuckRedPacketData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LuckRedPacketData copyWith(void Function(LuckRedPacketData) updates) =>
      super.copyWith((message) => updates(message as LuckRedPacketData))
          as LuckRedPacketData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LuckRedPacketData create() => LuckRedPacketData._();
  LuckRedPacketData createEmptyInstance() => create();
  static $pb.PbList<LuckRedPacketData> createRepeated() =>
      $pb.PbList<LuckRedPacketData>();
  @$core.pragma('dart2js:noInline')
  static LuckRedPacketData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LuckRedPacketData>(create);
  static LuckRedPacketData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get giftName => $_getSZ(0);
  @$pb.TagNumber(1)
  set giftName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGiftName() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftName() => clearField(1);

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
  $core.String get giftIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set giftIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGiftIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftIcon() => clearField(3);
}
