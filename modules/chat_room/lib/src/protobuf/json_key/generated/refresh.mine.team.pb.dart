///
//  Generated code. Do not modify.
//  source: refresh.mine.team.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RefreshMineTeam_Team_Mics extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RefreshMineTeam.Team.Mics',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'refresh.mine.team'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mic_status',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'username')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ring')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame_new')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.O3)
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  RefreshMineTeam_Team_Mics._() : super();
  factory RefreshMineTeam_Team_Mics({
    $core.int? micStatus,
    $core.int? uid,
    $core.int? position,
    $core.String? username,
    $core.String? ring,
    $core.String? frame,
    $core.String? frameNew,
    $core.int? vip,
    $core.String? icon,
  }) {
    final _result = create();
    if (micStatus != null) {
      _result.micStatus = micStatus;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (position != null) {
      _result.position = position;
    }
    if (username != null) {
      _result.username = username;
    }
    if (ring != null) {
      _result.ring = ring;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (frameNew != null) {
      _result.frameNew = frameNew;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory RefreshMineTeam_Team_Mics.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RefreshMineTeam_Team_Mics.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RefreshMineTeam_Team_Mics clone() =>
      RefreshMineTeam_Team_Mics()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RefreshMineTeam_Team_Mics copyWith(
          void Function(RefreshMineTeam_Team_Mics) updates) =>
      super.copyWith((message) => updates(message as RefreshMineTeam_Team_Mics))
          as RefreshMineTeam_Team_Mics; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefreshMineTeam_Team_Mics create() => RefreshMineTeam_Team_Mics._();
  RefreshMineTeam_Team_Mics createEmptyInstance() => create();
  static $pb.PbList<RefreshMineTeam_Team_Mics> createRepeated() =>
      $pb.PbList<RefreshMineTeam_Team_Mics>();
  @$core.pragma('dart2js:noInline')
  static RefreshMineTeam_Team_Mics getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshMineTeam_Team_Mics>(create);
  static RefreshMineTeam_Team_Mics? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get micStatus => $_getIZ(0);
  @$pb.TagNumber(1)
  set micStatus($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMicStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearMicStatus() => clearField(1);

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
  $core.int get position => $_getIZ(2);
  @$pb.TagNumber(3)
  set position($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearPosition() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get username => $_getSZ(3);
  @$pb.TagNumber(4)
  set username($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUsername() => $_has(3);
  @$pb.TagNumber(4)
  void clearUsername() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get ring => $_getSZ(4);
  @$pb.TagNumber(5)
  set ring($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRing() => $_has(4);
  @$pb.TagNumber(5)
  void clearRing() => clearField(5);

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

  @$pb.TagNumber(7)
  $core.String get frameNew => $_getSZ(6);
  @$pb.TagNumber(7)
  set frameNew($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasFrameNew() => $_has(6);
  @$pb.TagNumber(7)
  void clearFrameNew() => clearField(7);

  @$pb.TagNumber(14)
  $core.int get vip => $_getIZ(7);
  @$pb.TagNumber(14)
  set vip($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasVip() => $_has(7);
  @$pb.TagNumber(14)
  void clearVip() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get icon => $_getSZ(8);
  @$pb.TagNumber(15)
  set icon($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasIcon() => $_has(8);
  @$pb.TagNumber(15)
  void clearIcon() => clearField(15);
}

class RefreshMineTeam_Team_VehicleTitle extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RefreshMineTeam.Team.VehicleTitle',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'refresh.mine.team'),
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
    ..pc<RefreshMineTeam_Team_VehicleTitleUser>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icons',
        $pb.PbFieldType.PM,
        subBuilder: RefreshMineTeam_Team_VehicleTitleUser.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bg')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wear')
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'can_create')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rel_id',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'home_bg')
    ..hasRequiredFields = false;

  RefreshMineTeam_Team_VehicleTitle._() : super();
  factory RefreshMineTeam_Team_VehicleTitle({
    $core.int? id,
    $core.String? title,
    $core.Iterable<RefreshMineTeam_Team_VehicleTitleUser>? icons,
    $core.String? bg,
    $core.String? desc,
    $core.bool? wear,
    $core.bool? canCreate,
    $core.int? relId,
    $core.String? homeBg,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (icons != null) {
      _result.icons.addAll(icons);
    }
    if (bg != null) {
      _result.bg = bg;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (wear != null) {
      _result.wear = wear;
    }
    if (canCreate != null) {
      _result.canCreate = canCreate;
    }
    if (relId != null) {
      _result.relId = relId;
    }
    if (homeBg != null) {
      _result.homeBg = homeBg;
    }
    return _result;
  }
  factory RefreshMineTeam_Team_VehicleTitle.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RefreshMineTeam_Team_VehicleTitle.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RefreshMineTeam_Team_VehicleTitle clone() =>
      RefreshMineTeam_Team_VehicleTitle()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RefreshMineTeam_Team_VehicleTitle copyWith(
          void Function(RefreshMineTeam_Team_VehicleTitle) updates) =>
      super.copyWith((message) =>
              updates(message as RefreshMineTeam_Team_VehicleTitle))
          as RefreshMineTeam_Team_VehicleTitle; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefreshMineTeam_Team_VehicleTitle create() =>
      RefreshMineTeam_Team_VehicleTitle._();
  RefreshMineTeam_Team_VehicleTitle createEmptyInstance() => create();
  static $pb.PbList<RefreshMineTeam_Team_VehicleTitle> createRepeated() =>
      $pb.PbList<RefreshMineTeam_Team_VehicleTitle>();
  @$core.pragma('dart2js:noInline')
  static RefreshMineTeam_Team_VehicleTitle getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshMineTeam_Team_VehicleTitle>(
          create);
  static RefreshMineTeam_Team_VehicleTitle? _defaultInstance;

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
  $core.List<RefreshMineTeam_Team_VehicleTitleUser> get icons => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get bg => $_getSZ(3);
  @$pb.TagNumber(4)
  set bg($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBg() => $_has(3);
  @$pb.TagNumber(4)
  void clearBg() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get desc => $_getSZ(4);
  @$pb.TagNumber(5)
  set desc($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDesc() => $_has(4);
  @$pb.TagNumber(5)
  void clearDesc() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get wear => $_getBF(5);
  @$pb.TagNumber(6)
  set wear($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasWear() => $_has(5);
  @$pb.TagNumber(6)
  void clearWear() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get canCreate => $_getBF(6);
  @$pb.TagNumber(7)
  set canCreate($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCanCreate() => $_has(6);
  @$pb.TagNumber(7)
  void clearCanCreate() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get relId => $_getIZ(7);
  @$pb.TagNumber(8)
  set relId($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasRelId() => $_has(7);
  @$pb.TagNumber(8)
  void clearRelId() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get homeBg => $_getSZ(8);
  @$pb.TagNumber(9)
  set homeBg($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasHomeBg() => $_has(8);
  @$pb.TagNumber(9)
  void clearHomeBg() => clearField(9);
}

class RefreshMineTeam_Team_VehicleTitleUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RefreshMineTeam.Team.VehicleTitleUser',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'refresh.mine.team'),
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
    ..hasRequiredFields = false;

  RefreshMineTeam_Team_VehicleTitleUser._() : super();
  factory RefreshMineTeam_Team_VehicleTitleUser({
    $core.int? id,
    $core.String? icon,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory RefreshMineTeam_Team_VehicleTitleUser.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RefreshMineTeam_Team_VehicleTitleUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RefreshMineTeam_Team_VehicleTitleUser clone() =>
      RefreshMineTeam_Team_VehicleTitleUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RefreshMineTeam_Team_VehicleTitleUser copyWith(
          void Function(RefreshMineTeam_Team_VehicleTitleUser) updates) =>
      super.copyWith((message) =>
              updates(message as RefreshMineTeam_Team_VehicleTitleUser))
          as RefreshMineTeam_Team_VehicleTitleUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefreshMineTeam_Team_VehicleTitleUser create() =>
      RefreshMineTeam_Team_VehicleTitleUser._();
  RefreshMineTeam_Team_VehicleTitleUser createEmptyInstance() => create();
  static $pb.PbList<RefreshMineTeam_Team_VehicleTitleUser> createRepeated() =>
      $pb.PbList<RefreshMineTeam_Team_VehicleTitleUser>();
  @$core.pragma('dart2js:noInline')
  static RefreshMineTeam_Team_VehicleTitleUser getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RefreshMineTeam_Team_VehicleTitleUser>(create);
  static RefreshMineTeam_Team_VehicleTitleUser? _defaultInstance;

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
}

class RefreshMineTeam_Team extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RefreshMineTeam.Team',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'refresh.mine.team'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fee_type',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'can_chartered',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'srv')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pk_id',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'has_chartered',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mic_close',
        $pb.PbFieldType.OU3)
    ..p<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'buy_uids',
        $pb.PbFieldType.PU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'game_name')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ftype',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'buy_total',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_started',
        $pb.PbFieldType.OU3)
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tag')
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mic_num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'used_mic_num',
        $pb.PbFieldType.OU3)
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'game_icon')
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_empty_team',
        $pb.PbFieldType.OU3)
    ..pc<RefreshMineTeam_Team_Mics>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mics',
        $pb.PbFieldType.PM,
        subBuilder: RefreshMineTeam_Team_Mics.create)
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'username')
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fvalue',
        $pb.PbFieldType.O3)
    ..aOM<RefreshMineTeam_Team_VehicleTitle>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        subBuilder: RefreshMineTeam_Team_VehicleTitle.create)
    ..hasRequiredFields = false;

  RefreshMineTeam_Team._() : super();
  factory RefreshMineTeam_Team({
    $core.int? feeType,
    $core.int? canChartered,
    $core.int? rid,
    $core.String? srv,
    $core.int? pkId,
    $core.int? hasChartered,
    $core.int? micClose,
    $core.Iterable<$core.int>? buyUids,
    $core.String? name,
    $core.String? gameName,
    $core.int? ftype,
    $core.int? price,
    $core.int? buyTotal,
    $core.int? vip,
    $core.int? isStarted,
    $core.String? tag,
    $core.int? micNum,
    $core.int? usedMicNum,
    $core.String? gameIcon,
    $core.int? showEmptyTeam,
    $core.Iterable<RefreshMineTeam_Team_Mics>? mics,
    $core.String? username,
    $core.String? icon,
    $core.int? fvalue,
    RefreshMineTeam_Team_VehicleTitle? title,
  }) {
    final _result = create();
    if (feeType != null) {
      _result.feeType = feeType;
    }
    if (canChartered != null) {
      _result.canChartered = canChartered;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (srv != null) {
      _result.srv = srv;
    }
    if (pkId != null) {
      _result.pkId = pkId;
    }
    if (hasChartered != null) {
      _result.hasChartered = hasChartered;
    }
    if (micClose != null) {
      _result.micClose = micClose;
    }
    if (buyUids != null) {
      _result.buyUids.addAll(buyUids);
    }
    if (name != null) {
      _result.name = name;
    }
    if (gameName != null) {
      _result.gameName = gameName;
    }
    if (ftype != null) {
      _result.ftype = ftype;
    }
    if (price != null) {
      _result.price = price;
    }
    if (buyTotal != null) {
      _result.buyTotal = buyTotal;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (isStarted != null) {
      _result.isStarted = isStarted;
    }
    if (tag != null) {
      _result.tag = tag;
    }
    if (micNum != null) {
      _result.micNum = micNum;
    }
    if (usedMicNum != null) {
      _result.usedMicNum = usedMicNum;
    }
    if (gameIcon != null) {
      _result.gameIcon = gameIcon;
    }
    if (showEmptyTeam != null) {
      _result.showEmptyTeam = showEmptyTeam;
    }
    if (mics != null) {
      _result.mics.addAll(mics);
    }
    if (username != null) {
      _result.username = username;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (fvalue != null) {
      _result.fvalue = fvalue;
    }
    if (title != null) {
      _result.title = title;
    }
    return _result;
  }
  factory RefreshMineTeam_Team.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RefreshMineTeam_Team.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RefreshMineTeam_Team clone() =>
      RefreshMineTeam_Team()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RefreshMineTeam_Team copyWith(void Function(RefreshMineTeam_Team) updates) =>
      super.copyWith((message) => updates(message as RefreshMineTeam_Team))
          as RefreshMineTeam_Team; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefreshMineTeam_Team create() => RefreshMineTeam_Team._();
  RefreshMineTeam_Team createEmptyInstance() => create();
  static $pb.PbList<RefreshMineTeam_Team> createRepeated() =>
      $pb.PbList<RefreshMineTeam_Team>();
  @$core.pragma('dart2js:noInline')
  static RefreshMineTeam_Team getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshMineTeam_Team>(create);
  static RefreshMineTeam_Team? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get feeType => $_getIZ(0);
  @$pb.TagNumber(1)
  set feeType($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFeeType() => $_has(0);
  @$pb.TagNumber(1)
  void clearFeeType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get canChartered => $_getIZ(1);
  @$pb.TagNumber(2)
  set canChartered($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCanChartered() => $_has(1);
  @$pb.TagNumber(2)
  void clearCanChartered() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get rid => $_getIZ(2);
  @$pb.TagNumber(3)
  set rid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRid() => $_has(2);
  @$pb.TagNumber(3)
  void clearRid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get srv => $_getSZ(3);
  @$pb.TagNumber(4)
  set srv($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSrv() => $_has(3);
  @$pb.TagNumber(4)
  void clearSrv() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get pkId => $_getIZ(4);
  @$pb.TagNumber(5)
  set pkId($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPkId() => $_has(4);
  @$pb.TagNumber(5)
  void clearPkId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get hasChartered => $_getIZ(5);
  @$pb.TagNumber(6)
  set hasChartered($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasHasChartered() => $_has(5);
  @$pb.TagNumber(6)
  void clearHasChartered() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get micClose => $_getIZ(6);
  @$pb.TagNumber(7)
  set micClose($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMicClose() => $_has(6);
  @$pb.TagNumber(7)
  void clearMicClose() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.int> get buyUids => $_getList(7);

  @$pb.TagNumber(9)
  $core.String get name => $_getSZ(8);
  @$pb.TagNumber(9)
  set name($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasName() => $_has(8);
  @$pb.TagNumber(9)
  void clearName() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get gameName => $_getSZ(9);
  @$pb.TagNumber(10)
  set gameName($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasGameName() => $_has(9);
  @$pb.TagNumber(10)
  void clearGameName() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get ftype => $_getIZ(10);
  @$pb.TagNumber(11)
  set ftype($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasFtype() => $_has(10);
  @$pb.TagNumber(11)
  void clearFtype() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get price => $_getIZ(11);
  @$pb.TagNumber(12)
  set price($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasPrice() => $_has(11);
  @$pb.TagNumber(12)
  void clearPrice() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get buyTotal => $_getIZ(12);
  @$pb.TagNumber(13)
  set buyTotal($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasBuyTotal() => $_has(12);
  @$pb.TagNumber(13)
  void clearBuyTotal() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get vip => $_getIZ(13);
  @$pb.TagNumber(14)
  set vip($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasVip() => $_has(13);
  @$pb.TagNumber(14)
  void clearVip() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get isStarted => $_getIZ(14);
  @$pb.TagNumber(15)
  set isStarted($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasIsStarted() => $_has(14);
  @$pb.TagNumber(15)
  void clearIsStarted() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get tag => $_getSZ(15);
  @$pb.TagNumber(16)
  set tag($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasTag() => $_has(15);
  @$pb.TagNumber(16)
  void clearTag() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get micNum => $_getIZ(16);
  @$pb.TagNumber(17)
  set micNum($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasMicNum() => $_has(16);
  @$pb.TagNumber(17)
  void clearMicNum() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get usedMicNum => $_getIZ(17);
  @$pb.TagNumber(18)
  set usedMicNum($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasUsedMicNum() => $_has(17);
  @$pb.TagNumber(18)
  void clearUsedMicNum() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get gameIcon => $_getSZ(18);
  @$pb.TagNumber(19)
  set gameIcon($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasGameIcon() => $_has(18);
  @$pb.TagNumber(19)
  void clearGameIcon() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get showEmptyTeam => $_getIZ(19);
  @$pb.TagNumber(20)
  set showEmptyTeam($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasShowEmptyTeam() => $_has(19);
  @$pb.TagNumber(20)
  void clearShowEmptyTeam() => clearField(20);

  @$pb.TagNumber(21)
  $core.List<RefreshMineTeam_Team_Mics> get mics => $_getList(20);

  @$pb.TagNumber(22)
  $core.String get username => $_getSZ(21);
  @$pb.TagNumber(22)
  set username($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasUsername() => $_has(21);
  @$pb.TagNumber(22)
  void clearUsername() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get icon => $_getSZ(22);
  @$pb.TagNumber(23)
  set icon($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasIcon() => $_has(22);
  @$pb.TagNumber(23)
  void clearIcon() => clearField(23);

  @$pb.TagNumber(24)
  $core.int get fvalue => $_getIZ(23);
  @$pb.TagNumber(24)
  set fvalue($core.int v) {
    $_setSignedInt32(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasFvalue() => $_has(23);
  @$pb.TagNumber(24)
  void clearFvalue() => clearField(24);

  @$pb.TagNumber(25)
  RefreshMineTeam_Team_VehicleTitle get title => $_getN(24);
  @$pb.TagNumber(25)
  set title(RefreshMineTeam_Team_VehicleTitle v) {
    setField(25, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasTitle() => $_has(24);
  @$pb.TagNumber(25)
  void clearTitle() => clearField(25);
  @$pb.TagNumber(25)
  RefreshMineTeam_Team_VehicleTitle ensureTitle() => $_ensure(24);
}

class RefreshMineTeam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RefreshMineTeam',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'refresh.mine.team'),
      createEmptyInstance: create)
    ..aOM<RefreshMineTeam_Team>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'team',
        subBuilder: RefreshMineTeam_Team.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'event')
    ..hasRequiredFields = false;

  RefreshMineTeam._() : super();
  factory RefreshMineTeam({
    RefreshMineTeam_Team? team,
    $core.String? event,
  }) {
    final _result = create();
    if (team != null) {
      _result.team = team;
    }
    if (event != null) {
      _result.event = event;
    }
    return _result;
  }
  factory RefreshMineTeam.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RefreshMineTeam.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RefreshMineTeam clone() => RefreshMineTeam()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RefreshMineTeam copyWith(void Function(RefreshMineTeam) updates) =>
      super.copyWith((message) => updates(message as RefreshMineTeam))
          as RefreshMineTeam; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefreshMineTeam create() => RefreshMineTeam._();
  RefreshMineTeam createEmptyInstance() => create();
  static $pb.PbList<RefreshMineTeam> createRepeated() =>
      $pb.PbList<RefreshMineTeam>();
  @$core.pragma('dart2js:noInline')
  static RefreshMineTeam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshMineTeam>(create);
  static RefreshMineTeam? _defaultInstance;

  @$pb.TagNumber(1)
  RefreshMineTeam_Team get team => $_getN(0);
  @$pb.TagNumber(1)
  set team(RefreshMineTeam_Team v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTeam() => $_has(0);
  @$pb.TagNumber(1)
  void clearTeam() => clearField(1);
  @$pb.TagNumber(1)
  RefreshMineTeam_Team ensureTeam() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get event => $_getSZ(1);
  @$pb.TagNumber(2)
  set event($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEvent() => $_has(1);
  @$pb.TagNumber(2)
  void clearEvent() => clearField(2);
}
