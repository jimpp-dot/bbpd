///
//  Generated code. Do not modify.
//  source: room.refresh.mic.on.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MicOnUserList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MicOnUserList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'screen.msg.pull'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OU3)
    ..pc<MicData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onMicList',
        $pb.PbFieldType.PM,
        subBuilder: MicData.create)
    ..hasRequiredFields = false;

  MicOnUserList._() : super();
  factory MicOnUserList({
    $core.int? type,
    $core.Iterable<MicData>? onMicList,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (onMicList != null) {
      _result.onMicList.addAll(onMicList);
    }
    return _result;
  }
  factory MicOnUserList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MicOnUserList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MicOnUserList clone() => MicOnUserList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MicOnUserList copyWith(void Function(MicOnUserList) updates) =>
      super.copyWith((message) => updates(message as MicOnUserList))
          as MicOnUserList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MicOnUserList create() => MicOnUserList._();
  MicOnUserList createEmptyInstance() => create();
  static $pb.PbList<MicOnUserList> createRepeated() =>
      $pb.PbList<MicOnUserList>();
  @$core.pragma('dart2js:noInline')
  static MicOnUserList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MicOnUserList>(create);
  static MicOnUserList? _defaultInstance;

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
  $core.List<MicData> get onMicList => $_getList(1);
}

class MicData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MicData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'screen.msg.pull'),
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
            : 'sex')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lock',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'forbidden',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'package',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'counter',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mic_status',
        $pb.PbFieldType.OU3)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame_new')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ring')
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role',
        $pb.PbFieldType.OU3)
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gameZone',
        protoName: 'gameZone')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gameId',
        protoName: 'gameId')
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'live_only',
        $pb.PbFieldType.OU3)
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'live_label')
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knight_level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inflexion',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'game_online',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position_role',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position_state',
        $pb.PbFieldType.OU3)
    ..aOS(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'throne_img')
    ..aOS(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color_name')
    ..aOS(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position_label')
    ..a<$core.int>(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'god_tag',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MicData._() : super();
  factory MicData({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? sex,
    $core.int? age,
    $core.int? position,
    $core.int? lock,
    $core.int? forbidden,
    $core.int? package,
    $core.int? counter,
    $core.int? micStatus,
    $core.String? frame,
    $core.String? frameNew,
    $core.String? ring,
    $core.int? role,
    $core.String? gameZone,
    $core.String? gameId,
    $core.int? liveOnly,
    $core.String? liveLabel,
    $core.int? knightLevel,
    $core.int? inflexion,
    $core.int? gameOnline,
    $core.int? positionRole,
    $core.int? positionState,
    $core.String? throneImg,
    $core.String? colorName,
    $core.String? positionLabel,
    $core.int? godTag,
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
    if (age != null) {
      _result.age = age;
    }
    if (position != null) {
      _result.position = position;
    }
    if (lock != null) {
      _result.lock = lock;
    }
    if (forbidden != null) {
      _result.forbidden = forbidden;
    }
    if (package != null) {
      _result.package = package;
    }
    if (counter != null) {
      _result.counter = counter;
    }
    if (micStatus != null) {
      _result.micStatus = micStatus;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (frameNew != null) {
      _result.frameNew = frameNew;
    }
    if (ring != null) {
      _result.ring = ring;
    }
    if (role != null) {
      _result.role = role;
    }
    if (gameZone != null) {
      _result.gameZone = gameZone;
    }
    if (gameId != null) {
      _result.gameId = gameId;
    }
    if (liveOnly != null) {
      _result.liveOnly = liveOnly;
    }
    if (liveLabel != null) {
      _result.liveLabel = liveLabel;
    }
    if (knightLevel != null) {
      _result.knightLevel = knightLevel;
    }
    if (inflexion != null) {
      _result.inflexion = inflexion;
    }
    if (gameOnline != null) {
      _result.gameOnline = gameOnline;
    }
    if (positionRole != null) {
      _result.positionRole = positionRole;
    }
    if (positionState != null) {
      _result.positionState = positionState;
    }
    if (throneImg != null) {
      _result.throneImg = throneImg;
    }
    if (colorName != null) {
      _result.colorName = colorName;
    }
    if (positionLabel != null) {
      _result.positionLabel = positionLabel;
    }
    if (godTag != null) {
      _result.godTag = godTag;
    }
    return _result;
  }
  factory MicData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MicData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MicData clone() => MicData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MicData copyWith(void Function(MicData) updates) =>
      super.copyWith((message) => updates(message as MicData))
          as MicData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MicData create() => MicData._();
  MicData createEmptyInstance() => create();
  static $pb.PbList<MicData> createRepeated() => $pb.PbList<MicData>();
  @$core.pragma('dart2js:noInline')
  static MicData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MicData>(create);
  static MicData? _defaultInstance;

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
  $core.int get age => $_getIZ(4);
  @$pb.TagNumber(5)
  set age($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAge() => $_has(4);
  @$pb.TagNumber(5)
  void clearAge() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get position => $_getIZ(5);
  @$pb.TagNumber(6)
  set position($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPosition() => $_has(5);
  @$pb.TagNumber(6)
  void clearPosition() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get lock => $_getIZ(6);
  @$pb.TagNumber(7)
  set lock($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasLock() => $_has(6);
  @$pb.TagNumber(7)
  void clearLock() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get forbidden => $_getIZ(7);
  @$pb.TagNumber(8)
  set forbidden($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasForbidden() => $_has(7);
  @$pb.TagNumber(8)
  void clearForbidden() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get package => $_getIZ(8);
  @$pb.TagNumber(9)
  set package($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPackage() => $_has(8);
  @$pb.TagNumber(9)
  void clearPackage() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get counter => $_getIZ(9);
  @$pb.TagNumber(10)
  set counter($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasCounter() => $_has(9);
  @$pb.TagNumber(10)
  void clearCounter() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get micStatus => $_getIZ(10);
  @$pb.TagNumber(11)
  set micStatus($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasMicStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearMicStatus() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get frame => $_getSZ(11);
  @$pb.TagNumber(12)
  set frame($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasFrame() => $_has(11);
  @$pb.TagNumber(12)
  void clearFrame() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get frameNew => $_getSZ(12);
  @$pb.TagNumber(13)
  set frameNew($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasFrameNew() => $_has(12);
  @$pb.TagNumber(13)
  void clearFrameNew() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get ring => $_getSZ(13);
  @$pb.TagNumber(14)
  set ring($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasRing() => $_has(13);
  @$pb.TagNumber(14)
  void clearRing() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get role => $_getIZ(14);
  @$pb.TagNumber(15)
  set role($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasRole() => $_has(14);
  @$pb.TagNumber(15)
  void clearRole() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get gameZone => $_getSZ(15);
  @$pb.TagNumber(16)
  set gameZone($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasGameZone() => $_has(15);
  @$pb.TagNumber(16)
  void clearGameZone() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get gameId => $_getSZ(16);
  @$pb.TagNumber(17)
  set gameId($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasGameId() => $_has(16);
  @$pb.TagNumber(17)
  void clearGameId() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get liveOnly => $_getIZ(17);
  @$pb.TagNumber(18)
  set liveOnly($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasLiveOnly() => $_has(17);
  @$pb.TagNumber(18)
  void clearLiveOnly() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get liveLabel => $_getSZ(18);
  @$pb.TagNumber(19)
  set liveLabel($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasLiveLabel() => $_has(18);
  @$pb.TagNumber(19)
  void clearLiveLabel() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get knightLevel => $_getIZ(19);
  @$pb.TagNumber(20)
  set knightLevel($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasKnightLevel() => $_has(19);
  @$pb.TagNumber(20)
  void clearKnightLevel() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get inflexion => $_getIZ(20);
  @$pb.TagNumber(21)
  set inflexion($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasInflexion() => $_has(20);
  @$pb.TagNumber(21)
  void clearInflexion() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get gameOnline => $_getIZ(21);
  @$pb.TagNumber(22)
  set gameOnline($core.int v) {
    $_setUnsignedInt32(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasGameOnline() => $_has(21);
  @$pb.TagNumber(22)
  void clearGameOnline() => clearField(22);

  @$pb.TagNumber(23)
  $core.int get positionRole => $_getIZ(22);
  @$pb.TagNumber(23)
  set positionRole($core.int v) {
    $_setUnsignedInt32(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasPositionRole() => $_has(22);
  @$pb.TagNumber(23)
  void clearPositionRole() => clearField(23);

  @$pb.TagNumber(24)
  $core.int get positionState => $_getIZ(23);
  @$pb.TagNumber(24)
  set positionState($core.int v) {
    $_setUnsignedInt32(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasPositionState() => $_has(23);
  @$pb.TagNumber(24)
  void clearPositionState() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get throneImg => $_getSZ(24);
  @$pb.TagNumber(25)
  set throneImg($core.String v) {
    $_setString(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasThroneImg() => $_has(24);
  @$pb.TagNumber(25)
  void clearThroneImg() => clearField(25);

  @$pb.TagNumber(26)
  $core.String get colorName => $_getSZ(25);
  @$pb.TagNumber(26)
  set colorName($core.String v) {
    $_setString(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasColorName() => $_has(25);
  @$pb.TagNumber(26)
  void clearColorName() => clearField(26);

  @$pb.TagNumber(27)
  $core.String get positionLabel => $_getSZ(26);
  @$pb.TagNumber(27)
  set positionLabel($core.String v) {
    $_setString(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasPositionLabel() => $_has(26);
  @$pb.TagNumber(27)
  void clearPositionLabel() => clearField(27);

  @$pb.TagNumber(28)
  $core.int get godTag => $_getIZ(27);
  @$pb.TagNumber(28)
  set godTag($core.int v) {
    $_setUnsignedInt32(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasGodTag() => $_has(27);
  @$pb.TagNumber(28)
  void clearGodTag() => clearField(28);
}
