///
//  Generated code. Do not modify.
//  source: common_option.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResOptionRcmd extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResOptionRcmd',
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
    ..aOM<OptionRcmdData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: OptionRcmdData.create)
    ..hasRequiredFields = false;

  ResOptionRcmd._() : super();
  factory ResOptionRcmd({
    $core.bool? success,
    OptionRcmdData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ResOptionRcmd.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResOptionRcmd.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResOptionRcmd clone() => ResOptionRcmd()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResOptionRcmd copyWith(void Function(ResOptionRcmd) updates) =>
      super.copyWith((message) => updates(message as ResOptionRcmd))
          as ResOptionRcmd; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResOptionRcmd create() => ResOptionRcmd._();
  ResOptionRcmd createEmptyInstance() => create();
  static $pb.PbList<ResOptionRcmd> createRepeated() =>
      $pb.PbList<ResOptionRcmd>();
  @$core.pragma('dart2js:noInline')
  static ResOptionRcmd getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResOptionRcmd>(create);
  static ResOptionRcmd? _defaultInstance;

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
  OptionRcmdData get data => $_getN(1);
  @$pb.TagNumber(2)
  set data(OptionRcmdData v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
  @$pb.TagNumber(2)
  OptionRcmdData ensureData() => $_ensure(1);
}

class OptionRcmdData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'OptionRcmdData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<OptionRcmdOptionData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'options',
        $pb.PbFieldType.PM,
        subBuilder: OptionRcmdOptionData.create)
    ..pc<OptionRcmdRoomData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rooms',
        $pb.PbFieldType.PM,
        subBuilder: OptionRcmdRoomData.create)
    ..pc<OptionRcmdPlayingData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playings',
        $pb.PbFieldType.PM,
        subBuilder: OptionRcmdPlayingData.create)
    ..hasRequiredFields = false;

  OptionRcmdData._() : super();
  factory OptionRcmdData({
    $core.Iterable<OptionRcmdOptionData>? options,
    $core.Iterable<OptionRcmdRoomData>? rooms,
    $core.Iterable<OptionRcmdPlayingData>? playings,
  }) {
    final _result = create();
    if (options != null) {
      _result.options.addAll(options);
    }
    if (rooms != null) {
      _result.rooms.addAll(rooms);
    }
    if (playings != null) {
      _result.playings.addAll(playings);
    }
    return _result;
  }
  factory OptionRcmdData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OptionRcmdData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OptionRcmdData clone() => OptionRcmdData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OptionRcmdData copyWith(void Function(OptionRcmdData) updates) =>
      super.copyWith((message) => updates(message as OptionRcmdData))
          as OptionRcmdData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OptionRcmdData create() => OptionRcmdData._();
  OptionRcmdData createEmptyInstance() => create();
  static $pb.PbList<OptionRcmdData> createRepeated() =>
      $pb.PbList<OptionRcmdData>();
  @$core.pragma('dart2js:noInline')
  static OptionRcmdData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OptionRcmdData>(create);
  static OptionRcmdData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<OptionRcmdOptionData> get options => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<OptionRcmdRoomData> get rooms => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<OptionRcmdPlayingData> get playings => $_getList(2);
}

class OptionRcmdOptionData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'OptionRcmdOptionData',
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
            : 'value',
        $pb.PbFieldType.O3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..hasRequiredFields = false;

  OptionRcmdOptionData._() : super();
  factory OptionRcmdOptionData({
    $core.String? name,
    $core.int? value,
    $core.String? icon,
    $core.String? type,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (value != null) {
      _result.value = value;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory OptionRcmdOptionData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OptionRcmdOptionData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OptionRcmdOptionData clone() =>
      OptionRcmdOptionData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OptionRcmdOptionData copyWith(void Function(OptionRcmdOptionData) updates) =>
      super.copyWith((message) => updates(message as OptionRcmdOptionData))
          as OptionRcmdOptionData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OptionRcmdOptionData create() => OptionRcmdOptionData._();
  OptionRcmdOptionData createEmptyInstance() => create();
  static $pb.PbList<OptionRcmdOptionData> createRepeated() =>
      $pb.PbList<OptionRcmdOptionData>();
  @$core.pragma('dart2js:noInline')
  static OptionRcmdOptionData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OptionRcmdOptionData>(create);
  static OptionRcmdOptionData? _defaultInstance;

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
  $core.int get value => $_getIZ(1);
  @$pb.TagNumber(2)
  set value($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);

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
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);
}

class OptionRcmdPlayingData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'OptionRcmdPlayingData',
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
            : 'inRoom',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineStatus',
        $pb.PbFieldType.O3)
    ..aOM<PlayingRoomMiniIcon>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'miniIcon',
        subBuilder: PlayingRoomMiniIcon.create)
    ..hasRequiredFields = false;

  OptionRcmdPlayingData._() : super();
  factory OptionRcmdPlayingData({
    $core.int? uid,
    $core.String? name,
    $core.int? inRoom,
    $core.String? icon,
    $core.int? onlineStatus,
    PlayingRoomMiniIcon? miniIcon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (inRoom != null) {
      _result.inRoom = inRoom;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (miniIcon != null) {
      _result.miniIcon = miniIcon;
    }
    return _result;
  }
  factory OptionRcmdPlayingData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OptionRcmdPlayingData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OptionRcmdPlayingData clone() =>
      OptionRcmdPlayingData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OptionRcmdPlayingData copyWith(
          void Function(OptionRcmdPlayingData) updates) =>
      super.copyWith((message) => updates(message as OptionRcmdPlayingData))
          as OptionRcmdPlayingData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OptionRcmdPlayingData create() => OptionRcmdPlayingData._();
  OptionRcmdPlayingData createEmptyInstance() => create();
  static $pb.PbList<OptionRcmdPlayingData> createRepeated() =>
      $pb.PbList<OptionRcmdPlayingData>();
  @$core.pragma('dart2js:noInline')
  static OptionRcmdPlayingData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OptionRcmdPlayingData>(create);
  static OptionRcmdPlayingData? _defaultInstance;

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
  $core.int get inRoom => $_getIZ(2);
  @$pb.TagNumber(3)
  set inRoom($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasInRoom() => $_has(2);
  @$pb.TagNumber(3)
  void clearInRoom() => clearField(3);

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
  $core.int get onlineStatus => $_getIZ(4);
  @$pb.TagNumber(5)
  set onlineStatus($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOnlineStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnlineStatus() => clearField(5);

  @$pb.TagNumber(6)
  PlayingRoomMiniIcon get miniIcon => $_getN(5);
  @$pb.TagNumber(6)
  set miniIcon(PlayingRoomMiniIcon v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMiniIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearMiniIcon() => clearField(6);
  @$pb.TagNumber(6)
  PlayingRoomMiniIcon ensureMiniIcon() => $_ensure(5);
}

class PlayingRoomMiniIcon extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PlayingRoomMiniIcon',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pPS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'borders')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boardTitle')
    ..pPS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boardBg')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boardIcon')
    ..hasRequiredFields = false;

  PlayingRoomMiniIcon._() : super();
  factory PlayingRoomMiniIcon({
    $core.Iterable<$core.String>? borders,
    $core.String? boardTitle,
    $core.Iterable<$core.String>? boardBg,
    $core.String? boardIcon,
  }) {
    final _result = create();
    if (borders != null) {
      _result.borders.addAll(borders);
    }
    if (boardTitle != null) {
      _result.boardTitle = boardTitle;
    }
    if (boardBg != null) {
      _result.boardBg.addAll(boardBg);
    }
    if (boardIcon != null) {
      _result.boardIcon = boardIcon;
    }
    return _result;
  }
  factory PlayingRoomMiniIcon.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PlayingRoomMiniIcon.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PlayingRoomMiniIcon clone() => PlayingRoomMiniIcon()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PlayingRoomMiniIcon copyWith(void Function(PlayingRoomMiniIcon) updates) =>
      super.copyWith((message) => updates(message as PlayingRoomMiniIcon))
          as PlayingRoomMiniIcon; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PlayingRoomMiniIcon create() => PlayingRoomMiniIcon._();
  PlayingRoomMiniIcon createEmptyInstance() => create();
  static $pb.PbList<PlayingRoomMiniIcon> createRepeated() =>
      $pb.PbList<PlayingRoomMiniIcon>();
  @$core.pragma('dart2js:noInline')
  static PlayingRoomMiniIcon getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PlayingRoomMiniIcon>(create);
  static PlayingRoomMiniIcon? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get borders => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get boardTitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set boardTitle($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBoardTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoardTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get boardBg => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get boardIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set boardIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBoardIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoardIcon() => clearField(4);
}

class OptionRcmdRoomData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'OptionRcmdRoomData',
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
    ..aOM<TypeName>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeName',
        subBuilder: TypeName.create)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'real',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hot',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  OptionRcmdRoomData._() : super();
  factory OptionRcmdRoomData({
    $core.int? rid,
    $core.String? name,
    $core.String? icon,
    TypeName? typeName,
    $core.int? onlineNum,
    $core.int? real,
    $core.int? sex,
    $core.int? hot,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (typeName != null) {
      _result.typeName = typeName;
    }
    if (onlineNum != null) {
      _result.onlineNum = onlineNum;
    }
    if (real != null) {
      _result.real = real;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (hot != null) {
      _result.hot = hot;
    }
    return _result;
  }
  factory OptionRcmdRoomData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OptionRcmdRoomData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OptionRcmdRoomData clone() => OptionRcmdRoomData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OptionRcmdRoomData copyWith(void Function(OptionRcmdRoomData) updates) =>
      super.copyWith((message) => updates(message as OptionRcmdRoomData))
          as OptionRcmdRoomData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OptionRcmdRoomData create() => OptionRcmdRoomData._();
  OptionRcmdRoomData createEmptyInstance() => create();
  static $pb.PbList<OptionRcmdRoomData> createRepeated() =>
      $pb.PbList<OptionRcmdRoomData>();
  @$core.pragma('dart2js:noInline')
  static OptionRcmdRoomData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OptionRcmdRoomData>(create);
  static OptionRcmdRoomData? _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(4)
  set icon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);

  @$pb.TagNumber(5)
  TypeName get typeName => $_getN(3);
  @$pb.TagNumber(5)
  set typeName(TypeName v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTypeName() => $_has(3);
  @$pb.TagNumber(5)
  void clearTypeName() => clearField(5);
  @$pb.TagNumber(5)
  TypeName ensureTypeName() => $_ensure(3);

  @$pb.TagNumber(6)
  $core.int get onlineNum => $_getIZ(4);
  @$pb.TagNumber(6)
  set onlineNum($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasOnlineNum() => $_has(4);
  @$pb.TagNumber(6)
  void clearOnlineNum() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get real => $_getIZ(5);
  @$pb.TagNumber(7)
  set real($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasReal() => $_has(5);
  @$pb.TagNumber(7)
  void clearReal() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get sex => $_getIZ(6);
  @$pb.TagNumber(8)
  set sex($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSex() => $_has(6);
  @$pb.TagNumber(8)
  void clearSex() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get hot => $_getIZ(7);
  @$pb.TagNumber(9)
  set hot($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasHot() => $_has(7);
  @$pb.TagNumber(9)
  void clearHot() => clearField(9);
}

class TypeName extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TypeName',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'val')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..pPS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bg')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..hasRequiredFields = false;

  TypeName._() : super();
  factory TypeName({
    $core.String? val,
    $core.String? color,
    $core.String? show,
    $core.Iterable<$core.String>? bg,
    $core.String? label,
  }) {
    final _result = create();
    if (val != null) {
      _result.val = val;
    }
    if (color != null) {
      _result.color = color;
    }
    if (show != null) {
      _result.show = show;
    }
    if (bg != null) {
      _result.bg.addAll(bg);
    }
    if (label != null) {
      _result.label = label;
    }
    return _result;
  }
  factory TypeName.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TypeName.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TypeName clone() => TypeName()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TypeName copyWith(void Function(TypeName) updates) =>
      super.copyWith((message) => updates(message as TypeName))
          as TypeName; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TypeName create() => TypeName._();
  TypeName createEmptyInstance() => create();
  static $pb.PbList<TypeName> createRepeated() => $pb.PbList<TypeName>();
  @$core.pragma('dart2js:noInline')
  static TypeName getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TypeName>(create);
  static TypeName? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get val => $_getSZ(0);
  @$pb.TagNumber(1)
  set val($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasVal() => $_has(0);
  @$pb.TagNumber(1)
  void clearVal() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get color => $_getSZ(1);
  @$pb.TagNumber(2)
  set color($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearColor() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get show => $_getSZ(2);
  @$pb.TagNumber(3)
  set show($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasShow() => $_has(2);
  @$pb.TagNumber(3)
  void clearShow() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get bg => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get label => $_getSZ(4);
  @$pb.TagNumber(5)
  set label($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLabel() => $_has(4);
  @$pb.TagNumber(5)
  void clearLabel() => clearField(5);
}
