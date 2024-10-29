///
//  Generated code. Do not modify.
//  source: refresh.vehicle.team.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RefreshVehicleTeam_Mics extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RefreshVehicleTeam.Mics',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'refresh.vehicle.team'),
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

  RefreshVehicleTeam_Mics._() : super();
  factory RefreshVehicleTeam_Mics({
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
  factory RefreshVehicleTeam_Mics.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RefreshVehicleTeam_Mics.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RefreshVehicleTeam_Mics clone() =>
      RefreshVehicleTeam_Mics()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RefreshVehicleTeam_Mics copyWith(
          void Function(RefreshVehicleTeam_Mics) updates) =>
      super.copyWith((message) => updates(message as RefreshVehicleTeam_Mics))
          as RefreshVehicleTeam_Mics; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefreshVehicleTeam_Mics create() => RefreshVehicleTeam_Mics._();
  RefreshVehicleTeam_Mics createEmptyInstance() => create();
  static $pb.PbList<RefreshVehicleTeam_Mics> createRepeated() =>
      $pb.PbList<RefreshVehicleTeam_Mics>();
  @$core.pragma('dart2js:noInline')
  static RefreshVehicleTeam_Mics getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshVehicleTeam_Mics>(create);
  static RefreshVehicleTeam_Mics? _defaultInstance;

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

class RefreshVehicleTeam_Teams extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RefreshVehicleTeam.Teams',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'refresh.vehicle.team'),
      createEmptyInstance: create)
    ..pc<RefreshVehicleTeam_Mics>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mics',
        $pb.PbFieldType.PM,
        subBuilder: RefreshVehicleTeam_Mics.create)
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
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'username')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_started',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'srv')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tag')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mic_num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'used_mic_num',
        $pb.PbFieldType.OU3)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'game_name')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'game_icon')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pk_id',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fee_type',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ftype',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'can_chartered',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'has_chartered',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mic_close',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'buy_total',
        $pb.PbFieldType.OU3)
    ..p<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'buy_uids',
        $pb.PbFieldType.PU3)
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..aOS(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame_new')
    ..aOS(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ring')
    ..a<$core.int>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fvalue',
        $pb.PbFieldType.O3)
    ..aOM<RefreshVehicleTeam_VehicleTitle>(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        subBuilder: RefreshVehicleTeam_VehicleTitle.create)
    ..hasRequiredFields = false;

  RefreshVehicleTeam_Teams._() : super();
  factory RefreshVehicleTeam_Teams({
    $core.Iterable<RefreshVehicleTeam_Mics>? mics,
    $core.int? rid,
    $core.String? name,
    $core.String? username,
    $core.int? vip,
    $core.String? icon,
    $core.int? isStarted,
    $core.String? srv,
    $core.String? tag,
    $core.int? micNum,
    $core.int? usedMicNum,
    $core.String? gameName,
    $core.String? gameIcon,
    $core.int? pkId,
    $core.int? feeType,
    $core.int? ftype,
    $core.int? price,
    $core.int? canChartered,
    $core.int? hasChartered,
    $core.int? micClose,
    $core.int? buyTotal,
    $core.Iterable<$core.int>? buyUids,
    $core.String? frame,
    $core.String? frameNew,
    $core.String? ring,
    $core.int? fvalue,
    RefreshVehicleTeam_VehicleTitle? title,
  }) {
    final _result = create();
    if (mics != null) {
      _result.mics.addAll(mics);
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (username != null) {
      _result.username = username;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (isStarted != null) {
      _result.isStarted = isStarted;
    }
    if (srv != null) {
      _result.srv = srv;
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
    if (gameName != null) {
      _result.gameName = gameName;
    }
    if (gameIcon != null) {
      _result.gameIcon = gameIcon;
    }
    if (pkId != null) {
      _result.pkId = pkId;
    }
    if (feeType != null) {
      _result.feeType = feeType;
    }
    if (ftype != null) {
      _result.ftype = ftype;
    }
    if (price != null) {
      _result.price = price;
    }
    if (canChartered != null) {
      _result.canChartered = canChartered;
    }
    if (hasChartered != null) {
      _result.hasChartered = hasChartered;
    }
    if (micClose != null) {
      _result.micClose = micClose;
    }
    if (buyTotal != null) {
      _result.buyTotal = buyTotal;
    }
    if (buyUids != null) {
      _result.buyUids.addAll(buyUids);
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
    if (fvalue != null) {
      _result.fvalue = fvalue;
    }
    if (title != null) {
      _result.title = title;
    }
    return _result;
  }
  factory RefreshVehicleTeam_Teams.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RefreshVehicleTeam_Teams.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RefreshVehicleTeam_Teams clone() =>
      RefreshVehicleTeam_Teams()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RefreshVehicleTeam_Teams copyWith(
          void Function(RefreshVehicleTeam_Teams) updates) =>
      super.copyWith((message) => updates(message as RefreshVehicleTeam_Teams))
          as RefreshVehicleTeam_Teams; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefreshVehicleTeam_Teams create() => RefreshVehicleTeam_Teams._();
  RefreshVehicleTeam_Teams createEmptyInstance() => create();
  static $pb.PbList<RefreshVehicleTeam_Teams> createRepeated() =>
      $pb.PbList<RefreshVehicleTeam_Teams>();
  @$core.pragma('dart2js:noInline')
  static RefreshVehicleTeam_Teams getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshVehicleTeam_Teams>(create);
  static RefreshVehicleTeam_Teams? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RefreshVehicleTeam_Mics> get mics => $_getList(0);

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
  $core.int get vip => $_getIZ(4);
  @$pb.TagNumber(5)
  set vip($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasVip() => $_has(4);
  @$pb.TagNumber(5)
  void clearVip() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get icon => $_getSZ(5);
  @$pb.TagNumber(6)
  set icon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get isStarted => $_getIZ(6);
  @$pb.TagNumber(7)
  set isStarted($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIsStarted() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsStarted() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get srv => $_getSZ(7);
  @$pb.TagNumber(8)
  set srv($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSrv() => $_has(7);
  @$pb.TagNumber(8)
  void clearSrv() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get tag => $_getSZ(8);
  @$pb.TagNumber(9)
  set tag($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTag() => $_has(8);
  @$pb.TagNumber(9)
  void clearTag() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get micNum => $_getIZ(9);
  @$pb.TagNumber(10)
  set micNum($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasMicNum() => $_has(9);
  @$pb.TagNumber(10)
  void clearMicNum() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get usedMicNum => $_getIZ(10);
  @$pb.TagNumber(11)
  set usedMicNum($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasUsedMicNum() => $_has(10);
  @$pb.TagNumber(11)
  void clearUsedMicNum() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get gameName => $_getSZ(11);
  @$pb.TagNumber(12)
  set gameName($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasGameName() => $_has(11);
  @$pb.TagNumber(12)
  void clearGameName() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get gameIcon => $_getSZ(12);
  @$pb.TagNumber(13)
  set gameIcon($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasGameIcon() => $_has(12);
  @$pb.TagNumber(13)
  void clearGameIcon() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get pkId => $_getIZ(13);
  @$pb.TagNumber(14)
  set pkId($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasPkId() => $_has(13);
  @$pb.TagNumber(14)
  void clearPkId() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get feeType => $_getIZ(14);
  @$pb.TagNumber(15)
  set feeType($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasFeeType() => $_has(14);
  @$pb.TagNumber(15)
  void clearFeeType() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get ftype => $_getIZ(15);
  @$pb.TagNumber(16)
  set ftype($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasFtype() => $_has(15);
  @$pb.TagNumber(16)
  void clearFtype() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get price => $_getIZ(16);
  @$pb.TagNumber(17)
  set price($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasPrice() => $_has(16);
  @$pb.TagNumber(17)
  void clearPrice() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get canChartered => $_getIZ(17);
  @$pb.TagNumber(18)
  set canChartered($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasCanChartered() => $_has(17);
  @$pb.TagNumber(18)
  void clearCanChartered() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get hasChartered => $_getIZ(18);
  @$pb.TagNumber(19)
  set hasChartered($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasHasChartered() => $_has(18);
  @$pb.TagNumber(19)
  void clearHasChartered() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get micClose => $_getIZ(19);
  @$pb.TagNumber(20)
  set micClose($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasMicClose() => $_has(19);
  @$pb.TagNumber(20)
  void clearMicClose() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get buyTotal => $_getIZ(20);
  @$pb.TagNumber(21)
  set buyTotal($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasBuyTotal() => $_has(20);
  @$pb.TagNumber(21)
  void clearBuyTotal() => clearField(21);

  @$pb.TagNumber(22)
  $core.List<$core.int> get buyUids => $_getList(21);

  @$pb.TagNumber(23)
  $core.String get frame => $_getSZ(22);
  @$pb.TagNumber(23)
  set frame($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasFrame() => $_has(22);
  @$pb.TagNumber(23)
  void clearFrame() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get frameNew => $_getSZ(23);
  @$pb.TagNumber(24)
  set frameNew($core.String v) {
    $_setString(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasFrameNew() => $_has(23);
  @$pb.TagNumber(24)
  void clearFrameNew() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get ring => $_getSZ(24);
  @$pb.TagNumber(25)
  set ring($core.String v) {
    $_setString(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasRing() => $_has(24);
  @$pb.TagNumber(25)
  void clearRing() => clearField(25);

  @$pb.TagNumber(26)
  $core.int get fvalue => $_getIZ(25);
  @$pb.TagNumber(26)
  set fvalue($core.int v) {
    $_setSignedInt32(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasFvalue() => $_has(25);
  @$pb.TagNumber(26)
  void clearFvalue() => clearField(26);

  @$pb.TagNumber(27)
  RefreshVehicleTeam_VehicleTitle get title => $_getN(26);
  @$pb.TagNumber(27)
  set title(RefreshVehicleTeam_VehicleTitle v) {
    setField(27, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasTitle() => $_has(26);
  @$pb.TagNumber(27)
  void clearTitle() => clearField(27);
  @$pb.TagNumber(27)
  RefreshVehicleTeam_VehicleTitle ensureTitle() => $_ensure(26);
}

class RefreshVehicleTeam_VehicleTeamPush extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RefreshVehicleTeam.VehicleTeamPush',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'refresh.vehicle.team'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mic_num',
        $pb.PbFieldType.OU3)
    ..pc<RefreshVehicleTeam_Teams>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'teams',
        $pb.PbFieldType.PM,
        subBuilder: RefreshVehicleTeam_Teams.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_empty_team',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RefreshVehicleTeam_VehicleTeamPush._() : super();
  factory RefreshVehicleTeam_VehicleTeamPush({
    $core.int? micNum,
    $core.Iterable<RefreshVehicleTeam_Teams>? teams,
    $core.int? showEmptyTeam,
  }) {
    final _result = create();
    if (micNum != null) {
      _result.micNum = micNum;
    }
    if (teams != null) {
      _result.teams.addAll(teams);
    }
    if (showEmptyTeam != null) {
      _result.showEmptyTeam = showEmptyTeam;
    }
    return _result;
  }
  factory RefreshVehicleTeam_VehicleTeamPush.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RefreshVehicleTeam_VehicleTeamPush.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RefreshVehicleTeam_VehicleTeamPush clone() =>
      RefreshVehicleTeam_VehicleTeamPush()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RefreshVehicleTeam_VehicleTeamPush copyWith(
          void Function(RefreshVehicleTeam_VehicleTeamPush) updates) =>
      super.copyWith((message) =>
              updates(message as RefreshVehicleTeam_VehicleTeamPush))
          as RefreshVehicleTeam_VehicleTeamPush; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefreshVehicleTeam_VehicleTeamPush create() =>
      RefreshVehicleTeam_VehicleTeamPush._();
  RefreshVehicleTeam_VehicleTeamPush createEmptyInstance() => create();
  static $pb.PbList<RefreshVehicleTeam_VehicleTeamPush> createRepeated() =>
      $pb.PbList<RefreshVehicleTeam_VehicleTeamPush>();
  @$core.pragma('dart2js:noInline')
  static RefreshVehicleTeam_VehicleTeamPush getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshVehicleTeam_VehicleTeamPush>(
          create);
  static RefreshVehicleTeam_VehicleTeamPush? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get micNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set micNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMicNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearMicNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<RefreshVehicleTeam_Teams> get teams => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get showEmptyTeam => $_getIZ(2);
  @$pb.TagNumber(3)
  set showEmptyTeam($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasShowEmptyTeam() => $_has(2);
  @$pb.TagNumber(3)
  void clearShowEmptyTeam() => clearField(3);
}

class RefreshVehicleTeam_VehicleTitle extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RefreshVehicleTeam.VehicleTitle',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'refresh.vehicle.team'),
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
    ..pc<RefreshVehicleTeam_VehicleTitleUser>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icons',
        $pb.PbFieldType.PM,
        subBuilder: RefreshVehicleTeam_VehicleTitleUser.create)
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

  RefreshVehicleTeam_VehicleTitle._() : super();
  factory RefreshVehicleTeam_VehicleTitle({
    $core.int? id,
    $core.String? title,
    $core.Iterable<RefreshVehicleTeam_VehicleTitleUser>? icons,
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
  factory RefreshVehicleTeam_VehicleTitle.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RefreshVehicleTeam_VehicleTitle.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RefreshVehicleTeam_VehicleTitle clone() =>
      RefreshVehicleTeam_VehicleTitle()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RefreshVehicleTeam_VehicleTitle copyWith(
          void Function(RefreshVehicleTeam_VehicleTitle) updates) =>
      super.copyWith(
              (message) => updates(message as RefreshVehicleTeam_VehicleTitle))
          as RefreshVehicleTeam_VehicleTitle; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefreshVehicleTeam_VehicleTitle create() =>
      RefreshVehicleTeam_VehicleTitle._();
  RefreshVehicleTeam_VehicleTitle createEmptyInstance() => create();
  static $pb.PbList<RefreshVehicleTeam_VehicleTitle> createRepeated() =>
      $pb.PbList<RefreshVehicleTeam_VehicleTitle>();
  @$core.pragma('dart2js:noInline')
  static RefreshVehicleTeam_VehicleTitle getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshVehicleTeam_VehicleTitle>(
          create);
  static RefreshVehicleTeam_VehicleTitle? _defaultInstance;

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
  $core.List<RefreshVehicleTeam_VehicleTitleUser> get icons => $_getList(2);

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

class RefreshVehicleTeam_VehicleTitleUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RefreshVehicleTeam.VehicleTitleUser',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'refresh.vehicle.team'),
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

  RefreshVehicleTeam_VehicleTitleUser._() : super();
  factory RefreshVehicleTeam_VehicleTitleUser({
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
  factory RefreshVehicleTeam_VehicleTitleUser.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RefreshVehicleTeam_VehicleTitleUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RefreshVehicleTeam_VehicleTitleUser clone() =>
      RefreshVehicleTeam_VehicleTitleUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RefreshVehicleTeam_VehicleTitleUser copyWith(
          void Function(RefreshVehicleTeam_VehicleTitleUser) updates) =>
      super.copyWith((message) =>
              updates(message as RefreshVehicleTeam_VehicleTitleUser))
          as RefreshVehicleTeam_VehicleTitleUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefreshVehicleTeam_VehicleTitleUser create() =>
      RefreshVehicleTeam_VehicleTitleUser._();
  RefreshVehicleTeam_VehicleTitleUser createEmptyInstance() => create();
  static $pb.PbList<RefreshVehicleTeam_VehicleTitleUser> createRepeated() =>
      $pb.PbList<RefreshVehicleTeam_VehicleTitleUser>();
  @$core.pragma('dart2js:noInline')
  static RefreshVehicleTeam_VehicleTitleUser getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RefreshVehicleTeam_VehicleTitleUser>(create);
  static RefreshVehicleTeam_VehicleTitleUser? _defaultInstance;

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

class RefreshVehicleTeam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RefreshVehicleTeam',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'refresh.vehicle.team'),
      createEmptyInstance: create)
    ..aOM<RefreshVehicleTeam_VehicleTeamPush>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vehicle_team_push',
        subBuilder: RefreshVehicleTeam_VehicleTeamPush.create)
    ..hasRequiredFields = false;

  RefreshVehicleTeam._() : super();
  factory RefreshVehicleTeam({
    RefreshVehicleTeam_VehicleTeamPush? vehicleTeamPush,
  }) {
    final _result = create();
    if (vehicleTeamPush != null) {
      _result.vehicleTeamPush = vehicleTeamPush;
    }
    return _result;
  }
  factory RefreshVehicleTeam.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RefreshVehicleTeam.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RefreshVehicleTeam clone() => RefreshVehicleTeam()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RefreshVehicleTeam copyWith(void Function(RefreshVehicleTeam) updates) =>
      super.copyWith((message) => updates(message as RefreshVehicleTeam))
          as RefreshVehicleTeam; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefreshVehicleTeam create() => RefreshVehicleTeam._();
  RefreshVehicleTeam createEmptyInstance() => create();
  static $pb.PbList<RefreshVehicleTeam> createRepeated() =>
      $pb.PbList<RefreshVehicleTeam>();
  @$core.pragma('dart2js:noInline')
  static RefreshVehicleTeam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RefreshVehicleTeam>(create);
  static RefreshVehicleTeam? _defaultInstance;

  @$pb.TagNumber(1)
  RefreshVehicleTeam_VehicleTeamPush get vehicleTeamPush => $_getN(0);
  @$pb.TagNumber(1)
  set vehicleTeamPush(RefreshVehicleTeam_VehicleTeamPush v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasVehicleTeamPush() => $_has(0);
  @$pb.TagNumber(1)
  void clearVehicleTeamPush() => clearField(1);
  @$pb.TagNumber(1)
  RefreshVehicleTeam_VehicleTeamPush ensureVehicleTeamPush() => $_ensure(0);
}
