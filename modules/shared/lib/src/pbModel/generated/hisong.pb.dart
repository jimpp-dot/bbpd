///
//  Generated code. Do not modify.
//  source: hisong.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'banban_home.pb.dart' as $0;

class GamePartyItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GamePartyItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'display')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'partyType')
    ..pPS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeBg')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeIcon')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playingNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpUrl')
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'noParty')
    ..hasRequiredFields = false;

  GamePartyItem._() : super();
  factory GamePartyItem({
    $core.String? display,
    $core.String? partyType,
    $core.Iterable<$core.String>? typeBg,
    $core.String? typeIcon,
    $core.int? playingNum,
    $core.String? jumpUrl,
    $core.bool? noParty,
  }) {
    final _result = create();
    if (display != null) {
      _result.display = display;
    }
    if (partyType != null) {
      _result.partyType = partyType;
    }
    if (typeBg != null) {
      _result.typeBg.addAll(typeBg);
    }
    if (typeIcon != null) {
      _result.typeIcon = typeIcon;
    }
    if (playingNum != null) {
      _result.playingNum = playingNum;
    }
    if (jumpUrl != null) {
      _result.jumpUrl = jumpUrl;
    }
    if (noParty != null) {
      _result.noParty = noParty;
    }
    return _result;
  }
  factory GamePartyItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GamePartyItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GamePartyItem clone() => GamePartyItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GamePartyItem copyWith(void Function(GamePartyItem) updates) =>
      super.copyWith((message) => updates(message as GamePartyItem))
          as GamePartyItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GamePartyItem create() => GamePartyItem._();
  GamePartyItem createEmptyInstance() => create();
  static $pb.PbList<GamePartyItem> createRepeated() =>
      $pb.PbList<GamePartyItem>();
  @$core.pragma('dart2js:noInline')
  static GamePartyItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GamePartyItem>(create);
  static GamePartyItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get display => $_getSZ(0);
  @$pb.TagNumber(1)
  set display($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDisplay() => $_has(0);
  @$pb.TagNumber(1)
  void clearDisplay() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get partyType => $_getSZ(1);
  @$pb.TagNumber(2)
  set partyType($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPartyType() => $_has(1);
  @$pb.TagNumber(2)
  void clearPartyType() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get typeBg => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get typeIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set typeIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTypeIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearTypeIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get playingNum => $_getIZ(4);
  @$pb.TagNumber(5)
  set playingNum($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPlayingNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearPlayingNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get jumpUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set jumpUrl($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasJumpUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearJumpUrl() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get noParty => $_getBF(6);
  @$pb.TagNumber(7)
  set noParty($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasNoParty() => $_has(6);
  @$pb.TagNumber(7)
  void clearNoParty() => clearField(7);
}

class ResGamePartyList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResGamePartyList',
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
    ..pc<GamePartyItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: GamePartyItem.create)
    ..hasRequiredFields = false;

  ResGamePartyList._() : super();
  factory ResGamePartyList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<GamePartyItem>? data,
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
  factory ResGamePartyList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResGamePartyList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResGamePartyList clone() => ResGamePartyList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResGamePartyList copyWith(void Function(ResGamePartyList) updates) =>
      super.copyWith((message) => updates(message as ResGamePartyList))
          as ResGamePartyList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResGamePartyList create() => ResGamePartyList._();
  ResGamePartyList createEmptyInstance() => create();
  static $pb.PbList<ResGamePartyList> createRepeated() =>
      $pb.PbList<ResGamePartyList>();
  @$core.pragma('dart2js:noInline')
  static ResGamePartyList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResGamePartyList>(create);
  static ResGamePartyList? _defaultInstance;

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
  $core.List<GamePartyItem> get data => $_getList(2);
}

class ResHomePlayingFriend extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHomePlayingFriend',
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
    ..pc<$0.RoomListItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: $0.RoomListItem.create)
    ..hasRequiredFields = false;

  ResHomePlayingFriend._() : super();
  factory ResHomePlayingFriend({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<$0.RoomListItem>? data,
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
  factory ResHomePlayingFriend.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHomePlayingFriend.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHomePlayingFriend clone() =>
      ResHomePlayingFriend()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHomePlayingFriend copyWith(void Function(ResHomePlayingFriend) updates) =>
      super.copyWith((message) => updates(message as ResHomePlayingFriend))
          as ResHomePlayingFriend; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHomePlayingFriend create() => ResHomePlayingFriend._();
  ResHomePlayingFriend createEmptyInstance() => create();
  static $pb.PbList<ResHomePlayingFriend> createRepeated() =>
      $pb.PbList<ResHomePlayingFriend>();
  @$core.pragma('dart2js:noInline')
  static ResHomePlayingFriend getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHomePlayingFriend>(create);
  static ResHomePlayingFriend? _defaultInstance;

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
  $core.List<$0.RoomListItem> get data => $_getList(2);
}

class ResNoviceGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResNoviceGift',
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
    ..aOM<NoviceGiftData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: NoviceGiftData.create)
    ..hasRequiredFields = false;

  ResNoviceGift._() : super();
  factory ResNoviceGift({
    $core.bool? success,
    $core.String? msg,
    NoviceGiftData? data,
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
  factory ResNoviceGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResNoviceGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResNoviceGift clone() => ResNoviceGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResNoviceGift copyWith(void Function(ResNoviceGift) updates) =>
      super.copyWith((message) => updates(message as ResNoviceGift))
          as ResNoviceGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResNoviceGift create() => ResNoviceGift._();
  ResNoviceGift createEmptyInstance() => create();
  static $pb.PbList<ResNoviceGift> createRepeated() =>
      $pb.PbList<ResNoviceGift>();
  @$core.pragma('dart2js:noInline')
  static ResNoviceGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResNoviceGift>(create);
  static ResNoviceGift? _defaultInstance;

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
  NoviceGiftData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(NoviceGiftData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  NoviceGiftData ensureData() => $_ensure(2);
}

class NoviceGiftData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NoviceGiftData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'taskDesc')
    ..pc<NoviceGiftDataGift>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gifts',
        $pb.PbFieldType.PM,
        subBuilder: NoviceGiftDataGift.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'taskProcess',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'taskList')
    ..pc<NoviceGiftDataTask>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tasks',
        $pb.PbFieldType.PM,
        subBuilder: NoviceGiftDataTask.create)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'canDraw',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'taskBackground')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'drawDeadline',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  NoviceGiftData._() : super();
  factory NoviceGiftData({
    $core.String? taskDesc,
    $core.Iterable<NoviceGiftDataGift>? gifts,
    $core.int? taskProcess,
    $core.String? taskList,
    $core.Iterable<NoviceGiftDataTask>? tasks,
    $core.int? canDraw,
    $core.String? taskBackground,
    $core.int? drawDeadline,
  }) {
    final _result = create();
    if (taskDesc != null) {
      _result.taskDesc = taskDesc;
    }
    if (gifts != null) {
      _result.gifts.addAll(gifts);
    }
    if (taskProcess != null) {
      _result.taskProcess = taskProcess;
    }
    if (taskList != null) {
      _result.taskList = taskList;
    }
    if (tasks != null) {
      _result.tasks.addAll(tasks);
    }
    if (canDraw != null) {
      _result.canDraw = canDraw;
    }
    if (taskBackground != null) {
      _result.taskBackground = taskBackground;
    }
    if (drawDeadline != null) {
      _result.drawDeadline = drawDeadline;
    }
    return _result;
  }
  factory NoviceGiftData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NoviceGiftData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NoviceGiftData clone() => NoviceGiftData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NoviceGiftData copyWith(void Function(NoviceGiftData) updates) =>
      super.copyWith((message) => updates(message as NoviceGiftData))
          as NoviceGiftData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NoviceGiftData create() => NoviceGiftData._();
  NoviceGiftData createEmptyInstance() => create();
  static $pb.PbList<NoviceGiftData> createRepeated() =>
      $pb.PbList<NoviceGiftData>();
  @$core.pragma('dart2js:noInline')
  static NoviceGiftData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NoviceGiftData>(create);
  static NoviceGiftData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskDesc => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskDesc($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTaskDesc() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskDesc() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<NoviceGiftDataGift> get gifts => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get taskProcess => $_getIZ(2);
  @$pb.TagNumber(3)
  set taskProcess($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTaskProcess() => $_has(2);
  @$pb.TagNumber(3)
  void clearTaskProcess() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get taskList => $_getSZ(3);
  @$pb.TagNumber(4)
  set taskList($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTaskList() => $_has(3);
  @$pb.TagNumber(4)
  void clearTaskList() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<NoviceGiftDataTask> get tasks => $_getList(4);

  @$pb.TagNumber(6)
  $core.int get canDraw => $_getIZ(5);
  @$pb.TagNumber(6)
  set canDraw($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCanDraw() => $_has(5);
  @$pb.TagNumber(6)
  void clearCanDraw() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get taskBackground => $_getSZ(6);
  @$pb.TagNumber(7)
  set taskBackground($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTaskBackground() => $_has(6);
  @$pb.TagNumber(7)
  void clearTaskBackground() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get drawDeadline => $_getIZ(7);
  @$pb.TagNumber(8)
  set drawDeadline($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDrawDeadline() => $_has(7);
  @$pb.TagNumber(8)
  void clearDrawDeadline() => clearField(8);
}

class NoviceGiftDataGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NoviceGiftDataGift',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  NoviceGiftDataGift._() : super();
  factory NoviceGiftDataGift({
    $core.String? icon,
    $core.String? desc,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory NoviceGiftDataGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NoviceGiftDataGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NoviceGiftDataGift clone() => NoviceGiftDataGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NoviceGiftDataGift copyWith(void Function(NoviceGiftDataGift) updates) =>
      super.copyWith((message) => updates(message as NoviceGiftDataGift))
          as NoviceGiftDataGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NoviceGiftDataGift create() => NoviceGiftDataGift._();
  NoviceGiftDataGift createEmptyInstance() => create();
  static $pb.PbList<NoviceGiftDataGift> createRepeated() =>
      $pb.PbList<NoviceGiftDataGift>();
  @$core.pragma('dart2js:noInline')
  static NoviceGiftDataGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NoviceGiftDataGift>(create);
  static NoviceGiftDataGift? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get desc => $_getSZ(1);
  @$pb.TagNumber(2)
  set desc($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearDesc() => clearField(2);
}

class NoviceGiftDataTask extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'NoviceGiftDataTask',
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
            : 'title')
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
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'direct')
    ..hasRequiredFields = false;

  NoviceGiftDataTask._() : super();
  factory NoviceGiftDataTask({
    $core.int? id,
    $core.String? title,
    $core.String? desc,
    $core.int? status,
    $core.String? direct,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (status != null) {
      _result.status = status;
    }
    if (direct != null) {
      _result.direct = direct;
    }
    return _result;
  }
  factory NoviceGiftDataTask.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NoviceGiftDataTask.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NoviceGiftDataTask clone() => NoviceGiftDataTask()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NoviceGiftDataTask copyWith(void Function(NoviceGiftDataTask) updates) =>
      super.copyWith((message) => updates(message as NoviceGiftDataTask))
          as NoviceGiftDataTask; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NoviceGiftDataTask create() => NoviceGiftDataTask._();
  NoviceGiftDataTask createEmptyInstance() => create();
  static $pb.PbList<NoviceGiftDataTask> createRepeated() =>
      $pb.PbList<NoviceGiftDataTask>();
  @$core.pragma('dart2js:noInline')
  static NoviceGiftDataTask getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NoviceGiftDataTask>(create);
  static NoviceGiftDataTask? _defaultInstance;

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
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

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
  $core.String get direct => $_getSZ(4);
  @$pb.TagNumber(5)
  set direct($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDirect() => $_has(4);
  @$pb.TagNumber(5)
  void clearDirect() => clearField(5);
}
