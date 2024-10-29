///
//  Generated code. Do not modify.
//  source: room.refersh.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/struct.pb.dart' as $0;

class RoomRefersh_VehicleTeam_Mics extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.VehicleTeam.Mics',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mic_status',
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
            : 'username')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame_new')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ring')
    ..hasRequiredFields = false;

  RoomRefersh_VehicleTeam_Mics._() : super();
  factory RoomRefersh_VehicleTeam_Mics({
    $core.int? uid,
    $core.int? position,
    $core.int? micStatus,
    $core.String? icon,
    $core.String? username,
    $core.int? vip,
    $core.String? frame,
    $core.String? frameNew,
    $core.String? ring,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (position != null) {
      _result.position = position;
    }
    if (micStatus != null) {
      _result.micStatus = micStatus;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (username != null) {
      _result.username = username;
    }
    if (vip != null) {
      _result.vip = vip;
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
    return _result;
  }
  factory RoomRefersh_VehicleTeam_Mics.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_VehicleTeam_Mics.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_VehicleTeam_Mics clone() =>
      RoomRefersh_VehicleTeam_Mics()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_VehicleTeam_Mics copyWith(
          void Function(RoomRefersh_VehicleTeam_Mics) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_VehicleTeam_Mics))
          as RoomRefersh_VehicleTeam_Mics; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_VehicleTeam_Mics create() =>
      RoomRefersh_VehicleTeam_Mics._();
  RoomRefersh_VehicleTeam_Mics createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_VehicleTeam_Mics> createRepeated() =>
      $pb.PbList<RoomRefersh_VehicleTeam_Mics>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_VehicleTeam_Mics getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_VehicleTeam_Mics>(create);
  static RoomRefersh_VehicleTeam_Mics? _defaultInstance;

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
  $core.int get position => $_getIZ(1);
  @$pb.TagNumber(2)
  set position($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get micStatus => $_getIZ(2);
  @$pb.TagNumber(3)
  set micStatus($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMicStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearMicStatus() => clearField(3);

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
  $core.String get username => $_getSZ(4);
  @$pb.TagNumber(5)
  set username($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUsername() => $_has(4);
  @$pb.TagNumber(5)
  void clearUsername() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get vip => $_getIZ(5);
  @$pb.TagNumber(6)
  set vip($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasVip() => $_has(5);
  @$pb.TagNumber(6)
  void clearVip() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get frame => $_getSZ(6);
  @$pb.TagNumber(7)
  set frame($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasFrame() => $_has(6);
  @$pb.TagNumber(7)
  void clearFrame() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get frameNew => $_getSZ(7);
  @$pb.TagNumber(8)
  set frameNew($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasFrameNew() => $_has(7);
  @$pb.TagNumber(8)
  void clearFrameNew() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get ring => $_getSZ(8);
  @$pb.TagNumber(9)
  set ring($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasRing() => $_has(8);
  @$pb.TagNumber(9)
  void clearRing() => clearField(9);
}

class RoomRefersh_VehicleTeam_NewTeams extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.VehicleTeam.NewTeams',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..pc<RoomRefersh_VehicleTeam_Mics>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mics',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_VehicleTeam_Mics.create)
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
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mic_num')
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
    ..aOM<$0.ListValue>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'buy_uids',
        subBuilder: $0.ListValue.create)
    ..hasRequiredFields = false;

  RoomRefersh_VehicleTeam_NewTeams._() : super();
  factory RoomRefersh_VehicleTeam_NewTeams({
    $core.Iterable<RoomRefersh_VehicleTeam_Mics>? mics,
    $core.int? rid,
    $core.String? name,
    $core.String? username,
    $core.int? vip,
    $core.String? icon,
    $core.int? isStarted,
    $core.String? srv,
    $core.String? tag,
    $core.String? micNum,
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
    $0.ListValue? buyUids,
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
      _result.buyUids = buyUids;
    }
    return _result;
  }
  factory RoomRefersh_VehicleTeam_NewTeams.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_VehicleTeam_NewTeams.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_VehicleTeam_NewTeams clone() =>
      RoomRefersh_VehicleTeam_NewTeams()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_VehicleTeam_NewTeams copyWith(
          void Function(RoomRefersh_VehicleTeam_NewTeams) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_VehicleTeam_NewTeams))
          as RoomRefersh_VehicleTeam_NewTeams; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_VehicleTeam_NewTeams create() =>
      RoomRefersh_VehicleTeam_NewTeams._();
  RoomRefersh_VehicleTeam_NewTeams createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_VehicleTeam_NewTeams> createRepeated() =>
      $pb.PbList<RoomRefersh_VehicleTeam_NewTeams>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_VehicleTeam_NewTeams getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_VehicleTeam_NewTeams>(
          create);
  static RoomRefersh_VehicleTeam_NewTeams? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RoomRefersh_VehicleTeam_Mics> get mics => $_getList(0);

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
  $core.String get micNum => $_getSZ(9);
  @$pb.TagNumber(10)
  set micNum($core.String v) {
    $_setString(9, v);
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
  $0.ListValue get buyUids => $_getN(21);
  @$pb.TagNumber(22)
  set buyUids($0.ListValue v) {
    setField(22, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasBuyUids() => $_has(21);
  @$pb.TagNumber(22)
  void clearBuyUids() => clearField(22);
  @$pb.TagNumber(22)
  $0.ListValue ensureBuyUids() => $_ensure(21);
}

class RoomRefersh_VehicleTeam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.VehicleTeam',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mic_num',
        $pb.PbFieldType.OU3)
    ..aOM<$0.ListValue>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'teams',
        subBuilder: $0.ListValue.create)
    ..pc<RoomRefersh_VehicleTeam_NewTeams>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'new_teams',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_VehicleTeam_NewTeams.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_empty_team',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_VehicleTeam._() : super();
  factory RoomRefersh_VehicleTeam({
    $core.int? micNum,
    $0.ListValue? teams,
    $core.Iterable<RoomRefersh_VehicleTeam_NewTeams>? newTeams,
    $core.int? showEmptyTeam,
  }) {
    final _result = create();
    if (micNum != null) {
      _result.micNum = micNum;
    }
    if (teams != null) {
      _result.teams = teams;
    }
    if (newTeams != null) {
      _result.newTeams.addAll(newTeams);
    }
    if (showEmptyTeam != null) {
      _result.showEmptyTeam = showEmptyTeam;
    }
    return _result;
  }
  factory RoomRefersh_VehicleTeam.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_VehicleTeam.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_VehicleTeam clone() =>
      RoomRefersh_VehicleTeam()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_VehicleTeam copyWith(
          void Function(RoomRefersh_VehicleTeam) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_VehicleTeam))
          as RoomRefersh_VehicleTeam; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_VehicleTeam create() => RoomRefersh_VehicleTeam._();
  RoomRefersh_VehicleTeam createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_VehicleTeam> createRepeated() =>
      $pb.PbList<RoomRefersh_VehicleTeam>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_VehicleTeam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_VehicleTeam>(create);
  static RoomRefersh_VehicleTeam? _defaultInstance;

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
  $0.ListValue get teams => $_getN(1);
  @$pb.TagNumber(2)
  set teams($0.ListValue v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTeams() => $_has(1);
  @$pb.TagNumber(2)
  void clearTeams() => clearField(2);
  @$pb.TagNumber(2)
  $0.ListValue ensureTeams() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<RoomRefersh_VehicleTeam_NewTeams> get newTeams => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get showEmptyTeam => $_getIZ(3);
  @$pb.TagNumber(4)
  set showEmptyTeam($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasShowEmptyTeam() => $_has(3);
  @$pb.TagNumber(4)
  void clearShowEmptyTeam() => clearField(4);
}

class RoomRefersh_Tower_MySetting extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Tower.MySetting',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'b_name')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_Tower_MySetting._() : super();
  factory RoomRefersh_Tower_MySetting({
    $core.String? bName,
    $core.int? num,
  }) {
    final _result = create();
    if (bName != null) {
      _result.bName = bName;
    }
    if (num != null) {
      _result.num = num;
    }
    return _result;
  }
  factory RoomRefersh_Tower_MySetting.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Tower_MySetting.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Tower_MySetting clone() =>
      RoomRefersh_Tower_MySetting()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Tower_MySetting copyWith(
          void Function(RoomRefersh_Tower_MySetting) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_Tower_MySetting))
          as RoomRefersh_Tower_MySetting; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Tower_MySetting create() =>
      RoomRefersh_Tower_MySetting._();
  RoomRefersh_Tower_MySetting createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Tower_MySetting> createRepeated() =>
      $pb.PbList<RoomRefersh_Tower_MySetting>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Tower_MySetting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Tower_MySetting>(create);
  static RoomRefersh_Tower_MySetting? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bName => $_getSZ(0);
  @$pb.TagNumber(1)
  set bName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBName() => $_has(0);
  @$pb.TagNumber(1)
  void clearBName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get num => $_getIZ(1);
  @$pb.TagNumber(2)
  set num($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearNum() => clearField(2);
}

class RoomRefersh_Tower_Profile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Tower.Profile',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
    ..hasRequiredFields = false;

  RoomRefersh_Tower_Profile._() : super();
  factory RoomRefersh_Tower_Profile({
    $core.String? uid,
    $core.String? name,
    $core.String? icon,
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
    return _result;
  }
  factory RoomRefersh_Tower_Profile.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Tower_Profile.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Tower_Profile clone() =>
      RoomRefersh_Tower_Profile()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Tower_Profile copyWith(
          void Function(RoomRefersh_Tower_Profile) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_Tower_Profile))
          as RoomRefersh_Tower_Profile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Tower_Profile create() => RoomRefersh_Tower_Profile._();
  RoomRefersh_Tower_Profile createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Tower_Profile> createRepeated() =>
      $pb.PbList<RoomRefersh_Tower_Profile>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Tower_Profile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Tower_Profile>(create);
  static RoomRefersh_Tower_Profile? _defaultInstance;

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
}

class RoomRefersh_Tower extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Tower',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 't_uid')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'back_img')
    ..aOM<$0.ListValue>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        subBuilder: $0.ListValue.create)
    ..m<$core.String, RoomRefersh_Tower_Profile>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'profileMap',
        protoName: 'profileMap',
        entryClassName: 'RoomRefersh.Tower.ProfileMapEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: RoomRefersh_Tower_Profile.create,
        packageName: const $pb.PackageName('room.refersh'))
    ..aOM<RoomRefersh_Tower_MySetting>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'my_setting',
        subBuilder: RoomRefersh_Tower_MySetting.create)
    ..hasRequiredFields = false;

  RoomRefersh_Tower._() : super();
  factory RoomRefersh_Tower({
    $core.String? bid,
    $core.String? tUid,
    $core.String? state,
    $core.String? backImg,
    $0.ListValue? list,
    $core.Map<$core.String, RoomRefersh_Tower_Profile>? profileMap,
    RoomRefersh_Tower_MySetting? mySetting,
  }) {
    final _result = create();
    if (bid != null) {
      _result.bid = bid;
    }
    if (tUid != null) {
      _result.tUid = tUid;
    }
    if (state != null) {
      _result.state = state;
    }
    if (backImg != null) {
      _result.backImg = backImg;
    }
    if (list != null) {
      _result.list = list;
    }
    if (profileMap != null) {
      _result.profileMap.addAll(profileMap);
    }
    if (mySetting != null) {
      _result.mySetting = mySetting;
    }
    return _result;
  }
  factory RoomRefersh_Tower.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Tower.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Tower clone() => RoomRefersh_Tower()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Tower copyWith(void Function(RoomRefersh_Tower) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_Tower))
          as RoomRefersh_Tower; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Tower create() => RoomRefersh_Tower._();
  RoomRefersh_Tower createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Tower> createRepeated() =>
      $pb.PbList<RoomRefersh_Tower>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Tower getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Tower>(create);
  static RoomRefersh_Tower? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bid => $_getSZ(0);
  @$pb.TagNumber(1)
  set bid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tUid => $_getSZ(1);
  @$pb.TagNumber(2)
  set tUid($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearTUid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get state => $_getSZ(2);
  @$pb.TagNumber(3)
  set state($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasState() => $_has(2);
  @$pb.TagNumber(3)
  void clearState() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get backImg => $_getSZ(3);
  @$pb.TagNumber(4)
  set backImg($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBackImg() => $_has(3);
  @$pb.TagNumber(4)
  void clearBackImg() => clearField(4);

  @$pb.TagNumber(5)
  $0.ListValue get list => $_getN(4);
  @$pb.TagNumber(5)
  set list($0.ListValue v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasList() => $_has(4);
  @$pb.TagNumber(5)
  void clearList() => clearField(5);
  @$pb.TagNumber(5)
  $0.ListValue ensureList() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.Map<$core.String, RoomRefersh_Tower_Profile> get profileMap =>
      $_getMap(5);

  @$pb.TagNumber(7)
  RoomRefersh_Tower_MySetting get mySetting => $_getN(6);
  @$pb.TagNumber(7)
  set mySetting(RoomRefersh_Tower_MySetting v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMySetting() => $_has(6);
  @$pb.TagNumber(7)
  void clearMySetting() => clearField(7);
  @$pb.TagNumber(7)
  RoomRefersh_Tower_MySetting ensureMySetting() => $_ensure(6);
}

class RoomRefersh_VipMic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.VipMic',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOM<$0.Value>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show',
        subBuilder: $0.Value.create)
    ..hasRequiredFields = false;

  RoomRefersh_VipMic._() : super();
  factory RoomRefersh_VipMic({
    $0.Value? show,
  }) {
    final _result = create();
    if (show != null) {
      _result.show = show;
    }
    return _result;
  }
  factory RoomRefersh_VipMic.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_VipMic.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_VipMic clone() => RoomRefersh_VipMic()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_VipMic copyWith(void Function(RoomRefersh_VipMic) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_VipMic))
          as RoomRefersh_VipMic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_VipMic create() => RoomRefersh_VipMic._();
  RoomRefersh_VipMic createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_VipMic> createRepeated() =>
      $pb.PbList<RoomRefersh_VipMic>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_VipMic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_VipMic>(create);
  static RoomRefersh_VipMic? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Value get show => $_getN(0);
  @$pb.TagNumber(1)
  set show($0.Value v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShow() => $_has(0);
  @$pb.TagNumber(1)
  void clearShow() => clearField(1);
  @$pb.TagNumber(1)
  $0.Value ensureShow() => $_ensure(0);
}

class RoomRefersh_PrivateNest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.PrivateNest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showList',
        $pb.PbFieldType.OU3,
        protoName: 'showList')
    ..hasRequiredFields = false;

  RoomRefersh_PrivateNest._() : super();
  factory RoomRefersh_PrivateNest({
    $core.int? showList,
  }) {
    final _result = create();
    if (showList != null) {
      _result.showList = showList;
    }
    return _result;
  }
  factory RoomRefersh_PrivateNest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_PrivateNest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_PrivateNest clone() =>
      RoomRefersh_PrivateNest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_PrivateNest copyWith(
          void Function(RoomRefersh_PrivateNest) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_PrivateNest))
          as RoomRefersh_PrivateNest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_PrivateNest create() => RoomRefersh_PrivateNest._();
  RoomRefersh_PrivateNest createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_PrivateNest> createRepeated() =>
      $pb.PbList<RoomRefersh_PrivateNest>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_PrivateNest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_PrivateNest>(create);
  static RoomRefersh_PrivateNest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get showList => $_getIZ(0);
  @$pb.TagNumber(1)
  set showList($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShowList() => $_has(0);
  @$pb.TagNumber(1)
  void clearShowList() => clearField(1);
}

class RoomRefersh_Nest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Nest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'free',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_Nest._() : super();
  factory RoomRefersh_Nest({
    $core.int? show,
    $core.int? free,
  }) {
    final _result = create();
    if (show != null) {
      _result.show = show;
    }
    if (free != null) {
      _result.free = free;
    }
    return _result;
  }
  factory RoomRefersh_Nest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Nest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Nest clone() => RoomRefersh_Nest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Nest copyWith(void Function(RoomRefersh_Nest) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_Nest))
          as RoomRefersh_Nest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Nest create() => RoomRefersh_Nest._();
  RoomRefersh_Nest createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Nest> createRepeated() =>
      $pb.PbList<RoomRefersh_Nest>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Nest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Nest>(create);
  static RoomRefersh_Nest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get show => $_getIZ(0);
  @$pb.TagNumber(1)
  set show($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShow() => $_has(0);
  @$pb.TagNumber(1)
  void clearShow() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get free => $_getIZ(1);
  @$pb.TagNumber(2)
  set free($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFree() => $_has(1);
  @$pb.TagNumber(2)
  void clearFree() => clearField(2);
}

class RoomRefersh_Options_Camp_Good extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Options.Camp.Good',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'origin')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'target')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'antidoteTarget',
        protoName: 'antidoteTarget')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poison_target')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guard_target')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'voteTarget',
        protoName: 'voteTarget')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'count')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deadCount',
        protoName: 'deadCount')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isDead',
        protoName: 'isDead')
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deadPub',
        protoName: 'deadPub')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isDesc',
        protoName: 'isDesc')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastwords_type')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'voteDead',
        protoName: 'voteDead')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'killDead',
        protoName: 'killDead')
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_ready')
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gun_dead')
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poison_dead')
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'explode_dead')
    ..aOS(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_police_join')
    ..aOS(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_police')
    ..aOS(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'start_time')
    ..hasRequiredFields = false;

  RoomRefersh_Options_Camp_Good._() : super();
  factory RoomRefersh_Options_Camp_Good({
    $core.String? id,
    $core.String? rid,
    $core.String? position,
    $core.String? origin,
    $core.String? role,
    $core.String? price,
    $core.String? target,
    $core.String? antidoteTarget,
    $core.String? poisonTarget,
    $core.String? guardTarget,
    $core.String? voteTarget,
    $core.String? count,
    $core.String? deadCount,
    $core.String? isDead,
    $core.String? deadPub,
    $core.String? isDesc,
    $core.String? lastwordsType,
    $core.String? voteDead,
    $core.String? killDead,
    $core.String? isReady,
    $core.String? gunDead,
    $core.String? poisonDead,
    $core.String? explodeDead,
    $core.String? isPoliceJoin,
    $core.String? isPolice,
    $core.String? startTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (position != null) {
      _result.position = position;
    }
    if (origin != null) {
      _result.origin = origin;
    }
    if (role != null) {
      _result.role = role;
    }
    if (price != null) {
      _result.price = price;
    }
    if (target != null) {
      _result.target = target;
    }
    if (antidoteTarget != null) {
      _result.antidoteTarget = antidoteTarget;
    }
    if (poisonTarget != null) {
      _result.poisonTarget = poisonTarget;
    }
    if (guardTarget != null) {
      _result.guardTarget = guardTarget;
    }
    if (voteTarget != null) {
      _result.voteTarget = voteTarget;
    }
    if (count != null) {
      _result.count = count;
    }
    if (deadCount != null) {
      _result.deadCount = deadCount;
    }
    if (isDead != null) {
      _result.isDead = isDead;
    }
    if (deadPub != null) {
      _result.deadPub = deadPub;
    }
    if (isDesc != null) {
      _result.isDesc = isDesc;
    }
    if (lastwordsType != null) {
      _result.lastwordsType = lastwordsType;
    }
    if (voteDead != null) {
      _result.voteDead = voteDead;
    }
    if (killDead != null) {
      _result.killDead = killDead;
    }
    if (isReady != null) {
      _result.isReady = isReady;
    }
    if (gunDead != null) {
      _result.gunDead = gunDead;
    }
    if (poisonDead != null) {
      _result.poisonDead = poisonDead;
    }
    if (explodeDead != null) {
      _result.explodeDead = explodeDead;
    }
    if (isPoliceJoin != null) {
      _result.isPoliceJoin = isPoliceJoin;
    }
    if (isPolice != null) {
      _result.isPolice = isPolice;
    }
    if (startTime != null) {
      _result.startTime = startTime;
    }
    return _result;
  }
  factory RoomRefersh_Options_Camp_Good.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Options_Camp_Good.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_Camp_Good clone() =>
      RoomRefersh_Options_Camp_Good()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_Camp_Good copyWith(
          void Function(RoomRefersh_Options_Camp_Good) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_Options_Camp_Good))
          as RoomRefersh_Options_Camp_Good; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_Camp_Good create() =>
      RoomRefersh_Options_Camp_Good._();
  RoomRefersh_Options_Camp_Good createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Options_Camp_Good> createRepeated() =>
      $pb.PbList<RoomRefersh_Options_Camp_Good>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_Camp_Good getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Options_Camp_Good>(create);
  static RoomRefersh_Options_Camp_Good? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get rid => $_getSZ(1);
  @$pb.TagNumber(2)
  set rid($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get position => $_getSZ(2);
  @$pb.TagNumber(3)
  set position($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearPosition() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get origin => $_getSZ(3);
  @$pb.TagNumber(4)
  set origin($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOrigin() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrigin() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get role => $_getSZ(4);
  @$pb.TagNumber(5)
  set role($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRole() => $_has(4);
  @$pb.TagNumber(5)
  void clearRole() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get price => $_getSZ(5);
  @$pb.TagNumber(6)
  set price($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPrice() => $_has(5);
  @$pb.TagNumber(6)
  void clearPrice() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get target => $_getSZ(6);
  @$pb.TagNumber(7)
  set target($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTarget() => $_has(6);
  @$pb.TagNumber(7)
  void clearTarget() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get antidoteTarget => $_getSZ(7);
  @$pb.TagNumber(8)
  set antidoteTarget($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasAntidoteTarget() => $_has(7);
  @$pb.TagNumber(8)
  void clearAntidoteTarget() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get poisonTarget => $_getSZ(8);
  @$pb.TagNumber(9)
  set poisonTarget($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPoisonTarget() => $_has(8);
  @$pb.TagNumber(9)
  void clearPoisonTarget() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get guardTarget => $_getSZ(9);
  @$pb.TagNumber(10)
  set guardTarget($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasGuardTarget() => $_has(9);
  @$pb.TagNumber(10)
  void clearGuardTarget() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get voteTarget => $_getSZ(10);
  @$pb.TagNumber(11)
  set voteTarget($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasVoteTarget() => $_has(10);
  @$pb.TagNumber(11)
  void clearVoteTarget() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get count => $_getSZ(11);
  @$pb.TagNumber(12)
  set count($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasCount() => $_has(11);
  @$pb.TagNumber(12)
  void clearCount() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get deadCount => $_getSZ(12);
  @$pb.TagNumber(13)
  set deadCount($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasDeadCount() => $_has(12);
  @$pb.TagNumber(13)
  void clearDeadCount() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get isDead => $_getSZ(13);
  @$pb.TagNumber(14)
  set isDead($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasIsDead() => $_has(13);
  @$pb.TagNumber(14)
  void clearIsDead() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get deadPub => $_getSZ(14);
  @$pb.TagNumber(15)
  set deadPub($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasDeadPub() => $_has(14);
  @$pb.TagNumber(15)
  void clearDeadPub() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get isDesc => $_getSZ(15);
  @$pb.TagNumber(16)
  set isDesc($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasIsDesc() => $_has(15);
  @$pb.TagNumber(16)
  void clearIsDesc() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get lastwordsType => $_getSZ(16);
  @$pb.TagNumber(17)
  set lastwordsType($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasLastwordsType() => $_has(16);
  @$pb.TagNumber(17)
  void clearLastwordsType() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get voteDead => $_getSZ(17);
  @$pb.TagNumber(18)
  set voteDead($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasVoteDead() => $_has(17);
  @$pb.TagNumber(18)
  void clearVoteDead() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get killDead => $_getSZ(18);
  @$pb.TagNumber(19)
  set killDead($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasKillDead() => $_has(18);
  @$pb.TagNumber(19)
  void clearKillDead() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get isReady => $_getSZ(19);
  @$pb.TagNumber(20)
  set isReady($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasIsReady() => $_has(19);
  @$pb.TagNumber(20)
  void clearIsReady() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get gunDead => $_getSZ(20);
  @$pb.TagNumber(21)
  set gunDead($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasGunDead() => $_has(20);
  @$pb.TagNumber(21)
  void clearGunDead() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get poisonDead => $_getSZ(21);
  @$pb.TagNumber(22)
  set poisonDead($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasPoisonDead() => $_has(21);
  @$pb.TagNumber(22)
  void clearPoisonDead() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get explodeDead => $_getSZ(22);
  @$pb.TagNumber(23)
  set explodeDead($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasExplodeDead() => $_has(22);
  @$pb.TagNumber(23)
  void clearExplodeDead() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get isPoliceJoin => $_getSZ(23);
  @$pb.TagNumber(24)
  set isPoliceJoin($core.String v) {
    $_setString(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasIsPoliceJoin() => $_has(23);
  @$pb.TagNumber(24)
  void clearIsPoliceJoin() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get isPolice => $_getSZ(24);
  @$pb.TagNumber(25)
  set isPolice($core.String v) {
    $_setString(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasIsPolice() => $_has(24);
  @$pb.TagNumber(25)
  void clearIsPolice() => clearField(25);

  @$pb.TagNumber(26)
  $core.String get startTime => $_getSZ(25);
  @$pb.TagNumber(26)
  set startTime($core.String v) {
    $_setString(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasStartTime() => $_has(25);
  @$pb.TagNumber(26)
  void clearStartTime() => clearField(26);
}

class RoomRefersh_Options_Camp_Bad extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Options.Camp.Bad',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'origin')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'target')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'antidoteTarget',
        protoName: 'antidoteTarget')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poison_target')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guard_target')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'voteTarget',
        protoName: 'voteTarget')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'count')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deadCount',
        protoName: 'deadCount')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isDead',
        protoName: 'isDead')
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deadPub',
        protoName: 'deadPub')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isDesc',
        protoName: 'isDesc')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastwords_type')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'voteDead',
        protoName: 'voteDead')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'killDead',
        protoName: 'killDead')
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_ready')
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gun_dead')
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poison_dead')
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'explode_dead')
    ..aOS(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_police_join')
    ..aOS(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_police')
    ..aOS(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'start_time')
    ..hasRequiredFields = false;

  RoomRefersh_Options_Camp_Bad._() : super();
  factory RoomRefersh_Options_Camp_Bad({
    $core.String? id,
    $core.String? rid,
    $core.String? position,
    $core.String? origin,
    $core.String? role,
    $core.String? price,
    $core.String? target,
    $core.String? antidoteTarget,
    $core.String? poisonTarget,
    $core.String? guardTarget,
    $core.String? voteTarget,
    $core.String? count,
    $core.String? deadCount,
    $core.String? isDead,
    $core.String? deadPub,
    $core.String? isDesc,
    $core.String? lastwordsType,
    $core.String? voteDead,
    $core.String? killDead,
    $core.String? isReady,
    $core.String? gunDead,
    $core.String? poisonDead,
    $core.String? explodeDead,
    $core.String? isPoliceJoin,
    $core.String? isPolice,
    $core.String? startTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (position != null) {
      _result.position = position;
    }
    if (origin != null) {
      _result.origin = origin;
    }
    if (role != null) {
      _result.role = role;
    }
    if (price != null) {
      _result.price = price;
    }
    if (target != null) {
      _result.target = target;
    }
    if (antidoteTarget != null) {
      _result.antidoteTarget = antidoteTarget;
    }
    if (poisonTarget != null) {
      _result.poisonTarget = poisonTarget;
    }
    if (guardTarget != null) {
      _result.guardTarget = guardTarget;
    }
    if (voteTarget != null) {
      _result.voteTarget = voteTarget;
    }
    if (count != null) {
      _result.count = count;
    }
    if (deadCount != null) {
      _result.deadCount = deadCount;
    }
    if (isDead != null) {
      _result.isDead = isDead;
    }
    if (deadPub != null) {
      _result.deadPub = deadPub;
    }
    if (isDesc != null) {
      _result.isDesc = isDesc;
    }
    if (lastwordsType != null) {
      _result.lastwordsType = lastwordsType;
    }
    if (voteDead != null) {
      _result.voteDead = voteDead;
    }
    if (killDead != null) {
      _result.killDead = killDead;
    }
    if (isReady != null) {
      _result.isReady = isReady;
    }
    if (gunDead != null) {
      _result.gunDead = gunDead;
    }
    if (poisonDead != null) {
      _result.poisonDead = poisonDead;
    }
    if (explodeDead != null) {
      _result.explodeDead = explodeDead;
    }
    if (isPoliceJoin != null) {
      _result.isPoliceJoin = isPoliceJoin;
    }
    if (isPolice != null) {
      _result.isPolice = isPolice;
    }
    if (startTime != null) {
      _result.startTime = startTime;
    }
    return _result;
  }
  factory RoomRefersh_Options_Camp_Bad.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Options_Camp_Bad.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_Camp_Bad clone() =>
      RoomRefersh_Options_Camp_Bad()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_Camp_Bad copyWith(
          void Function(RoomRefersh_Options_Camp_Bad) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_Options_Camp_Bad))
          as RoomRefersh_Options_Camp_Bad; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_Camp_Bad create() =>
      RoomRefersh_Options_Camp_Bad._();
  RoomRefersh_Options_Camp_Bad createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Options_Camp_Bad> createRepeated() =>
      $pb.PbList<RoomRefersh_Options_Camp_Bad>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_Camp_Bad getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Options_Camp_Bad>(create);
  static RoomRefersh_Options_Camp_Bad? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get rid => $_getSZ(1);
  @$pb.TagNumber(2)
  set rid($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get position => $_getSZ(2);
  @$pb.TagNumber(3)
  set position($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearPosition() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get origin => $_getSZ(3);
  @$pb.TagNumber(4)
  set origin($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOrigin() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrigin() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get role => $_getSZ(4);
  @$pb.TagNumber(5)
  set role($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRole() => $_has(4);
  @$pb.TagNumber(5)
  void clearRole() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get price => $_getSZ(5);
  @$pb.TagNumber(6)
  set price($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPrice() => $_has(5);
  @$pb.TagNumber(6)
  void clearPrice() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get target => $_getSZ(6);
  @$pb.TagNumber(7)
  set target($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTarget() => $_has(6);
  @$pb.TagNumber(7)
  void clearTarget() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get antidoteTarget => $_getSZ(7);
  @$pb.TagNumber(8)
  set antidoteTarget($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasAntidoteTarget() => $_has(7);
  @$pb.TagNumber(8)
  void clearAntidoteTarget() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get poisonTarget => $_getSZ(8);
  @$pb.TagNumber(9)
  set poisonTarget($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPoisonTarget() => $_has(8);
  @$pb.TagNumber(9)
  void clearPoisonTarget() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get guardTarget => $_getSZ(9);
  @$pb.TagNumber(10)
  set guardTarget($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasGuardTarget() => $_has(9);
  @$pb.TagNumber(10)
  void clearGuardTarget() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get voteTarget => $_getSZ(10);
  @$pb.TagNumber(11)
  set voteTarget($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasVoteTarget() => $_has(10);
  @$pb.TagNumber(11)
  void clearVoteTarget() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get count => $_getSZ(11);
  @$pb.TagNumber(12)
  set count($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasCount() => $_has(11);
  @$pb.TagNumber(12)
  void clearCount() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get deadCount => $_getSZ(12);
  @$pb.TagNumber(13)
  set deadCount($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasDeadCount() => $_has(12);
  @$pb.TagNumber(13)
  void clearDeadCount() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get isDead => $_getSZ(13);
  @$pb.TagNumber(14)
  set isDead($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasIsDead() => $_has(13);
  @$pb.TagNumber(14)
  void clearIsDead() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get deadPub => $_getSZ(14);
  @$pb.TagNumber(15)
  set deadPub($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasDeadPub() => $_has(14);
  @$pb.TagNumber(15)
  void clearDeadPub() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get isDesc => $_getSZ(15);
  @$pb.TagNumber(16)
  set isDesc($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasIsDesc() => $_has(15);
  @$pb.TagNumber(16)
  void clearIsDesc() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get lastwordsType => $_getSZ(16);
  @$pb.TagNumber(17)
  set lastwordsType($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasLastwordsType() => $_has(16);
  @$pb.TagNumber(17)
  void clearLastwordsType() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get voteDead => $_getSZ(17);
  @$pb.TagNumber(18)
  set voteDead($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasVoteDead() => $_has(17);
  @$pb.TagNumber(18)
  void clearVoteDead() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get killDead => $_getSZ(18);
  @$pb.TagNumber(19)
  set killDead($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasKillDead() => $_has(18);
  @$pb.TagNumber(19)
  void clearKillDead() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get isReady => $_getSZ(19);
  @$pb.TagNumber(20)
  set isReady($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasIsReady() => $_has(19);
  @$pb.TagNumber(20)
  void clearIsReady() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get gunDead => $_getSZ(20);
  @$pb.TagNumber(21)
  set gunDead($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasGunDead() => $_has(20);
  @$pb.TagNumber(21)
  void clearGunDead() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get poisonDead => $_getSZ(21);
  @$pb.TagNumber(22)
  set poisonDead($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasPoisonDead() => $_has(21);
  @$pb.TagNumber(22)
  void clearPoisonDead() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get explodeDead => $_getSZ(22);
  @$pb.TagNumber(23)
  set explodeDead($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasExplodeDead() => $_has(22);
  @$pb.TagNumber(23)
  void clearExplodeDead() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get isPoliceJoin => $_getSZ(23);
  @$pb.TagNumber(24)
  set isPoliceJoin($core.String v) {
    $_setString(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasIsPoliceJoin() => $_has(23);
  @$pb.TagNumber(24)
  void clearIsPoliceJoin() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get isPolice => $_getSZ(24);
  @$pb.TagNumber(25)
  set isPolice($core.String v) {
    $_setString(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasIsPolice() => $_has(24);
  @$pb.TagNumber(25)
  void clearIsPolice() => clearField(25);

  @$pb.TagNumber(26)
  $core.String get startTime => $_getSZ(25);
  @$pb.TagNumber(26)
  set startTime($core.String v) {
    $_setString(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasStartTime() => $_has(25);
  @$pb.TagNumber(26)
  void clearStartTime() => clearField(26);
}

class RoomRefersh_Options_Camp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Options.Camp',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..pc<RoomRefersh_Options_Camp_Good>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'good',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_Options_Camp_Good.create)
    ..pc<RoomRefersh_Options_Camp_Bad>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bad',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_Options_Camp_Bad.create)
    ..hasRequiredFields = false;

  RoomRefersh_Options_Camp._() : super();
  factory RoomRefersh_Options_Camp({
    $core.Iterable<RoomRefersh_Options_Camp_Good>? good,
    $core.Iterable<RoomRefersh_Options_Camp_Bad>? bad,
  }) {
    final _result = create();
    if (good != null) {
      _result.good.addAll(good);
    }
    if (bad != null) {
      _result.bad.addAll(bad);
    }
    return _result;
  }
  factory RoomRefersh_Options_Camp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Options_Camp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_Camp clone() =>
      RoomRefersh_Options_Camp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_Camp copyWith(
          void Function(RoomRefersh_Options_Camp) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_Options_Camp))
          as RoomRefersh_Options_Camp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_Camp create() => RoomRefersh_Options_Camp._();
  RoomRefersh_Options_Camp createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Options_Camp> createRepeated() =>
      $pb.PbList<RoomRefersh_Options_Camp>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_Camp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Options_Camp>(create);
  static RoomRefersh_Options_Camp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RoomRefersh_Options_Camp_Good> get good => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<RoomRefersh_Options_Camp_Bad> get bad => $_getList(1);
}

class RoomRefersh_Options_User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Options.User',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
    ..hasRequiredFields = false;

  RoomRefersh_Options_User._() : super();
  factory RoomRefersh_Options_User({
    $core.String? uid,
    $core.String? name,
    $core.String? icon,
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
    return _result;
  }
  factory RoomRefersh_Options_User.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Options_User.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_User clone() =>
      RoomRefersh_Options_User()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_User copyWith(
          void Function(RoomRefersh_Options_User) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_Options_User))
          as RoomRefersh_Options_User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_User create() => RoomRefersh_Options_User._();
  RoomRefersh_Options_User createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Options_User> createRepeated() =>
      $pb.PbList<RoomRefersh_Options_User>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_User getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Options_User>(create);
  static RoomRefersh_Options_User? _defaultInstance;

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
}

class RoomRefersh_Options_OptionsData_Poison extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Options.OptionsData.Poison',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasPoison',
        protoName: 'hasPoison')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'antidoteTarget',
        protoName: 'antidoteTarget')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'killTarget',
        $pb.PbFieldType.OU3,
        protoName: 'killTarget')
    ..hasRequiredFields = false;

  RoomRefersh_Options_OptionsData_Poison._() : super();
  factory RoomRefersh_Options_OptionsData_Poison({
    $core.bool? hasPoison,
    $core.String? antidoteTarget,
    $core.int? killTarget,
  }) {
    final _result = create();
    if (hasPoison != null) {
      _result.hasPoison = hasPoison;
    }
    if (antidoteTarget != null) {
      _result.antidoteTarget = antidoteTarget;
    }
    if (killTarget != null) {
      _result.killTarget = killTarget;
    }
    return _result;
  }
  factory RoomRefersh_Options_OptionsData_Poison.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Options_OptionsData_Poison.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_OptionsData_Poison clone() =>
      RoomRefersh_Options_OptionsData_Poison()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_OptionsData_Poison copyWith(
          void Function(RoomRefersh_Options_OptionsData_Poison) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_Options_OptionsData_Poison))
          as RoomRefersh_Options_OptionsData_Poison; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_OptionsData_Poison create() =>
      RoomRefersh_Options_OptionsData_Poison._();
  RoomRefersh_Options_OptionsData_Poison createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Options_OptionsData_Poison> createRepeated() =>
      $pb.PbList<RoomRefersh_Options_OptionsData_Poison>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_OptionsData_Poison getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_Options_OptionsData_Poison>(create);
  static RoomRefersh_Options_OptionsData_Poison? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get hasPoison => $_getBF(0);
  @$pb.TagNumber(1)
  set hasPoison($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHasPoison() => $_has(0);
  @$pb.TagNumber(1)
  void clearHasPoison() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get antidoteTarget => $_getSZ(1);
  @$pb.TagNumber(2)
  set antidoteTarget($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAntidoteTarget() => $_has(1);
  @$pb.TagNumber(2)
  void clearAntidoteTarget() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get killTarget => $_getIZ(2);
  @$pb.TagNumber(3)
  set killTarget($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasKillTarget() => $_has(2);
  @$pb.TagNumber(3)
  void clearKillTarget() => clearField(3);
}

class RoomRefersh_Options_OptionsData_Scene extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Options.OptionsData.Scene',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'surplusClues',
        $pb.PbFieldType.OU3,
        protoName: 'surplusClues')
    ..hasRequiredFields = false;

  RoomRefersh_Options_OptionsData_Scene._() : super();
  factory RoomRefersh_Options_OptionsData_Scene({
    $core.int? sid,
    $core.int? surplusClues,
  }) {
    final _result = create();
    if (sid != null) {
      _result.sid = sid;
    }
    if (surplusClues != null) {
      _result.surplusClues = surplusClues;
    }
    return _result;
  }
  factory RoomRefersh_Options_OptionsData_Scene.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Options_OptionsData_Scene.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_OptionsData_Scene clone() =>
      RoomRefersh_Options_OptionsData_Scene()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_OptionsData_Scene copyWith(
          void Function(RoomRefersh_Options_OptionsData_Scene) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_Options_OptionsData_Scene))
          as RoomRefersh_Options_OptionsData_Scene; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_OptionsData_Scene create() =>
      RoomRefersh_Options_OptionsData_Scene._();
  RoomRefersh_Options_OptionsData_Scene createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Options_OptionsData_Scene> createRepeated() =>
      $pb.PbList<RoomRefersh_Options_OptionsData_Scene>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_OptionsData_Scene getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_Options_OptionsData_Scene>(create);
  static RoomRefersh_Options_OptionsData_Scene? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get sid => $_getIZ(0);
  @$pb.TagNumber(1)
  set sid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSid() => $_has(0);
  @$pb.TagNumber(1)
  void clearSid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get surplusClues => $_getIZ(1);
  @$pb.TagNumber(2)
  set surplusClues($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSurplusClues() => $_has(1);
  @$pb.TagNumber(2)
  void clearSurplusClues() => clearField(2);
}

class RoomRefersh_Options_OptionsData_Antidote extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Options.OptionsData.Antidote',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasAntidote',
        protoName: 'hasAntidote')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'killTarget',
        $pb.PbFieldType.OU3,
        protoName: 'killTarget')
    ..hasRequiredFields = false;

  RoomRefersh_Options_OptionsData_Antidote._() : super();
  factory RoomRefersh_Options_OptionsData_Antidote({
    $core.bool? hasAntidote,
    $core.int? killTarget,
  }) {
    final _result = create();
    if (hasAntidote != null) {
      _result.hasAntidote = hasAntidote;
    }
    if (killTarget != null) {
      _result.killTarget = killTarget;
    }
    return _result;
  }
  factory RoomRefersh_Options_OptionsData_Antidote.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Options_OptionsData_Antidote.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_OptionsData_Antidote clone() =>
      RoomRefersh_Options_OptionsData_Antidote()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_OptionsData_Antidote copyWith(
          void Function(RoomRefersh_Options_OptionsData_Antidote) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_Options_OptionsData_Antidote))
          as RoomRefersh_Options_OptionsData_Antidote; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_OptionsData_Antidote create() =>
      RoomRefersh_Options_OptionsData_Antidote._();
  RoomRefersh_Options_OptionsData_Antidote createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Options_OptionsData_Antidote>
      createRepeated() =>
          $pb.PbList<RoomRefersh_Options_OptionsData_Antidote>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_OptionsData_Antidote getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_Options_OptionsData_Antidote>(create);
  static RoomRefersh_Options_OptionsData_Antidote? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get hasAntidote => $_getBF(0);
  @$pb.TagNumber(1)
  set hasAntidote($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHasAntidote() => $_has(0);
  @$pb.TagNumber(1)
  void clearHasAntidote() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get killTarget => $_getIZ(1);
  @$pb.TagNumber(2)
  set killTarget($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasKillTarget() => $_has(1);
  @$pb.TagNumber(2)
  void clearKillTarget() => clearField(2);
}

class RoomRefersh_Options_OptionsData_User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Options.OptionsData.User',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hat_level',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_Options_OptionsData_User._() : super();
  factory RoomRefersh_Options_OptionsData_User({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? hatLevel,
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
    if (hatLevel != null) {
      _result.hatLevel = hatLevel;
    }
    return _result;
  }
  factory RoomRefersh_Options_OptionsData_User.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Options_OptionsData_User.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_OptionsData_User clone() =>
      RoomRefersh_Options_OptionsData_User()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_OptionsData_User copyWith(
          void Function(RoomRefersh_Options_OptionsData_User) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_Options_OptionsData_User))
          as RoomRefersh_Options_OptionsData_User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_OptionsData_User create() =>
      RoomRefersh_Options_OptionsData_User._();
  RoomRefersh_Options_OptionsData_User createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Options_OptionsData_User> createRepeated() =>
      $pb.PbList<RoomRefersh_Options_OptionsData_User>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_OptionsData_User getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_Options_OptionsData_User>(create);
  static RoomRefersh_Options_OptionsData_User? _defaultInstance;

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
  $core.int get hatLevel => $_getIZ(3);
  @$pb.TagNumber(4)
  set hatLevel($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHatLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearHatLevel() => clearField(4);
}

class RoomRefersh_Options_OptionsData_SeerArray extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Options.OptionsData.SeerArray',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..pc<RoomRefersh_Options_OptionsData_Seer>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'seer',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_Options_OptionsData_Seer.create)
    ..hasRequiredFields = false;

  RoomRefersh_Options_OptionsData_SeerArray._() : super();
  factory RoomRefersh_Options_OptionsData_SeerArray({
    $core.Iterable<RoomRefersh_Options_OptionsData_Seer>? seer,
  }) {
    final _result = create();
    if (seer != null) {
      _result.seer.addAll(seer);
    }
    return _result;
  }
  factory RoomRefersh_Options_OptionsData_SeerArray.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Options_OptionsData_SeerArray.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_OptionsData_SeerArray clone() =>
      RoomRefersh_Options_OptionsData_SeerArray()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_OptionsData_SeerArray copyWith(
          void Function(RoomRefersh_Options_OptionsData_SeerArray) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_Options_OptionsData_SeerArray))
          as RoomRefersh_Options_OptionsData_SeerArray; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_OptionsData_SeerArray create() =>
      RoomRefersh_Options_OptionsData_SeerArray._();
  RoomRefersh_Options_OptionsData_SeerArray createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Options_OptionsData_SeerArray>
      createRepeated() =>
          $pb.PbList<RoomRefersh_Options_OptionsData_SeerArray>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_OptionsData_SeerArray getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_Options_OptionsData_SeerArray>(create);
  static RoomRefersh_Options_OptionsData_SeerArray? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RoomRefersh_Options_OptionsData_Seer> get seer => $_getList(0);
}

class RoomRefersh_Options_OptionsData_Seer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Options.OptionsData.Seer',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'origin')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'target')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'antidoteTarget',
        protoName: 'antidoteTarget')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poison_target')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guard_target')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'voteTarget',
        protoName: 'voteTarget')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'count')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deadCount',
        protoName: 'deadCount')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isDead',
        protoName: 'isDead')
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deadPub',
        protoName: 'deadPub')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isDesc',
        protoName: 'isDesc')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lastwords_type')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'voteDead',
        protoName: 'voteDead')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'killDead',
        protoName: 'killDead')
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_ready')
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gun_dead')
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poison_dead')
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'explode_dead')
    ..aOS(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_police_join')
    ..aOS(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_police')
    ..aOS(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'start_time')
    ..hasRequiredFields = false;

  RoomRefersh_Options_OptionsData_Seer._() : super();
  factory RoomRefersh_Options_OptionsData_Seer({
    $core.String? id,
    $core.String? rid,
    $core.String? position,
    $core.String? origin,
    $core.String? role,
    $core.String? price,
    $core.String? target,
    $core.String? antidoteTarget,
    $core.String? poisonTarget,
    $core.String? guardTarget,
    $core.String? voteTarget,
    $core.String? count,
    $core.String? deadCount,
    $core.String? isDead,
    $core.String? deadPub,
    $core.String? isDesc,
    $core.String? lastwordsType,
    $core.String? voteDead,
    $core.String? killDead,
    $core.String? isReady,
    $core.String? gunDead,
    $core.String? poisonDead,
    $core.String? explodeDead,
    $core.String? isPoliceJoin,
    $core.String? isPolice,
    $core.String? startTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (position != null) {
      _result.position = position;
    }
    if (origin != null) {
      _result.origin = origin;
    }
    if (role != null) {
      _result.role = role;
    }
    if (price != null) {
      _result.price = price;
    }
    if (target != null) {
      _result.target = target;
    }
    if (antidoteTarget != null) {
      _result.antidoteTarget = antidoteTarget;
    }
    if (poisonTarget != null) {
      _result.poisonTarget = poisonTarget;
    }
    if (guardTarget != null) {
      _result.guardTarget = guardTarget;
    }
    if (voteTarget != null) {
      _result.voteTarget = voteTarget;
    }
    if (count != null) {
      _result.count = count;
    }
    if (deadCount != null) {
      _result.deadCount = deadCount;
    }
    if (isDead != null) {
      _result.isDead = isDead;
    }
    if (deadPub != null) {
      _result.deadPub = deadPub;
    }
    if (isDesc != null) {
      _result.isDesc = isDesc;
    }
    if (lastwordsType != null) {
      _result.lastwordsType = lastwordsType;
    }
    if (voteDead != null) {
      _result.voteDead = voteDead;
    }
    if (killDead != null) {
      _result.killDead = killDead;
    }
    if (isReady != null) {
      _result.isReady = isReady;
    }
    if (gunDead != null) {
      _result.gunDead = gunDead;
    }
    if (poisonDead != null) {
      _result.poisonDead = poisonDead;
    }
    if (explodeDead != null) {
      _result.explodeDead = explodeDead;
    }
    if (isPoliceJoin != null) {
      _result.isPoliceJoin = isPoliceJoin;
    }
    if (isPolice != null) {
      _result.isPolice = isPolice;
    }
    if (startTime != null) {
      _result.startTime = startTime;
    }
    return _result;
  }
  factory RoomRefersh_Options_OptionsData_Seer.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Options_OptionsData_Seer.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_OptionsData_Seer clone() =>
      RoomRefersh_Options_OptionsData_Seer()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_OptionsData_Seer copyWith(
          void Function(RoomRefersh_Options_OptionsData_Seer) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_Options_OptionsData_Seer))
          as RoomRefersh_Options_OptionsData_Seer; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_OptionsData_Seer create() =>
      RoomRefersh_Options_OptionsData_Seer._();
  RoomRefersh_Options_OptionsData_Seer createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Options_OptionsData_Seer> createRepeated() =>
      $pb.PbList<RoomRefersh_Options_OptionsData_Seer>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_OptionsData_Seer getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_Options_OptionsData_Seer>(create);
  static RoomRefersh_Options_OptionsData_Seer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get rid => $_getSZ(1);
  @$pb.TagNumber(2)
  set rid($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get position => $_getSZ(2);
  @$pb.TagNumber(3)
  set position($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearPosition() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get origin => $_getSZ(3);
  @$pb.TagNumber(4)
  set origin($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOrigin() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrigin() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get role => $_getSZ(4);
  @$pb.TagNumber(5)
  set role($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRole() => $_has(4);
  @$pb.TagNumber(5)
  void clearRole() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get price => $_getSZ(5);
  @$pb.TagNumber(6)
  set price($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPrice() => $_has(5);
  @$pb.TagNumber(6)
  void clearPrice() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get target => $_getSZ(6);
  @$pb.TagNumber(7)
  set target($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTarget() => $_has(6);
  @$pb.TagNumber(7)
  void clearTarget() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get antidoteTarget => $_getSZ(7);
  @$pb.TagNumber(8)
  set antidoteTarget($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasAntidoteTarget() => $_has(7);
  @$pb.TagNumber(8)
  void clearAntidoteTarget() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get poisonTarget => $_getSZ(8);
  @$pb.TagNumber(9)
  set poisonTarget($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPoisonTarget() => $_has(8);
  @$pb.TagNumber(9)
  void clearPoisonTarget() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get guardTarget => $_getSZ(9);
  @$pb.TagNumber(10)
  set guardTarget($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasGuardTarget() => $_has(9);
  @$pb.TagNumber(10)
  void clearGuardTarget() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get voteTarget => $_getSZ(10);
  @$pb.TagNumber(11)
  set voteTarget($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasVoteTarget() => $_has(10);
  @$pb.TagNumber(11)
  void clearVoteTarget() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get count => $_getSZ(11);
  @$pb.TagNumber(12)
  set count($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasCount() => $_has(11);
  @$pb.TagNumber(12)
  void clearCount() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get deadCount => $_getSZ(12);
  @$pb.TagNumber(13)
  set deadCount($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasDeadCount() => $_has(12);
  @$pb.TagNumber(13)
  void clearDeadCount() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get isDead => $_getSZ(13);
  @$pb.TagNumber(14)
  set isDead($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasIsDead() => $_has(13);
  @$pb.TagNumber(14)
  void clearIsDead() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get deadPub => $_getSZ(14);
  @$pb.TagNumber(15)
  set deadPub($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasDeadPub() => $_has(14);
  @$pb.TagNumber(15)
  void clearDeadPub() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get isDesc => $_getSZ(15);
  @$pb.TagNumber(16)
  set isDesc($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasIsDesc() => $_has(15);
  @$pb.TagNumber(16)
  void clearIsDesc() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get lastwordsType => $_getSZ(16);
  @$pb.TagNumber(17)
  set lastwordsType($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasLastwordsType() => $_has(16);
  @$pb.TagNumber(17)
  void clearLastwordsType() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get voteDead => $_getSZ(17);
  @$pb.TagNumber(18)
  set voteDead($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasVoteDead() => $_has(17);
  @$pb.TagNumber(18)
  void clearVoteDead() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get killDead => $_getSZ(18);
  @$pb.TagNumber(19)
  set killDead($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasKillDead() => $_has(18);
  @$pb.TagNumber(19)
  void clearKillDead() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get isReady => $_getSZ(19);
  @$pb.TagNumber(20)
  set isReady($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasIsReady() => $_has(19);
  @$pb.TagNumber(20)
  void clearIsReady() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get gunDead => $_getSZ(20);
  @$pb.TagNumber(21)
  set gunDead($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasGunDead() => $_has(20);
  @$pb.TagNumber(21)
  void clearGunDead() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get poisonDead => $_getSZ(21);
  @$pb.TagNumber(22)
  set poisonDead($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasPoisonDead() => $_has(21);
  @$pb.TagNumber(22)
  void clearPoisonDead() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get explodeDead => $_getSZ(22);
  @$pb.TagNumber(23)
  set explodeDead($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasExplodeDead() => $_has(22);
  @$pb.TagNumber(23)
  void clearExplodeDead() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get isPoliceJoin => $_getSZ(23);
  @$pb.TagNumber(24)
  set isPoliceJoin($core.String v) {
    $_setString(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasIsPoliceJoin() => $_has(23);
  @$pb.TagNumber(24)
  void clearIsPoliceJoin() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get isPolice => $_getSZ(24);
  @$pb.TagNumber(25)
  set isPolice($core.String v) {
    $_setString(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasIsPolice() => $_has(24);
  @$pb.TagNumber(25)
  void clearIsPolice() => clearField(25);

  @$pb.TagNumber(26)
  $core.String get startTime => $_getSZ(25);
  @$pb.TagNumber(26)
  set startTime($core.String v) {
    $_setString(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasStartTime() => $_has(25);
  @$pb.TagNumber(26)
  void clearStartTime() => clearField(26);
}

class RoomRefersh_Options_OptionsData_DeadList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Options.OptionsData.DeadList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
            : 'role')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deadCount',
        protoName: 'deadCount')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deadPub',
        protoName: 'deadPub')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'voteDead',
        protoName: 'voteDead')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'killDead',
        protoName: 'killDead')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gunDead',
        protoName: 'gunDead')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poisonDead',
        protoName: 'poisonDead')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isPolice',
        protoName: 'isPolice')
    ..hasRequiredFields = false;

  RoomRefersh_Options_OptionsData_DeadList._() : super();
  factory RoomRefersh_Options_OptionsData_DeadList({
    $core.String? uid,
    $core.String? role,
    $core.String? position,
    $core.String? deadCount,
    $core.String? deadPub,
    $core.String? voteDead,
    $core.String? killDead,
    $core.String? gunDead,
    $core.String? poisonDead,
    $core.String? isPolice,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (role != null) {
      _result.role = role;
    }
    if (position != null) {
      _result.position = position;
    }
    if (deadCount != null) {
      _result.deadCount = deadCount;
    }
    if (deadPub != null) {
      _result.deadPub = deadPub;
    }
    if (voteDead != null) {
      _result.voteDead = voteDead;
    }
    if (killDead != null) {
      _result.killDead = killDead;
    }
    if (gunDead != null) {
      _result.gunDead = gunDead;
    }
    if (poisonDead != null) {
      _result.poisonDead = poisonDead;
    }
    if (isPolice != null) {
      _result.isPolice = isPolice;
    }
    return _result;
  }
  factory RoomRefersh_Options_OptionsData_DeadList.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Options_OptionsData_DeadList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_OptionsData_DeadList clone() =>
      RoomRefersh_Options_OptionsData_DeadList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_OptionsData_DeadList copyWith(
          void Function(RoomRefersh_Options_OptionsData_DeadList) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_Options_OptionsData_DeadList))
          as RoomRefersh_Options_OptionsData_DeadList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_OptionsData_DeadList create() =>
      RoomRefersh_Options_OptionsData_DeadList._();
  RoomRefersh_Options_OptionsData_DeadList createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Options_OptionsData_DeadList>
      createRepeated() =>
          $pb.PbList<RoomRefersh_Options_OptionsData_DeadList>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_OptionsData_DeadList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_Options_OptionsData_DeadList>(create);
  static RoomRefersh_Options_OptionsData_DeadList? _defaultInstance;

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
  $core.String get role => $_getSZ(1);
  @$pb.TagNumber(2)
  set role($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get position => $_getSZ(2);
  @$pb.TagNumber(3)
  set position($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearPosition() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get deadCount => $_getSZ(3);
  @$pb.TagNumber(4)
  set deadCount($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDeadCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeadCount() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get deadPub => $_getSZ(4);
  @$pb.TagNumber(5)
  set deadPub($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDeadPub() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeadPub() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get voteDead => $_getSZ(5);
  @$pb.TagNumber(6)
  set voteDead($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasVoteDead() => $_has(5);
  @$pb.TagNumber(6)
  void clearVoteDead() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get killDead => $_getSZ(6);
  @$pb.TagNumber(7)
  set killDead($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasKillDead() => $_has(6);
  @$pb.TagNumber(7)
  void clearKillDead() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get gunDead => $_getSZ(7);
  @$pb.TagNumber(8)
  set gunDead($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasGunDead() => $_has(7);
  @$pb.TagNumber(8)
  void clearGunDead() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get poisonDead => $_getSZ(8);
  @$pb.TagNumber(9)
  set poisonDead($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPoisonDead() => $_has(8);
  @$pb.TagNumber(9)
  void clearPoisonDead() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get isPolice => $_getSZ(9);
  @$pb.TagNumber(10)
  set isPolice($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasIsPolice() => $_has(9);
  @$pb.TagNumber(10)
  void clearIsPolice() => clearField(10);
}

class RoomRefersh_Options_OptionsData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Options.OptionsData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOM<RoomRefersh_Options_OptionsData_Antidote>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'antidote',
        subBuilder: RoomRefersh_Options_OptionsData_Antidote.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'main_con_win')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'compete_con_win')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOM<RoomRefersh_Options_OptionsData_User>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user_a',
        subBuilder: RoomRefersh_Options_OptionsData_User.create)
    ..aOM<RoomRefersh_Options_OptionsData_User>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user_b',
        subBuilder: RoomRefersh_Options_OptionsData_User.create)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'package',
        $pb.PbFieldType.OU3)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rname')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'word')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sub_word')
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'webp_start',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'webp_end',
        $pb.PbFieldType.OU3)
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'webp_url')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num_word')
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_ready',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..m<$core.String, $core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'oneStates',
        protoName: 'oneStates',
        entryClassName: 'RoomRefersh.Options.OptionsData.OneStatesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OU3,
        packageName: const $pb.PackageName('room.refersh'))
    ..m<$core.String, $core.int>(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'readStates',
        protoName: 'readStates',
        entryClassName: 'RoomRefersh.Options.OptionsData.ReadStatesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OU3,
        packageName: const $pb.PackageName('room.refersh'))
    ..a<$core.int>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cate_id',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'turns',
        $pb.PbFieldType.OU3)
    ..aOS(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..a<$core.int>(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..aOS(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'origin')
    ..aOS(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'thumbs_up')
    ..aOS(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'start_time')
    ..aOS(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'change_word_price',
        $pb.PbFieldType.OU3)
    ..aOS(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'change_word_price_type')
    ..pc<RoomRefersh_Options_OptionsData_Scene>(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'scene',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_Options_OptionsData_Scene.create)
    ..a<$core.int>(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_public',
        $pb.PbFieldType.OU3)
    ..aOM<$0.Value>(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'populace',
        subBuilder: $0.Value.create)
    ..aOM<$0.Value>(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'under',
        subBuilder: $0.Value.create)
    ..aOM<$0.Value>(
        38,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pos',
        subBuilder: $0.Value.create)
    ..aOS(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'contributor_name')
    ..aOM<$0.Value>(
        40,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: $0.Value.create)
    ..a<$core.int>(
        41,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vvc',
        $pb.PbFieldType.OU3)
    ..aOS(
        42,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOM<$0.Value>(
        43,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'votes',
        subBuilder: $0.Value.create)
    ..pc<RoomRefersh_Options_OptionsData_DeadList>(
        44,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deadList',
        $pb.PbFieldType.PM,
        protoName: 'deadList',
        subBuilder: RoomRefersh_Options_OptionsData_DeadList.create)
    ..aOB(
        45,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasLastWords',
        protoName: 'hasLastWords')
    ..a<$core.int>(
        46,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'killTarget',
        $pb.PbFieldType.OU3,
        protoName: 'killTarget')
    ..a<$core.int>(
        47,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'follow',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        48,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'clueId',
        $pb.PbFieldType.OU3,
        protoName: 'clueId')
    ..aOM<RoomRefersh_Options_OptionsData_Poison>(
        49,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poison',
        subBuilder: RoomRefersh_Options_OptionsData_Poison.create)
    ..pPS(
        50,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pkPosition',
        protoName: 'pkPosition')
    ..aOS(
        51,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'killPosition',
        protoName: 'killPosition')
    ..aOS(
        52,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..a<$core.int>(
        53,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vrid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        54,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inviter_uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        55,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inviter_name')
    ..hasRequiredFields = false;

  RoomRefersh_Options_OptionsData._() : super();
  factory RoomRefersh_Options_OptionsData({
    RoomRefersh_Options_OptionsData_Antidote? antidote,
    $core.String? mainConWin,
    $core.String? competeConWin,
    $core.String? msg,
    $core.String? name,
    $core.int? rid,
    RoomRefersh_Options_OptionsData_User? userA,
    RoomRefersh_Options_OptionsData_User? userB,
    $core.int? level,
    $core.int? dateline,
    $core.int? package,
    $core.String? rname,
    $core.String? word,
    $core.String? subWord,
    $core.int? webpStart,
    $core.int? webpEnd,
    $core.String? webpUrl,
    $core.String? numWord,
    $core.int? position,
    $core.int? isReady,
    $core.int? uid,
    $core.Map<$core.String, $core.int>? oneStates,
    $core.Map<$core.String, $core.int>? readStates,
    $core.int? cateId,
    $core.int? turns,
    $core.String? image,
    $core.int? score,
    $core.String? origin,
    $core.String? thumbsUp,
    $core.String? startTime,
    $core.String? icon,
    $core.int? changeWordPrice,
    $core.String? changeWordPriceType,
    $core.Iterable<RoomRefersh_Options_OptionsData_Scene>? scene,
    $core.int? isPublic,
    $0.Value? populace,
    $0.Value? under,
    $0.Value? pos,
    $core.String? contributorName,
    $0.Value? data,
    $core.int? vvc,
    $core.String? success,
    $0.Value? votes,
    $core.Iterable<RoomRefersh_Options_OptionsData_DeadList>? deadList,
    $core.bool? hasLastWords,
    $core.int? killTarget,
    $core.int? follow,
    $core.int? clueId,
    RoomRefersh_Options_OptionsData_Poison? poison,
    $core.Iterable<$core.String>? pkPosition,
    $core.String? killPosition,
    $core.String? type,
    $core.int? vrid,
    $core.int? inviterUid,
    $core.String? inviterName,
  }) {
    final _result = create();
    if (antidote != null) {
      _result.antidote = antidote;
    }
    if (mainConWin != null) {
      _result.mainConWin = mainConWin;
    }
    if (competeConWin != null) {
      _result.competeConWin = competeConWin;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (name != null) {
      _result.name = name;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (userA != null) {
      _result.userA = userA;
    }
    if (userB != null) {
      _result.userB = userB;
    }
    if (level != null) {
      _result.level = level;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (package != null) {
      _result.package = package;
    }
    if (rname != null) {
      _result.rname = rname;
    }
    if (word != null) {
      _result.word = word;
    }
    if (subWord != null) {
      _result.subWord = subWord;
    }
    if (webpStart != null) {
      _result.webpStart = webpStart;
    }
    if (webpEnd != null) {
      _result.webpEnd = webpEnd;
    }
    if (webpUrl != null) {
      _result.webpUrl = webpUrl;
    }
    if (numWord != null) {
      _result.numWord = numWord;
    }
    if (position != null) {
      _result.position = position;
    }
    if (isReady != null) {
      _result.isReady = isReady;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (oneStates != null) {
      _result.oneStates.addAll(oneStates);
    }
    if (readStates != null) {
      _result.readStates.addAll(readStates);
    }
    if (cateId != null) {
      _result.cateId = cateId;
    }
    if (turns != null) {
      _result.turns = turns;
    }
    if (image != null) {
      _result.image = image;
    }
    if (score != null) {
      _result.score = score;
    }
    if (origin != null) {
      _result.origin = origin;
    }
    if (thumbsUp != null) {
      _result.thumbsUp = thumbsUp;
    }
    if (startTime != null) {
      _result.startTime = startTime;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (changeWordPrice != null) {
      _result.changeWordPrice = changeWordPrice;
    }
    if (changeWordPriceType != null) {
      _result.changeWordPriceType = changeWordPriceType;
    }
    if (scene != null) {
      _result.scene.addAll(scene);
    }
    if (isPublic != null) {
      _result.isPublic = isPublic;
    }
    if (populace != null) {
      _result.populace = populace;
    }
    if (under != null) {
      _result.under = under;
    }
    if (pos != null) {
      _result.pos = pos;
    }
    if (contributorName != null) {
      _result.contributorName = contributorName;
    }
    if (data != null) {
      _result.data = data;
    }
    if (vvc != null) {
      _result.vvc = vvc;
    }
    if (success != null) {
      _result.success = success;
    }
    if (votes != null) {
      _result.votes = votes;
    }
    if (deadList != null) {
      _result.deadList.addAll(deadList);
    }
    if (hasLastWords != null) {
      _result.hasLastWords = hasLastWords;
    }
    if (killTarget != null) {
      _result.killTarget = killTarget;
    }
    if (follow != null) {
      _result.follow = follow;
    }
    if (clueId != null) {
      _result.clueId = clueId;
    }
    if (poison != null) {
      _result.poison = poison;
    }
    if (pkPosition != null) {
      _result.pkPosition.addAll(pkPosition);
    }
    if (killPosition != null) {
      _result.killPosition = killPosition;
    }
    if (type != null) {
      _result.type = type;
    }
    if (vrid != null) {
      _result.vrid = vrid;
    }
    if (inviterUid != null) {
      _result.inviterUid = inviterUid;
    }
    if (inviterName != null) {
      _result.inviterName = inviterName;
    }
    return _result;
  }
  factory RoomRefersh_Options_OptionsData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Options_OptionsData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_OptionsData clone() =>
      RoomRefersh_Options_OptionsData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_OptionsData copyWith(
          void Function(RoomRefersh_Options_OptionsData) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_Options_OptionsData))
          as RoomRefersh_Options_OptionsData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_OptionsData create() =>
      RoomRefersh_Options_OptionsData._();
  RoomRefersh_Options_OptionsData createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Options_OptionsData> createRepeated() =>
      $pb.PbList<RoomRefersh_Options_OptionsData>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_OptionsData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Options_OptionsData>(
          create);
  static RoomRefersh_Options_OptionsData? _defaultInstance;

  @$pb.TagNumber(1)
  RoomRefersh_Options_OptionsData_Antidote get antidote => $_getN(0);
  @$pb.TagNumber(1)
  set antidote(RoomRefersh_Options_OptionsData_Antidote v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAntidote() => $_has(0);
  @$pb.TagNumber(1)
  void clearAntidote() => clearField(1);
  @$pb.TagNumber(1)
  RoomRefersh_Options_OptionsData_Antidote ensureAntidote() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get mainConWin => $_getSZ(1);
  @$pb.TagNumber(2)
  set mainConWin($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMainConWin() => $_has(1);
  @$pb.TagNumber(2)
  void clearMainConWin() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get competeConWin => $_getSZ(2);
  @$pb.TagNumber(3)
  set competeConWin($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCompeteConWin() => $_has(2);
  @$pb.TagNumber(3)
  void clearCompeteConWin() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get msg => $_getSZ(3);
  @$pb.TagNumber(4)
  set msg($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMsg() => $_has(3);
  @$pb.TagNumber(4)
  void clearMsg() => clearField(4);

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

  @$pb.TagNumber(6)
  $core.int get rid => $_getIZ(5);
  @$pb.TagNumber(6)
  set rid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRid() => $_has(5);
  @$pb.TagNumber(6)
  void clearRid() => clearField(6);

  @$pb.TagNumber(7)
  RoomRefersh_Options_OptionsData_User get userA => $_getN(6);
  @$pb.TagNumber(7)
  set userA(RoomRefersh_Options_OptionsData_User v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUserA() => $_has(6);
  @$pb.TagNumber(7)
  void clearUserA() => clearField(7);
  @$pb.TagNumber(7)
  RoomRefersh_Options_OptionsData_User ensureUserA() => $_ensure(6);

  @$pb.TagNumber(8)
  RoomRefersh_Options_OptionsData_User get userB => $_getN(7);
  @$pb.TagNumber(8)
  set userB(RoomRefersh_Options_OptionsData_User v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasUserB() => $_has(7);
  @$pb.TagNumber(8)
  void clearUserB() => clearField(8);
  @$pb.TagNumber(8)
  RoomRefersh_Options_OptionsData_User ensureUserB() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.int get level => $_getIZ(8);
  @$pb.TagNumber(9)
  set level($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasLevel() => $_has(8);
  @$pb.TagNumber(9)
  void clearLevel() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get dateline => $_getIZ(9);
  @$pb.TagNumber(10)
  set dateline($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasDateline() => $_has(9);
  @$pb.TagNumber(10)
  void clearDateline() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get package => $_getIZ(10);
  @$pb.TagNumber(11)
  set package($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasPackage() => $_has(10);
  @$pb.TagNumber(11)
  void clearPackage() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get rname => $_getSZ(11);
  @$pb.TagNumber(12)
  set rname($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasRname() => $_has(11);
  @$pb.TagNumber(12)
  void clearRname() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get word => $_getSZ(12);
  @$pb.TagNumber(13)
  set word($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasWord() => $_has(12);
  @$pb.TagNumber(13)
  void clearWord() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get subWord => $_getSZ(13);
  @$pb.TagNumber(14)
  set subWord($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasSubWord() => $_has(13);
  @$pb.TagNumber(14)
  void clearSubWord() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get webpStart => $_getIZ(14);
  @$pb.TagNumber(15)
  set webpStart($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasWebpStart() => $_has(14);
  @$pb.TagNumber(15)
  void clearWebpStart() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get webpEnd => $_getIZ(15);
  @$pb.TagNumber(16)
  set webpEnd($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasWebpEnd() => $_has(15);
  @$pb.TagNumber(16)
  void clearWebpEnd() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get webpUrl => $_getSZ(16);
  @$pb.TagNumber(17)
  set webpUrl($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasWebpUrl() => $_has(16);
  @$pb.TagNumber(17)
  void clearWebpUrl() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get numWord => $_getSZ(17);
  @$pb.TagNumber(18)
  set numWord($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasNumWord() => $_has(17);
  @$pb.TagNumber(18)
  void clearNumWord() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get position => $_getIZ(18);
  @$pb.TagNumber(19)
  set position($core.int v) {
    $_setSignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasPosition() => $_has(18);
  @$pb.TagNumber(19)
  void clearPosition() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get isReady => $_getIZ(19);
  @$pb.TagNumber(20)
  set isReady($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasIsReady() => $_has(19);
  @$pb.TagNumber(20)
  void clearIsReady() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get uid => $_getIZ(20);
  @$pb.TagNumber(21)
  set uid($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasUid() => $_has(20);
  @$pb.TagNumber(21)
  void clearUid() => clearField(21);

  @$pb.TagNumber(22)
  $core.Map<$core.String, $core.int> get oneStates => $_getMap(21);

  @$pb.TagNumber(23)
  $core.Map<$core.String, $core.int> get readStates => $_getMap(22);

  @$pb.TagNumber(24)
  $core.int get cateId => $_getIZ(23);
  @$pb.TagNumber(24)
  set cateId($core.int v) {
    $_setUnsignedInt32(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasCateId() => $_has(23);
  @$pb.TagNumber(24)
  void clearCateId() => clearField(24);

  @$pb.TagNumber(25)
  $core.int get turns => $_getIZ(24);
  @$pb.TagNumber(25)
  set turns($core.int v) {
    $_setUnsignedInt32(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasTurns() => $_has(24);
  @$pb.TagNumber(25)
  void clearTurns() => clearField(25);

  @$pb.TagNumber(26)
  $core.String get image => $_getSZ(25);
  @$pb.TagNumber(26)
  set image($core.String v) {
    $_setString(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasImage() => $_has(25);
  @$pb.TagNumber(26)
  void clearImage() => clearField(26);

  @$pb.TagNumber(27)
  $core.int get score => $_getIZ(26);
  @$pb.TagNumber(27)
  set score($core.int v) {
    $_setUnsignedInt32(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasScore() => $_has(26);
  @$pb.TagNumber(27)
  void clearScore() => clearField(27);

  @$pb.TagNumber(28)
  $core.String get origin => $_getSZ(27);
  @$pb.TagNumber(28)
  set origin($core.String v) {
    $_setString(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasOrigin() => $_has(27);
  @$pb.TagNumber(28)
  void clearOrigin() => clearField(28);

  @$pb.TagNumber(29)
  $core.String get thumbsUp => $_getSZ(28);
  @$pb.TagNumber(29)
  set thumbsUp($core.String v) {
    $_setString(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasThumbsUp() => $_has(28);
  @$pb.TagNumber(29)
  void clearThumbsUp() => clearField(29);

  @$pb.TagNumber(30)
  $core.String get startTime => $_getSZ(29);
  @$pb.TagNumber(30)
  set startTime($core.String v) {
    $_setString(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasStartTime() => $_has(29);
  @$pb.TagNumber(30)
  void clearStartTime() => clearField(30);

  @$pb.TagNumber(31)
  $core.String get icon => $_getSZ(30);
  @$pb.TagNumber(31)
  set icon($core.String v) {
    $_setString(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasIcon() => $_has(30);
  @$pb.TagNumber(31)
  void clearIcon() => clearField(31);

  @$pb.TagNumber(32)
  $core.int get changeWordPrice => $_getIZ(31);
  @$pb.TagNumber(32)
  set changeWordPrice($core.int v) {
    $_setUnsignedInt32(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasChangeWordPrice() => $_has(31);
  @$pb.TagNumber(32)
  void clearChangeWordPrice() => clearField(32);

  @$pb.TagNumber(33)
  $core.String get changeWordPriceType => $_getSZ(32);
  @$pb.TagNumber(33)
  set changeWordPriceType($core.String v) {
    $_setString(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasChangeWordPriceType() => $_has(32);
  @$pb.TagNumber(33)
  void clearChangeWordPriceType() => clearField(33);

  @$pb.TagNumber(34)
  $core.List<RoomRefersh_Options_OptionsData_Scene> get scene => $_getList(33);

  @$pb.TagNumber(35)
  $core.int get isPublic => $_getIZ(34);
  @$pb.TagNumber(35)
  set isPublic($core.int v) {
    $_setUnsignedInt32(34, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasIsPublic() => $_has(34);
  @$pb.TagNumber(35)
  void clearIsPublic() => clearField(35);

  @$pb.TagNumber(36)
  $0.Value get populace => $_getN(35);
  @$pb.TagNumber(36)
  set populace($0.Value v) {
    setField(36, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasPopulace() => $_has(35);
  @$pb.TagNumber(36)
  void clearPopulace() => clearField(36);
  @$pb.TagNumber(36)
  $0.Value ensurePopulace() => $_ensure(35);

  @$pb.TagNumber(37)
  $0.Value get under => $_getN(36);
  @$pb.TagNumber(37)
  set under($0.Value v) {
    setField(37, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasUnder() => $_has(36);
  @$pb.TagNumber(37)
  void clearUnder() => clearField(37);
  @$pb.TagNumber(37)
  $0.Value ensureUnder() => $_ensure(36);

  @$pb.TagNumber(38)
  $0.Value get pos => $_getN(37);
  @$pb.TagNumber(38)
  set pos($0.Value v) {
    setField(38, v);
  }

  @$pb.TagNumber(38)
  $core.bool hasPos() => $_has(37);
  @$pb.TagNumber(38)
  void clearPos() => clearField(38);
  @$pb.TagNumber(38)
  $0.Value ensurePos() => $_ensure(37);

  @$pb.TagNumber(39)
  $core.String get contributorName => $_getSZ(38);
  @$pb.TagNumber(39)
  set contributorName($core.String v) {
    $_setString(38, v);
  }

  @$pb.TagNumber(39)
  $core.bool hasContributorName() => $_has(38);
  @$pb.TagNumber(39)
  void clearContributorName() => clearField(39);

  @$pb.TagNumber(40)
  $0.Value get data => $_getN(39);
  @$pb.TagNumber(40)
  set data($0.Value v) {
    setField(40, v);
  }

  @$pb.TagNumber(40)
  $core.bool hasData() => $_has(39);
  @$pb.TagNumber(40)
  void clearData() => clearField(40);
  @$pb.TagNumber(40)
  $0.Value ensureData() => $_ensure(39);

  @$pb.TagNumber(41)
  $core.int get vvc => $_getIZ(40);
  @$pb.TagNumber(41)
  set vvc($core.int v) {
    $_setUnsignedInt32(40, v);
  }

  @$pb.TagNumber(41)
  $core.bool hasVvc() => $_has(40);
  @$pb.TagNumber(41)
  void clearVvc() => clearField(41);

  @$pb.TagNumber(42)
  $core.String get success => $_getSZ(41);
  @$pb.TagNumber(42)
  set success($core.String v) {
    $_setString(41, v);
  }

  @$pb.TagNumber(42)
  $core.bool hasSuccess() => $_has(41);
  @$pb.TagNumber(42)
  void clearSuccess() => clearField(42);

  @$pb.TagNumber(43)
  $0.Value get votes => $_getN(42);
  @$pb.TagNumber(43)
  set votes($0.Value v) {
    setField(43, v);
  }

  @$pb.TagNumber(43)
  $core.bool hasVotes() => $_has(42);
  @$pb.TagNumber(43)
  void clearVotes() => clearField(43);
  @$pb.TagNumber(43)
  $0.Value ensureVotes() => $_ensure(42);

  @$pb.TagNumber(44)
  $core.List<RoomRefersh_Options_OptionsData_DeadList> get deadList =>
      $_getList(43);

  @$pb.TagNumber(45)
  $core.bool get hasLastWords => $_getBF(44);
  @$pb.TagNumber(45)
  set hasLastWords($core.bool v) {
    $_setBool(44, v);
  }

  @$pb.TagNumber(45)
  $core.bool hasHasLastWords() => $_has(44);
  @$pb.TagNumber(45)
  void clearHasLastWords() => clearField(45);

  @$pb.TagNumber(46)
  $core.int get killTarget => $_getIZ(45);
  @$pb.TagNumber(46)
  set killTarget($core.int v) {
    $_setUnsignedInt32(45, v);
  }

  @$pb.TagNumber(46)
  $core.bool hasKillTarget() => $_has(45);
  @$pb.TagNumber(46)
  void clearKillTarget() => clearField(46);

  @$pb.TagNumber(47)
  $core.int get follow => $_getIZ(46);
  @$pb.TagNumber(47)
  set follow($core.int v) {
    $_setUnsignedInt32(46, v);
  }

  @$pb.TagNumber(47)
  $core.bool hasFollow() => $_has(46);
  @$pb.TagNumber(47)
  void clearFollow() => clearField(47);

  @$pb.TagNumber(48)
  $core.int get clueId => $_getIZ(47);
  @$pb.TagNumber(48)
  set clueId($core.int v) {
    $_setUnsignedInt32(47, v);
  }

  @$pb.TagNumber(48)
  $core.bool hasClueId() => $_has(47);
  @$pb.TagNumber(48)
  void clearClueId() => clearField(48);

  @$pb.TagNumber(49)
  RoomRefersh_Options_OptionsData_Poison get poison => $_getN(48);
  @$pb.TagNumber(49)
  set poison(RoomRefersh_Options_OptionsData_Poison v) {
    setField(49, v);
  }

  @$pb.TagNumber(49)
  $core.bool hasPoison() => $_has(48);
  @$pb.TagNumber(49)
  void clearPoison() => clearField(49);
  @$pb.TagNumber(49)
  RoomRefersh_Options_OptionsData_Poison ensurePoison() => $_ensure(48);

  @$pb.TagNumber(50)
  $core.List<$core.String> get pkPosition => $_getList(49);

  @$pb.TagNumber(51)
  $core.String get killPosition => $_getSZ(50);
  @$pb.TagNumber(51)
  set killPosition($core.String v) {
    $_setString(50, v);
  }

  @$pb.TagNumber(51)
  $core.bool hasKillPosition() => $_has(50);
  @$pb.TagNumber(51)
  void clearKillPosition() => clearField(51);

  @$pb.TagNumber(52)
  $core.String get type => $_getSZ(51);
  @$pb.TagNumber(52)
  set type($core.String v) {
    $_setString(51, v);
  }

  @$pb.TagNumber(52)
  $core.bool hasType() => $_has(51);
  @$pb.TagNumber(52)
  void clearType() => clearField(52);

  @$pb.TagNumber(53)
  $core.int get vrid => $_getIZ(52);
  @$pb.TagNumber(53)
  set vrid($core.int v) {
    $_setUnsignedInt32(52, v);
  }

  @$pb.TagNumber(53)
  $core.bool hasVrid() => $_has(52);
  @$pb.TagNumber(53)
  void clearVrid() => clearField(53);

  @$pb.TagNumber(54)
  $core.int get inviterUid => $_getIZ(53);
  @$pb.TagNumber(54)
  set inviterUid($core.int v) {
    $_setUnsignedInt32(53, v);
  }

  @$pb.TagNumber(54)
  $core.bool hasInviterUid() => $_has(53);
  @$pb.TagNumber(54)
  void clearInviterUid() => clearField(54);

  @$pb.TagNumber(55)
  $core.String get inviterName => $_getSZ(54);
  @$pb.TagNumber(55)
  set inviterName($core.String v) {
    $_setString(54, v);
  }

  @$pb.TagNumber(55)
  $core.bool hasInviterName() => $_has(54);
  @$pb.TagNumber(55)
  void clearInviterName() => clearField(55);
}

class RoomRefersh_Options_DefendInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Options.DefendInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defend_uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defend_level',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defend_level_name')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'upgrade',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_Options_DefendInfo._() : super();
  factory RoomRefersh_Options_DefendInfo({
    $core.int? uid,
    $core.int? defendUid,
    $core.String? title,
    $core.int? position,
    $core.int? defendLevel,
    $core.String? defendLevelName,
    $core.int? upgrade,
    $core.int? category,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (defendUid != null) {
      _result.defendUid = defendUid;
    }
    if (title != null) {
      _result.title = title;
    }
    if (position != null) {
      _result.position = position;
    }
    if (defendLevel != null) {
      _result.defendLevel = defendLevel;
    }
    if (defendLevelName != null) {
      _result.defendLevelName = defendLevelName;
    }
    if (upgrade != null) {
      _result.upgrade = upgrade;
    }
    if (category != null) {
      _result.category = category;
    }
    return _result;
  }
  factory RoomRefersh_Options_DefendInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Options_DefendInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_DefendInfo clone() =>
      RoomRefersh_Options_DefendInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_DefendInfo copyWith(
          void Function(RoomRefersh_Options_DefendInfo) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_Options_DefendInfo))
          as RoomRefersh_Options_DefendInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_DefendInfo create() =>
      RoomRefersh_Options_DefendInfo._();
  RoomRefersh_Options_DefendInfo createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Options_DefendInfo> createRepeated() =>
      $pb.PbList<RoomRefersh_Options_DefendInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_DefendInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Options_DefendInfo>(create);
  static RoomRefersh_Options_DefendInfo? _defaultInstance;

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
  $core.int get defendUid => $_getIZ(1);
  @$pb.TagNumber(2)
  set defendUid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDefendUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearDefendUid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get position => $_getIZ(3);
  @$pb.TagNumber(4)
  set position($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPosition() => $_has(3);
  @$pb.TagNumber(4)
  void clearPosition() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get defendLevel => $_getIZ(4);
  @$pb.TagNumber(5)
  set defendLevel($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDefendLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearDefendLevel() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get defendLevelName => $_getSZ(5);
  @$pb.TagNumber(6)
  set defendLevelName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDefendLevelName() => $_has(5);
  @$pb.TagNumber(6)
  void clearDefendLevelName() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get upgrade => $_getIZ(6);
  @$pb.TagNumber(7)
  set upgrade($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUpgrade() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpgrade() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get category => $_getIZ(7);
  @$pb.TagNumber(8)
  set category($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasCategory() => $_has(7);
  @$pb.TagNumber(8)
  void clearCategory() => clearField(8);
}

class RoomRefersh_Options_MarryInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Options.MarryInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'marry_from_uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ring_img')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'line_img')
    ..hasRequiredFields = false;

  RoomRefersh_Options_MarryInfo._() : super();
  factory RoomRefersh_Options_MarryInfo({
    $core.int? uid,
    $core.int? marryFromUid,
    $core.String? ringImg,
    $core.String? lineImg,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (marryFromUid != null) {
      _result.marryFromUid = marryFromUid;
    }
    if (ringImg != null) {
      _result.ringImg = ringImg;
    }
    if (lineImg != null) {
      _result.lineImg = lineImg;
    }
    return _result;
  }
  factory RoomRefersh_Options_MarryInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Options_MarryInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_MarryInfo clone() =>
      RoomRefersh_Options_MarryInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options_MarryInfo copyWith(
          void Function(RoomRefersh_Options_MarryInfo) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_Options_MarryInfo))
          as RoomRefersh_Options_MarryInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_MarryInfo create() =>
      RoomRefersh_Options_MarryInfo._();
  RoomRefersh_Options_MarryInfo createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Options_MarryInfo> createRepeated() =>
      $pb.PbList<RoomRefersh_Options_MarryInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options_MarryInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Options_MarryInfo>(create);
  static RoomRefersh_Options_MarryInfo? _defaultInstance;

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
  $core.int get marryFromUid => $_getIZ(1);
  @$pb.TagNumber(2)
  set marryFromUid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMarryFromUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearMarryFromUid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get ringImg => $_getSZ(2);
  @$pb.TagNumber(3)
  set ringImg($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRingImg() => $_has(2);
  @$pb.TagNumber(3)
  void clearRingImg() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get lineImg => $_getSZ(3);
  @$pb.TagNumber(4)
  set lineImg($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLineImg() => $_has(3);
  @$pb.TagNumber(4)
  void clearLineImg() => clearField(4);
}

class RoomRefersh_Options extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Options',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'op')
    ..aOM<$0.Value>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        subBuilder: $0.Value.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOM<$0.Value>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value',
        subBuilder: $0.Value.create)
    ..p<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'close_mic_uids',
        $pb.PbFieldType.PU3)
    ..aOM<$0.Value>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: $0.Value.create)
    ..pc<RoomRefersh_Options_DefendInfo>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defend_info',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_Options_DefendInfo.create)
    ..pc<RoomRefersh_Options_MarryInfo>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'marry_info',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_Options_MarryInfo.create)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'turns')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'size',
        $pb.PbFieldType.OU3)
    ..pc<RoomRefersh_Options_User>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'users',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_Options_User.create)
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'auction_duration')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'auction_name')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success_img')
    ..aOM<$0.Value>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'live_uid',
        subBuilder: $0.Value.create)
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'refresh_follow',
        $pb.PbFieldType.OU3)
    ..p<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'positions',
        $pb.PbFieldType.PU3)
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'text')
    ..a<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'op_uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOM<$0.ListValue>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uids',
        subBuilder: $0.ListValue.create)
    ..a<$core.int>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'scene',
        $pb.PbFieldType.OU3)
    ..aOM<RoomRefersh_Options_Camp>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'camp',
        subBuilder: RoomRefersh_Options_Camp.create)
    ..aOS(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'win')
    ..a<$core.int>(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ouid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_Options._() : super();
  factory RoomRefersh_Options({
    $core.String? op,
    $0.Value? uid,
    $core.String? type,
    $0.Value? value,
    $core.Iterable<$core.int>? closeMicUids,
    $0.Value? data,
    $core.Iterable<RoomRefersh_Options_DefendInfo>? defendInfo,
    $core.Iterable<RoomRefersh_Options_MarryInfo>? marryInfo,
    $core.String? message,
    $core.String? turns,
    $core.String? status,
    $core.String? url,
    $core.int? size,
    $core.Iterable<RoomRefersh_Options_User>? users,
    $core.String? auctionDuration,
    $core.String? auctionName,
    $core.String? successImg,
    $0.Value? liveUid,
    $core.int? refreshFollow,
    $core.Iterable<$core.int>? positions,
    $core.String? text,
    $core.int? opUid,
    $core.int? rid,
    $0.ListValue? uids,
    $core.int? scene,
    RoomRefersh_Options_Camp? camp,
    $core.String? win,
    $core.int? ouid,
  }) {
    final _result = create();
    if (op != null) {
      _result.op = op;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (type != null) {
      _result.type = type;
    }
    if (value != null) {
      _result.value = value;
    }
    if (closeMicUids != null) {
      _result.closeMicUids.addAll(closeMicUids);
    }
    if (data != null) {
      _result.data = data;
    }
    if (defendInfo != null) {
      _result.defendInfo.addAll(defendInfo);
    }
    if (marryInfo != null) {
      _result.marryInfo.addAll(marryInfo);
    }
    if (message != null) {
      _result.message = message;
    }
    if (turns != null) {
      _result.turns = turns;
    }
    if (status != null) {
      _result.status = status;
    }
    if (url != null) {
      _result.url = url;
    }
    if (size != null) {
      _result.size = size;
    }
    if (users != null) {
      _result.users.addAll(users);
    }
    if (auctionDuration != null) {
      _result.auctionDuration = auctionDuration;
    }
    if (auctionName != null) {
      _result.auctionName = auctionName;
    }
    if (successImg != null) {
      _result.successImg = successImg;
    }
    if (liveUid != null) {
      _result.liveUid = liveUid;
    }
    if (refreshFollow != null) {
      _result.refreshFollow = refreshFollow;
    }
    if (positions != null) {
      _result.positions.addAll(positions);
    }
    if (text != null) {
      _result.text = text;
    }
    if (opUid != null) {
      _result.opUid = opUid;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (uids != null) {
      _result.uids = uids;
    }
    if (scene != null) {
      _result.scene = scene;
    }
    if (camp != null) {
      _result.camp = camp;
    }
    if (win != null) {
      _result.win = win;
    }
    if (ouid != null) {
      _result.ouid = ouid;
    }
    return _result;
  }
  factory RoomRefersh_Options.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Options.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options clone() => RoomRefersh_Options()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Options copyWith(void Function(RoomRefersh_Options) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_Options))
          as RoomRefersh_Options; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options create() => RoomRefersh_Options._();
  RoomRefersh_Options createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Options> createRepeated() =>
      $pb.PbList<RoomRefersh_Options>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Options getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Options>(create);
  static RoomRefersh_Options? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get op => $_getSZ(0);
  @$pb.TagNumber(1)
  set op($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOp() => $_has(0);
  @$pb.TagNumber(1)
  void clearOp() => clearField(1);

  @$pb.TagNumber(2)
  $0.Value get uid => $_getN(1);
  @$pb.TagNumber(2)
  set uid($0.Value v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);
  @$pb.TagNumber(2)
  $0.Value ensureUid() => $_ensure(1);

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
  $0.Value get value => $_getN(3);
  @$pb.TagNumber(4)
  set value($0.Value v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearValue() => clearField(4);
  @$pb.TagNumber(4)
  $0.Value ensureValue() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.List<$core.int> get closeMicUids => $_getList(4);

  @$pb.TagNumber(6)
  $0.Value get data => $_getN(5);
  @$pb.TagNumber(6)
  set data($0.Value v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasData() => $_has(5);
  @$pb.TagNumber(6)
  void clearData() => clearField(6);
  @$pb.TagNumber(6)
  $0.Value ensureData() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.List<RoomRefersh_Options_DefendInfo> get defendInfo => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<RoomRefersh_Options_MarryInfo> get marryInfo => $_getList(7);

  @$pb.TagNumber(9)
  $core.String get message => $_getSZ(8);
  @$pb.TagNumber(9)
  set message($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasMessage() => $_has(8);
  @$pb.TagNumber(9)
  void clearMessage() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get turns => $_getSZ(9);
  @$pb.TagNumber(10)
  set turns($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTurns() => $_has(9);
  @$pb.TagNumber(10)
  void clearTurns() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get status => $_getSZ(10);
  @$pb.TagNumber(11)
  set status($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearStatus() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get url => $_getSZ(11);
  @$pb.TagNumber(12)
  set url($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasUrl() => $_has(11);
  @$pb.TagNumber(12)
  void clearUrl() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get size => $_getIZ(12);
  @$pb.TagNumber(13)
  set size($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasSize() => $_has(12);
  @$pb.TagNumber(13)
  void clearSize() => clearField(13);

  @$pb.TagNumber(14)
  $core.List<RoomRefersh_Options_User> get users => $_getList(13);

  @$pb.TagNumber(15)
  $core.String get auctionDuration => $_getSZ(14);
  @$pb.TagNumber(15)
  set auctionDuration($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasAuctionDuration() => $_has(14);
  @$pb.TagNumber(15)
  void clearAuctionDuration() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get auctionName => $_getSZ(15);
  @$pb.TagNumber(16)
  set auctionName($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasAuctionName() => $_has(15);
  @$pb.TagNumber(16)
  void clearAuctionName() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get successImg => $_getSZ(16);
  @$pb.TagNumber(17)
  set successImg($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasSuccessImg() => $_has(16);
  @$pb.TagNumber(17)
  void clearSuccessImg() => clearField(17);

  @$pb.TagNumber(18)
  $0.Value get liveUid => $_getN(17);
  @$pb.TagNumber(18)
  set liveUid($0.Value v) {
    setField(18, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasLiveUid() => $_has(17);
  @$pb.TagNumber(18)
  void clearLiveUid() => clearField(18);
  @$pb.TagNumber(18)
  $0.Value ensureLiveUid() => $_ensure(17);

  @$pb.TagNumber(19)
  $core.int get refreshFollow => $_getIZ(18);
  @$pb.TagNumber(19)
  set refreshFollow($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasRefreshFollow() => $_has(18);
  @$pb.TagNumber(19)
  void clearRefreshFollow() => clearField(19);

  @$pb.TagNumber(20)
  $core.List<$core.int> get positions => $_getList(19);

  @$pb.TagNumber(21)
  $core.String get text => $_getSZ(20);
  @$pb.TagNumber(21)
  set text($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasText() => $_has(20);
  @$pb.TagNumber(21)
  void clearText() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get opUid => $_getIZ(21);
  @$pb.TagNumber(22)
  set opUid($core.int v) {
    $_setUnsignedInt32(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasOpUid() => $_has(21);
  @$pb.TagNumber(22)
  void clearOpUid() => clearField(22);

  @$pb.TagNumber(23)
  $core.int get rid => $_getIZ(22);
  @$pb.TagNumber(23)
  set rid($core.int v) {
    $_setUnsignedInt32(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasRid() => $_has(22);
  @$pb.TagNumber(23)
  void clearRid() => clearField(23);

  @$pb.TagNumber(24)
  $0.ListValue get uids => $_getN(23);
  @$pb.TagNumber(24)
  set uids($0.ListValue v) {
    setField(24, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasUids() => $_has(23);
  @$pb.TagNumber(24)
  void clearUids() => clearField(24);
  @$pb.TagNumber(24)
  $0.ListValue ensureUids() => $_ensure(23);

  @$pb.TagNumber(25)
  $core.int get scene => $_getIZ(24);
  @$pb.TagNumber(25)
  set scene($core.int v) {
    $_setUnsignedInt32(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasScene() => $_has(24);
  @$pb.TagNumber(25)
  void clearScene() => clearField(25);

  @$pb.TagNumber(26)
  RoomRefersh_Options_Camp get camp => $_getN(25);
  @$pb.TagNumber(26)
  set camp(RoomRefersh_Options_Camp v) {
    setField(26, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasCamp() => $_has(25);
  @$pb.TagNumber(26)
  void clearCamp() => clearField(26);
  @$pb.TagNumber(26)
  RoomRefersh_Options_Camp ensureCamp() => $_ensure(25);

  @$pb.TagNumber(27)
  $core.String get win => $_getSZ(26);
  @$pb.TagNumber(27)
  set win($core.String v) {
    $_setString(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasWin() => $_has(26);
  @$pb.TagNumber(27)
  void clearWin() => clearField(27);

  @$pb.TagNumber(28)
  $core.int get ouid => $_getIZ(27);
  @$pb.TagNumber(28)
  set ouid($core.int v) {
    $_setUnsignedInt32(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasOuid() => $_has(27);
  @$pb.TagNumber(28)
  void clearOuid() => clearField(28);
}

class RoomRefersh_Config_UnDataMap extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Config.UnDataMap',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOM<$0.Value>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'populace',
        subBuilder: $0.Value.create)
    ..aOM<$0.Value>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'under',
        subBuilder: $0.Value.create)
    ..aOM<$0.Value>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pos',
        subBuilder: $0.Value.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'contributor_name')
    ..p<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOM<$0.Value>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'votes',
        subBuilder: $0.Value.create)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..hasRequiredFields = false;

  RoomRefersh_Config_UnDataMap._() : super();
  factory RoomRefersh_Config_UnDataMap({
    $0.Value? populace,
    $0.Value? under,
    $0.Value? pos,
    $core.String? contributorName,
    $core.Iterable<$core.int>? data,
    $core.String? success,
    $0.Value? votes,
    $core.String? type,
  }) {
    final _result = create();
    if (populace != null) {
      _result.populace = populace;
    }
    if (under != null) {
      _result.under = under;
    }
    if (pos != null) {
      _result.pos = pos;
    }
    if (contributorName != null) {
      _result.contributorName = contributorName;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    if (success != null) {
      _result.success = success;
    }
    if (votes != null) {
      _result.votes = votes;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory RoomRefersh_Config_UnDataMap.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Config_UnDataMap.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Config_UnDataMap clone() =>
      RoomRefersh_Config_UnDataMap()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Config_UnDataMap copyWith(
          void Function(RoomRefersh_Config_UnDataMap) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_Config_UnDataMap))
          as RoomRefersh_Config_UnDataMap; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Config_UnDataMap create() =>
      RoomRefersh_Config_UnDataMap._();
  RoomRefersh_Config_UnDataMap createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Config_UnDataMap> createRepeated() =>
      $pb.PbList<RoomRefersh_Config_UnDataMap>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Config_UnDataMap getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Config_UnDataMap>(create);
  static RoomRefersh_Config_UnDataMap? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Value get populace => $_getN(0);
  @$pb.TagNumber(1)
  set populace($0.Value v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPopulace() => $_has(0);
  @$pb.TagNumber(1)
  void clearPopulace() => clearField(1);
  @$pb.TagNumber(1)
  $0.Value ensurePopulace() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.Value get under => $_getN(1);
  @$pb.TagNumber(2)
  set under($0.Value v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUnder() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnder() => clearField(2);
  @$pb.TagNumber(2)
  $0.Value ensureUnder() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.Value get pos => $_getN(2);
  @$pb.TagNumber(3)
  set pos($0.Value v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPos() => $_has(2);
  @$pb.TagNumber(3)
  void clearPos() => clearField(3);
  @$pb.TagNumber(3)
  $0.Value ensurePos() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get contributorName => $_getSZ(3);
  @$pb.TagNumber(4)
  set contributorName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasContributorName() => $_has(3);
  @$pb.TagNumber(4)
  void clearContributorName() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get data => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get success => $_getSZ(5);
  @$pb.TagNumber(6)
  set success($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSuccess() => $_has(5);
  @$pb.TagNumber(6)
  void clearSuccess() => clearField(6);

  @$pb.TagNumber(7)
  $0.Value get votes => $_getN(6);
  @$pb.TagNumber(7)
  set votes($0.Value v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasVotes() => $_has(6);
  @$pb.TagNumber(7)
  void clearVotes() => clearField(7);
  @$pb.TagNumber(7)
  $0.Value ensureVotes() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get type => $_getSZ(7);
  @$pb.TagNumber(8)
  set type($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasType() => $_has(7);
  @$pb.TagNumber(8)
  void clearType() => clearField(8);
}

class RoomRefersh_Config extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Config',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'app_id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'auction')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'auto_mic',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'background')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'background_url')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bicon')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boss')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'close_box')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'counter',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleted',
        $pb.PbFieldType.O3)
    ..aOM<$0.Value>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description',
        subBuilder: $0.Value.create)
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description_text')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'display_chat',
        $pb.PbFieldType.OU3)
    ..aOM<$0.Value>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'display_message',
        subBuilder: $0.Value.create)
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'display_rank',
        $pb.PbFieldType.OU3)
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fixed_tag_id')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'game')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift_wish')
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'has_lock',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'have_task',
        $pb.PbFieldType.OU3)
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..aOS(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mode')
    ..aOS(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nine',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'o_duration',
        $pb.PbFieldType.OU3)
    ..aOS(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'o_num')
    ..aOS(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'o_total')
    ..aOS(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'online_admin')
    ..a<$core.int>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'online_num',
        $pb.PbFieldType.OU3)
    ..aOB(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'option_enable')
    ..a<$core.int>(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'package',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'paier',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'password',
        $pb.PbFieldType.OU3)
    ..aOS(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prefix')
    ..aOS(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'property')
    ..aOM<$0.Value>(
        38,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'real',
        subBuilder: $0.Value.create)
    ..a<$core.int>(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'reception',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        40,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOS(
        41,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room_factory_type')
    ..aOS(
        42,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room_module_id')
    ..aOS(
        43,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room_task_type')
    ..aOM<RoomRefersh_RtcExtra>(
        44,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rtc_extra',
        subBuilder: RoomRefersh_RtcExtra.create)
    ..a<$core.int>(
        45,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rtc_type',
        $pb.PbFieldType.OU3)
    ..aOS(
        46,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'settlement_channel')
    ..aOS(
        47,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex')
    ..aOS(
        48,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..aOS(
        49,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'theme')
    ..aOS(
        50,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..pPS(
        51,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type_bg')
    ..aOS(
        52,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type_label')
    ..aOS(
        53,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'types')
    ..aOM<$0.Value>(
        54,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        subBuilder: $0.Value.create)
    ..a<$fixnum.Int64>(
        55,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(
        56,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weight')
    ..aOS(
        57,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'area')
    ..aOS(
        58,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'language')
    ..aOS(
        59,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'entry_limit')
    ..a<$core.int>(
        60,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chat_limit',
        $pb.PbFieldType.OU3)
    ..aOM<RoomRefersh_MateData>(
        61,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mate_data',
        subBuilder: RoomRefersh_MateData.create)
    ..aOS(
        62,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cp_state')
    ..aOM<RoomRefersh_UnionData>(
        63,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'union_data',
        subBuilder: RoomRefersh_UnionData.create)
    ..aOM<RoomRefersh_Accompany>(
        64,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'accompany',
        subBuilder: RoomRefersh_Accompany.create)
    ..aOM<RoomRefersh_AuctionInfo>(
        65,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'auction_info',
        subBuilder: RoomRefersh_AuctionInfo.create)
    ..aOS(
        66,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'background_mp4')
    ..aOM<RoomRefersh_CpNamingInfo>(
        67,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cp_naming_info',
        subBuilder: RoomRefersh_CpNamingInfo.create)
    ..aOM<RoomRefersh_CpSceneInfo>(
        68,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cp_scene_info',
        subBuilder: RoomRefersh_CpSceneInfo.create)
    ..aOM<RoomRefersh_CpLinkInfo>(
        69,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cplink_info',
        subBuilder: RoomRefersh_CpLinkInfo.create)
    ..aOM<RoomRefersh_GrabmicInfo>(
        71,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grabmic_info',
        subBuilder: RoomRefersh_GrabmicInfo.create)
    ..aOS(
        72,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gu_state')
    ..aOM<RoomRefersh_GuessQueueData>(
        73,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guess_queue_data',
        subBuilder: RoomRefersh_GuessQueueData.create)
    ..aOM<RoomRefersh_KtvInfo>(
        74,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ktv_info',
        subBuilder: RoomRefersh_KtvInfo.create)
    ..aOS(
        75,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'live_challenge')
    ..aOM<RoomRefersh_PartyGameInfo>(
        76,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'party_game_info',
        subBuilder: RoomRefersh_PartyGameInfo.create)
    ..aOM<RoomRefersh_PuzzleInfo>(
        77,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'puzzle_info',
        subBuilder: RoomRefersh_PuzzleInfo.create)
    ..aOM<RoomRefersh_RoomGroupPk>(
        78,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room_group_pk',
        subBuilder: RoomRefersh_RoomGroupPk.create)
    ..aOS(
        79,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room_module_type')
    ..aOB(
        80,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_intimate')
    ..aOS(
        81,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'un_state')
    ..aOS(
        82,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_state')
    ..aOM<RoomRefersh_ZegoGameConfig>(
        83,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'zego_game_config',
        subBuilder: RoomRefersh_ZegoGameConfig.create)
    ..aOM<RoomRefersh_LivePkV3>(
        84,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'live_pk_v3',
        subBuilder: RoomRefersh_LivePkV3.create)
    ..a<$core.int>(
        85,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'live_pk_version',
        $pb.PbFieldType.OU3)
    ..aOS(
        86,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'number_mode')
    ..aOS(
        87,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room_background_new_cplink')
    ..a<$core.int>(
        88,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gu_vvc',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        89,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'un_vvc',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        90,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_vvc',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        91,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gu_count',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        92,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'un_count',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        93,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_count',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        94,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gu_strict',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        95,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'un_strict',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        96,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_mode',
        $pb.PbFieldType.OU3)
    ..aOS(
        97,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knight_king_icon')
    ..aOM<$0.Value>(
        98,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knight_king_level',
        subBuilder: $0.Value.create)
    ..aOS(
        99,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knight_king_name')
    ..aOB(
        100,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'has_king_rank')
    ..aOM<RoomRefersh_Live>(
        101,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'live',
        subBuilder: RoomRefersh_Live.create)
    ..a<$core.int>(
        102,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_ispk',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        103,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_start',
        $pb.PbFieldType.O3)
    ..aOS(
        104,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_turns')
    ..a<$core.int>(
        105,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_current',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        106,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_player_num_type',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        107,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_server_version',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        108,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_state_type',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        109,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_can_explode',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        110,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_is_open_card',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        111,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_jump_mic_type',
        $pb.PbFieldType.OU3)
    ..aOM<$0.Value>(
        112,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_dataMap',
        protoName: 'wo_dataMap',
        subBuilder: $0.Value.create)
    ..a<$core.int>(
        113,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gu_current',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        114,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gu_version',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        115,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gu_change_word_price',
        $pb.PbFieldType.OU3)
    ..aOS(
        116,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gu_change_word_price_type')
    ..a<$core.int>(
        117,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'un_ispk',
        $pb.PbFieldType.OU3)
    ..aOM<$0.Value>(
        118,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'un_current',
        subBuilder: $0.Value.create)
    ..aOM<RoomRefersh_Config_UnDataMap>(
        119,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'un_dataMap',
        protoName: 'un_dataMap',
        subBuilder: RoomRefersh_Config_UnDataMap.create)
    ..aOS(
        120,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gu_image')
    ..aOS(
        121,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gu_prompt')
    ..aOS(
        122,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'background_multiframe')
    ..aOS(
        123,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'reception_name')
    ..a<$core.int>(
        124,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extra_mic',
        $pb.PbFieldType.O3)
    ..aOS(
        125,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bless_words')
    ..a<$core.int>(
        127,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hot',
        $pb.PbFieldType.O3)
    ..m<$core.String, $core.String>(
        128,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'background_extra',
        entryClassName: 'RoomRefersh.Config.BackgroundExtraEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('room.refersh'))
    ..hasRequiredFields = false;

  RoomRefersh_Config._() : super();
  factory RoomRefersh_Config({
    $core.String? appId,
    $core.String? auction,
    $core.int? autoMic,
    $core.String? background,
    $core.String? backgroundUrl,
    $core.String? bicon,
    $core.String? boss,
    $core.String? closeBox,
    $core.int? counter,
    $core.int? dateline,
    $core.int? deleted,
    $0.Value? description,
    $core.String? descriptionText,
    $core.int? displayChat,
    $0.Value? displayMessage,
    $core.int? displayRank,
    $core.String? fixedTagId,
    $core.String? game,
    $core.String? giftWish,
    $core.int? hasLock,
    $core.int? haveTask,
    $core.String? icon,
    $core.int? level,
    $core.String? mode,
    $core.String? name,
    $core.int? nine,
    $core.int? oDuration,
    $core.String? oNum,
    $core.String? oTotal,
    $core.String? onlineAdmin,
    $core.int? onlineNum,
    $core.bool? optionEnable,
    $core.int? package,
    $core.int? paier,
    $core.int? password,
    $core.String? prefix,
    $core.String? property,
    $0.Value? real,
    $core.int? reception,
    $core.int? rid,
    $core.String? roomFactoryType,
    $core.String? roomModuleId,
    $core.String? roomTaskType,
    RoomRefersh_RtcExtra? rtcExtra,
    $core.int? rtcType,
    $core.String? settlementChannel,
    $core.String? sex,
    $core.String? state,
    $core.String? theme,
    $core.String? type,
    $core.Iterable<$core.String>? typeBg,
    $core.String? typeLabel,
    $core.String? types,
    $0.Value? uid,
    $fixnum.Int64? version,
    $core.String? weight,
    $core.String? area,
    $core.String? language,
    $core.String? entryLimit,
    $core.int? chatLimit,
    RoomRefersh_MateData? mateData,
    $core.String? cpState,
    RoomRefersh_UnionData? unionData,
    RoomRefersh_Accompany? accompany,
    RoomRefersh_AuctionInfo? auctionInfo,
    $core.String? backgroundMp4,
    RoomRefersh_CpNamingInfo? cpNamingInfo,
    RoomRefersh_CpSceneInfo? cpSceneInfo,
    RoomRefersh_CpLinkInfo? cplinkInfo,
    RoomRefersh_GrabmicInfo? grabmicInfo,
    $core.String? guState,
    RoomRefersh_GuessQueueData? guessQueueData,
    RoomRefersh_KtvInfo? ktvInfo,
    $core.String? liveChallenge,
    RoomRefersh_PartyGameInfo? partyGameInfo,
    RoomRefersh_PuzzleInfo? puzzleInfo,
    RoomRefersh_RoomGroupPk? roomGroupPk,
    $core.String? roomModuleType,
    $core.bool? showIntimate,
    $core.String? unState,
    $core.String? woState,
    RoomRefersh_ZegoGameConfig? zegoGameConfig,
    RoomRefersh_LivePkV3? livePkV3,
    $core.int? livePkVersion,
    $core.String? numberMode,
    $core.String? roomBackgroundNewCplink,
    $core.int? guVvc,
    $core.int? unVvc,
    $core.int? woVvc,
    $core.int? guCount,
    $core.int? unCount,
    $core.int? woCount,
    $core.int? guStrict,
    $core.int? unStrict,
    $core.int? woMode,
    $core.String? knightKingIcon,
    $0.Value? knightKingLevel,
    $core.String? knightKingName,
    $core.bool? hasKingRank,
    RoomRefersh_Live? live,
    $core.int? woIspk,
    $core.int? woStart,
    $core.String? woTurns,
    $core.int? woCurrent,
    $core.int? woPlayerNumType,
    $core.int? woServerVersion,
    $core.int? woStateType,
    $core.int? woCanExplode,
    $core.int? woIsOpenCard,
    $core.int? woJumpMicType,
    $0.Value? woDataMap,
    $core.int? guCurrent,
    $core.int? guVersion,
    $core.int? guChangeWordPrice,
    $core.String? guChangeWordPriceType,
    $core.int? unIspk,
    $0.Value? unCurrent,
    RoomRefersh_Config_UnDataMap? unDataMap,
    $core.String? guImage,
    $core.String? guPrompt,
    $core.String? backgroundMultiframe,
    $core.String? receptionName,
    $core.int? extraMic,
    $core.String? blessWords,
    $core.int? hot,
    $core.Map<$core.String, $core.String>? backgroundExtra,
  }) {
    final _result = create();
    if (appId != null) {
      _result.appId = appId;
    }
    if (auction != null) {
      _result.auction = auction;
    }
    if (autoMic != null) {
      _result.autoMic = autoMic;
    }
    if (background != null) {
      _result.background = background;
    }
    if (backgroundUrl != null) {
      _result.backgroundUrl = backgroundUrl;
    }
    if (bicon != null) {
      _result.bicon = bicon;
    }
    if (boss != null) {
      _result.boss = boss;
    }
    if (closeBox != null) {
      _result.closeBox = closeBox;
    }
    if (counter != null) {
      _result.counter = counter;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (deleted != null) {
      _result.deleted = deleted;
    }
    if (description != null) {
      _result.description = description;
    }
    if (descriptionText != null) {
      _result.descriptionText = descriptionText;
    }
    if (displayChat != null) {
      _result.displayChat = displayChat;
    }
    if (displayMessage != null) {
      _result.displayMessage = displayMessage;
    }
    if (displayRank != null) {
      _result.displayRank = displayRank;
    }
    if (fixedTagId != null) {
      _result.fixedTagId = fixedTagId;
    }
    if (game != null) {
      _result.game = game;
    }
    if (giftWish != null) {
      _result.giftWish = giftWish;
    }
    if (hasLock != null) {
      _result.hasLock = hasLock;
    }
    if (haveTask != null) {
      _result.haveTask = haveTask;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (level != null) {
      _result.level = level;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (name != null) {
      _result.name = name;
    }
    if (nine != null) {
      _result.nine = nine;
    }
    if (oDuration != null) {
      _result.oDuration = oDuration;
    }
    if (oNum != null) {
      _result.oNum = oNum;
    }
    if (oTotal != null) {
      _result.oTotal = oTotal;
    }
    if (onlineAdmin != null) {
      _result.onlineAdmin = onlineAdmin;
    }
    if (onlineNum != null) {
      _result.onlineNum = onlineNum;
    }
    if (optionEnable != null) {
      _result.optionEnable = optionEnable;
    }
    if (package != null) {
      _result.package = package;
    }
    if (paier != null) {
      _result.paier = paier;
    }
    if (password != null) {
      _result.password = password;
    }
    if (prefix != null) {
      _result.prefix = prefix;
    }
    if (property != null) {
      _result.property = property;
    }
    if (real != null) {
      _result.real = real;
    }
    if (reception != null) {
      _result.reception = reception;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (roomFactoryType != null) {
      _result.roomFactoryType = roomFactoryType;
    }
    if (roomModuleId != null) {
      _result.roomModuleId = roomModuleId;
    }
    if (roomTaskType != null) {
      _result.roomTaskType = roomTaskType;
    }
    if (rtcExtra != null) {
      _result.rtcExtra = rtcExtra;
    }
    if (rtcType != null) {
      _result.rtcType = rtcType;
    }
    if (settlementChannel != null) {
      _result.settlementChannel = settlementChannel;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (state != null) {
      _result.state = state;
    }
    if (theme != null) {
      _result.theme = theme;
    }
    if (type != null) {
      _result.type = type;
    }
    if (typeBg != null) {
      _result.typeBg.addAll(typeBg);
    }
    if (typeLabel != null) {
      _result.typeLabel = typeLabel;
    }
    if (types != null) {
      _result.types = types;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (version != null) {
      _result.version = version;
    }
    if (weight != null) {
      _result.weight = weight;
    }
    if (area != null) {
      _result.area = area;
    }
    if (language != null) {
      _result.language = language;
    }
    if (entryLimit != null) {
      _result.entryLimit = entryLimit;
    }
    if (chatLimit != null) {
      _result.chatLimit = chatLimit;
    }
    if (mateData != null) {
      _result.mateData = mateData;
    }
    if (cpState != null) {
      _result.cpState = cpState;
    }
    if (unionData != null) {
      _result.unionData = unionData;
    }
    if (accompany != null) {
      _result.accompany = accompany;
    }
    if (auctionInfo != null) {
      _result.auctionInfo = auctionInfo;
    }
    if (backgroundMp4 != null) {
      _result.backgroundMp4 = backgroundMp4;
    }
    if (cpNamingInfo != null) {
      _result.cpNamingInfo = cpNamingInfo;
    }
    if (cpSceneInfo != null) {
      _result.cpSceneInfo = cpSceneInfo;
    }
    if (cplinkInfo != null) {
      _result.cplinkInfo = cplinkInfo;
    }
    if (grabmicInfo != null) {
      _result.grabmicInfo = grabmicInfo;
    }
    if (guState != null) {
      _result.guState = guState;
    }
    if (guessQueueData != null) {
      _result.guessQueueData = guessQueueData;
    }
    if (ktvInfo != null) {
      _result.ktvInfo = ktvInfo;
    }
    if (liveChallenge != null) {
      _result.liveChallenge = liveChallenge;
    }
    if (partyGameInfo != null) {
      _result.partyGameInfo = partyGameInfo;
    }
    if (puzzleInfo != null) {
      _result.puzzleInfo = puzzleInfo;
    }
    if (roomGroupPk != null) {
      _result.roomGroupPk = roomGroupPk;
    }
    if (roomModuleType != null) {
      _result.roomModuleType = roomModuleType;
    }
    if (showIntimate != null) {
      _result.showIntimate = showIntimate;
    }
    if (unState != null) {
      _result.unState = unState;
    }
    if (woState != null) {
      _result.woState = woState;
    }
    if (zegoGameConfig != null) {
      _result.zegoGameConfig = zegoGameConfig;
    }
    if (livePkV3 != null) {
      _result.livePkV3 = livePkV3;
    }
    if (livePkVersion != null) {
      _result.livePkVersion = livePkVersion;
    }
    if (numberMode != null) {
      _result.numberMode = numberMode;
    }
    if (roomBackgroundNewCplink != null) {
      _result.roomBackgroundNewCplink = roomBackgroundNewCplink;
    }
    if (guVvc != null) {
      _result.guVvc = guVvc;
    }
    if (unVvc != null) {
      _result.unVvc = unVvc;
    }
    if (woVvc != null) {
      _result.woVvc = woVvc;
    }
    if (guCount != null) {
      _result.guCount = guCount;
    }
    if (unCount != null) {
      _result.unCount = unCount;
    }
    if (woCount != null) {
      _result.woCount = woCount;
    }
    if (guStrict != null) {
      _result.guStrict = guStrict;
    }
    if (unStrict != null) {
      _result.unStrict = unStrict;
    }
    if (woMode != null) {
      _result.woMode = woMode;
    }
    if (knightKingIcon != null) {
      _result.knightKingIcon = knightKingIcon;
    }
    if (knightKingLevel != null) {
      _result.knightKingLevel = knightKingLevel;
    }
    if (knightKingName != null) {
      _result.knightKingName = knightKingName;
    }
    if (hasKingRank != null) {
      _result.hasKingRank = hasKingRank;
    }
    if (live != null) {
      _result.live = live;
    }
    if (woIspk != null) {
      _result.woIspk = woIspk;
    }
    if (woStart != null) {
      _result.woStart = woStart;
    }
    if (woTurns != null) {
      _result.woTurns = woTurns;
    }
    if (woCurrent != null) {
      _result.woCurrent = woCurrent;
    }
    if (woPlayerNumType != null) {
      _result.woPlayerNumType = woPlayerNumType;
    }
    if (woServerVersion != null) {
      _result.woServerVersion = woServerVersion;
    }
    if (woStateType != null) {
      _result.woStateType = woStateType;
    }
    if (woCanExplode != null) {
      _result.woCanExplode = woCanExplode;
    }
    if (woIsOpenCard != null) {
      _result.woIsOpenCard = woIsOpenCard;
    }
    if (woJumpMicType != null) {
      _result.woJumpMicType = woJumpMicType;
    }
    if (woDataMap != null) {
      _result.woDataMap = woDataMap;
    }
    if (guCurrent != null) {
      _result.guCurrent = guCurrent;
    }
    if (guVersion != null) {
      _result.guVersion = guVersion;
    }
    if (guChangeWordPrice != null) {
      _result.guChangeWordPrice = guChangeWordPrice;
    }
    if (guChangeWordPriceType != null) {
      _result.guChangeWordPriceType = guChangeWordPriceType;
    }
    if (unIspk != null) {
      _result.unIspk = unIspk;
    }
    if (unCurrent != null) {
      _result.unCurrent = unCurrent;
    }
    if (unDataMap != null) {
      _result.unDataMap = unDataMap;
    }
    if (guImage != null) {
      _result.guImage = guImage;
    }
    if (guPrompt != null) {
      _result.guPrompt = guPrompt;
    }
    if (backgroundMultiframe != null) {
      _result.backgroundMultiframe = backgroundMultiframe;
    }
    if (receptionName != null) {
      _result.receptionName = receptionName;
    }
    if (extraMic != null) {
      _result.extraMic = extraMic;
    }
    if (blessWords != null) {
      _result.blessWords = blessWords;
    }
    if (hot != null) {
      _result.hot = hot;
    }
    if (backgroundExtra != null) {
      _result.backgroundExtra.addAll(backgroundExtra);
    }
    return _result;
  }
  factory RoomRefersh_Config.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Config.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Config clone() => RoomRefersh_Config()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Config copyWith(void Function(RoomRefersh_Config) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_Config))
          as RoomRefersh_Config; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Config create() => RoomRefersh_Config._();
  RoomRefersh_Config createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Config> createRepeated() =>
      $pb.PbList<RoomRefersh_Config>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Config getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Config>(create);
  static RoomRefersh_Config? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get appId => $_getSZ(0);
  @$pb.TagNumber(1)
  set appId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAppId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAppId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get auction => $_getSZ(1);
  @$pb.TagNumber(2)
  set auction($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAuction() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuction() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get autoMic => $_getIZ(2);
  @$pb.TagNumber(3)
  set autoMic($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAutoMic() => $_has(2);
  @$pb.TagNumber(3)
  void clearAutoMic() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get background => $_getSZ(3);
  @$pb.TagNumber(4)
  set background($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBackground() => $_has(3);
  @$pb.TagNumber(4)
  void clearBackground() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get backgroundUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set backgroundUrl($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBackgroundUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearBackgroundUrl() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get bicon => $_getSZ(5);
  @$pb.TagNumber(6)
  set bicon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasBicon() => $_has(5);
  @$pb.TagNumber(6)
  void clearBicon() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get boss => $_getSZ(6);
  @$pb.TagNumber(7)
  set boss($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasBoss() => $_has(6);
  @$pb.TagNumber(7)
  void clearBoss() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get closeBox => $_getSZ(7);
  @$pb.TagNumber(8)
  set closeBox($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasCloseBox() => $_has(7);
  @$pb.TagNumber(8)
  void clearCloseBox() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get counter => $_getIZ(8);
  @$pb.TagNumber(9)
  set counter($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasCounter() => $_has(8);
  @$pb.TagNumber(9)
  void clearCounter() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get dateline => $_getIZ(9);
  @$pb.TagNumber(10)
  set dateline($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasDateline() => $_has(9);
  @$pb.TagNumber(10)
  void clearDateline() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get deleted => $_getIZ(10);
  @$pb.TagNumber(11)
  set deleted($core.int v) {
    $_setSignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasDeleted() => $_has(10);
  @$pb.TagNumber(11)
  void clearDeleted() => clearField(11);

  @$pb.TagNumber(12)
  $0.Value get description => $_getN(11);
  @$pb.TagNumber(12)
  set description($0.Value v) {
    setField(12, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasDescription() => $_has(11);
  @$pb.TagNumber(12)
  void clearDescription() => clearField(12);
  @$pb.TagNumber(12)
  $0.Value ensureDescription() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.String get descriptionText => $_getSZ(12);
  @$pb.TagNumber(13)
  set descriptionText($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasDescriptionText() => $_has(12);
  @$pb.TagNumber(13)
  void clearDescriptionText() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get displayChat => $_getIZ(13);
  @$pb.TagNumber(14)
  set displayChat($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasDisplayChat() => $_has(13);
  @$pb.TagNumber(14)
  void clearDisplayChat() => clearField(14);

  @$pb.TagNumber(15)
  $0.Value get displayMessage => $_getN(14);
  @$pb.TagNumber(15)
  set displayMessage($0.Value v) {
    setField(15, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasDisplayMessage() => $_has(14);
  @$pb.TagNumber(15)
  void clearDisplayMessage() => clearField(15);
  @$pb.TagNumber(15)
  $0.Value ensureDisplayMessage() => $_ensure(14);

  @$pb.TagNumber(16)
  $core.int get displayRank => $_getIZ(15);
  @$pb.TagNumber(16)
  set displayRank($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasDisplayRank() => $_has(15);
  @$pb.TagNumber(16)
  void clearDisplayRank() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get fixedTagId => $_getSZ(16);
  @$pb.TagNumber(17)
  set fixedTagId($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasFixedTagId() => $_has(16);
  @$pb.TagNumber(17)
  void clearFixedTagId() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get game => $_getSZ(17);
  @$pb.TagNumber(18)
  set game($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasGame() => $_has(17);
  @$pb.TagNumber(18)
  void clearGame() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get giftWish => $_getSZ(18);
  @$pb.TagNumber(19)
  set giftWish($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasGiftWish() => $_has(18);
  @$pb.TagNumber(19)
  void clearGiftWish() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get hasLock => $_getIZ(19);
  @$pb.TagNumber(20)
  set hasLock($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasHasLock() => $_has(19);
  @$pb.TagNumber(20)
  void clearHasLock() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get haveTask => $_getIZ(20);
  @$pb.TagNumber(21)
  set haveTask($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasHaveTask() => $_has(20);
  @$pb.TagNumber(21)
  void clearHaveTask() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get icon => $_getSZ(21);
  @$pb.TagNumber(22)
  set icon($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasIcon() => $_has(21);
  @$pb.TagNumber(22)
  void clearIcon() => clearField(22);

  @$pb.TagNumber(23)
  $core.int get level => $_getIZ(22);
  @$pb.TagNumber(23)
  set level($core.int v) {
    $_setUnsignedInt32(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasLevel() => $_has(22);
  @$pb.TagNumber(23)
  void clearLevel() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get mode => $_getSZ(23);
  @$pb.TagNumber(24)
  set mode($core.String v) {
    $_setString(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasMode() => $_has(23);
  @$pb.TagNumber(24)
  void clearMode() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get name => $_getSZ(24);
  @$pb.TagNumber(25)
  set name($core.String v) {
    $_setString(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasName() => $_has(24);
  @$pb.TagNumber(25)
  void clearName() => clearField(25);

  @$pb.TagNumber(26)
  $core.int get nine => $_getIZ(25);
  @$pb.TagNumber(26)
  set nine($core.int v) {
    $_setUnsignedInt32(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasNine() => $_has(25);
  @$pb.TagNumber(26)
  void clearNine() => clearField(26);

  @$pb.TagNumber(27)
  $core.int get oDuration => $_getIZ(26);
  @$pb.TagNumber(27)
  set oDuration($core.int v) {
    $_setUnsignedInt32(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasODuration() => $_has(26);
  @$pb.TagNumber(27)
  void clearODuration() => clearField(27);

  @$pb.TagNumber(28)
  $core.String get oNum => $_getSZ(27);
  @$pb.TagNumber(28)
  set oNum($core.String v) {
    $_setString(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasONum() => $_has(27);
  @$pb.TagNumber(28)
  void clearONum() => clearField(28);

  @$pb.TagNumber(29)
  $core.String get oTotal => $_getSZ(28);
  @$pb.TagNumber(29)
  set oTotal($core.String v) {
    $_setString(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasOTotal() => $_has(28);
  @$pb.TagNumber(29)
  void clearOTotal() => clearField(29);

  @$pb.TagNumber(30)
  $core.String get onlineAdmin => $_getSZ(29);
  @$pb.TagNumber(30)
  set onlineAdmin($core.String v) {
    $_setString(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasOnlineAdmin() => $_has(29);
  @$pb.TagNumber(30)
  void clearOnlineAdmin() => clearField(30);

  @$pb.TagNumber(31)
  $core.int get onlineNum => $_getIZ(30);
  @$pb.TagNumber(31)
  set onlineNum($core.int v) {
    $_setUnsignedInt32(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasOnlineNum() => $_has(30);
  @$pb.TagNumber(31)
  void clearOnlineNum() => clearField(31);

  @$pb.TagNumber(32)
  $core.bool get optionEnable => $_getBF(31);
  @$pb.TagNumber(32)
  set optionEnable($core.bool v) {
    $_setBool(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasOptionEnable() => $_has(31);
  @$pb.TagNumber(32)
  void clearOptionEnable() => clearField(32);

  @$pb.TagNumber(33)
  $core.int get package => $_getIZ(32);
  @$pb.TagNumber(33)
  set package($core.int v) {
    $_setUnsignedInt32(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasPackage() => $_has(32);
  @$pb.TagNumber(33)
  void clearPackage() => clearField(33);

  @$pb.TagNumber(34)
  $core.int get paier => $_getIZ(33);
  @$pb.TagNumber(34)
  set paier($core.int v) {
    $_setUnsignedInt32(33, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasPaier() => $_has(33);
  @$pb.TagNumber(34)
  void clearPaier() => clearField(34);

  @$pb.TagNumber(35)
  $core.int get password => $_getIZ(34);
  @$pb.TagNumber(35)
  set password($core.int v) {
    $_setUnsignedInt32(34, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasPassword() => $_has(34);
  @$pb.TagNumber(35)
  void clearPassword() => clearField(35);

  @$pb.TagNumber(36)
  $core.String get prefix => $_getSZ(35);
  @$pb.TagNumber(36)
  set prefix($core.String v) {
    $_setString(35, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasPrefix() => $_has(35);
  @$pb.TagNumber(36)
  void clearPrefix() => clearField(36);

  @$pb.TagNumber(37)
  $core.String get property => $_getSZ(36);
  @$pb.TagNumber(37)
  set property($core.String v) {
    $_setString(36, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasProperty() => $_has(36);
  @$pb.TagNumber(37)
  void clearProperty() => clearField(37);

  @$pb.TagNumber(38)
  $0.Value get real => $_getN(37);
  @$pb.TagNumber(38)
  set real($0.Value v) {
    setField(38, v);
  }

  @$pb.TagNumber(38)
  $core.bool hasReal() => $_has(37);
  @$pb.TagNumber(38)
  void clearReal() => clearField(38);
  @$pb.TagNumber(38)
  $0.Value ensureReal() => $_ensure(37);

  @$pb.TagNumber(39)
  $core.int get reception => $_getIZ(38);
  @$pb.TagNumber(39)
  set reception($core.int v) {
    $_setUnsignedInt32(38, v);
  }

  @$pb.TagNumber(39)
  $core.bool hasReception() => $_has(38);
  @$pb.TagNumber(39)
  void clearReception() => clearField(39);

  @$pb.TagNumber(40)
  $core.int get rid => $_getIZ(39);
  @$pb.TagNumber(40)
  set rid($core.int v) {
    $_setUnsignedInt32(39, v);
  }

  @$pb.TagNumber(40)
  $core.bool hasRid() => $_has(39);
  @$pb.TagNumber(40)
  void clearRid() => clearField(40);

  @$pb.TagNumber(41)
  $core.String get roomFactoryType => $_getSZ(40);
  @$pb.TagNumber(41)
  set roomFactoryType($core.String v) {
    $_setString(40, v);
  }

  @$pb.TagNumber(41)
  $core.bool hasRoomFactoryType() => $_has(40);
  @$pb.TagNumber(41)
  void clearRoomFactoryType() => clearField(41);

  @$pb.TagNumber(42)
  $core.String get roomModuleId => $_getSZ(41);
  @$pb.TagNumber(42)
  set roomModuleId($core.String v) {
    $_setString(41, v);
  }

  @$pb.TagNumber(42)
  $core.bool hasRoomModuleId() => $_has(41);
  @$pb.TagNumber(42)
  void clearRoomModuleId() => clearField(42);

  @$pb.TagNumber(43)
  $core.String get roomTaskType => $_getSZ(42);
  @$pb.TagNumber(43)
  set roomTaskType($core.String v) {
    $_setString(42, v);
  }

  @$pb.TagNumber(43)
  $core.bool hasRoomTaskType() => $_has(42);
  @$pb.TagNumber(43)
  void clearRoomTaskType() => clearField(43);

  @$pb.TagNumber(44)
  RoomRefersh_RtcExtra get rtcExtra => $_getN(43);
  @$pb.TagNumber(44)
  set rtcExtra(RoomRefersh_RtcExtra v) {
    setField(44, v);
  }

  @$pb.TagNumber(44)
  $core.bool hasRtcExtra() => $_has(43);
  @$pb.TagNumber(44)
  void clearRtcExtra() => clearField(44);
  @$pb.TagNumber(44)
  RoomRefersh_RtcExtra ensureRtcExtra() => $_ensure(43);

  @$pb.TagNumber(45)
  $core.int get rtcType => $_getIZ(44);
  @$pb.TagNumber(45)
  set rtcType($core.int v) {
    $_setUnsignedInt32(44, v);
  }

  @$pb.TagNumber(45)
  $core.bool hasRtcType() => $_has(44);
  @$pb.TagNumber(45)
  void clearRtcType() => clearField(45);

  @$pb.TagNumber(46)
  $core.String get settlementChannel => $_getSZ(45);
  @$pb.TagNumber(46)
  set settlementChannel($core.String v) {
    $_setString(45, v);
  }

  @$pb.TagNumber(46)
  $core.bool hasSettlementChannel() => $_has(45);
  @$pb.TagNumber(46)
  void clearSettlementChannel() => clearField(46);

  @$pb.TagNumber(47)
  $core.String get sex => $_getSZ(46);
  @$pb.TagNumber(47)
  set sex($core.String v) {
    $_setString(46, v);
  }

  @$pb.TagNumber(47)
  $core.bool hasSex() => $_has(46);
  @$pb.TagNumber(47)
  void clearSex() => clearField(47);

  @$pb.TagNumber(48)
  $core.String get state => $_getSZ(47);
  @$pb.TagNumber(48)
  set state($core.String v) {
    $_setString(47, v);
  }

  @$pb.TagNumber(48)
  $core.bool hasState() => $_has(47);
  @$pb.TagNumber(48)
  void clearState() => clearField(48);

  @$pb.TagNumber(49)
  $core.String get theme => $_getSZ(48);
  @$pb.TagNumber(49)
  set theme($core.String v) {
    $_setString(48, v);
  }

  @$pb.TagNumber(49)
  $core.bool hasTheme() => $_has(48);
  @$pb.TagNumber(49)
  void clearTheme() => clearField(49);

  @$pb.TagNumber(50)
  $core.String get type => $_getSZ(49);
  @$pb.TagNumber(50)
  set type($core.String v) {
    $_setString(49, v);
  }

  @$pb.TagNumber(50)
  $core.bool hasType() => $_has(49);
  @$pb.TagNumber(50)
  void clearType() => clearField(50);

  @$pb.TagNumber(51)
  $core.List<$core.String> get typeBg => $_getList(50);

  @$pb.TagNumber(52)
  $core.String get typeLabel => $_getSZ(51);
  @$pb.TagNumber(52)
  set typeLabel($core.String v) {
    $_setString(51, v);
  }

  @$pb.TagNumber(52)
  $core.bool hasTypeLabel() => $_has(51);
  @$pb.TagNumber(52)
  void clearTypeLabel() => clearField(52);

  @$pb.TagNumber(53)
  $core.String get types => $_getSZ(52);
  @$pb.TagNumber(53)
  set types($core.String v) {
    $_setString(52, v);
  }

  @$pb.TagNumber(53)
  $core.bool hasTypes() => $_has(52);
  @$pb.TagNumber(53)
  void clearTypes() => clearField(53);

  @$pb.TagNumber(54)
  $0.Value get uid => $_getN(53);
  @$pb.TagNumber(54)
  set uid($0.Value v) {
    setField(54, v);
  }

  @$pb.TagNumber(54)
  $core.bool hasUid() => $_has(53);
  @$pb.TagNumber(54)
  void clearUid() => clearField(54);
  @$pb.TagNumber(54)
  $0.Value ensureUid() => $_ensure(53);

  @$pb.TagNumber(55)
  $fixnum.Int64 get version => $_getI64(54);
  @$pb.TagNumber(55)
  set version($fixnum.Int64 v) {
    $_setInt64(54, v);
  }

  @$pb.TagNumber(55)
  $core.bool hasVersion() => $_has(54);
  @$pb.TagNumber(55)
  void clearVersion() => clearField(55);

  @$pb.TagNumber(56)
  $core.String get weight => $_getSZ(55);
  @$pb.TagNumber(56)
  set weight($core.String v) {
    $_setString(55, v);
  }

  @$pb.TagNumber(56)
  $core.bool hasWeight() => $_has(55);
  @$pb.TagNumber(56)
  void clearWeight() => clearField(56);

  @$pb.TagNumber(57)
  $core.String get area => $_getSZ(56);
  @$pb.TagNumber(57)
  set area($core.String v) {
    $_setString(56, v);
  }

  @$pb.TagNumber(57)
  $core.bool hasArea() => $_has(56);
  @$pb.TagNumber(57)
  void clearArea() => clearField(57);

  @$pb.TagNumber(58)
  $core.String get language => $_getSZ(57);
  @$pb.TagNumber(58)
  set language($core.String v) {
    $_setString(57, v);
  }

  @$pb.TagNumber(58)
  $core.bool hasLanguage() => $_has(57);
  @$pb.TagNumber(58)
  void clearLanguage() => clearField(58);

  @$pb.TagNumber(59)
  $core.String get entryLimit => $_getSZ(58);
  @$pb.TagNumber(59)
  set entryLimit($core.String v) {
    $_setString(58, v);
  }

  @$pb.TagNumber(59)
  $core.bool hasEntryLimit() => $_has(58);
  @$pb.TagNumber(59)
  void clearEntryLimit() => clearField(59);

  @$pb.TagNumber(60)
  $core.int get chatLimit => $_getIZ(59);
  @$pb.TagNumber(60)
  set chatLimit($core.int v) {
    $_setUnsignedInt32(59, v);
  }

  @$pb.TagNumber(60)
  $core.bool hasChatLimit() => $_has(59);
  @$pb.TagNumber(60)
  void clearChatLimit() => clearField(60);

  @$pb.TagNumber(61)
  RoomRefersh_MateData get mateData => $_getN(60);
  @$pb.TagNumber(61)
  set mateData(RoomRefersh_MateData v) {
    setField(61, v);
  }

  @$pb.TagNumber(61)
  $core.bool hasMateData() => $_has(60);
  @$pb.TagNumber(61)
  void clearMateData() => clearField(61);
  @$pb.TagNumber(61)
  RoomRefersh_MateData ensureMateData() => $_ensure(60);

  @$pb.TagNumber(62)
  $core.String get cpState => $_getSZ(61);
  @$pb.TagNumber(62)
  set cpState($core.String v) {
    $_setString(61, v);
  }

  @$pb.TagNumber(62)
  $core.bool hasCpState() => $_has(61);
  @$pb.TagNumber(62)
  void clearCpState() => clearField(62);

  @$pb.TagNumber(63)
  RoomRefersh_UnionData get unionData => $_getN(62);
  @$pb.TagNumber(63)
  set unionData(RoomRefersh_UnionData v) {
    setField(63, v);
  }

  @$pb.TagNumber(63)
  $core.bool hasUnionData() => $_has(62);
  @$pb.TagNumber(63)
  void clearUnionData() => clearField(63);
  @$pb.TagNumber(63)
  RoomRefersh_UnionData ensureUnionData() => $_ensure(62);

  @$pb.TagNumber(64)
  RoomRefersh_Accompany get accompany => $_getN(63);
  @$pb.TagNumber(64)
  set accompany(RoomRefersh_Accompany v) {
    setField(64, v);
  }

  @$pb.TagNumber(64)
  $core.bool hasAccompany() => $_has(63);
  @$pb.TagNumber(64)
  void clearAccompany() => clearField(64);
  @$pb.TagNumber(64)
  RoomRefersh_Accompany ensureAccompany() => $_ensure(63);

  @$pb.TagNumber(65)
  RoomRefersh_AuctionInfo get auctionInfo => $_getN(64);
  @$pb.TagNumber(65)
  set auctionInfo(RoomRefersh_AuctionInfo v) {
    setField(65, v);
  }

  @$pb.TagNumber(65)
  $core.bool hasAuctionInfo() => $_has(64);
  @$pb.TagNumber(65)
  void clearAuctionInfo() => clearField(65);
  @$pb.TagNumber(65)
  RoomRefersh_AuctionInfo ensureAuctionInfo() => $_ensure(64);

  @$pb.TagNumber(66)
  $core.String get backgroundMp4 => $_getSZ(65);
  @$pb.TagNumber(66)
  set backgroundMp4($core.String v) {
    $_setString(65, v);
  }

  @$pb.TagNumber(66)
  $core.bool hasBackgroundMp4() => $_has(65);
  @$pb.TagNumber(66)
  void clearBackgroundMp4() => clearField(66);

  @$pb.TagNumber(67)
  RoomRefersh_CpNamingInfo get cpNamingInfo => $_getN(66);
  @$pb.TagNumber(67)
  set cpNamingInfo(RoomRefersh_CpNamingInfo v) {
    setField(67, v);
  }

  @$pb.TagNumber(67)
  $core.bool hasCpNamingInfo() => $_has(66);
  @$pb.TagNumber(67)
  void clearCpNamingInfo() => clearField(67);
  @$pb.TagNumber(67)
  RoomRefersh_CpNamingInfo ensureCpNamingInfo() => $_ensure(66);

  @$pb.TagNumber(68)
  RoomRefersh_CpSceneInfo get cpSceneInfo => $_getN(67);
  @$pb.TagNumber(68)
  set cpSceneInfo(RoomRefersh_CpSceneInfo v) {
    setField(68, v);
  }

  @$pb.TagNumber(68)
  $core.bool hasCpSceneInfo() => $_has(67);
  @$pb.TagNumber(68)
  void clearCpSceneInfo() => clearField(68);
  @$pb.TagNumber(68)
  RoomRefersh_CpSceneInfo ensureCpSceneInfo() => $_ensure(67);

  @$pb.TagNumber(69)
  RoomRefersh_CpLinkInfo get cplinkInfo => $_getN(68);
  @$pb.TagNumber(69)
  set cplinkInfo(RoomRefersh_CpLinkInfo v) {
    setField(69, v);
  }

  @$pb.TagNumber(69)
  $core.bool hasCplinkInfo() => $_has(68);
  @$pb.TagNumber(69)
  void clearCplinkInfo() => clearField(69);
  @$pb.TagNumber(69)
  RoomRefersh_CpLinkInfo ensureCplinkInfo() => $_ensure(68);

  @$pb.TagNumber(71)
  RoomRefersh_GrabmicInfo get grabmicInfo => $_getN(69);
  @$pb.TagNumber(71)
  set grabmicInfo(RoomRefersh_GrabmicInfo v) {
    setField(71, v);
  }

  @$pb.TagNumber(71)
  $core.bool hasGrabmicInfo() => $_has(69);
  @$pb.TagNumber(71)
  void clearGrabmicInfo() => clearField(71);
  @$pb.TagNumber(71)
  RoomRefersh_GrabmicInfo ensureGrabmicInfo() => $_ensure(69);

  @$pb.TagNumber(72)
  $core.String get guState => $_getSZ(70);
  @$pb.TagNumber(72)
  set guState($core.String v) {
    $_setString(70, v);
  }

  @$pb.TagNumber(72)
  $core.bool hasGuState() => $_has(70);
  @$pb.TagNumber(72)
  void clearGuState() => clearField(72);

  @$pb.TagNumber(73)
  RoomRefersh_GuessQueueData get guessQueueData => $_getN(71);
  @$pb.TagNumber(73)
  set guessQueueData(RoomRefersh_GuessQueueData v) {
    setField(73, v);
  }

  @$pb.TagNumber(73)
  $core.bool hasGuessQueueData() => $_has(71);
  @$pb.TagNumber(73)
  void clearGuessQueueData() => clearField(73);
  @$pb.TagNumber(73)
  RoomRefersh_GuessQueueData ensureGuessQueueData() => $_ensure(71);

  @$pb.TagNumber(74)
  RoomRefersh_KtvInfo get ktvInfo => $_getN(72);
  @$pb.TagNumber(74)
  set ktvInfo(RoomRefersh_KtvInfo v) {
    setField(74, v);
  }

  @$pb.TagNumber(74)
  $core.bool hasKtvInfo() => $_has(72);
  @$pb.TagNumber(74)
  void clearKtvInfo() => clearField(74);
  @$pb.TagNumber(74)
  RoomRefersh_KtvInfo ensureKtvInfo() => $_ensure(72);

  @$pb.TagNumber(75)
  $core.String get liveChallenge => $_getSZ(73);
  @$pb.TagNumber(75)
  set liveChallenge($core.String v) {
    $_setString(73, v);
  }

  @$pb.TagNumber(75)
  $core.bool hasLiveChallenge() => $_has(73);
  @$pb.TagNumber(75)
  void clearLiveChallenge() => clearField(75);

  @$pb.TagNumber(76)
  RoomRefersh_PartyGameInfo get partyGameInfo => $_getN(74);
  @$pb.TagNumber(76)
  set partyGameInfo(RoomRefersh_PartyGameInfo v) {
    setField(76, v);
  }

  @$pb.TagNumber(76)
  $core.bool hasPartyGameInfo() => $_has(74);
  @$pb.TagNumber(76)
  void clearPartyGameInfo() => clearField(76);
  @$pb.TagNumber(76)
  RoomRefersh_PartyGameInfo ensurePartyGameInfo() => $_ensure(74);

  @$pb.TagNumber(77)
  RoomRefersh_PuzzleInfo get puzzleInfo => $_getN(75);
  @$pb.TagNumber(77)
  set puzzleInfo(RoomRefersh_PuzzleInfo v) {
    setField(77, v);
  }

  @$pb.TagNumber(77)
  $core.bool hasPuzzleInfo() => $_has(75);
  @$pb.TagNumber(77)
  void clearPuzzleInfo() => clearField(77);
  @$pb.TagNumber(77)
  RoomRefersh_PuzzleInfo ensurePuzzleInfo() => $_ensure(75);

  @$pb.TagNumber(78)
  RoomRefersh_RoomGroupPk get roomGroupPk => $_getN(76);
  @$pb.TagNumber(78)
  set roomGroupPk(RoomRefersh_RoomGroupPk v) {
    setField(78, v);
  }

  @$pb.TagNumber(78)
  $core.bool hasRoomGroupPk() => $_has(76);
  @$pb.TagNumber(78)
  void clearRoomGroupPk() => clearField(78);
  @$pb.TagNumber(78)
  RoomRefersh_RoomGroupPk ensureRoomGroupPk() => $_ensure(76);

  @$pb.TagNumber(79)
  $core.String get roomModuleType => $_getSZ(77);
  @$pb.TagNumber(79)
  set roomModuleType($core.String v) {
    $_setString(77, v);
  }

  @$pb.TagNumber(79)
  $core.bool hasRoomModuleType() => $_has(77);
  @$pb.TagNumber(79)
  void clearRoomModuleType() => clearField(79);

  @$pb.TagNumber(80)
  $core.bool get showIntimate => $_getBF(78);
  @$pb.TagNumber(80)
  set showIntimate($core.bool v) {
    $_setBool(78, v);
  }

  @$pb.TagNumber(80)
  $core.bool hasShowIntimate() => $_has(78);
  @$pb.TagNumber(80)
  void clearShowIntimate() => clearField(80);

  @$pb.TagNumber(81)
  $core.String get unState => $_getSZ(79);
  @$pb.TagNumber(81)
  set unState($core.String v) {
    $_setString(79, v);
  }

  @$pb.TagNumber(81)
  $core.bool hasUnState() => $_has(79);
  @$pb.TagNumber(81)
  void clearUnState() => clearField(81);

  @$pb.TagNumber(82)
  $core.String get woState => $_getSZ(80);
  @$pb.TagNumber(82)
  set woState($core.String v) {
    $_setString(80, v);
  }

  @$pb.TagNumber(82)
  $core.bool hasWoState() => $_has(80);
  @$pb.TagNumber(82)
  void clearWoState() => clearField(82);

  @$pb.TagNumber(83)
  RoomRefersh_ZegoGameConfig get zegoGameConfig => $_getN(81);
  @$pb.TagNumber(83)
  set zegoGameConfig(RoomRefersh_ZegoGameConfig v) {
    setField(83, v);
  }

  @$pb.TagNumber(83)
  $core.bool hasZegoGameConfig() => $_has(81);
  @$pb.TagNumber(83)
  void clearZegoGameConfig() => clearField(83);
  @$pb.TagNumber(83)
  RoomRefersh_ZegoGameConfig ensureZegoGameConfig() => $_ensure(81);

  @$pb.TagNumber(84)
  RoomRefersh_LivePkV3 get livePkV3 => $_getN(82);
  @$pb.TagNumber(84)
  set livePkV3(RoomRefersh_LivePkV3 v) {
    setField(84, v);
  }

  @$pb.TagNumber(84)
  $core.bool hasLivePkV3() => $_has(82);
  @$pb.TagNumber(84)
  void clearLivePkV3() => clearField(84);
  @$pb.TagNumber(84)
  RoomRefersh_LivePkV3 ensureLivePkV3() => $_ensure(82);

  @$pb.TagNumber(85)
  $core.int get livePkVersion => $_getIZ(83);
  @$pb.TagNumber(85)
  set livePkVersion($core.int v) {
    $_setUnsignedInt32(83, v);
  }

  @$pb.TagNumber(85)
  $core.bool hasLivePkVersion() => $_has(83);
  @$pb.TagNumber(85)
  void clearLivePkVersion() => clearField(85);

  @$pb.TagNumber(86)
  $core.String get numberMode => $_getSZ(84);
  @$pb.TagNumber(86)
  set numberMode($core.String v) {
    $_setString(84, v);
  }

  @$pb.TagNumber(86)
  $core.bool hasNumberMode() => $_has(84);
  @$pb.TagNumber(86)
  void clearNumberMode() => clearField(86);

  @$pb.TagNumber(87)
  $core.String get roomBackgroundNewCplink => $_getSZ(85);
  @$pb.TagNumber(87)
  set roomBackgroundNewCplink($core.String v) {
    $_setString(85, v);
  }

  @$pb.TagNumber(87)
  $core.bool hasRoomBackgroundNewCplink() => $_has(85);
  @$pb.TagNumber(87)
  void clearRoomBackgroundNewCplink() => clearField(87);

  @$pb.TagNumber(88)
  $core.int get guVvc => $_getIZ(86);
  @$pb.TagNumber(88)
  set guVvc($core.int v) {
    $_setUnsignedInt32(86, v);
  }

  @$pb.TagNumber(88)
  $core.bool hasGuVvc() => $_has(86);
  @$pb.TagNumber(88)
  void clearGuVvc() => clearField(88);

  @$pb.TagNumber(89)
  $core.int get unVvc => $_getIZ(87);
  @$pb.TagNumber(89)
  set unVvc($core.int v) {
    $_setUnsignedInt32(87, v);
  }

  @$pb.TagNumber(89)
  $core.bool hasUnVvc() => $_has(87);
  @$pb.TagNumber(89)
  void clearUnVvc() => clearField(89);

  @$pb.TagNumber(90)
  $core.int get woVvc => $_getIZ(88);
  @$pb.TagNumber(90)
  set woVvc($core.int v) {
    $_setUnsignedInt32(88, v);
  }

  @$pb.TagNumber(90)
  $core.bool hasWoVvc() => $_has(88);
  @$pb.TagNumber(90)
  void clearWoVvc() => clearField(90);

  @$pb.TagNumber(91)
  $core.int get guCount => $_getIZ(89);
  @$pb.TagNumber(91)
  set guCount($core.int v) {
    $_setUnsignedInt32(89, v);
  }

  @$pb.TagNumber(91)
  $core.bool hasGuCount() => $_has(89);
  @$pb.TagNumber(91)
  void clearGuCount() => clearField(91);

  @$pb.TagNumber(92)
  $core.int get unCount => $_getIZ(90);
  @$pb.TagNumber(92)
  set unCount($core.int v) {
    $_setUnsignedInt32(90, v);
  }

  @$pb.TagNumber(92)
  $core.bool hasUnCount() => $_has(90);
  @$pb.TagNumber(92)
  void clearUnCount() => clearField(92);

  @$pb.TagNumber(93)
  $core.int get woCount => $_getIZ(91);
  @$pb.TagNumber(93)
  set woCount($core.int v) {
    $_setUnsignedInt32(91, v);
  }

  @$pb.TagNumber(93)
  $core.bool hasWoCount() => $_has(91);
  @$pb.TagNumber(93)
  void clearWoCount() => clearField(93);

  @$pb.TagNumber(94)
  $core.int get guStrict => $_getIZ(92);
  @$pb.TagNumber(94)
  set guStrict($core.int v) {
    $_setUnsignedInt32(92, v);
  }

  @$pb.TagNumber(94)
  $core.bool hasGuStrict() => $_has(92);
  @$pb.TagNumber(94)
  void clearGuStrict() => clearField(94);

  @$pb.TagNumber(95)
  $core.int get unStrict => $_getIZ(93);
  @$pb.TagNumber(95)
  set unStrict($core.int v) {
    $_setUnsignedInt32(93, v);
  }

  @$pb.TagNumber(95)
  $core.bool hasUnStrict() => $_has(93);
  @$pb.TagNumber(95)
  void clearUnStrict() => clearField(95);

  @$pb.TagNumber(96)
  $core.int get woMode => $_getIZ(94);
  @$pb.TagNumber(96)
  set woMode($core.int v) {
    $_setUnsignedInt32(94, v);
  }

  @$pb.TagNumber(96)
  $core.bool hasWoMode() => $_has(94);
  @$pb.TagNumber(96)
  void clearWoMode() => clearField(96);

  @$pb.TagNumber(97)
  $core.String get knightKingIcon => $_getSZ(95);
  @$pb.TagNumber(97)
  set knightKingIcon($core.String v) {
    $_setString(95, v);
  }

  @$pb.TagNumber(97)
  $core.bool hasKnightKingIcon() => $_has(95);
  @$pb.TagNumber(97)
  void clearKnightKingIcon() => clearField(97);

  @$pb.TagNumber(98)
  $0.Value get knightKingLevel => $_getN(96);
  @$pb.TagNumber(98)
  set knightKingLevel($0.Value v) {
    setField(98, v);
  }

  @$pb.TagNumber(98)
  $core.bool hasKnightKingLevel() => $_has(96);
  @$pb.TagNumber(98)
  void clearKnightKingLevel() => clearField(98);
  @$pb.TagNumber(98)
  $0.Value ensureKnightKingLevel() => $_ensure(96);

  @$pb.TagNumber(99)
  $core.String get knightKingName => $_getSZ(97);
  @$pb.TagNumber(99)
  set knightKingName($core.String v) {
    $_setString(97, v);
  }

  @$pb.TagNumber(99)
  $core.bool hasKnightKingName() => $_has(97);
  @$pb.TagNumber(99)
  void clearKnightKingName() => clearField(99);

  @$pb.TagNumber(100)
  $core.bool get hasKingRank => $_getBF(98);
  @$pb.TagNumber(100)
  set hasKingRank($core.bool v) {
    $_setBool(98, v);
  }

  @$pb.TagNumber(100)
  $core.bool hasHasKingRank() => $_has(98);
  @$pb.TagNumber(100)
  void clearHasKingRank() => clearField(100);

  @$pb.TagNumber(101)
  RoomRefersh_Live get live => $_getN(99);
  @$pb.TagNumber(101)
  set live(RoomRefersh_Live v) {
    setField(101, v);
  }

  @$pb.TagNumber(101)
  $core.bool hasLive() => $_has(99);
  @$pb.TagNumber(101)
  void clearLive() => clearField(101);
  @$pb.TagNumber(101)
  RoomRefersh_Live ensureLive() => $_ensure(99);

  @$pb.TagNumber(102)
  $core.int get woIspk => $_getIZ(100);
  @$pb.TagNumber(102)
  set woIspk($core.int v) {
    $_setUnsignedInt32(100, v);
  }

  @$pb.TagNumber(102)
  $core.bool hasWoIspk() => $_has(100);
  @$pb.TagNumber(102)
  void clearWoIspk() => clearField(102);

  @$pb.TagNumber(103)
  $core.int get woStart => $_getIZ(101);
  @$pb.TagNumber(103)
  set woStart($core.int v) {
    $_setSignedInt32(101, v);
  }

  @$pb.TagNumber(103)
  $core.bool hasWoStart() => $_has(101);
  @$pb.TagNumber(103)
  void clearWoStart() => clearField(103);

  @$pb.TagNumber(104)
  $core.String get woTurns => $_getSZ(102);
  @$pb.TagNumber(104)
  set woTurns($core.String v) {
    $_setString(102, v);
  }

  @$pb.TagNumber(104)
  $core.bool hasWoTurns() => $_has(102);
  @$pb.TagNumber(104)
  void clearWoTurns() => clearField(104);

  @$pb.TagNumber(105)
  $core.int get woCurrent => $_getIZ(103);
  @$pb.TagNumber(105)
  set woCurrent($core.int v) {
    $_setSignedInt32(103, v);
  }

  @$pb.TagNumber(105)
  $core.bool hasWoCurrent() => $_has(103);
  @$pb.TagNumber(105)
  void clearWoCurrent() => clearField(105);

  @$pb.TagNumber(106)
  $core.int get woPlayerNumType => $_getIZ(104);
  @$pb.TagNumber(106)
  set woPlayerNumType($core.int v) {
    $_setUnsignedInt32(104, v);
  }

  @$pb.TagNumber(106)
  $core.bool hasWoPlayerNumType() => $_has(104);
  @$pb.TagNumber(106)
  void clearWoPlayerNumType() => clearField(106);

  @$pb.TagNumber(107)
  $core.int get woServerVersion => $_getIZ(105);
  @$pb.TagNumber(107)
  set woServerVersion($core.int v) {
    $_setUnsignedInt32(105, v);
  }

  @$pb.TagNumber(107)
  $core.bool hasWoServerVersion() => $_has(105);
  @$pb.TagNumber(107)
  void clearWoServerVersion() => clearField(107);

  @$pb.TagNumber(108)
  $core.int get woStateType => $_getIZ(106);
  @$pb.TagNumber(108)
  set woStateType($core.int v) {
    $_setUnsignedInt32(106, v);
  }

  @$pb.TagNumber(108)
  $core.bool hasWoStateType() => $_has(106);
  @$pb.TagNumber(108)
  void clearWoStateType() => clearField(108);

  @$pb.TagNumber(109)
  $core.int get woCanExplode => $_getIZ(107);
  @$pb.TagNumber(109)
  set woCanExplode($core.int v) {
    $_setUnsignedInt32(107, v);
  }

  @$pb.TagNumber(109)
  $core.bool hasWoCanExplode() => $_has(107);
  @$pb.TagNumber(109)
  void clearWoCanExplode() => clearField(109);

  @$pb.TagNumber(110)
  $core.int get woIsOpenCard => $_getIZ(108);
  @$pb.TagNumber(110)
  set woIsOpenCard($core.int v) {
    $_setUnsignedInt32(108, v);
  }

  @$pb.TagNumber(110)
  $core.bool hasWoIsOpenCard() => $_has(108);
  @$pb.TagNumber(110)
  void clearWoIsOpenCard() => clearField(110);

  @$pb.TagNumber(111)
  $core.int get woJumpMicType => $_getIZ(109);
  @$pb.TagNumber(111)
  set woJumpMicType($core.int v) {
    $_setUnsignedInt32(109, v);
  }

  @$pb.TagNumber(111)
  $core.bool hasWoJumpMicType() => $_has(109);
  @$pb.TagNumber(111)
  void clearWoJumpMicType() => clearField(111);

  @$pb.TagNumber(112)
  $0.Value get woDataMap => $_getN(110);
  @$pb.TagNumber(112)
  set woDataMap($0.Value v) {
    setField(112, v);
  }

  @$pb.TagNumber(112)
  $core.bool hasWoDataMap() => $_has(110);
  @$pb.TagNumber(112)
  void clearWoDataMap() => clearField(112);
  @$pb.TagNumber(112)
  $0.Value ensureWoDataMap() => $_ensure(110);

  @$pb.TagNumber(113)
  $core.int get guCurrent => $_getIZ(111);
  @$pb.TagNumber(113)
  set guCurrent($core.int v) {
    $_setSignedInt32(111, v);
  }

  @$pb.TagNumber(113)
  $core.bool hasGuCurrent() => $_has(111);
  @$pb.TagNumber(113)
  void clearGuCurrent() => clearField(113);

  @$pb.TagNumber(114)
  $core.int get guVersion => $_getIZ(112);
  @$pb.TagNumber(114)
  set guVersion($core.int v) {
    $_setUnsignedInt32(112, v);
  }

  @$pb.TagNumber(114)
  $core.bool hasGuVersion() => $_has(112);
  @$pb.TagNumber(114)
  void clearGuVersion() => clearField(114);

  @$pb.TagNumber(115)
  $core.int get guChangeWordPrice => $_getIZ(113);
  @$pb.TagNumber(115)
  set guChangeWordPrice($core.int v) {
    $_setUnsignedInt32(113, v);
  }

  @$pb.TagNumber(115)
  $core.bool hasGuChangeWordPrice() => $_has(113);
  @$pb.TagNumber(115)
  void clearGuChangeWordPrice() => clearField(115);

  @$pb.TagNumber(116)
  $core.String get guChangeWordPriceType => $_getSZ(114);
  @$pb.TagNumber(116)
  set guChangeWordPriceType($core.String v) {
    $_setString(114, v);
  }

  @$pb.TagNumber(116)
  $core.bool hasGuChangeWordPriceType() => $_has(114);
  @$pb.TagNumber(116)
  void clearGuChangeWordPriceType() => clearField(116);

  @$pb.TagNumber(117)
  $core.int get unIspk => $_getIZ(115);
  @$pb.TagNumber(117)
  set unIspk($core.int v) {
    $_setUnsignedInt32(115, v);
  }

  @$pb.TagNumber(117)
  $core.bool hasUnIspk() => $_has(115);
  @$pb.TagNumber(117)
  void clearUnIspk() => clearField(117);

  @$pb.TagNumber(118)
  $0.Value get unCurrent => $_getN(116);
  @$pb.TagNumber(118)
  set unCurrent($0.Value v) {
    setField(118, v);
  }

  @$pb.TagNumber(118)
  $core.bool hasUnCurrent() => $_has(116);
  @$pb.TagNumber(118)
  void clearUnCurrent() => clearField(118);
  @$pb.TagNumber(118)
  $0.Value ensureUnCurrent() => $_ensure(116);

  @$pb.TagNumber(119)
  RoomRefersh_Config_UnDataMap get unDataMap => $_getN(117);
  @$pb.TagNumber(119)
  set unDataMap(RoomRefersh_Config_UnDataMap v) {
    setField(119, v);
  }

  @$pb.TagNumber(119)
  $core.bool hasUnDataMap() => $_has(117);
  @$pb.TagNumber(119)
  void clearUnDataMap() => clearField(119);
  @$pb.TagNumber(119)
  RoomRefersh_Config_UnDataMap ensureUnDataMap() => $_ensure(117);

  @$pb.TagNumber(120)
  $core.String get guImage => $_getSZ(118);
  @$pb.TagNumber(120)
  set guImage($core.String v) {
    $_setString(118, v);
  }

  @$pb.TagNumber(120)
  $core.bool hasGuImage() => $_has(118);
  @$pb.TagNumber(120)
  void clearGuImage() => clearField(120);

  @$pb.TagNumber(121)
  $core.String get guPrompt => $_getSZ(119);
  @$pb.TagNumber(121)
  set guPrompt($core.String v) {
    $_setString(119, v);
  }

  @$pb.TagNumber(121)
  $core.bool hasGuPrompt() => $_has(119);
  @$pb.TagNumber(121)
  void clearGuPrompt() => clearField(121);

  @$pb.TagNumber(122)
  $core.String get backgroundMultiframe => $_getSZ(120);
  @$pb.TagNumber(122)
  set backgroundMultiframe($core.String v) {
    $_setString(120, v);
  }

  @$pb.TagNumber(122)
  $core.bool hasBackgroundMultiframe() => $_has(120);
  @$pb.TagNumber(122)
  void clearBackgroundMultiframe() => clearField(122);

  @$pb.TagNumber(123)
  $core.String get receptionName => $_getSZ(121);
  @$pb.TagNumber(123)
  set receptionName($core.String v) {
    $_setString(121, v);
  }

  @$pb.TagNumber(123)
  $core.bool hasReceptionName() => $_has(121);
  @$pb.TagNumber(123)
  void clearReceptionName() => clearField(123);

  @$pb.TagNumber(124)
  $core.int get extraMic => $_getIZ(122);
  @$pb.TagNumber(124)
  set extraMic($core.int v) {
    $_setSignedInt32(122, v);
  }

  @$pb.TagNumber(124)
  $core.bool hasExtraMic() => $_has(122);
  @$pb.TagNumber(124)
  void clearExtraMic() => clearField(124);

  @$pb.TagNumber(125)
  $core.String get blessWords => $_getSZ(123);
  @$pb.TagNumber(125)
  set blessWords($core.String v) {
    $_setString(123, v);
  }

  @$pb.TagNumber(125)
  $core.bool hasBlessWords() => $_has(123);
  @$pb.TagNumber(125)
  void clearBlessWords() => clearField(125);

  @$pb.TagNumber(127)
  $core.int get hot => $_getIZ(124);
  @$pb.TagNumber(127)
  set hot($core.int v) {
    $_setSignedInt32(124, v);
  }

  @$pb.TagNumber(127)
  $core.bool hasHot() => $_has(124);
  @$pb.TagNumber(127)
  void clearHot() => clearField(127);

  @$pb.TagNumber(128)
  $core.Map<$core.String, $core.String> get backgroundExtra => $_getMap(125);
}

class RoomRefersh_Live extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Live',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fans_label')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'online_num',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_Live._() : super();
  factory RoomRefersh_Live({
    $core.String? fansLabel,
    $core.int? onlineNum,
  }) {
    final _result = create();
    if (fansLabel != null) {
      _result.fansLabel = fansLabel;
    }
    if (onlineNum != null) {
      _result.onlineNum = onlineNum;
    }
    return _result;
  }
  factory RoomRefersh_Live.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Live.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Live clone() => RoomRefersh_Live()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Live copyWith(void Function(RoomRefersh_Live) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_Live))
          as RoomRefersh_Live; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Live create() => RoomRefersh_Live._();
  RoomRefersh_Live createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Live> createRepeated() =>
      $pb.PbList<RoomRefersh_Live>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Live getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Live>(create);
  static RoomRefersh_Live? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fansLabel => $_getSZ(0);
  @$pb.TagNumber(1)
  set fansLabel($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFansLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearFansLabel() => clearField(1);

  @$pb.TagNumber(3)
  $core.int get onlineNum => $_getIZ(1);
  @$pb.TagNumber(3)
  set onlineNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOnlineNum() => $_has(1);
  @$pb.TagNumber(3)
  void clearOnlineNum() => clearField(3);
}

class RoomRefersh_LivePkV3_Base_Main extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.LivePkV3.Base.Main',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
            : 'origin')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mic',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'con_win',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_LivePkV3_Base_Main._() : super();
  factory RoomRefersh_LivePkV3_Base_Main({
    $core.String? uid,
    $core.String? origin,
    $core.String? rid,
    $core.String? name,
    $core.String? icon,
    $core.String? sex,
    $core.int? score,
    $core.int? mic,
    $core.int? conWin,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (origin != null) {
      _result.origin = origin;
    }
    if (rid != null) {
      _result.rid = rid;
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
    if (score != null) {
      _result.score = score;
    }
    if (mic != null) {
      _result.mic = mic;
    }
    if (conWin != null) {
      _result.conWin = conWin;
    }
    return _result;
  }
  factory RoomRefersh_LivePkV3_Base_Main.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_LivePkV3_Base_Main.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_LivePkV3_Base_Main clone() =>
      RoomRefersh_LivePkV3_Base_Main()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_LivePkV3_Base_Main copyWith(
          void Function(RoomRefersh_LivePkV3_Base_Main) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_LivePkV3_Base_Main))
          as RoomRefersh_LivePkV3_Base_Main; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_LivePkV3_Base_Main create() =>
      RoomRefersh_LivePkV3_Base_Main._();
  RoomRefersh_LivePkV3_Base_Main createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_LivePkV3_Base_Main> createRepeated() =>
      $pb.PbList<RoomRefersh_LivePkV3_Base_Main>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_LivePkV3_Base_Main getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_LivePkV3_Base_Main>(create);
  static RoomRefersh_LivePkV3_Base_Main? _defaultInstance;

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
  $core.String get origin => $_getSZ(1);
  @$pb.TagNumber(2)
  set origin($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOrigin() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrigin() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get rid => $_getSZ(2);
  @$pb.TagNumber(3)
  set rid($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRid() => $_has(2);
  @$pb.TagNumber(3)
  void clearRid() => clearField(3);

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
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get sex => $_getSZ(5);
  @$pb.TagNumber(6)
  set sex($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSex() => $_has(5);
  @$pb.TagNumber(6)
  void clearSex() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get score => $_getIZ(6);
  @$pb.TagNumber(7)
  set score($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasScore() => $_has(6);
  @$pb.TagNumber(7)
  void clearScore() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get mic => $_getIZ(7);
  @$pb.TagNumber(8)
  set mic($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasMic() => $_has(7);
  @$pb.TagNumber(8)
  void clearMic() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get conWin => $_getIZ(8);
  @$pb.TagNumber(9)
  set conWin($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasConWin() => $_has(8);
  @$pb.TagNumber(9)
  void clearConWin() => clearField(9);
}

class RoomRefersh_LivePkV3_Base_Compete extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.LivePkV3.Base.Compete',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
            : 'origin')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mic',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'con_win',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_LivePkV3_Base_Compete._() : super();
  factory RoomRefersh_LivePkV3_Base_Compete({
    $core.String? uid,
    $core.String? origin,
    $core.String? rid,
    $core.String? name,
    $core.String? icon,
    $core.String? sex,
    $core.int? score,
    $core.int? mic,
    $core.int? conWin,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (origin != null) {
      _result.origin = origin;
    }
    if (rid != null) {
      _result.rid = rid;
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
    if (score != null) {
      _result.score = score;
    }
    if (mic != null) {
      _result.mic = mic;
    }
    if (conWin != null) {
      _result.conWin = conWin;
    }
    return _result;
  }
  factory RoomRefersh_LivePkV3_Base_Compete.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_LivePkV3_Base_Compete.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_LivePkV3_Base_Compete clone() =>
      RoomRefersh_LivePkV3_Base_Compete()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_LivePkV3_Base_Compete copyWith(
          void Function(RoomRefersh_LivePkV3_Base_Compete) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_LivePkV3_Base_Compete))
          as RoomRefersh_LivePkV3_Base_Compete; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_LivePkV3_Base_Compete create() =>
      RoomRefersh_LivePkV3_Base_Compete._();
  RoomRefersh_LivePkV3_Base_Compete createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_LivePkV3_Base_Compete> createRepeated() =>
      $pb.PbList<RoomRefersh_LivePkV3_Base_Compete>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_LivePkV3_Base_Compete getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_LivePkV3_Base_Compete>(
          create);
  static RoomRefersh_LivePkV3_Base_Compete? _defaultInstance;

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
  $core.String get origin => $_getSZ(1);
  @$pb.TagNumber(2)
  set origin($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOrigin() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrigin() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get rid => $_getSZ(2);
  @$pb.TagNumber(3)
  set rid($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRid() => $_has(2);
  @$pb.TagNumber(3)
  void clearRid() => clearField(3);

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
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get sex => $_getSZ(5);
  @$pb.TagNumber(6)
  set sex($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSex() => $_has(5);
  @$pb.TagNumber(6)
  void clearSex() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get score => $_getIZ(6);
  @$pb.TagNumber(7)
  set score($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasScore() => $_has(6);
  @$pb.TagNumber(7)
  void clearScore() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get mic => $_getIZ(7);
  @$pb.TagNumber(8)
  set mic($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasMic() => $_has(7);
  @$pb.TagNumber(8)
  void clearMic() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get conWin => $_getIZ(8);
  @$pb.TagNumber(9)
  set conWin($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasConWin() => $_has(8);
  @$pb.TagNumber(9)
  void clearConWin() => clearField(9);
}

class RoomRefersh_LivePkV3_Base extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.LivePkV3.Base',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOM<RoomRefersh_LivePkV3_Base_Main>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'main',
        subBuilder: RoomRefersh_LivePkV3_Base_Main.create)
    ..aOM<RoomRefersh_LivePkV3_Base_Compete>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'compete',
        subBuilder: RoomRefersh_LivePkV3_Base_Compete.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pk_id',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..aOM<$0.Value>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'win',
        subBuilder: $0.Value.create)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'punish')
    ..hasRequiredFields = false;

  RoomRefersh_LivePkV3_Base._() : super();
  factory RoomRefersh_LivePkV3_Base({
    RoomRefersh_LivePkV3_Base_Main? main,
    RoomRefersh_LivePkV3_Base_Compete? compete,
    $core.int? pkId,
    $core.String? state,
    $0.Value? win,
    $core.String? punish,
  }) {
    final _result = create();
    if (main != null) {
      _result.main = main;
    }
    if (compete != null) {
      _result.compete = compete;
    }
    if (pkId != null) {
      _result.pkId = pkId;
    }
    if (state != null) {
      _result.state = state;
    }
    if (win != null) {
      _result.win = win;
    }
    if (punish != null) {
      _result.punish = punish;
    }
    return _result;
  }
  factory RoomRefersh_LivePkV3_Base.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_LivePkV3_Base.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_LivePkV3_Base clone() =>
      RoomRefersh_LivePkV3_Base()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_LivePkV3_Base copyWith(
          void Function(RoomRefersh_LivePkV3_Base) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_LivePkV3_Base))
          as RoomRefersh_LivePkV3_Base; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_LivePkV3_Base create() => RoomRefersh_LivePkV3_Base._();
  RoomRefersh_LivePkV3_Base createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_LivePkV3_Base> createRepeated() =>
      $pb.PbList<RoomRefersh_LivePkV3_Base>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_LivePkV3_Base getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_LivePkV3_Base>(create);
  static RoomRefersh_LivePkV3_Base? _defaultInstance;

  @$pb.TagNumber(1)
  RoomRefersh_LivePkV3_Base_Main get main => $_getN(0);
  @$pb.TagNumber(1)
  set main(RoomRefersh_LivePkV3_Base_Main v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMain() => $_has(0);
  @$pb.TagNumber(1)
  void clearMain() => clearField(1);
  @$pb.TagNumber(1)
  RoomRefersh_LivePkV3_Base_Main ensureMain() => $_ensure(0);

  @$pb.TagNumber(2)
  RoomRefersh_LivePkV3_Base_Compete get compete => $_getN(1);
  @$pb.TagNumber(2)
  set compete(RoomRefersh_LivePkV3_Base_Compete v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCompete() => $_has(1);
  @$pb.TagNumber(2)
  void clearCompete() => clearField(2);
  @$pb.TagNumber(2)
  RoomRefersh_LivePkV3_Base_Compete ensureCompete() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get pkId => $_getIZ(2);
  @$pb.TagNumber(3)
  set pkId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPkId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPkId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get state => $_getSZ(3);
  @$pb.TagNumber(4)
  set state($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => clearField(4);

  @$pb.TagNumber(5)
  $0.Value get win => $_getN(4);
  @$pb.TagNumber(5)
  set win($0.Value v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasWin() => $_has(4);
  @$pb.TagNumber(5)
  void clearWin() => clearField(5);
  @$pb.TagNumber(5)
  $0.Value ensureWin() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get punish => $_getSZ(5);
  @$pb.TagNumber(6)
  set punish($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPunish() => $_has(5);
  @$pb.TagNumber(6)
  void clearPunish() => clearField(6);
}

class RoomRefersh_LivePkV3_Rank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.LivePkV3.Rank',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
            : 'icon')
    ..a<$core.double>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OD)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_first_kill',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_LivePkV3_Rank._() : super();
  factory RoomRefersh_LivePkV3_Rank({
    $core.int? uid,
    $core.String? icon,
    $core.double? score,
    $core.int? isFirstKill,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (score != null) {
      _result.score = score;
    }
    if (isFirstKill != null) {
      _result.isFirstKill = isFirstKill;
    }
    return _result;
  }
  factory RoomRefersh_LivePkV3_Rank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_LivePkV3_Rank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_LivePkV3_Rank clone() =>
      RoomRefersh_LivePkV3_Rank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_LivePkV3_Rank copyWith(
          void Function(RoomRefersh_LivePkV3_Rank) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_LivePkV3_Rank))
          as RoomRefersh_LivePkV3_Rank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_LivePkV3_Rank create() => RoomRefersh_LivePkV3_Rank._();
  RoomRefersh_LivePkV3_Rank createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_LivePkV3_Rank> createRepeated() =>
      $pb.PbList<RoomRefersh_LivePkV3_Rank>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_LivePkV3_Rank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_LivePkV3_Rank>(create);
  static RoomRefersh_LivePkV3_Rank? _defaultInstance;

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
  $core.double get score => $_getN(2);
  @$pb.TagNumber(3)
  set score($core.double v) {
    $_setDouble(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearScore() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get isFirstKill => $_getIZ(3);
  @$pb.TagNumber(4)
  set isFirstKill($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsFirstKill() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsFirstKill() => clearField(4);
}

class RoomRefersh_LivePkV3_Punish_Gua extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.LivePkV3.Punish.Gua',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  RoomRefersh_LivePkV3_Punish_Gua._() : super();
  factory RoomRefersh_LivePkV3_Punish_Gua({
    $core.String? icon,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory RoomRefersh_LivePkV3_Punish_Gua.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_LivePkV3_Punish_Gua.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_LivePkV3_Punish_Gua clone() =>
      RoomRefersh_LivePkV3_Punish_Gua()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_LivePkV3_Punish_Gua copyWith(
          void Function(RoomRefersh_LivePkV3_Punish_Gua) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_LivePkV3_Punish_Gua))
          as RoomRefersh_LivePkV3_Punish_Gua; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_LivePkV3_Punish_Gua create() =>
      RoomRefersh_LivePkV3_Punish_Gua._();
  RoomRefersh_LivePkV3_Punish_Gua createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_LivePkV3_Punish_Gua> createRepeated() =>
      $pb.PbList<RoomRefersh_LivePkV3_Punish_Gua>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_LivePkV3_Punish_Gua getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_LivePkV3_Punish_Gua>(
          create);
  static RoomRefersh_LivePkV3_Punish_Gua? _defaultInstance;

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
}

class RoomRefersh_LivePkV3_Punish_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.LivePkV3.Punish.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
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
            : 'content')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'paper_count',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_LivePkV3_Punish_Data._() : super();
  factory RoomRefersh_LivePkV3_Punish_Data({
    $core.String? uid,
    $core.int? id,
    $core.String? type,
    $core.String? content,
    $core.int? paperCount,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (id != null) {
      _result.id = id;
    }
    if (type != null) {
      _result.type = type;
    }
    if (content != null) {
      _result.content = content;
    }
    if (paperCount != null) {
      _result.paperCount = paperCount;
    }
    return _result;
  }
  factory RoomRefersh_LivePkV3_Punish_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_LivePkV3_Punish_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_LivePkV3_Punish_Data clone() =>
      RoomRefersh_LivePkV3_Punish_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_LivePkV3_Punish_Data copyWith(
          void Function(RoomRefersh_LivePkV3_Punish_Data) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_LivePkV3_Punish_Data))
          as RoomRefersh_LivePkV3_Punish_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_LivePkV3_Punish_Data create() =>
      RoomRefersh_LivePkV3_Punish_Data._();
  RoomRefersh_LivePkV3_Punish_Data createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_LivePkV3_Punish_Data> createRepeated() =>
      $pb.PbList<RoomRefersh_LivePkV3_Punish_Data>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_LivePkV3_Punish_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_LivePkV3_Punish_Data>(
          create);
  static RoomRefersh_LivePkV3_Punish_Data? _defaultInstance;

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
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

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
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get paperCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set paperCount($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPaperCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearPaperCount() => clearField(5);
}

class RoomRefersh_LivePkV3_Punish extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.LivePkV3.Punish',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOM<RoomRefersh_LivePkV3_Punish_Gua>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gua',
        subBuilder: RoomRefersh_LivePkV3_Punish_Gua.create)
    ..pc<RoomRefersh_LivePkV3_Punish_Data>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_LivePkV3_Punish_Data.create)
    ..hasRequiredFields = false;

  RoomRefersh_LivePkV3_Punish._() : super();
  factory RoomRefersh_LivePkV3_Punish({
    RoomRefersh_LivePkV3_Punish_Gua? gua,
    $core.Iterable<RoomRefersh_LivePkV3_Punish_Data>? data,
  }) {
    final _result = create();
    if (gua != null) {
      _result.gua = gua;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory RoomRefersh_LivePkV3_Punish.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_LivePkV3_Punish.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_LivePkV3_Punish clone() =>
      RoomRefersh_LivePkV3_Punish()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_LivePkV3_Punish copyWith(
          void Function(RoomRefersh_LivePkV3_Punish) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_LivePkV3_Punish))
          as RoomRefersh_LivePkV3_Punish; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_LivePkV3_Punish create() =>
      RoomRefersh_LivePkV3_Punish._();
  RoomRefersh_LivePkV3_Punish createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_LivePkV3_Punish> createRepeated() =>
      $pb.PbList<RoomRefersh_LivePkV3_Punish>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_LivePkV3_Punish getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_LivePkV3_Punish>(create);
  static RoomRefersh_LivePkV3_Punish? _defaultInstance;

  @$pb.TagNumber(1)
  RoomRefersh_LivePkV3_Punish_Gua get gua => $_getN(0);
  @$pb.TagNumber(1)
  set gua(RoomRefersh_LivePkV3_Punish_Gua v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGua() => $_has(0);
  @$pb.TagNumber(1)
  void clearGua() => clearField(1);
  @$pb.TagNumber(1)
  RoomRefersh_LivePkV3_Punish_Gua ensureGua() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<RoomRefersh_LivePkV3_Punish_Data> get data => $_getList(1);
}

class RoomRefersh_LivePkV3 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.LivePkV3',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOM<RoomRefersh_LivePkV3_Base>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'base',
        subBuilder: RoomRefersh_LivePkV3_Base.create)
    ..m<$core.String, $0.ListValue>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        entryClassName: 'RoomRefersh.LivePkV3.RankEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $0.ListValue.create,
        packageName: const $pb.PackageName('room.refersh'))
    ..aOM<RoomRefersh_LivePkV3_Punish>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'punish',
        subBuilder: RoomRefersh_LivePkV3_Punish.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isUse',
        $pb.PbFieldType.OU3,
        protoName: 'isUse')
    ..hasRequiredFields = false;

  RoomRefersh_LivePkV3._() : super();
  factory RoomRefersh_LivePkV3({
    RoomRefersh_LivePkV3_Base? base,
    $core.Map<$core.String, $0.ListValue>? rank,
    RoomRefersh_LivePkV3_Punish? punish,
    $core.int? isUse,
  }) {
    final _result = create();
    if (base != null) {
      _result.base = base;
    }
    if (rank != null) {
      _result.rank.addAll(rank);
    }
    if (punish != null) {
      _result.punish = punish;
    }
    if (isUse != null) {
      _result.isUse = isUse;
    }
    return _result;
  }
  factory RoomRefersh_LivePkV3.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_LivePkV3.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_LivePkV3 clone() =>
      RoomRefersh_LivePkV3()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_LivePkV3 copyWith(void Function(RoomRefersh_LivePkV3) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_LivePkV3))
          as RoomRefersh_LivePkV3; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_LivePkV3 create() => RoomRefersh_LivePkV3._();
  RoomRefersh_LivePkV3 createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_LivePkV3> createRepeated() =>
      $pb.PbList<RoomRefersh_LivePkV3>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_LivePkV3 getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_LivePkV3>(create);
  static RoomRefersh_LivePkV3? _defaultInstance;

  @$pb.TagNumber(1)
  RoomRefersh_LivePkV3_Base get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(RoomRefersh_LivePkV3_Base v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  RoomRefersh_LivePkV3_Base ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.Map<$core.String, $0.ListValue> get rank => $_getMap(1);

  @$pb.TagNumber(3)
  RoomRefersh_LivePkV3_Punish get punish => $_getN(2);
  @$pb.TagNumber(3)
  set punish(RoomRefersh_LivePkV3_Punish v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPunish() => $_has(2);
  @$pb.TagNumber(3)
  void clearPunish() => clearField(3);
  @$pb.TagNumber(3)
  RoomRefersh_LivePkV3_Punish ensurePunish() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get isUse => $_getIZ(3);
  @$pb.TagNumber(4)
  set isUse($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsUse() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsUse() => clearField(4);
}

class RoomRefersh_Accompany extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Accompany',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'decorate')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'effect')
    ..aOM<$0.Value>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value',
        subBuilder: $0.Value.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'truth_enable',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'foreground')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total_time',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room_is_lock',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room_auto_mic',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_Accompany._() : super();
  factory RoomRefersh_Accompany({
    $core.String? decorate,
    $core.String? effect,
    $0.Value? value,
    $core.int? duration,
    $core.int? truthEnable,
    $core.String? foreground,
    $core.int? totalTime,
    $core.int? roomIsLock,
    $core.int? roomAutoMic,
  }) {
    final _result = create();
    if (decorate != null) {
      _result.decorate = decorate;
    }
    if (effect != null) {
      _result.effect = effect;
    }
    if (value != null) {
      _result.value = value;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (truthEnable != null) {
      _result.truthEnable = truthEnable;
    }
    if (foreground != null) {
      _result.foreground = foreground;
    }
    if (totalTime != null) {
      _result.totalTime = totalTime;
    }
    if (roomIsLock != null) {
      _result.roomIsLock = roomIsLock;
    }
    if (roomAutoMic != null) {
      _result.roomAutoMic = roomAutoMic;
    }
    return _result;
  }
  factory RoomRefersh_Accompany.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Accompany.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Accompany clone() =>
      RoomRefersh_Accompany()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Accompany copyWith(
          void Function(RoomRefersh_Accompany) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_Accompany))
          as RoomRefersh_Accompany; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Accompany create() => RoomRefersh_Accompany._();
  RoomRefersh_Accompany createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Accompany> createRepeated() =>
      $pb.PbList<RoomRefersh_Accompany>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Accompany getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Accompany>(create);
  static RoomRefersh_Accompany? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get decorate => $_getSZ(0);
  @$pb.TagNumber(1)
  set decorate($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDecorate() => $_has(0);
  @$pb.TagNumber(1)
  void clearDecorate() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get effect => $_getSZ(1);
  @$pb.TagNumber(2)
  set effect($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasEffect() => $_has(1);
  @$pb.TagNumber(2)
  void clearEffect() => clearField(2);

  @$pb.TagNumber(3)
  $0.Value get value => $_getN(2);
  @$pb.TagNumber(3)
  set value($0.Value v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);
  @$pb.TagNumber(3)
  $0.Value ensureValue() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get duration => $_getIZ(3);
  @$pb.TagNumber(4)
  set duration($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearDuration() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get truthEnable => $_getIZ(4);
  @$pb.TagNumber(5)
  set truthEnable($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTruthEnable() => $_has(4);
  @$pb.TagNumber(5)
  void clearTruthEnable() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get foreground => $_getSZ(5);
  @$pb.TagNumber(6)
  set foreground($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasForeground() => $_has(5);
  @$pb.TagNumber(6)
  void clearForeground() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get totalTime => $_getIZ(6);
  @$pb.TagNumber(7)
  set totalTime($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTotalTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalTime() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get roomIsLock => $_getIZ(7);
  @$pb.TagNumber(8)
  set roomIsLock($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasRoomIsLock() => $_has(7);
  @$pb.TagNumber(8)
  void clearRoomIsLock() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get roomAutoMic => $_getIZ(8);
  @$pb.TagNumber(9)
  set roomAutoMic($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasRoomAutoMic() => $_has(8);
  @$pb.TagNumber(9)
  void clearRoomAutoMic() => clearField(9);
}

class RoomRefersh_AuctionInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.AuctionInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
            : 'state')
    ..aOM<$0.Value>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vvc',
        subBuilder: $0.Value.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commodity')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift_price',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift_id',
        $pb.PbFieldType.OU3)
    ..pc<RoomRefersh_Rank>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_Rank.create)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version')
    ..hasRequiredFields = false;

  RoomRefersh_AuctionInfo._() : super();
  factory RoomRefersh_AuctionInfo({
    $core.String? uid,
    $core.String? state,
    $0.Value? vvc,
    $core.String? commodity,
    $core.String? time,
    $core.int? giftPrice,
    $core.int? giftId,
    $core.Iterable<RoomRefersh_Rank>? rank,
    $core.String? version,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (state != null) {
      _result.state = state;
    }
    if (vvc != null) {
      _result.vvc = vvc;
    }
    if (commodity != null) {
      _result.commodity = commodity;
    }
    if (time != null) {
      _result.time = time;
    }
    if (giftPrice != null) {
      _result.giftPrice = giftPrice;
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (rank != null) {
      _result.rank.addAll(rank);
    }
    if (version != null) {
      _result.version = version;
    }
    return _result;
  }
  factory RoomRefersh_AuctionInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_AuctionInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_AuctionInfo clone() =>
      RoomRefersh_AuctionInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_AuctionInfo copyWith(
          void Function(RoomRefersh_AuctionInfo) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_AuctionInfo))
          as RoomRefersh_AuctionInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_AuctionInfo create() => RoomRefersh_AuctionInfo._();
  RoomRefersh_AuctionInfo createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_AuctionInfo> createRepeated() =>
      $pb.PbList<RoomRefersh_AuctionInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_AuctionInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_AuctionInfo>(create);
  static RoomRefersh_AuctionInfo? _defaultInstance;

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
  $core.String get state => $_getSZ(1);
  @$pb.TagNumber(2)
  set state($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);

  @$pb.TagNumber(3)
  $0.Value get vvc => $_getN(2);
  @$pb.TagNumber(3)
  set vvc($0.Value v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasVvc() => $_has(2);
  @$pb.TagNumber(3)
  void clearVvc() => clearField(3);
  @$pb.TagNumber(3)
  $0.Value ensureVvc() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get commodity => $_getSZ(3);
  @$pb.TagNumber(4)
  set commodity($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCommodity() => $_has(3);
  @$pb.TagNumber(4)
  void clearCommodity() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get time => $_getSZ(4);
  @$pb.TagNumber(5)
  set time($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearTime() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get giftPrice => $_getIZ(5);
  @$pb.TagNumber(6)
  set giftPrice($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGiftPrice() => $_has(5);
  @$pb.TagNumber(6)
  void clearGiftPrice() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get giftId => $_getIZ(6);
  @$pb.TagNumber(7)
  set giftId($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGiftId() => $_has(6);
  @$pb.TagNumber(7)
  void clearGiftId() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<RoomRefersh_Rank> get rank => $_getList(7);

  @$pb.TagNumber(9)
  $core.String get version => $_getSZ(8);
  @$pb.TagNumber(9)
  set version($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasVersion() => $_has(8);
  @$pb.TagNumber(9)
  void clearVersion() => clearField(9);
}

class RoomRefersh_Rank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Rank',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
    ..aOM<$0.Value>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftNum',
        protoName: 'giftNum',
        subBuilder: $0.Value.create)
    ..a<$core.double>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftMoney',
        $pb.PbFieldType.OD,
        protoName: 'giftMoney')
    ..hasRequiredFields = false;

  RoomRefersh_Rank._() : super();
  factory RoomRefersh_Rank({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $0.Value? giftNum,
    $core.double? giftMoney,
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
    if (giftNum != null) {
      _result.giftNum = giftNum;
    }
    if (giftMoney != null) {
      _result.giftMoney = giftMoney;
    }
    return _result;
  }
  factory RoomRefersh_Rank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Rank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Rank clone() => RoomRefersh_Rank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Rank copyWith(void Function(RoomRefersh_Rank) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_Rank))
          as RoomRefersh_Rank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Rank create() => RoomRefersh_Rank._();
  RoomRefersh_Rank createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Rank> createRepeated() =>
      $pb.PbList<RoomRefersh_Rank>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Rank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Rank>(create);
  static RoomRefersh_Rank? _defaultInstance;

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
  $0.Value get giftNum => $_getN(3);
  @$pb.TagNumber(4)
  set giftNum($0.Value v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGiftNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftNum() => clearField(4);
  @$pb.TagNumber(4)
  $0.Value ensureGiftNum() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.double get giftMoney => $_getN(4);
  @$pb.TagNumber(5)
  set giftMoney($core.double v) {
    $_setDouble(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGiftMoney() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftMoney() => clearField(5);
}

class RoomRefersh_CpNamingInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.CpNamingInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
    ..hasRequiredFields = false;

  RoomRefersh_CpNamingInfo._() : super();
  factory RoomRefersh_CpNamingInfo({
    $core.String? icon,
    $core.String? name,
    $core.String? uid,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory RoomRefersh_CpNamingInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_CpNamingInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_CpNamingInfo clone() =>
      RoomRefersh_CpNamingInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_CpNamingInfo copyWith(
          void Function(RoomRefersh_CpNamingInfo) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_CpNamingInfo))
          as RoomRefersh_CpNamingInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CpNamingInfo create() => RoomRefersh_CpNamingInfo._();
  RoomRefersh_CpNamingInfo createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_CpNamingInfo> createRepeated() =>
      $pb.PbList<RoomRefersh_CpNamingInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CpNamingInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_CpNamingInfo>(create);
  static RoomRefersh_CpNamingInfo? _defaultInstance;

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
  $core.String get uid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uid($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);
}

class RoomRefersh_CpSceneInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.CpSceneInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'heart_num',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'scene_background')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'background')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title_image')
    ..hasRequiredFields = false;

  RoomRefersh_CpSceneInfo._() : super();
  factory RoomRefersh_CpSceneInfo({
    $core.int? heartNum,
    $core.String? sceneBackground,
    $core.String? background,
    $core.String? titleImage,
  }) {
    final _result = create();
    if (heartNum != null) {
      _result.heartNum = heartNum;
    }
    if (sceneBackground != null) {
      _result.sceneBackground = sceneBackground;
    }
    if (background != null) {
      _result.background = background;
    }
    if (titleImage != null) {
      _result.titleImage = titleImage;
    }
    return _result;
  }
  factory RoomRefersh_CpSceneInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_CpSceneInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_CpSceneInfo clone() =>
      RoomRefersh_CpSceneInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_CpSceneInfo copyWith(
          void Function(RoomRefersh_CpSceneInfo) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_CpSceneInfo))
          as RoomRefersh_CpSceneInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CpSceneInfo create() => RoomRefersh_CpSceneInfo._();
  RoomRefersh_CpSceneInfo createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_CpSceneInfo> createRepeated() =>
      $pb.PbList<RoomRefersh_CpSceneInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CpSceneInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_CpSceneInfo>(create);
  static RoomRefersh_CpSceneInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get heartNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set heartNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHeartNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeartNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sceneBackground => $_getSZ(1);
  @$pb.TagNumber(2)
  set sceneBackground($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSceneBackground() => $_has(1);
  @$pb.TagNumber(2)
  void clearSceneBackground() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get background => $_getSZ(2);
  @$pb.TagNumber(3)
  set background($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBackground() => $_has(2);
  @$pb.TagNumber(3)
  void clearBackground() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get titleImage => $_getSZ(3);
  @$pb.TagNumber(4)
  set titleImage($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTitleImage() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitleImage() => clearField(4);
}

class RoomRefersh_CpLinkInfo_AuctionConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.CpLinkInfo.AuctionConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  RoomRefersh_CpLinkInfo_AuctionConfig._() : super();
  factory RoomRefersh_CpLinkInfo_AuctionConfig({
    $core.String? id,
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
  factory RoomRefersh_CpLinkInfo_AuctionConfig.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_CpLinkInfo_AuctionConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_CpLinkInfo_AuctionConfig clone() =>
      RoomRefersh_CpLinkInfo_AuctionConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_CpLinkInfo_AuctionConfig copyWith(
          void Function(RoomRefersh_CpLinkInfo_AuctionConfig) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_CpLinkInfo_AuctionConfig))
          as RoomRefersh_CpLinkInfo_AuctionConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CpLinkInfo_AuctionConfig create() =>
      RoomRefersh_CpLinkInfo_AuctionConfig._();
  RoomRefersh_CpLinkInfo_AuctionConfig createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_CpLinkInfo_AuctionConfig> createRepeated() =>
      $pb.PbList<RoomRefersh_CpLinkInfo_AuctionConfig>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CpLinkInfo_AuctionConfig getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_CpLinkInfo_AuctionConfig>(create);
  static RoomRefersh_CpLinkInfo_AuctionConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
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

class RoomRefersh_CpLinkInfo_SceneConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.CpLinkInfo.SceneConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'scene',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  RoomRefersh_CpLinkInfo_SceneConfig._() : super();
  factory RoomRefersh_CpLinkInfo_SceneConfig({
    $core.int? scene,
    $core.int? money,
    $core.String? name,
  }) {
    final _result = create();
    if (scene != null) {
      _result.scene = scene;
    }
    if (money != null) {
      _result.money = money;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory RoomRefersh_CpLinkInfo_SceneConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_CpLinkInfo_SceneConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_CpLinkInfo_SceneConfig clone() =>
      RoomRefersh_CpLinkInfo_SceneConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_CpLinkInfo_SceneConfig copyWith(
          void Function(RoomRefersh_CpLinkInfo_SceneConfig) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_CpLinkInfo_SceneConfig))
          as RoomRefersh_CpLinkInfo_SceneConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CpLinkInfo_SceneConfig create() =>
      RoomRefersh_CpLinkInfo_SceneConfig._();
  RoomRefersh_CpLinkInfo_SceneConfig createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_CpLinkInfo_SceneConfig> createRepeated() =>
      $pb.PbList<RoomRefersh_CpLinkInfo_SceneConfig>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CpLinkInfo_SceneConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_CpLinkInfo_SceneConfig>(
          create);
  static RoomRefersh_CpLinkInfo_SceneConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get scene => $_getIZ(0);
  @$pb.TagNumber(1)
  set scene($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasScene() => $_has(0);
  @$pb.TagNumber(1)
  void clearScene() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get money => $_getIZ(1);
  @$pb.TagNumber(2)
  set money($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMoney() => $_has(1);
  @$pb.TagNumber(2)
  void clearMoney() => clearField(2);

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
}

class RoomRefersh_CpLinkInfo_SceneConfigNew extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.CpLinkInfo.SceneConfigNew',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'scene',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
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
    ..hasRequiredFields = false;

  RoomRefersh_CpLinkInfo_SceneConfigNew._() : super();
  factory RoomRefersh_CpLinkInfo_SceneConfigNew({
    $core.int? scene,
    $core.int? money,
    $core.String? name,
    $core.String? icon,
  }) {
    final _result = create();
    if (scene != null) {
      _result.scene = scene;
    }
    if (money != null) {
      _result.money = money;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory RoomRefersh_CpLinkInfo_SceneConfigNew.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_CpLinkInfo_SceneConfigNew.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_CpLinkInfo_SceneConfigNew clone() =>
      RoomRefersh_CpLinkInfo_SceneConfigNew()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_CpLinkInfo_SceneConfigNew copyWith(
          void Function(RoomRefersh_CpLinkInfo_SceneConfigNew) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_CpLinkInfo_SceneConfigNew))
          as RoomRefersh_CpLinkInfo_SceneConfigNew; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CpLinkInfo_SceneConfigNew create() =>
      RoomRefersh_CpLinkInfo_SceneConfigNew._();
  RoomRefersh_CpLinkInfo_SceneConfigNew createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_CpLinkInfo_SceneConfigNew> createRepeated() =>
      $pb.PbList<RoomRefersh_CpLinkInfo_SceneConfigNew>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CpLinkInfo_SceneConfigNew getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_CpLinkInfo_SceneConfigNew>(create);
  static RoomRefersh_CpLinkInfo_SceneConfigNew? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get scene => $_getIZ(0);
  @$pb.TagNumber(1)
  set scene($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasScene() => $_has(0);
  @$pb.TagNumber(1)
  void clearScene() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get money => $_getIZ(1);
  @$pb.TagNumber(2)
  set money($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMoney() => $_has(1);
  @$pb.TagNumber(2)
  void clearMoney() => clearField(2);

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

class RoomRefersh_CpLinkInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.CpLinkInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cplink_stage')
    ..p<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cplink_top_list',
        $pb.PbFieldType.PU3)
    ..aOM<RoomRefersh_CpLinkInfo_AuctionConfig>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'auction_config',
        subBuilder: RoomRefersh_CpLinkInfo_AuctionConfig.create)
    ..pc<RoomRefersh_CpLinkInfo_SceneConfig>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'scene_config',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_CpLinkInfo_SceneConfig.create)
    ..pc<RoomRefersh_CpLinkInfo_SceneConfigNew>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'scene_config_new',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_CpLinkInfo_SceneConfigNew.create)
    ..hasRequiredFields = false;

  RoomRefersh_CpLinkInfo._() : super();
  factory RoomRefersh_CpLinkInfo({
    $core.String? cplinkStage,
    $core.Iterable<$core.int>? cplinkTopList,
    RoomRefersh_CpLinkInfo_AuctionConfig? auctionConfig,
    $core.Iterable<RoomRefersh_CpLinkInfo_SceneConfig>? sceneConfig,
    $core.Iterable<RoomRefersh_CpLinkInfo_SceneConfigNew>? sceneConfigNew,
  }) {
    final _result = create();
    if (cplinkStage != null) {
      _result.cplinkStage = cplinkStage;
    }
    if (cplinkTopList != null) {
      _result.cplinkTopList.addAll(cplinkTopList);
    }
    if (auctionConfig != null) {
      _result.auctionConfig = auctionConfig;
    }
    if (sceneConfig != null) {
      _result.sceneConfig.addAll(sceneConfig);
    }
    if (sceneConfigNew != null) {
      _result.sceneConfigNew.addAll(sceneConfigNew);
    }
    return _result;
  }
  factory RoomRefersh_CpLinkInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_CpLinkInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_CpLinkInfo clone() =>
      RoomRefersh_CpLinkInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_CpLinkInfo copyWith(
          void Function(RoomRefersh_CpLinkInfo) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_CpLinkInfo))
          as RoomRefersh_CpLinkInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CpLinkInfo create() => RoomRefersh_CpLinkInfo._();
  RoomRefersh_CpLinkInfo createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_CpLinkInfo> createRepeated() =>
      $pb.PbList<RoomRefersh_CpLinkInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CpLinkInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_CpLinkInfo>(create);
  static RoomRefersh_CpLinkInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cplinkStage => $_getSZ(0);
  @$pb.TagNumber(1)
  set cplinkStage($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCplinkStage() => $_has(0);
  @$pb.TagNumber(1)
  void clearCplinkStage() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get cplinkTopList => $_getList(1);

  @$pb.TagNumber(3)
  RoomRefersh_CpLinkInfo_AuctionConfig get auctionConfig => $_getN(2);
  @$pb.TagNumber(3)
  set auctionConfig(RoomRefersh_CpLinkInfo_AuctionConfig v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAuctionConfig() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuctionConfig() => clearField(3);
  @$pb.TagNumber(3)
  RoomRefersh_CpLinkInfo_AuctionConfig ensureAuctionConfig() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<RoomRefersh_CpLinkInfo_SceneConfig> get sceneConfig =>
      $_getList(3);

  @$pb.TagNumber(5)
  $core.List<RoomRefersh_CpLinkInfo_SceneConfigNew> get sceneConfigNew =>
      $_getList(4);
}

class RoomRefersh_GrabmicInfo_GamingList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.GrabmicInfo.GamingList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'origin',
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
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'points',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'health',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_out',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank_num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_offline',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_GrabmicInfo_GamingList._() : super();
  factory RoomRefersh_GrabmicInfo_GamingList({
    $core.int? position,
    $core.int? origin,
    $core.String? name,
    $core.String? icon,
    $core.int? points,
    $core.int? health,
    $core.int? isOut,
    $core.int? rankNum,
    $core.int? isOffline,
  }) {
    final _result = create();
    if (position != null) {
      _result.position = position;
    }
    if (origin != null) {
      _result.origin = origin;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (points != null) {
      _result.points = points;
    }
    if (health != null) {
      _result.health = health;
    }
    if (isOut != null) {
      _result.isOut = isOut;
    }
    if (rankNum != null) {
      _result.rankNum = rankNum;
    }
    if (isOffline != null) {
      _result.isOffline = isOffline;
    }
    return _result;
  }
  factory RoomRefersh_GrabmicInfo_GamingList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_GrabmicInfo_GamingList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_GrabmicInfo_GamingList clone() =>
      RoomRefersh_GrabmicInfo_GamingList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_GrabmicInfo_GamingList copyWith(
          void Function(RoomRefersh_GrabmicInfo_GamingList) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_GrabmicInfo_GamingList))
          as RoomRefersh_GrabmicInfo_GamingList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GrabmicInfo_GamingList create() =>
      RoomRefersh_GrabmicInfo_GamingList._();
  RoomRefersh_GrabmicInfo_GamingList createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_GrabmicInfo_GamingList> createRepeated() =>
      $pb.PbList<RoomRefersh_GrabmicInfo_GamingList>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GrabmicInfo_GamingList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_GrabmicInfo_GamingList>(
          create);
  static RoomRefersh_GrabmicInfo_GamingList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get position => $_getIZ(0);
  @$pb.TagNumber(1)
  set position($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get origin => $_getIZ(1);
  @$pb.TagNumber(2)
  set origin($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOrigin() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrigin() => clearField(2);

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
  $core.int get points => $_getIZ(4);
  @$pb.TagNumber(5)
  set points($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPoints() => $_has(4);
  @$pb.TagNumber(5)
  void clearPoints() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get health => $_getIZ(5);
  @$pb.TagNumber(6)
  set health($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasHealth() => $_has(5);
  @$pb.TagNumber(6)
  void clearHealth() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get isOut => $_getIZ(6);
  @$pb.TagNumber(7)
  set isOut($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIsOut() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsOut() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get rankNum => $_getIZ(7);
  @$pb.TagNumber(8)
  set rankNum($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasRankNum() => $_has(7);
  @$pb.TagNumber(8)
  void clearRankNum() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get isOffline => $_getIZ(8);
  @$pb.TagNumber(9)
  set isOffline($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasIsOffline() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsOffline() => clearField(9);
}

class RoomRefersh_GrabmicInfo_GrabmicInfoMap_SceneGift
    extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.GrabmicInfo.GrabmicInfoMap.SceneGift',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name_zh_tw')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name_en')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'display')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sub_display')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift_type')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'income_type')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'with_end')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'size')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'size_big')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ordering')
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleted')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'naming')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'xratio')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'xtype')
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'excludes')
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tag_url')
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tag_ids')
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..aOS(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jump_page')
    ..aOS(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unlock_limit')
    ..aOS(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ext_id')
    ..aOS(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_skin')
    ..aOS(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_combo')
    ..aOS(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version')
    ..aOS(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vap_type')
    ..aOS(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vap_size')
    ..aOS(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vap_header')
    ..aOS(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vap_header_start')
    ..aOS(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vap_header_end')
    ..aOS(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'magic')
    ..aOS(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'magic_size')
    ..aOS(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category')
    ..aOS(
        38,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'app_id')
    ..aOS(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_app_public')
    ..hasRequiredFields = false;

  RoomRefersh_GrabmicInfo_GrabmicInfoMap_SceneGift._() : super();
  factory RoomRefersh_GrabmicInfo_GrabmicInfoMap_SceneGift({
    $core.String? id,
    $core.String? name,
    $core.String? nameZhTw,
    $core.String? nameEn,
    $core.String? price,
    $core.String? display,
    $core.String? subDisplay,
    $core.String? type,
    $core.String? giftType,
    $core.String? incomeType,
    $core.String? withEnd,
    $core.String? size,
    $core.String? sizeBig,
    $core.String? ordering,
    $core.String? deleted,
    $core.String? title,
    $core.String? naming,
    $core.String? xratio,
    $core.String? xtype,
    $core.String? excludes,
    $core.String? tagUrl,
    $core.String? tagIds,
    $core.String? description,
    $core.String? jumpPage,
    $core.String? unlockLimit,
    $core.String? extId,
    $core.String? isSkin,
    $core.String? isCombo,
    $core.String? version,
    $core.String? vapType,
    $core.String? vapSize,
    $core.String? vapHeader,
    $core.String? vapHeaderStart,
    $core.String? vapHeaderEnd,
    $core.String? magic,
    $core.String? magicSize,
    $core.String? category,
    $core.String? appId,
    $core.String? isAppPublic,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (nameZhTw != null) {
      _result.nameZhTw = nameZhTw;
    }
    if (nameEn != null) {
      _result.nameEn = nameEn;
    }
    if (price != null) {
      _result.price = price;
    }
    if (display != null) {
      _result.display = display;
    }
    if (subDisplay != null) {
      _result.subDisplay = subDisplay;
    }
    if (type != null) {
      _result.type = type;
    }
    if (giftType != null) {
      _result.giftType = giftType;
    }
    if (incomeType != null) {
      _result.incomeType = incomeType;
    }
    if (withEnd != null) {
      _result.withEnd = withEnd;
    }
    if (size != null) {
      _result.size = size;
    }
    if (sizeBig != null) {
      _result.sizeBig = sizeBig;
    }
    if (ordering != null) {
      _result.ordering = ordering;
    }
    if (deleted != null) {
      _result.deleted = deleted;
    }
    if (title != null) {
      _result.title = title;
    }
    if (naming != null) {
      _result.naming = naming;
    }
    if (xratio != null) {
      _result.xratio = xratio;
    }
    if (xtype != null) {
      _result.xtype = xtype;
    }
    if (excludes != null) {
      _result.excludes = excludes;
    }
    if (tagUrl != null) {
      _result.tagUrl = tagUrl;
    }
    if (tagIds != null) {
      _result.tagIds = tagIds;
    }
    if (description != null) {
      _result.description = description;
    }
    if (jumpPage != null) {
      _result.jumpPage = jumpPage;
    }
    if (unlockLimit != null) {
      _result.unlockLimit = unlockLimit;
    }
    if (extId != null) {
      _result.extId = extId;
    }
    if (isSkin != null) {
      _result.isSkin = isSkin;
    }
    if (isCombo != null) {
      _result.isCombo = isCombo;
    }
    if (version != null) {
      _result.version = version;
    }
    if (vapType != null) {
      _result.vapType = vapType;
    }
    if (vapSize != null) {
      _result.vapSize = vapSize;
    }
    if (vapHeader != null) {
      _result.vapHeader = vapHeader;
    }
    if (vapHeaderStart != null) {
      _result.vapHeaderStart = vapHeaderStart;
    }
    if (vapHeaderEnd != null) {
      _result.vapHeaderEnd = vapHeaderEnd;
    }
    if (magic != null) {
      _result.magic = magic;
    }
    if (magicSize != null) {
      _result.magicSize = magicSize;
    }
    if (category != null) {
      _result.category = category;
    }
    if (appId != null) {
      _result.appId = appId;
    }
    if (isAppPublic != null) {
      _result.isAppPublic = isAppPublic;
    }
    return _result;
  }
  factory RoomRefersh_GrabmicInfo_GrabmicInfoMap_SceneGift.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_GrabmicInfo_GrabmicInfoMap_SceneGift.fromJson(
          $core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_GrabmicInfo_GrabmicInfoMap_SceneGift clone() =>
      RoomRefersh_GrabmicInfo_GrabmicInfoMap_SceneGift()
        ..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_GrabmicInfo_GrabmicInfoMap_SceneGift copyWith(
          void Function(RoomRefersh_GrabmicInfo_GrabmicInfoMap_SceneGift)
              updates) =>
      super.copyWith((message) => updates(
              message as RoomRefersh_GrabmicInfo_GrabmicInfoMap_SceneGift))
          as RoomRefersh_GrabmicInfo_GrabmicInfoMap_SceneGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GrabmicInfo_GrabmicInfoMap_SceneGift create() =>
      RoomRefersh_GrabmicInfo_GrabmicInfoMap_SceneGift._();
  RoomRefersh_GrabmicInfo_GrabmicInfoMap_SceneGift createEmptyInstance() =>
      create();
  static $pb.PbList<RoomRefersh_GrabmicInfo_GrabmicInfoMap_SceneGift>
      createRepeated() =>
          $pb.PbList<RoomRefersh_GrabmicInfo_GrabmicInfoMap_SceneGift>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GrabmicInfo_GrabmicInfoMap_SceneGift getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_GrabmicInfo_GrabmicInfoMap_SceneGift>(create);
  static RoomRefersh_GrabmicInfo_GrabmicInfoMap_SceneGift? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
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
  $core.String get nameZhTw => $_getSZ(2);
  @$pb.TagNumber(3)
  set nameZhTw($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNameZhTw() => $_has(2);
  @$pb.TagNumber(3)
  void clearNameZhTw() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get nameEn => $_getSZ(3);
  @$pb.TagNumber(4)
  set nameEn($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNameEn() => $_has(3);
  @$pb.TagNumber(4)
  void clearNameEn() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get price => $_getSZ(4);
  @$pb.TagNumber(5)
  set price($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrice() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get display => $_getSZ(5);
  @$pb.TagNumber(6)
  set display($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDisplay() => $_has(5);
  @$pb.TagNumber(6)
  void clearDisplay() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get subDisplay => $_getSZ(6);
  @$pb.TagNumber(7)
  set subDisplay($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSubDisplay() => $_has(6);
  @$pb.TagNumber(7)
  void clearSubDisplay() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get type => $_getSZ(7);
  @$pb.TagNumber(8)
  set type($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasType() => $_has(7);
  @$pb.TagNumber(8)
  void clearType() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get giftType => $_getSZ(8);
  @$pb.TagNumber(9)
  set giftType($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasGiftType() => $_has(8);
  @$pb.TagNumber(9)
  void clearGiftType() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get incomeType => $_getSZ(9);
  @$pb.TagNumber(10)
  set incomeType($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasIncomeType() => $_has(9);
  @$pb.TagNumber(10)
  void clearIncomeType() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get withEnd => $_getSZ(10);
  @$pb.TagNumber(11)
  set withEnd($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasWithEnd() => $_has(10);
  @$pb.TagNumber(11)
  void clearWithEnd() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get size => $_getSZ(11);
  @$pb.TagNumber(12)
  set size($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasSize() => $_has(11);
  @$pb.TagNumber(12)
  void clearSize() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get sizeBig => $_getSZ(12);
  @$pb.TagNumber(13)
  set sizeBig($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasSizeBig() => $_has(12);
  @$pb.TagNumber(13)
  void clearSizeBig() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get ordering => $_getSZ(13);
  @$pb.TagNumber(14)
  set ordering($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasOrdering() => $_has(13);
  @$pb.TagNumber(14)
  void clearOrdering() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get deleted => $_getSZ(14);
  @$pb.TagNumber(15)
  set deleted($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasDeleted() => $_has(14);
  @$pb.TagNumber(15)
  void clearDeleted() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get title => $_getSZ(15);
  @$pb.TagNumber(16)
  set title($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasTitle() => $_has(15);
  @$pb.TagNumber(16)
  void clearTitle() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get naming => $_getSZ(16);
  @$pb.TagNumber(17)
  set naming($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasNaming() => $_has(16);
  @$pb.TagNumber(17)
  void clearNaming() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get xratio => $_getSZ(17);
  @$pb.TagNumber(18)
  set xratio($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasXratio() => $_has(17);
  @$pb.TagNumber(18)
  void clearXratio() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get xtype => $_getSZ(18);
  @$pb.TagNumber(19)
  set xtype($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasXtype() => $_has(18);
  @$pb.TagNumber(19)
  void clearXtype() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get excludes => $_getSZ(19);
  @$pb.TagNumber(20)
  set excludes($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasExcludes() => $_has(19);
  @$pb.TagNumber(20)
  void clearExcludes() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get tagUrl => $_getSZ(20);
  @$pb.TagNumber(21)
  set tagUrl($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasTagUrl() => $_has(20);
  @$pb.TagNumber(21)
  void clearTagUrl() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get tagIds => $_getSZ(21);
  @$pb.TagNumber(22)
  set tagIds($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasTagIds() => $_has(21);
  @$pb.TagNumber(22)
  void clearTagIds() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get description => $_getSZ(22);
  @$pb.TagNumber(23)
  set description($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasDescription() => $_has(22);
  @$pb.TagNumber(23)
  void clearDescription() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get jumpPage => $_getSZ(23);
  @$pb.TagNumber(24)
  set jumpPage($core.String v) {
    $_setString(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasJumpPage() => $_has(23);
  @$pb.TagNumber(24)
  void clearJumpPage() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get unlockLimit => $_getSZ(24);
  @$pb.TagNumber(25)
  set unlockLimit($core.String v) {
    $_setString(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasUnlockLimit() => $_has(24);
  @$pb.TagNumber(25)
  void clearUnlockLimit() => clearField(25);

  @$pb.TagNumber(26)
  $core.String get extId => $_getSZ(25);
  @$pb.TagNumber(26)
  set extId($core.String v) {
    $_setString(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasExtId() => $_has(25);
  @$pb.TagNumber(26)
  void clearExtId() => clearField(26);

  @$pb.TagNumber(27)
  $core.String get isSkin => $_getSZ(26);
  @$pb.TagNumber(27)
  set isSkin($core.String v) {
    $_setString(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasIsSkin() => $_has(26);
  @$pb.TagNumber(27)
  void clearIsSkin() => clearField(27);

  @$pb.TagNumber(28)
  $core.String get isCombo => $_getSZ(27);
  @$pb.TagNumber(28)
  set isCombo($core.String v) {
    $_setString(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasIsCombo() => $_has(27);
  @$pb.TagNumber(28)
  void clearIsCombo() => clearField(28);

  @$pb.TagNumber(29)
  $core.String get version => $_getSZ(28);
  @$pb.TagNumber(29)
  set version($core.String v) {
    $_setString(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasVersion() => $_has(28);
  @$pb.TagNumber(29)
  void clearVersion() => clearField(29);

  @$pb.TagNumber(30)
  $core.String get vapType => $_getSZ(29);
  @$pb.TagNumber(30)
  set vapType($core.String v) {
    $_setString(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasVapType() => $_has(29);
  @$pb.TagNumber(30)
  void clearVapType() => clearField(30);

  @$pb.TagNumber(31)
  $core.String get vapSize => $_getSZ(30);
  @$pb.TagNumber(31)
  set vapSize($core.String v) {
    $_setString(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasVapSize() => $_has(30);
  @$pb.TagNumber(31)
  void clearVapSize() => clearField(31);

  @$pb.TagNumber(32)
  $core.String get vapHeader => $_getSZ(31);
  @$pb.TagNumber(32)
  set vapHeader($core.String v) {
    $_setString(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasVapHeader() => $_has(31);
  @$pb.TagNumber(32)
  void clearVapHeader() => clearField(32);

  @$pb.TagNumber(33)
  $core.String get vapHeaderStart => $_getSZ(32);
  @$pb.TagNumber(33)
  set vapHeaderStart($core.String v) {
    $_setString(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasVapHeaderStart() => $_has(32);
  @$pb.TagNumber(33)
  void clearVapHeaderStart() => clearField(33);

  @$pb.TagNumber(34)
  $core.String get vapHeaderEnd => $_getSZ(33);
  @$pb.TagNumber(34)
  set vapHeaderEnd($core.String v) {
    $_setString(33, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasVapHeaderEnd() => $_has(33);
  @$pb.TagNumber(34)
  void clearVapHeaderEnd() => clearField(34);

  @$pb.TagNumber(35)
  $core.String get magic => $_getSZ(34);
  @$pb.TagNumber(35)
  set magic($core.String v) {
    $_setString(34, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasMagic() => $_has(34);
  @$pb.TagNumber(35)
  void clearMagic() => clearField(35);

  @$pb.TagNumber(36)
  $core.String get magicSize => $_getSZ(35);
  @$pb.TagNumber(36)
  set magicSize($core.String v) {
    $_setString(35, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasMagicSize() => $_has(35);
  @$pb.TagNumber(36)
  void clearMagicSize() => clearField(36);

  @$pb.TagNumber(37)
  $core.String get category => $_getSZ(36);
  @$pb.TagNumber(37)
  set category($core.String v) {
    $_setString(36, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasCategory() => $_has(36);
  @$pb.TagNumber(37)
  void clearCategory() => clearField(37);

  @$pb.TagNumber(38)
  $core.String get appId => $_getSZ(37);
  @$pb.TagNumber(38)
  set appId($core.String v) {
    $_setString(37, v);
  }

  @$pb.TagNumber(38)
  $core.bool hasAppId() => $_has(37);
  @$pb.TagNumber(38)
  void clearAppId() => clearField(38);

  @$pb.TagNumber(39)
  $core.String get isAppPublic => $_getSZ(38);
  @$pb.TagNumber(39)
  set isAppPublic($core.String v) {
    $_setString(38, v);
  }

  @$pb.TagNumber(39)
  $core.bool hasIsAppPublic() => $_has(38);
  @$pb.TagNumber(39)
  void clearIsAppPublic() => clearField(39);
}

class RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList
    extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.GrabmicInfo.GrabmicInfoMap.EffectList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'none_grab')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grab_success')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grab_fail')
    ..hasRequiredFields = false;

  RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList._() : super();
  factory RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList({
    $core.String? noneGrab,
    $core.String? grabSuccess,
    $core.String? grabFail,
  }) {
    final _result = create();
    if (noneGrab != null) {
      _result.noneGrab = noneGrab;
    }
    if (grabSuccess != null) {
      _result.grabSuccess = grabSuccess;
    }
    if (grabFail != null) {
      _result.grabFail = grabFail;
    }
    return _result;
  }
  factory RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList.fromJson(
          $core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList clone() =>
      RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList()
        ..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList copyWith(
          void Function(RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList)
              updates) =>
      super.copyWith((message) => updates(
              message as RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList))
          as RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList create() =>
      RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList._();
  RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList createEmptyInstance() =>
      create();
  static $pb.PbList<RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList>
      createRepeated() =>
          $pb.PbList<RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList>(create);
  static RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get noneGrab => $_getSZ(0);
  @$pb.TagNumber(1)
  set noneGrab($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNoneGrab() => $_has(0);
  @$pb.TagNumber(1)
  void clearNoneGrab() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get grabSuccess => $_getSZ(1);
  @$pb.TagNumber(2)
  set grabSuccess($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGrabSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearGrabSuccess() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get grabFail => $_getSZ(2);
  @$pb.TagNumber(3)
  set grabFail($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGrabFail() => $_has(2);
  @$pb.TagNumber(3)
  void clearGrabFail() => clearField(3);
}

class RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.GrabmicInfo.GrabmicInfoMap.Song',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singer_name')
    ..pc<$0.ListValue>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lyric',
        $pb.PbFieldType.PM,
        subBuilder: $0.ListValue.create)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'path')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uploader_uid')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uploader_name')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tag')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'play_count')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'good_count')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bad_count')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sing_success_count')
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sing_fail_count')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user_is_auth')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'area')
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'app_id')
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sing_mode')
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uploader_icon')
    ..hasRequiredFields = false;

  RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song._() : super();
  factory RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song({
    $core.String? id,
    $core.String? name,
    $core.String? singerName,
    $core.Iterable<$0.ListValue>? lyric,
    $core.String? path,
    $core.String? duration,
    $core.String? uploaderUid,
    $core.String? uploaderName,
    $core.String? tag,
    $core.String? status,
    $core.String? playCount,
    $core.String? goodCount,
    $core.String? badCount,
    $core.String? singSuccessCount,
    $core.String? singFailCount,
    $core.String? dateline,
    $core.String? score,
    $core.String? userIsAuth,
    $core.String? area,
    $core.String? appId,
    $core.String? singMode,
    $core.String? uploaderIcon,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (singerName != null) {
      _result.singerName = singerName;
    }
    if (lyric != null) {
      _result.lyric.addAll(lyric);
    }
    if (path != null) {
      _result.path = path;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (uploaderUid != null) {
      _result.uploaderUid = uploaderUid;
    }
    if (uploaderName != null) {
      _result.uploaderName = uploaderName;
    }
    if (tag != null) {
      _result.tag = tag;
    }
    if (status != null) {
      _result.status = status;
    }
    if (playCount != null) {
      _result.playCount = playCount;
    }
    if (goodCount != null) {
      _result.goodCount = goodCount;
    }
    if (badCount != null) {
      _result.badCount = badCount;
    }
    if (singSuccessCount != null) {
      _result.singSuccessCount = singSuccessCount;
    }
    if (singFailCount != null) {
      _result.singFailCount = singFailCount;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (score != null) {
      _result.score = score;
    }
    if (userIsAuth != null) {
      _result.userIsAuth = userIsAuth;
    }
    if (area != null) {
      _result.area = area;
    }
    if (appId != null) {
      _result.appId = appId;
    }
    if (singMode != null) {
      _result.singMode = singMode;
    }
    if (uploaderIcon != null) {
      _result.uploaderIcon = uploaderIcon;
    }
    return _result;
  }
  factory RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song clone() =>
      RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song copyWith(
          void Function(RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song))
          as RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song create() =>
      RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song._();
  RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song>
      createRepeated() =>
          $pb.PbList<RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song>(create);
  static RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
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
  $core.String get singerName => $_getSZ(2);
  @$pb.TagNumber(3)
  set singerName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSingerName() => $_has(2);
  @$pb.TagNumber(3)
  void clearSingerName() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$0.ListValue> get lyric => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get path => $_getSZ(4);
  @$pb.TagNumber(5)
  set path($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPath() => $_has(4);
  @$pb.TagNumber(5)
  void clearPath() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get duration => $_getSZ(5);
  @$pb.TagNumber(6)
  set duration($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearDuration() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get uploaderUid => $_getSZ(6);
  @$pb.TagNumber(7)
  set uploaderUid($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUploaderUid() => $_has(6);
  @$pb.TagNumber(7)
  void clearUploaderUid() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get uploaderName => $_getSZ(7);
  @$pb.TagNumber(8)
  set uploaderName($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasUploaderName() => $_has(7);
  @$pb.TagNumber(8)
  void clearUploaderName() => clearField(8);

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
  $core.String get status => $_getSZ(9);
  @$pb.TagNumber(10)
  set status($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasStatus() => $_has(9);
  @$pb.TagNumber(10)
  void clearStatus() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get playCount => $_getSZ(10);
  @$pb.TagNumber(11)
  set playCount($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasPlayCount() => $_has(10);
  @$pb.TagNumber(11)
  void clearPlayCount() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get goodCount => $_getSZ(11);
  @$pb.TagNumber(12)
  set goodCount($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasGoodCount() => $_has(11);
  @$pb.TagNumber(12)
  void clearGoodCount() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get badCount => $_getSZ(12);
  @$pb.TagNumber(13)
  set badCount($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasBadCount() => $_has(12);
  @$pb.TagNumber(13)
  void clearBadCount() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get singSuccessCount => $_getSZ(13);
  @$pb.TagNumber(14)
  set singSuccessCount($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasSingSuccessCount() => $_has(13);
  @$pb.TagNumber(14)
  void clearSingSuccessCount() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get singFailCount => $_getSZ(14);
  @$pb.TagNumber(15)
  set singFailCount($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasSingFailCount() => $_has(14);
  @$pb.TagNumber(15)
  void clearSingFailCount() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get dateline => $_getSZ(15);
  @$pb.TagNumber(16)
  set dateline($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasDateline() => $_has(15);
  @$pb.TagNumber(16)
  void clearDateline() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get score => $_getSZ(16);
  @$pb.TagNumber(17)
  set score($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasScore() => $_has(16);
  @$pb.TagNumber(17)
  void clearScore() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get userIsAuth => $_getSZ(17);
  @$pb.TagNumber(18)
  set userIsAuth($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasUserIsAuth() => $_has(17);
  @$pb.TagNumber(18)
  void clearUserIsAuth() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get area => $_getSZ(18);
  @$pb.TagNumber(19)
  set area($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasArea() => $_has(18);
  @$pb.TagNumber(19)
  void clearArea() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get appId => $_getSZ(19);
  @$pb.TagNumber(20)
  set appId($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasAppId() => $_has(19);
  @$pb.TagNumber(20)
  void clearAppId() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get singMode => $_getSZ(20);
  @$pb.TagNumber(21)
  set singMode($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasSingMode() => $_has(20);
  @$pb.TagNumber(21)
  void clearSingMode() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get uploaderIcon => $_getSZ(21);
  @$pb.TagNumber(22)
  set uploaderIcon($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasUploaderIcon() => $_has(21);
  @$pb.TagNumber(22)
  void clearUploaderIcon() => clearField(22);
}

class RoomRefersh_GrabmicInfo_GrabmicInfoMap extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.GrabmicInfo.GrabmicInfoMap',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOM<RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'effect_list',
        subBuilder: RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'max_count',
        $pb.PbFieldType.OU3)
    ..aOM<RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'song',
        subBuilder: RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..pc<RoomRefersh_Rank>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_Rank.create)
    ..aOM<$0.Value>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current_origin',
        subBuilder: $0.Value.create)
    ..pPS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grab_uids')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'start_grab_second',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grab_max_second',
        $pb.PbFieldType.OU3)
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'song_result')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'song_second',
        $pb.PbFieldType.OU3)
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sub_title')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'effect_info')
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'count',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_GrabmicInfo_GrabmicInfoMap._() : super();
  factory RoomRefersh_GrabmicInfo_GrabmicInfoMap({
    RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList? effectList,
    $core.int? maxCount,
    RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song? song,
    $core.String? title,
    $core.Iterable<RoomRefersh_Rank>? rank,
    $0.Value? currentOrigin,
    $core.Iterable<$core.String>? grabUids,
    $core.int? startGrabSecond,
    $core.String? type,
    $core.int? grabMaxSecond,
    $core.String? songResult,
    $core.int? songSecond,
    $core.String? subTitle,
    $core.String? effectInfo,
    $core.int? count,
  }) {
    final _result = create();
    if (effectList != null) {
      _result.effectList = effectList;
    }
    if (maxCount != null) {
      _result.maxCount = maxCount;
    }
    if (song != null) {
      _result.song = song;
    }
    if (title != null) {
      _result.title = title;
    }
    if (rank != null) {
      _result.rank.addAll(rank);
    }
    if (currentOrigin != null) {
      _result.currentOrigin = currentOrigin;
    }
    if (grabUids != null) {
      _result.grabUids.addAll(grabUids);
    }
    if (startGrabSecond != null) {
      _result.startGrabSecond = startGrabSecond;
    }
    if (type != null) {
      _result.type = type;
    }
    if (grabMaxSecond != null) {
      _result.grabMaxSecond = grabMaxSecond;
    }
    if (songResult != null) {
      _result.songResult = songResult;
    }
    if (songSecond != null) {
      _result.songSecond = songSecond;
    }
    if (subTitle != null) {
      _result.subTitle = subTitle;
    }
    if (effectInfo != null) {
      _result.effectInfo = effectInfo;
    }
    if (count != null) {
      _result.count = count;
    }
    return _result;
  }
  factory RoomRefersh_GrabmicInfo_GrabmicInfoMap.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_GrabmicInfo_GrabmicInfoMap.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_GrabmicInfo_GrabmicInfoMap clone() =>
      RoomRefersh_GrabmicInfo_GrabmicInfoMap()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_GrabmicInfo_GrabmicInfoMap copyWith(
          void Function(RoomRefersh_GrabmicInfo_GrabmicInfoMap) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_GrabmicInfo_GrabmicInfoMap))
          as RoomRefersh_GrabmicInfo_GrabmicInfoMap; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GrabmicInfo_GrabmicInfoMap create() =>
      RoomRefersh_GrabmicInfo_GrabmicInfoMap._();
  RoomRefersh_GrabmicInfo_GrabmicInfoMap createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_GrabmicInfo_GrabmicInfoMap> createRepeated() =>
      $pb.PbList<RoomRefersh_GrabmicInfo_GrabmicInfoMap>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GrabmicInfo_GrabmicInfoMap getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_GrabmicInfo_GrabmicInfoMap>(create);
  static RoomRefersh_GrabmicInfo_GrabmicInfoMap? _defaultInstance;

  @$pb.TagNumber(1)
  RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList get effectList => $_getN(0);
  @$pb.TagNumber(1)
  set effectList(RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEffectList() => $_has(0);
  @$pb.TagNumber(1)
  void clearEffectList() => clearField(1);
  @$pb.TagNumber(1)
  RoomRefersh_GrabmicInfo_GrabmicInfoMap_EffectList ensureEffectList() =>
      $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get maxCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set maxCount($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMaxCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxCount() => clearField(2);

  @$pb.TagNumber(3)
  RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song get song => $_getN(2);
  @$pb.TagNumber(3)
  set song(RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSong() => $_has(2);
  @$pb.TagNumber(3)
  void clearSong() => clearField(3);
  @$pb.TagNumber(3)
  RoomRefersh_GrabmicInfo_GrabmicInfoMap_Song ensureSong() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<RoomRefersh_Rank> get rank => $_getList(4);

  @$pb.TagNumber(6)
  $0.Value get currentOrigin => $_getN(5);
  @$pb.TagNumber(6)
  set currentOrigin($0.Value v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCurrentOrigin() => $_has(5);
  @$pb.TagNumber(6)
  void clearCurrentOrigin() => clearField(6);
  @$pb.TagNumber(6)
  $0.Value ensureCurrentOrigin() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.List<$core.String> get grabUids => $_getList(6);

  @$pb.TagNumber(8)
  $core.int get startGrabSecond => $_getIZ(7);
  @$pb.TagNumber(8)
  set startGrabSecond($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasStartGrabSecond() => $_has(7);
  @$pb.TagNumber(8)
  void clearStartGrabSecond() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get type => $_getSZ(8);
  @$pb.TagNumber(9)
  set type($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasType() => $_has(8);
  @$pb.TagNumber(9)
  void clearType() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get grabMaxSecond => $_getIZ(9);
  @$pb.TagNumber(10)
  set grabMaxSecond($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasGrabMaxSecond() => $_has(9);
  @$pb.TagNumber(10)
  void clearGrabMaxSecond() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get songResult => $_getSZ(10);
  @$pb.TagNumber(11)
  set songResult($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasSongResult() => $_has(10);
  @$pb.TagNumber(11)
  void clearSongResult() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get songSecond => $_getIZ(11);
  @$pb.TagNumber(12)
  set songSecond($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasSongSecond() => $_has(11);
  @$pb.TagNumber(12)
  void clearSongSecond() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get subTitle => $_getSZ(12);
  @$pb.TagNumber(13)
  set subTitle($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasSubTitle() => $_has(12);
  @$pb.TagNumber(13)
  void clearSubTitle() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get effectInfo => $_getSZ(13);
  @$pb.TagNumber(14)
  set effectInfo($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasEffectInfo() => $_has(13);
  @$pb.TagNumber(14)
  void clearEffectInfo() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get count => $_getIZ(14);
  @$pb.TagNumber(15)
  set count($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasCount() => $_has(14);
  @$pb.TagNumber(15)
  void clearCount() => clearField(15);
}

class RoomRefersh_GrabmicInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.GrabmicInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'grabmic_version',
        $pb.PbFieldType.OU3)
    ..aOM<RoomRefersh_GrabmicInfo_GrabmicInfoMap>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'map',
        subBuilder: RoomRefersh_GrabmicInfo_GrabmicInfoMap.create)
    ..pc<RoomRefersh_SceneGift>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'scene_gift',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_SceneGift.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..pc<RoomRefersh_GrabmicInfo_GamingList>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gaming_list',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_GrabmicInfo_GamingList.create)
    ..hasRequiredFields = false;

  RoomRefersh_GrabmicInfo._() : super();
  factory RoomRefersh_GrabmicInfo({
    $core.int? grabmicVersion,
    RoomRefersh_GrabmicInfo_GrabmicInfoMap? map,
    $core.Iterable<RoomRefersh_SceneGift>? sceneGift,
    $core.String? state,
    $core.Iterable<RoomRefersh_GrabmicInfo_GamingList>? gamingList,
  }) {
    final _result = create();
    if (grabmicVersion != null) {
      _result.grabmicVersion = grabmicVersion;
    }
    if (map != null) {
      _result.map = map;
    }
    if (sceneGift != null) {
      _result.sceneGift.addAll(sceneGift);
    }
    if (state != null) {
      _result.state = state;
    }
    if (gamingList != null) {
      _result.gamingList.addAll(gamingList);
    }
    return _result;
  }
  factory RoomRefersh_GrabmicInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_GrabmicInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_GrabmicInfo clone() =>
      RoomRefersh_GrabmicInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_GrabmicInfo copyWith(
          void Function(RoomRefersh_GrabmicInfo) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_GrabmicInfo))
          as RoomRefersh_GrabmicInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GrabmicInfo create() => RoomRefersh_GrabmicInfo._();
  RoomRefersh_GrabmicInfo createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_GrabmicInfo> createRepeated() =>
      $pb.PbList<RoomRefersh_GrabmicInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GrabmicInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_GrabmicInfo>(create);
  static RoomRefersh_GrabmicInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get grabmicVersion => $_getIZ(0);
  @$pb.TagNumber(1)
  set grabmicVersion($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGrabmicVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearGrabmicVersion() => clearField(1);

  @$pb.TagNumber(2)
  RoomRefersh_GrabmicInfo_GrabmicInfoMap get map => $_getN(1);
  @$pb.TagNumber(2)
  set map(RoomRefersh_GrabmicInfo_GrabmicInfoMap v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMap() => $_has(1);
  @$pb.TagNumber(2)
  void clearMap() => clearField(2);
  @$pb.TagNumber(2)
  RoomRefersh_GrabmicInfo_GrabmicInfoMap ensureMap() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<RoomRefersh_SceneGift> get sceneGift => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get state => $_getSZ(3);
  @$pb.TagNumber(4)
  set state($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<RoomRefersh_GrabmicInfo_GamingList> get gamingList => $_getList(4);
}

class RoomRefersh_SceneGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.SceneGift',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name_zh_tw')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name_en')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'display')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sub_display')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift_type')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'income_type')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'with_end')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'size')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'size_big')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ordering')
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleted',
        $pb.PbFieldType.OU3)
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'naming')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'xratio')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'xtype')
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'excludes')
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tag_url')
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tag_ids')
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..aOS(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jump_page')
    ..aOS(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unlock_limit')
    ..aOS(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ext_id')
    ..aOS(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_skin')
    ..aOS(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_combo')
    ..aOS(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version')
    ..aOS(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vap_type')
    ..aOS(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vap_size')
    ..aOS(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vap_header')
    ..aOS(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vap_header_start')
    ..aOS(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vap_header_end')
    ..aOS(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'magic')
    ..aOS(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'magic_size')
    ..aOS(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category')
    ..aOS(
        38,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'app_id')
    ..aOS(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_app_public')
    ..hasRequiredFields = false;

  RoomRefersh_SceneGift._() : super();
  factory RoomRefersh_SceneGift({
    $core.String? id,
    $core.String? name,
    $core.String? nameZhTw,
    $core.String? nameEn,
    $core.String? price,
    $core.String? display,
    $core.String? subDisplay,
    $core.String? type,
    $core.String? giftType,
    $core.String? incomeType,
    $core.String? withEnd,
    $core.String? size,
    $core.String? sizeBig,
    $core.String? ordering,
    $core.int? deleted,
    $core.String? title,
    $core.String? naming,
    $core.String? xratio,
    $core.String? xtype,
    $core.String? excludes,
    $core.String? tagUrl,
    $core.String? tagIds,
    $core.String? description,
    $core.String? jumpPage,
    $core.String? unlockLimit,
    $core.String? extId,
    $core.String? isSkin,
    $core.String? isCombo,
    $core.String? version,
    $core.String? vapType,
    $core.String? vapSize,
    $core.String? vapHeader,
    $core.String? vapHeaderStart,
    $core.String? vapHeaderEnd,
    $core.String? magic,
    $core.String? magicSize,
    $core.String? category,
    $core.String? appId,
    $core.String? isAppPublic,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (nameZhTw != null) {
      _result.nameZhTw = nameZhTw;
    }
    if (nameEn != null) {
      _result.nameEn = nameEn;
    }
    if (price != null) {
      _result.price = price;
    }
    if (display != null) {
      _result.display = display;
    }
    if (subDisplay != null) {
      _result.subDisplay = subDisplay;
    }
    if (type != null) {
      _result.type = type;
    }
    if (giftType != null) {
      _result.giftType = giftType;
    }
    if (incomeType != null) {
      _result.incomeType = incomeType;
    }
    if (withEnd != null) {
      _result.withEnd = withEnd;
    }
    if (size != null) {
      _result.size = size;
    }
    if (sizeBig != null) {
      _result.sizeBig = sizeBig;
    }
    if (ordering != null) {
      _result.ordering = ordering;
    }
    if (deleted != null) {
      _result.deleted = deleted;
    }
    if (title != null) {
      _result.title = title;
    }
    if (naming != null) {
      _result.naming = naming;
    }
    if (xratio != null) {
      _result.xratio = xratio;
    }
    if (xtype != null) {
      _result.xtype = xtype;
    }
    if (excludes != null) {
      _result.excludes = excludes;
    }
    if (tagUrl != null) {
      _result.tagUrl = tagUrl;
    }
    if (tagIds != null) {
      _result.tagIds = tagIds;
    }
    if (description != null) {
      _result.description = description;
    }
    if (jumpPage != null) {
      _result.jumpPage = jumpPage;
    }
    if (unlockLimit != null) {
      _result.unlockLimit = unlockLimit;
    }
    if (extId != null) {
      _result.extId = extId;
    }
    if (isSkin != null) {
      _result.isSkin = isSkin;
    }
    if (isCombo != null) {
      _result.isCombo = isCombo;
    }
    if (version != null) {
      _result.version = version;
    }
    if (vapType != null) {
      _result.vapType = vapType;
    }
    if (vapSize != null) {
      _result.vapSize = vapSize;
    }
    if (vapHeader != null) {
      _result.vapHeader = vapHeader;
    }
    if (vapHeaderStart != null) {
      _result.vapHeaderStart = vapHeaderStart;
    }
    if (vapHeaderEnd != null) {
      _result.vapHeaderEnd = vapHeaderEnd;
    }
    if (magic != null) {
      _result.magic = magic;
    }
    if (magicSize != null) {
      _result.magicSize = magicSize;
    }
    if (category != null) {
      _result.category = category;
    }
    if (appId != null) {
      _result.appId = appId;
    }
    if (isAppPublic != null) {
      _result.isAppPublic = isAppPublic;
    }
    return _result;
  }
  factory RoomRefersh_SceneGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_SceneGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_SceneGift clone() =>
      RoomRefersh_SceneGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_SceneGift copyWith(
          void Function(RoomRefersh_SceneGift) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_SceneGift))
          as RoomRefersh_SceneGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_SceneGift create() => RoomRefersh_SceneGift._();
  RoomRefersh_SceneGift createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_SceneGift> createRepeated() =>
      $pb.PbList<RoomRefersh_SceneGift>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_SceneGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_SceneGift>(create);
  static RoomRefersh_SceneGift? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
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
  $core.String get nameZhTw => $_getSZ(2);
  @$pb.TagNumber(3)
  set nameZhTw($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNameZhTw() => $_has(2);
  @$pb.TagNumber(3)
  void clearNameZhTw() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get nameEn => $_getSZ(3);
  @$pb.TagNumber(4)
  set nameEn($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasNameEn() => $_has(3);
  @$pb.TagNumber(4)
  void clearNameEn() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get price => $_getSZ(4);
  @$pb.TagNumber(5)
  set price($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrice() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get display => $_getSZ(5);
  @$pb.TagNumber(6)
  set display($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDisplay() => $_has(5);
  @$pb.TagNumber(6)
  void clearDisplay() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get subDisplay => $_getSZ(6);
  @$pb.TagNumber(7)
  set subDisplay($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSubDisplay() => $_has(6);
  @$pb.TagNumber(7)
  void clearSubDisplay() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get type => $_getSZ(7);
  @$pb.TagNumber(8)
  set type($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasType() => $_has(7);
  @$pb.TagNumber(8)
  void clearType() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get giftType => $_getSZ(8);
  @$pb.TagNumber(9)
  set giftType($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasGiftType() => $_has(8);
  @$pb.TagNumber(9)
  void clearGiftType() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get incomeType => $_getSZ(9);
  @$pb.TagNumber(10)
  set incomeType($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasIncomeType() => $_has(9);
  @$pb.TagNumber(10)
  void clearIncomeType() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get withEnd => $_getSZ(10);
  @$pb.TagNumber(11)
  set withEnd($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasWithEnd() => $_has(10);
  @$pb.TagNumber(11)
  void clearWithEnd() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get size => $_getSZ(11);
  @$pb.TagNumber(12)
  set size($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasSize() => $_has(11);
  @$pb.TagNumber(12)
  void clearSize() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get sizeBig => $_getSZ(12);
  @$pb.TagNumber(13)
  set sizeBig($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasSizeBig() => $_has(12);
  @$pb.TagNumber(13)
  void clearSizeBig() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get ordering => $_getSZ(13);
  @$pb.TagNumber(14)
  set ordering($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasOrdering() => $_has(13);
  @$pb.TagNumber(14)
  void clearOrdering() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get deleted => $_getIZ(14);
  @$pb.TagNumber(15)
  set deleted($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasDeleted() => $_has(14);
  @$pb.TagNumber(15)
  void clearDeleted() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get title => $_getSZ(15);
  @$pb.TagNumber(16)
  set title($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasTitle() => $_has(15);
  @$pb.TagNumber(16)
  void clearTitle() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get naming => $_getSZ(16);
  @$pb.TagNumber(17)
  set naming($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasNaming() => $_has(16);
  @$pb.TagNumber(17)
  void clearNaming() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get xratio => $_getSZ(17);
  @$pb.TagNumber(18)
  set xratio($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasXratio() => $_has(17);
  @$pb.TagNumber(18)
  void clearXratio() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get xtype => $_getSZ(18);
  @$pb.TagNumber(19)
  set xtype($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasXtype() => $_has(18);
  @$pb.TagNumber(19)
  void clearXtype() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get excludes => $_getSZ(19);
  @$pb.TagNumber(20)
  set excludes($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasExcludes() => $_has(19);
  @$pb.TagNumber(20)
  void clearExcludes() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get tagUrl => $_getSZ(20);
  @$pb.TagNumber(21)
  set tagUrl($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasTagUrl() => $_has(20);
  @$pb.TagNumber(21)
  void clearTagUrl() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get tagIds => $_getSZ(21);
  @$pb.TagNumber(22)
  set tagIds($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasTagIds() => $_has(21);
  @$pb.TagNumber(22)
  void clearTagIds() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get description => $_getSZ(22);
  @$pb.TagNumber(23)
  set description($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasDescription() => $_has(22);
  @$pb.TagNumber(23)
  void clearDescription() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get jumpPage => $_getSZ(23);
  @$pb.TagNumber(24)
  set jumpPage($core.String v) {
    $_setString(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasJumpPage() => $_has(23);
  @$pb.TagNumber(24)
  void clearJumpPage() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get unlockLimit => $_getSZ(24);
  @$pb.TagNumber(25)
  set unlockLimit($core.String v) {
    $_setString(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasUnlockLimit() => $_has(24);
  @$pb.TagNumber(25)
  void clearUnlockLimit() => clearField(25);

  @$pb.TagNumber(26)
  $core.String get extId => $_getSZ(25);
  @$pb.TagNumber(26)
  set extId($core.String v) {
    $_setString(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasExtId() => $_has(25);
  @$pb.TagNumber(26)
  void clearExtId() => clearField(26);

  @$pb.TagNumber(27)
  $core.String get isSkin => $_getSZ(26);
  @$pb.TagNumber(27)
  set isSkin($core.String v) {
    $_setString(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasIsSkin() => $_has(26);
  @$pb.TagNumber(27)
  void clearIsSkin() => clearField(27);

  @$pb.TagNumber(28)
  $core.String get isCombo => $_getSZ(27);
  @$pb.TagNumber(28)
  set isCombo($core.String v) {
    $_setString(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasIsCombo() => $_has(27);
  @$pb.TagNumber(28)
  void clearIsCombo() => clearField(28);

  @$pb.TagNumber(29)
  $core.String get version => $_getSZ(28);
  @$pb.TagNumber(29)
  set version($core.String v) {
    $_setString(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasVersion() => $_has(28);
  @$pb.TagNumber(29)
  void clearVersion() => clearField(29);

  @$pb.TagNumber(30)
  $core.String get vapType => $_getSZ(29);
  @$pb.TagNumber(30)
  set vapType($core.String v) {
    $_setString(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasVapType() => $_has(29);
  @$pb.TagNumber(30)
  void clearVapType() => clearField(30);

  @$pb.TagNumber(31)
  $core.String get vapSize => $_getSZ(30);
  @$pb.TagNumber(31)
  set vapSize($core.String v) {
    $_setString(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasVapSize() => $_has(30);
  @$pb.TagNumber(31)
  void clearVapSize() => clearField(31);

  @$pb.TagNumber(32)
  $core.String get vapHeader => $_getSZ(31);
  @$pb.TagNumber(32)
  set vapHeader($core.String v) {
    $_setString(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasVapHeader() => $_has(31);
  @$pb.TagNumber(32)
  void clearVapHeader() => clearField(32);

  @$pb.TagNumber(33)
  $core.String get vapHeaderStart => $_getSZ(32);
  @$pb.TagNumber(33)
  set vapHeaderStart($core.String v) {
    $_setString(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasVapHeaderStart() => $_has(32);
  @$pb.TagNumber(33)
  void clearVapHeaderStart() => clearField(33);

  @$pb.TagNumber(34)
  $core.String get vapHeaderEnd => $_getSZ(33);
  @$pb.TagNumber(34)
  set vapHeaderEnd($core.String v) {
    $_setString(33, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasVapHeaderEnd() => $_has(33);
  @$pb.TagNumber(34)
  void clearVapHeaderEnd() => clearField(34);

  @$pb.TagNumber(35)
  $core.String get magic => $_getSZ(34);
  @$pb.TagNumber(35)
  set magic($core.String v) {
    $_setString(34, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasMagic() => $_has(34);
  @$pb.TagNumber(35)
  void clearMagic() => clearField(35);

  @$pb.TagNumber(36)
  $core.String get magicSize => $_getSZ(35);
  @$pb.TagNumber(36)
  set magicSize($core.String v) {
    $_setString(35, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasMagicSize() => $_has(35);
  @$pb.TagNumber(36)
  void clearMagicSize() => clearField(36);

  @$pb.TagNumber(37)
  $core.String get category => $_getSZ(36);
  @$pb.TagNumber(37)
  set category($core.String v) {
    $_setString(36, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasCategory() => $_has(36);
  @$pb.TagNumber(37)
  void clearCategory() => clearField(37);

  @$pb.TagNumber(38)
  $core.String get appId => $_getSZ(37);
  @$pb.TagNumber(38)
  set appId($core.String v) {
    $_setString(37, v);
  }

  @$pb.TagNumber(38)
  $core.bool hasAppId() => $_has(37);
  @$pb.TagNumber(38)
  void clearAppId() => clearField(38);

  @$pb.TagNumber(39)
  $core.String get isAppPublic => $_getSZ(38);
  @$pb.TagNumber(39)
  set isAppPublic($core.String v) {
    $_setString(38, v);
  }

  @$pb.TagNumber(39)
  $core.bool hasIsAppPublic() => $_has(38);
  @$pb.TagNumber(39)
  void clearIsAppPublic() => clearField(39);
}

class RoomRefersh_RtcExtra_ExtraList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.RtcExtra.ExtraList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stream_id')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mic',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'zego_link_type')
    ..hasRequiredFields = false;

  RoomRefersh_RtcExtra_ExtraList._() : super();
  factory RoomRefersh_RtcExtra_ExtraList({
    $core.String? rid,
    $core.String? uid,
    $core.String? streamId,
    $core.int? mic,
    $core.String? zegoLinkType,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (streamId != null) {
      _result.streamId = streamId;
    }
    if (mic != null) {
      _result.mic = mic;
    }
    if (zegoLinkType != null) {
      _result.zegoLinkType = zegoLinkType;
    }
    return _result;
  }
  factory RoomRefersh_RtcExtra_ExtraList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_RtcExtra_ExtraList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_RtcExtra_ExtraList clone() =>
      RoomRefersh_RtcExtra_ExtraList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_RtcExtra_ExtraList copyWith(
          void Function(RoomRefersh_RtcExtra_ExtraList) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_RtcExtra_ExtraList))
          as RoomRefersh_RtcExtra_ExtraList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RtcExtra_ExtraList create() =>
      RoomRefersh_RtcExtra_ExtraList._();
  RoomRefersh_RtcExtra_ExtraList createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_RtcExtra_ExtraList> createRepeated() =>
      $pb.PbList<RoomRefersh_RtcExtra_ExtraList>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RtcExtra_ExtraList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_RtcExtra_ExtraList>(create);
  static RoomRefersh_RtcExtra_ExtraList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get rid => $_getSZ(0);
  @$pb.TagNumber(1)
  set rid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uid($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get streamId => $_getSZ(2);
  @$pb.TagNumber(3)
  set streamId($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasStreamId() => $_has(2);
  @$pb.TagNumber(3)
  void clearStreamId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get mic => $_getIZ(3);
  @$pb.TagNumber(4)
  set mic($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMic() => $_has(3);
  @$pb.TagNumber(4)
  void clearMic() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get zegoLinkType => $_getSZ(4);
  @$pb.TagNumber(5)
  set zegoLinkType($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasZegoLinkType() => $_has(4);
  @$pb.TagNumber(5)
  void clearZegoLinkType() => clearField(5);
}

class RoomRefersh_RtcExtra extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.RtcExtra',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..pc<RoomRefersh_RtcExtra_ExtraList>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extra_list',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_RtcExtra_ExtraList.create)
    ..hasRequiredFields = false;

  RoomRefersh_RtcExtra._() : super();
  factory RoomRefersh_RtcExtra({
    $core.Iterable<RoomRefersh_RtcExtra_ExtraList>? extraList,
  }) {
    final _result = create();
    if (extraList != null) {
      _result.extraList.addAll(extraList);
    }
    return _result;
  }
  factory RoomRefersh_RtcExtra.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_RtcExtra.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_RtcExtra clone() =>
      RoomRefersh_RtcExtra()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_RtcExtra copyWith(void Function(RoomRefersh_RtcExtra) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_RtcExtra))
          as RoomRefersh_RtcExtra; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RtcExtra create() => RoomRefersh_RtcExtra._();
  RoomRefersh_RtcExtra createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_RtcExtra> createRepeated() =>
      $pb.PbList<RoomRefersh_RtcExtra>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RtcExtra getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_RtcExtra>(create);
  static RoomRefersh_RtcExtra? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RoomRefersh_RtcExtra_ExtraList> get extraList => $_getList(0);
}

class RoomRefersh_GuessQueueData_Replay_OwnerInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.GuessQueueData.Replay.OwnerInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
            : 'icon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'word')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'line_id')
    ..hasRequiredFields = false;

  RoomRefersh_GuessQueueData_Replay_OwnerInfo._() : super();
  factory RoomRefersh_GuessQueueData_Replay_OwnerInfo({
    $core.String? uid,
    $core.String? icon,
    $core.String? word,
    $core.String? lineId,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (word != null) {
      _result.word = word;
    }
    if (lineId != null) {
      _result.lineId = lineId;
    }
    return _result;
  }
  factory RoomRefersh_GuessQueueData_Replay_OwnerInfo.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_GuessQueueData_Replay_OwnerInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_GuessQueueData_Replay_OwnerInfo clone() =>
      RoomRefersh_GuessQueueData_Replay_OwnerInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_GuessQueueData_Replay_OwnerInfo copyWith(
          void Function(RoomRefersh_GuessQueueData_Replay_OwnerInfo) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_GuessQueueData_Replay_OwnerInfo))
          as RoomRefersh_GuessQueueData_Replay_OwnerInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GuessQueueData_Replay_OwnerInfo create() =>
      RoomRefersh_GuessQueueData_Replay_OwnerInfo._();
  RoomRefersh_GuessQueueData_Replay_OwnerInfo createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_GuessQueueData_Replay_OwnerInfo>
      createRepeated() =>
          $pb.PbList<RoomRefersh_GuessQueueData_Replay_OwnerInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GuessQueueData_Replay_OwnerInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_GuessQueueData_Replay_OwnerInfo>(create);
  static RoomRefersh_GuessQueueData_Replay_OwnerInfo? _defaultInstance;

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
  $core.String get word => $_getSZ(2);
  @$pb.TagNumber(3)
  set word($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasWord() => $_has(2);
  @$pb.TagNumber(3)
  void clearWord() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get lineId => $_getSZ(3);
  @$pb.TagNumber(4)
  set lineId($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLineId() => $_has(3);
  @$pb.TagNumber(4)
  void clearLineId() => clearField(4);
}

class RoomRefersh_GuessQueueData_Replay_DrawerInfo
    extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.GuessQueueData.Replay.DrawerInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
            : 'icon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guess_image')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'last_guess_word')
    ..hasRequiredFields = false;

  RoomRefersh_GuessQueueData_Replay_DrawerInfo._() : super();
  factory RoomRefersh_GuessQueueData_Replay_DrawerInfo({
    $core.String? uid,
    $core.String? icon,
    $core.String? guessImage,
    $core.String? lastGuessWord,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (guessImage != null) {
      _result.guessImage = guessImage;
    }
    if (lastGuessWord != null) {
      _result.lastGuessWord = lastGuessWord;
    }
    return _result;
  }
  factory RoomRefersh_GuessQueueData_Replay_DrawerInfo.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_GuessQueueData_Replay_DrawerInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_GuessQueueData_Replay_DrawerInfo clone() =>
      RoomRefersh_GuessQueueData_Replay_DrawerInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_GuessQueueData_Replay_DrawerInfo copyWith(
          void Function(RoomRefersh_GuessQueueData_Replay_DrawerInfo)
              updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_GuessQueueData_Replay_DrawerInfo))
          as RoomRefersh_GuessQueueData_Replay_DrawerInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GuessQueueData_Replay_DrawerInfo create() =>
      RoomRefersh_GuessQueueData_Replay_DrawerInfo._();
  RoomRefersh_GuessQueueData_Replay_DrawerInfo createEmptyInstance() =>
      create();
  static $pb.PbList<RoomRefersh_GuessQueueData_Replay_DrawerInfo>
      createRepeated() =>
          $pb.PbList<RoomRefersh_GuessQueueData_Replay_DrawerInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GuessQueueData_Replay_DrawerInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_GuessQueueData_Replay_DrawerInfo>(create);
  static RoomRefersh_GuessQueueData_Replay_DrawerInfo? _defaultInstance;

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
  $core.String get guessImage => $_getSZ(2);
  @$pb.TagNumber(3)
  set guessImage($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGuessImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearGuessImage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get lastGuessWord => $_getSZ(3);
  @$pb.TagNumber(4)
  set lastGuessWord($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLastGuessWord() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastGuessWord() => clearField(4);
}

class RoomRefersh_GuessQueueData_Replay_GuesserInfo
    extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.GuessQueueData.Replay.GuesserInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
            : 'icon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guess_word')
    ..hasRequiredFields = false;

  RoomRefersh_GuessQueueData_Replay_GuesserInfo._() : super();
  factory RoomRefersh_GuessQueueData_Replay_GuesserInfo({
    $core.String? uid,
    $core.String? icon,
    $core.String? guessWord,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (guessWord != null) {
      _result.guessWord = guessWord;
    }
    return _result;
  }
  factory RoomRefersh_GuessQueueData_Replay_GuesserInfo.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_GuessQueueData_Replay_GuesserInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_GuessQueueData_Replay_GuesserInfo clone() =>
      RoomRefersh_GuessQueueData_Replay_GuesserInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_GuessQueueData_Replay_GuesserInfo copyWith(
          void Function(RoomRefersh_GuessQueueData_Replay_GuesserInfo)
              updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_GuessQueueData_Replay_GuesserInfo))
          as RoomRefersh_GuessQueueData_Replay_GuesserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GuessQueueData_Replay_GuesserInfo create() =>
      RoomRefersh_GuessQueueData_Replay_GuesserInfo._();
  RoomRefersh_GuessQueueData_Replay_GuesserInfo createEmptyInstance() =>
      create();
  static $pb.PbList<RoomRefersh_GuessQueueData_Replay_GuesserInfo>
      createRepeated() =>
          $pb.PbList<RoomRefersh_GuessQueueData_Replay_GuesserInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GuessQueueData_Replay_GuesserInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_GuessQueueData_Replay_GuesserInfo>(create);
  static RoomRefersh_GuessQueueData_Replay_GuesserInfo? _defaultInstance;

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
  $core.String get guessWord => $_getSZ(2);
  @$pb.TagNumber(3)
  set guessWord($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGuessWord() => $_has(2);
  @$pb.TagNumber(3)
  void clearGuessWord() => clearField(3);
}

class RoomRefersh_GuessQueueData_Replay extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.GuessQueueData.Replay',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOM<RoomRefersh_GuessQueueData_Replay_OwnerInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'owner_info',
        subBuilder: RoomRefersh_GuessQueueData_Replay_OwnerInfo.create)
    ..aOM<RoomRefersh_GuessQueueData_Replay_DrawerInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'drawer_info',
        subBuilder: RoomRefersh_GuessQueueData_Replay_DrawerInfo.create)
    ..aOM<RoomRefersh_GuessQueueData_Replay_GuesserInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guesser_info',
        subBuilder: RoomRefersh_GuessQueueData_Replay_GuesserInfo.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total_turns',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current_turns',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'line_uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_GuessQueueData_Replay._() : super();
  factory RoomRefersh_GuessQueueData_Replay({
    RoomRefersh_GuessQueueData_Replay_OwnerInfo? ownerInfo,
    RoomRefersh_GuessQueueData_Replay_DrawerInfo? drawerInfo,
    RoomRefersh_GuessQueueData_Replay_GuesserInfo? guesserInfo,
    $core.int? totalTurns,
    $core.int? currentTurns,
    $core.int? lineUid,
  }) {
    final _result = create();
    if (ownerInfo != null) {
      _result.ownerInfo = ownerInfo;
    }
    if (drawerInfo != null) {
      _result.drawerInfo = drawerInfo;
    }
    if (guesserInfo != null) {
      _result.guesserInfo = guesserInfo;
    }
    if (totalTurns != null) {
      _result.totalTurns = totalTurns;
    }
    if (currentTurns != null) {
      _result.currentTurns = currentTurns;
    }
    if (lineUid != null) {
      _result.lineUid = lineUid;
    }
    return _result;
  }
  factory RoomRefersh_GuessQueueData_Replay.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_GuessQueueData_Replay.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_GuessQueueData_Replay clone() =>
      RoomRefersh_GuessQueueData_Replay()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_GuessQueueData_Replay copyWith(
          void Function(RoomRefersh_GuessQueueData_Replay) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_GuessQueueData_Replay))
          as RoomRefersh_GuessQueueData_Replay; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GuessQueueData_Replay create() =>
      RoomRefersh_GuessQueueData_Replay._();
  RoomRefersh_GuessQueueData_Replay createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_GuessQueueData_Replay> createRepeated() =>
      $pb.PbList<RoomRefersh_GuessQueueData_Replay>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GuessQueueData_Replay getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_GuessQueueData_Replay>(
          create);
  static RoomRefersh_GuessQueueData_Replay? _defaultInstance;

  @$pb.TagNumber(1)
  RoomRefersh_GuessQueueData_Replay_OwnerInfo get ownerInfo => $_getN(0);
  @$pb.TagNumber(1)
  set ownerInfo(RoomRefersh_GuessQueueData_Replay_OwnerInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOwnerInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwnerInfo() => clearField(1);
  @$pb.TagNumber(1)
  RoomRefersh_GuessQueueData_Replay_OwnerInfo ensureOwnerInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  RoomRefersh_GuessQueueData_Replay_DrawerInfo get drawerInfo => $_getN(1);
  @$pb.TagNumber(2)
  set drawerInfo(RoomRefersh_GuessQueueData_Replay_DrawerInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDrawerInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearDrawerInfo() => clearField(2);
  @$pb.TagNumber(2)
  RoomRefersh_GuessQueueData_Replay_DrawerInfo ensureDrawerInfo() =>
      $_ensure(1);

  @$pb.TagNumber(3)
  RoomRefersh_GuessQueueData_Replay_GuesserInfo get guesserInfo => $_getN(2);
  @$pb.TagNumber(3)
  set guesserInfo(RoomRefersh_GuessQueueData_Replay_GuesserInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGuesserInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearGuesserInfo() => clearField(3);
  @$pb.TagNumber(3)
  RoomRefersh_GuessQueueData_Replay_GuesserInfo ensureGuesserInfo() =>
      $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get totalTurns => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalTurns($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTotalTurns() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalTurns() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get currentTurns => $_getIZ(4);
  @$pb.TagNumber(5)
  set currentTurns($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCurrentTurns() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrentTurns() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get lineUid => $_getIZ(5);
  @$pb.TagNumber(6)
  set lineUid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLineUid() => $_has(5);
  @$pb.TagNumber(6)
  void clearLineUid() => clearField(6);
}

class RoomRefersh_GuessQueueData_ReplayComment_VoteList
    extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.GuessQueueData.ReplayComment.VoteList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
            : 'state')
    ..hasRequiredFields = false;

  RoomRefersh_GuessQueueData_ReplayComment_VoteList._() : super();
  factory RoomRefersh_GuessQueueData_ReplayComment_VoteList({
    $core.int? uid,
    $core.String? state,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory RoomRefersh_GuessQueueData_ReplayComment_VoteList.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_GuessQueueData_ReplayComment_VoteList.fromJson(
          $core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_GuessQueueData_ReplayComment_VoteList clone() =>
      RoomRefersh_GuessQueueData_ReplayComment_VoteList()
        ..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_GuessQueueData_ReplayComment_VoteList copyWith(
          void Function(RoomRefersh_GuessQueueData_ReplayComment_VoteList)
              updates) =>
      super.copyWith((message) => updates(
              message as RoomRefersh_GuessQueueData_ReplayComment_VoteList))
          as RoomRefersh_GuessQueueData_ReplayComment_VoteList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GuessQueueData_ReplayComment_VoteList create() =>
      RoomRefersh_GuessQueueData_ReplayComment_VoteList._();
  RoomRefersh_GuessQueueData_ReplayComment_VoteList createEmptyInstance() =>
      create();
  static $pb.PbList<RoomRefersh_GuessQueueData_ReplayComment_VoteList>
      createRepeated() =>
          $pb.PbList<RoomRefersh_GuessQueueData_ReplayComment_VoteList>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GuessQueueData_ReplayComment_VoteList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_GuessQueueData_ReplayComment_VoteList>(create);
  static RoomRefersh_GuessQueueData_ReplayComment_VoteList? _defaultInstance;

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
  $core.String get state => $_getSZ(1);
  @$pb.TagNumber(2)
  set state($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);
}

class RoomRefersh_GuessQueueData_ReplayComment extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.GuessQueueData.ReplayComment',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'from_word')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'line_id')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'to_word')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..m<$core.String, $core.String>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vote',
        entryClassName: 'RoomRefersh.GuessQueueData.ReplayComment.VoteEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('room.refersh'))
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'line_uid',
        $pb.PbFieldType.OU3)
    ..pc<RoomRefersh_GuessQueueData_ReplayComment_VoteList>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vote_list',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_GuessQueueData_ReplayComment_VoteList.create)
    ..hasRequiredFields = false;

  RoomRefersh_GuessQueueData_ReplayComment._() : super();
  factory RoomRefersh_GuessQueueData_ReplayComment({
    $core.String? fromWord,
    $core.String? lineId,
    $core.String? toWord,
    $core.String? image,
    $core.Map<$core.String, $core.String>? vote,
    $core.int? lineUid,
    $core.Iterable<RoomRefersh_GuessQueueData_ReplayComment_VoteList>? voteList,
  }) {
    final _result = create();
    if (fromWord != null) {
      _result.fromWord = fromWord;
    }
    if (lineId != null) {
      _result.lineId = lineId;
    }
    if (toWord != null) {
      _result.toWord = toWord;
    }
    if (image != null) {
      _result.image = image;
    }
    if (vote != null) {
      _result.vote.addAll(vote);
    }
    if (lineUid != null) {
      _result.lineUid = lineUid;
    }
    if (voteList != null) {
      _result.voteList.addAll(voteList);
    }
    return _result;
  }
  factory RoomRefersh_GuessQueueData_ReplayComment.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_GuessQueueData_ReplayComment.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_GuessQueueData_ReplayComment clone() =>
      RoomRefersh_GuessQueueData_ReplayComment()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_GuessQueueData_ReplayComment copyWith(
          void Function(RoomRefersh_GuessQueueData_ReplayComment) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_GuessQueueData_ReplayComment))
          as RoomRefersh_GuessQueueData_ReplayComment; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GuessQueueData_ReplayComment create() =>
      RoomRefersh_GuessQueueData_ReplayComment._();
  RoomRefersh_GuessQueueData_ReplayComment createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_GuessQueueData_ReplayComment>
      createRepeated() =>
          $pb.PbList<RoomRefersh_GuessQueueData_ReplayComment>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GuessQueueData_ReplayComment getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_GuessQueueData_ReplayComment>(create);
  static RoomRefersh_GuessQueueData_ReplayComment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fromWord => $_getSZ(0);
  @$pb.TagNumber(1)
  set fromWord($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFromWord() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromWord() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get lineId => $_getSZ(1);
  @$pb.TagNumber(2)
  set lineId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLineId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLineId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get toWord => $_getSZ(2);
  @$pb.TagNumber(3)
  set toWord($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasToWord() => $_has(2);
  @$pb.TagNumber(3)
  void clearToWord() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get image => $_getSZ(3);
  @$pb.TagNumber(4)
  set image($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasImage() => $_has(3);
  @$pb.TagNumber(4)
  void clearImage() => clearField(4);

  @$pb.TagNumber(5)
  $core.Map<$core.String, $core.String> get vote => $_getMap(4);

  @$pb.TagNumber(6)
  $core.int get lineUid => $_getIZ(5);
  @$pb.TagNumber(6)
  set lineUid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLineUid() => $_has(5);
  @$pb.TagNumber(6)
  void clearLineUid() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<RoomRefersh_GuessQueueData_ReplayComment_VoteList> get voteList =>
      $_getList(6);
}

class RoomRefersh_GuessQueueData_ReplayLike_Images
    extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.GuessQueueData.ReplayLike.Images',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
            : 'guess_image')
    ..hasRequiredFields = false;

  RoomRefersh_GuessQueueData_ReplayLike_Images._() : super();
  factory RoomRefersh_GuessQueueData_ReplayLike_Images({
    $core.String? uid,
    $core.String? guessImage,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (guessImage != null) {
      _result.guessImage = guessImage;
    }
    return _result;
  }
  factory RoomRefersh_GuessQueueData_ReplayLike_Images.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_GuessQueueData_ReplayLike_Images.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_GuessQueueData_ReplayLike_Images clone() =>
      RoomRefersh_GuessQueueData_ReplayLike_Images()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_GuessQueueData_ReplayLike_Images copyWith(
          void Function(RoomRefersh_GuessQueueData_ReplayLike_Images)
              updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_GuessQueueData_ReplayLike_Images))
          as RoomRefersh_GuessQueueData_ReplayLike_Images; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GuessQueueData_ReplayLike_Images create() =>
      RoomRefersh_GuessQueueData_ReplayLike_Images._();
  RoomRefersh_GuessQueueData_ReplayLike_Images createEmptyInstance() =>
      create();
  static $pb.PbList<RoomRefersh_GuessQueueData_ReplayLike_Images>
      createRepeated() =>
          $pb.PbList<RoomRefersh_GuessQueueData_ReplayLike_Images>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GuessQueueData_ReplayLike_Images getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_GuessQueueData_ReplayLike_Images>(create);
  static RoomRefersh_GuessQueueData_ReplayLike_Images? _defaultInstance;

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
  $core.String get guessImage => $_getSZ(1);
  @$pb.TagNumber(2)
  set guessImage($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGuessImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearGuessImage() => clearField(2);
}

class RoomRefersh_GuessQueueData_ReplayLike_Like extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.GuessQueueData.ReplayLike.Like',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
    ..a<$core.List<$core.int>>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guess_image',
        $pb.PbFieldType.OY)
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

  RoomRefersh_GuessQueueData_ReplayLike_Like._() : super();
  factory RoomRefersh_GuessQueueData_ReplayLike_Like({
    $core.String? uid,
    $core.List<$core.int>? guessImage,
    $core.String? name,
    $core.String? icon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (guessImage != null) {
      _result.guessImage = guessImage;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory RoomRefersh_GuessQueueData_ReplayLike_Like.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_GuessQueueData_ReplayLike_Like.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_GuessQueueData_ReplayLike_Like clone() =>
      RoomRefersh_GuessQueueData_ReplayLike_Like()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_GuessQueueData_ReplayLike_Like copyWith(
          void Function(RoomRefersh_GuessQueueData_ReplayLike_Like) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_GuessQueueData_ReplayLike_Like))
          as RoomRefersh_GuessQueueData_ReplayLike_Like; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GuessQueueData_ReplayLike_Like create() =>
      RoomRefersh_GuessQueueData_ReplayLike_Like._();
  RoomRefersh_GuessQueueData_ReplayLike_Like createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_GuessQueueData_ReplayLike_Like>
      createRepeated() =>
          $pb.PbList<RoomRefersh_GuessQueueData_ReplayLike_Like>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GuessQueueData_ReplayLike_Like getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_GuessQueueData_ReplayLike_Like>(create);
  static RoomRefersh_GuessQueueData_ReplayLike_Like? _defaultInstance;

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
  $core.List<$core.int> get guessImage => $_getN(1);
  @$pb.TagNumber(2)
  set guessImage($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGuessImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearGuessImage() => clearField(2);

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

class RoomRefersh_GuessQueueData_ReplayLike extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.GuessQueueData.ReplayLike',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'line_id')
    ..aOM<RoomRefersh_GuessQueueData_ReplayLike_Like>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'like',
        subBuilder: RoomRefersh_GuessQueueData_ReplayLike_Like.create)
    ..pc<RoomRefersh_GuessQueueData_ReplayLike_Images>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'images',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_GuessQueueData_ReplayLike_Images.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'line_uid')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'line_icon')
    ..hasRequiredFields = false;

  RoomRefersh_GuessQueueData_ReplayLike._() : super();
  factory RoomRefersh_GuessQueueData_ReplayLike({
    $core.String? lineId,
    RoomRefersh_GuessQueueData_ReplayLike_Like? like,
    $core.Iterable<RoomRefersh_GuessQueueData_ReplayLike_Images>? images,
    $core.String? lineUid,
    $core.String? lineIcon,
  }) {
    final _result = create();
    if (lineId != null) {
      _result.lineId = lineId;
    }
    if (like != null) {
      _result.like = like;
    }
    if (images != null) {
      _result.images.addAll(images);
    }
    if (lineUid != null) {
      _result.lineUid = lineUid;
    }
    if (lineIcon != null) {
      _result.lineIcon = lineIcon;
    }
    return _result;
  }
  factory RoomRefersh_GuessQueueData_ReplayLike.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_GuessQueueData_ReplayLike.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_GuessQueueData_ReplayLike clone() =>
      RoomRefersh_GuessQueueData_ReplayLike()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_GuessQueueData_ReplayLike copyWith(
          void Function(RoomRefersh_GuessQueueData_ReplayLike) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_GuessQueueData_ReplayLike))
          as RoomRefersh_GuessQueueData_ReplayLike; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GuessQueueData_ReplayLike create() =>
      RoomRefersh_GuessQueueData_ReplayLike._();
  RoomRefersh_GuessQueueData_ReplayLike createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_GuessQueueData_ReplayLike> createRepeated() =>
      $pb.PbList<RoomRefersh_GuessQueueData_ReplayLike>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GuessQueueData_ReplayLike getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_GuessQueueData_ReplayLike>(create);
  static RoomRefersh_GuessQueueData_ReplayLike? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get lineId => $_getSZ(0);
  @$pb.TagNumber(1)
  set lineId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLineId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLineId() => clearField(1);

  @$pb.TagNumber(2)
  RoomRefersh_GuessQueueData_ReplayLike_Like get like => $_getN(1);
  @$pb.TagNumber(2)
  set like(RoomRefersh_GuessQueueData_ReplayLike_Like v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLike() => $_has(1);
  @$pb.TagNumber(2)
  void clearLike() => clearField(2);
  @$pb.TagNumber(2)
  RoomRefersh_GuessQueueData_ReplayLike_Like ensureLike() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<RoomRefersh_GuessQueueData_ReplayLike_Images> get images =>
      $_getList(2);

  @$pb.TagNumber(4)
  $core.String get lineUid => $_getSZ(3);
  @$pb.TagNumber(4)
  set lineUid($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLineUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearLineUid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get lineIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set lineIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLineIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearLineIcon() => clearField(5);
}

class RoomRefersh_GuessQueueData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.GuessQueueData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'turns',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cate_id',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cate_name')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state_deadline',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'replay_start_time',
        $pb.PbFieldType.OU3)
    ..pc<RoomRefersh_Gift>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_Gift.create)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'line_uid',
        $pb.PbFieldType.OU3)
    ..aOM<RoomRefersh_GuessQueueData_Replay>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'replay',
        subBuilder: RoomRefersh_GuessQueueData_Replay.create)
    ..aOM<RoomRefersh_GuessQueueData_ReplayComment>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'replay_comment',
        subBuilder: RoomRefersh_GuessQueueData_ReplayComment.create)
    ..aOM<RoomRefersh_GuessQueueData_ReplayLike>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'replay_like',
        subBuilder: RoomRefersh_GuessQueueData_ReplayLike.create)
    ..hasRequiredFields = false;

  RoomRefersh_GuessQueueData._() : super();
  factory RoomRefersh_GuessQueueData({
    $core.int? version,
    $core.int? state,
    $core.int? turns,
    $core.int? cateId,
    $core.String? cateName,
    $core.int? stateDeadline,
    $core.int? replayStartTime,
    $core.Iterable<RoomRefersh_Gift>? gift,
    $core.int? lineUid,
    RoomRefersh_GuessQueueData_Replay? replay,
    RoomRefersh_GuessQueueData_ReplayComment? replayComment,
    RoomRefersh_GuessQueueData_ReplayLike? replayLike,
  }) {
    final _result = create();
    if (version != null) {
      _result.version = version;
    }
    if (state != null) {
      _result.state = state;
    }
    if (turns != null) {
      _result.turns = turns;
    }
    if (cateId != null) {
      _result.cateId = cateId;
    }
    if (cateName != null) {
      _result.cateName = cateName;
    }
    if (stateDeadline != null) {
      _result.stateDeadline = stateDeadline;
    }
    if (replayStartTime != null) {
      _result.replayStartTime = replayStartTime;
    }
    if (gift != null) {
      _result.gift.addAll(gift);
    }
    if (lineUid != null) {
      _result.lineUid = lineUid;
    }
    if (replay != null) {
      _result.replay = replay;
    }
    if (replayComment != null) {
      _result.replayComment = replayComment;
    }
    if (replayLike != null) {
      _result.replayLike = replayLike;
    }
    return _result;
  }
  factory RoomRefersh_GuessQueueData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_GuessQueueData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_GuessQueueData clone() =>
      RoomRefersh_GuessQueueData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_GuessQueueData copyWith(
          void Function(RoomRefersh_GuessQueueData) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_GuessQueueData))
          as RoomRefersh_GuessQueueData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GuessQueueData create() => RoomRefersh_GuessQueueData._();
  RoomRefersh_GuessQueueData createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_GuessQueueData> createRepeated() =>
      $pb.PbList<RoomRefersh_GuessQueueData>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GuessQueueData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_GuessQueueData>(create);
  static RoomRefersh_GuessQueueData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get state => $_getIZ(1);
  @$pb.TagNumber(2)
  set state($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get turns => $_getIZ(2);
  @$pb.TagNumber(3)
  set turns($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTurns() => $_has(2);
  @$pb.TagNumber(3)
  void clearTurns() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get cateId => $_getIZ(3);
  @$pb.TagNumber(4)
  set cateId($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCateId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCateId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get cateName => $_getSZ(4);
  @$pb.TagNumber(5)
  set cateName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCateName() => $_has(4);
  @$pb.TagNumber(5)
  void clearCateName() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get stateDeadline => $_getIZ(5);
  @$pb.TagNumber(6)
  set stateDeadline($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasStateDeadline() => $_has(5);
  @$pb.TagNumber(6)
  void clearStateDeadline() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get replayStartTime => $_getIZ(6);
  @$pb.TagNumber(7)
  set replayStartTime($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasReplayStartTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearReplayStartTime() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<RoomRefersh_Gift> get gift => $_getList(7);

  @$pb.TagNumber(9)
  $core.int get lineUid => $_getIZ(8);
  @$pb.TagNumber(9)
  set lineUid($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasLineUid() => $_has(8);
  @$pb.TagNumber(9)
  void clearLineUid() => clearField(9);

  @$pb.TagNumber(10)
  RoomRefersh_GuessQueueData_Replay get replay => $_getN(9);
  @$pb.TagNumber(10)
  set replay(RoomRefersh_GuessQueueData_Replay v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasReplay() => $_has(9);
  @$pb.TagNumber(10)
  void clearReplay() => clearField(10);
  @$pb.TagNumber(10)
  RoomRefersh_GuessQueueData_Replay ensureReplay() => $_ensure(9);

  @$pb.TagNumber(11)
  RoomRefersh_GuessQueueData_ReplayComment get replayComment => $_getN(10);
  @$pb.TagNumber(11)
  set replayComment(RoomRefersh_GuessQueueData_ReplayComment v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasReplayComment() => $_has(10);
  @$pb.TagNumber(11)
  void clearReplayComment() => clearField(11);
  @$pb.TagNumber(11)
  RoomRefersh_GuessQueueData_ReplayComment ensureReplayComment() =>
      $_ensure(10);

  @$pb.TagNumber(12)
  RoomRefersh_GuessQueueData_ReplayLike get replayLike => $_getN(11);
  @$pb.TagNumber(12)
  set replayLike(RoomRefersh_GuessQueueData_ReplayLike v) {
    setField(12, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasReplayLike() => $_has(11);
  @$pb.TagNumber(12)
  void clearReplayLike() => clearField(12);
  @$pb.TagNumber(12)
  RoomRefersh_GuessQueueData_ReplayLike ensureReplayLike() => $_ensure(11);
}

class RoomRefersh_Gift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Gift',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift_type')
    ..hasRequiredFields = false;

  RoomRefersh_Gift._() : super();
  factory RoomRefersh_Gift({
    $core.String? id,
    $core.String? name,
    $core.String? price,
    $core.String? giftType,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (price != null) {
      _result.price = price;
    }
    if (giftType != null) {
      _result.giftType = giftType;
    }
    return _result;
  }
  factory RoomRefersh_Gift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Gift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Gift clone() => RoomRefersh_Gift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Gift copyWith(void Function(RoomRefersh_Gift) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_Gift))
          as RoomRefersh_Gift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Gift create() => RoomRefersh_Gift._();
  RoomRefersh_Gift createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Gift> createRepeated() =>
      $pb.PbList<RoomRefersh_Gift>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Gift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Gift>(create);
  static RoomRefersh_Gift? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
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
  $core.String get price => $_getSZ(2);
  @$pb.TagNumber(3)
  set price($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get giftType => $_getSZ(3);
  @$pb.TagNumber(4)
  set giftType($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGiftType() => $_has(3);
  @$pb.TagNumber(4)
  void clearGiftType() => clearField(4);
}

class RoomRefersh_ChorusUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.ChorusUser',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'week_musical_notes',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rtc_stream_id')
    ..hasRequiredFields = false;

  RoomRefersh_ChorusUser._() : super();
  factory RoomRefersh_ChorusUser({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? weekMusicalNotes,
    $core.String? rtcStreamId,
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
    if (weekMusicalNotes != null) {
      _result.weekMusicalNotes = weekMusicalNotes;
    }
    if (rtcStreamId != null) {
      _result.rtcStreamId = rtcStreamId;
    }
    return _result;
  }
  factory RoomRefersh_ChorusUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_ChorusUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_ChorusUser clone() =>
      RoomRefersh_ChorusUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_ChorusUser copyWith(
          void Function(RoomRefersh_ChorusUser) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_ChorusUser))
          as RoomRefersh_ChorusUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_ChorusUser create() => RoomRefersh_ChorusUser._();
  RoomRefersh_ChorusUser createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_ChorusUser> createRepeated() =>
      $pb.PbList<RoomRefersh_ChorusUser>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_ChorusUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_ChorusUser>(create);
  static RoomRefersh_ChorusUser? _defaultInstance;

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
  $core.int get weekMusicalNotes => $_getIZ(3);
  @$pb.TagNumber(4)
  set weekMusicalNotes($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasWeekMusicalNotes() => $_has(3);
  @$pb.TagNumber(4)
  void clearWeekMusicalNotes() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get rtcStreamId => $_getSZ(4);
  @$pb.TagNumber(5)
  set rtcStreamId($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRtcStreamId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRtcStreamId() => clearField(5);
}

class RoomRefersh_SongDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.SongDetail',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'photo')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'original_mp3')
    ..aOM<$0.Value>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'size',
        subBuilder: $0.Value.create)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hq_music')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hq_size',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hq_status',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singer_id',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singer_name')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uploader_uid')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uploader_name')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uploader_photo')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'brc')
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'choosed',
        $pb.PbFieldType.OU3)
    ..aOB(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_accuse')
    ..aOM<$0.Value>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        subBuilder: $0.Value.create)
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status_description')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'platform')
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playtime',
        $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'platform_song_id',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'song_mv')
    ..hasRequiredFields = false;

  RoomRefersh_SongDetail._() : super();
  factory RoomRefersh_SongDetail({
    $core.int? id,
    $core.String? name,
    $core.String? photo,
    $core.String? originalMp3,
    $0.Value? size,
    $core.String? hqMusic,
    $core.int? hqSize,
    $core.int? hqStatus,
    $core.int? singerId,
    $core.String? singerName,
    $core.String? uploaderUid,
    $core.String? uploaderName,
    $core.String? uploaderPhoto,
    $core.String? brc,
    $core.int? choosed,
    $core.bool? showAccuse,
    $0.Value? status,
    $core.String? statusDescription,
    $core.String? platform,
    $core.int? playtime,
    $fixnum.Int64? platformSongId,
    $core.String? songMv,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (photo != null) {
      _result.photo = photo;
    }
    if (originalMp3 != null) {
      _result.originalMp3 = originalMp3;
    }
    if (size != null) {
      _result.size = size;
    }
    if (hqMusic != null) {
      _result.hqMusic = hqMusic;
    }
    if (hqSize != null) {
      _result.hqSize = hqSize;
    }
    if (hqStatus != null) {
      _result.hqStatus = hqStatus;
    }
    if (singerId != null) {
      _result.singerId = singerId;
    }
    if (singerName != null) {
      _result.singerName = singerName;
    }
    if (uploaderUid != null) {
      _result.uploaderUid = uploaderUid;
    }
    if (uploaderName != null) {
      _result.uploaderName = uploaderName;
    }
    if (uploaderPhoto != null) {
      _result.uploaderPhoto = uploaderPhoto;
    }
    if (brc != null) {
      _result.brc = brc;
    }
    if (choosed != null) {
      _result.choosed = choosed;
    }
    if (showAccuse != null) {
      _result.showAccuse = showAccuse;
    }
    if (status != null) {
      _result.status = status;
    }
    if (statusDescription != null) {
      _result.statusDescription = statusDescription;
    }
    if (platform != null) {
      _result.platform = platform;
    }
    if (playtime != null) {
      _result.playtime = playtime;
    }
    if (platformSongId != null) {
      _result.platformSongId = platformSongId;
    }
    if (songMv != null) {
      _result.songMv = songMv;
    }
    return _result;
  }
  factory RoomRefersh_SongDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_SongDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_SongDetail clone() =>
      RoomRefersh_SongDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_SongDetail copyWith(
          void Function(RoomRefersh_SongDetail) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_SongDetail))
          as RoomRefersh_SongDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_SongDetail create() => RoomRefersh_SongDetail._();
  RoomRefersh_SongDetail createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_SongDetail> createRepeated() =>
      $pb.PbList<RoomRefersh_SongDetail>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_SongDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_SongDetail>(create);
  static RoomRefersh_SongDetail? _defaultInstance;

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
  $core.String get photo => $_getSZ(2);
  @$pb.TagNumber(3)
  set photo($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPhoto() => $_has(2);
  @$pb.TagNumber(3)
  void clearPhoto() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get originalMp3 => $_getSZ(3);
  @$pb.TagNumber(4)
  set originalMp3($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOriginalMp3() => $_has(3);
  @$pb.TagNumber(4)
  void clearOriginalMp3() => clearField(4);

  @$pb.TagNumber(5)
  $0.Value get size => $_getN(4);
  @$pb.TagNumber(5)
  set size($0.Value v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearSize() => clearField(5);
  @$pb.TagNumber(5)
  $0.Value ensureSize() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get hqMusic => $_getSZ(5);
  @$pb.TagNumber(6)
  set hqMusic($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasHqMusic() => $_has(5);
  @$pb.TagNumber(6)
  void clearHqMusic() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get hqSize => $_getIZ(6);
  @$pb.TagNumber(7)
  set hqSize($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasHqSize() => $_has(6);
  @$pb.TagNumber(7)
  void clearHqSize() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get hqStatus => $_getIZ(7);
  @$pb.TagNumber(8)
  set hqStatus($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasHqStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearHqStatus() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get singerId => $_getIZ(8);
  @$pb.TagNumber(9)
  set singerId($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasSingerId() => $_has(8);
  @$pb.TagNumber(9)
  void clearSingerId() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get singerName => $_getSZ(9);
  @$pb.TagNumber(10)
  set singerName($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasSingerName() => $_has(9);
  @$pb.TagNumber(10)
  void clearSingerName() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get uploaderUid => $_getSZ(10);
  @$pb.TagNumber(11)
  set uploaderUid($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasUploaderUid() => $_has(10);
  @$pb.TagNumber(11)
  void clearUploaderUid() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get uploaderName => $_getSZ(11);
  @$pb.TagNumber(12)
  set uploaderName($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasUploaderName() => $_has(11);
  @$pb.TagNumber(12)
  void clearUploaderName() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get uploaderPhoto => $_getSZ(12);
  @$pb.TagNumber(13)
  set uploaderPhoto($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasUploaderPhoto() => $_has(12);
  @$pb.TagNumber(13)
  void clearUploaderPhoto() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get brc => $_getSZ(13);
  @$pb.TagNumber(14)
  set brc($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasBrc() => $_has(13);
  @$pb.TagNumber(14)
  void clearBrc() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get choosed => $_getIZ(14);
  @$pb.TagNumber(15)
  set choosed($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasChoosed() => $_has(14);
  @$pb.TagNumber(15)
  void clearChoosed() => clearField(15);

  @$pb.TagNumber(16)
  $core.bool get showAccuse => $_getBF(15);
  @$pb.TagNumber(16)
  set showAccuse($core.bool v) {
    $_setBool(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasShowAccuse() => $_has(15);
  @$pb.TagNumber(16)
  void clearShowAccuse() => clearField(16);

  @$pb.TagNumber(17)
  $0.Value get status => $_getN(16);
  @$pb.TagNumber(17)
  set status($0.Value v) {
    setField(17, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasStatus() => $_has(16);
  @$pb.TagNumber(17)
  void clearStatus() => clearField(17);
  @$pb.TagNumber(17)
  $0.Value ensureStatus() => $_ensure(16);

  @$pb.TagNumber(18)
  $core.String get statusDescription => $_getSZ(17);
  @$pb.TagNumber(18)
  set statusDescription($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasStatusDescription() => $_has(17);
  @$pb.TagNumber(18)
  void clearStatusDescription() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get platform => $_getSZ(18);
  @$pb.TagNumber(19)
  set platform($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasPlatform() => $_has(18);
  @$pb.TagNumber(19)
  void clearPlatform() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get playtime => $_getIZ(19);
  @$pb.TagNumber(20)
  set playtime($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasPlaytime() => $_has(19);
  @$pb.TagNumber(20)
  void clearPlaytime() => clearField(20);

  @$pb.TagNumber(21)
  $fixnum.Int64 get platformSongId => $_getI64(20);
  @$pb.TagNumber(21)
  set platformSongId($fixnum.Int64 v) {
    $_setInt64(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasPlatformSongId() => $_has(20);
  @$pb.TagNumber(21)
  void clearPlatformSongId() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get songMv => $_getSZ(21);
  @$pb.TagNumber(22)
  set songMv($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasSongMv() => $_has(21);
  @$pb.TagNumber(22)
  void clearSongMv() => clearField(22);
}

class RoomRefersh_CurrentSong extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.CurrentSong',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
            : 'brc')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'back_track',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'play_time',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'brc_progress',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singer_name')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sid',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sname')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status')
    ..a<$fixnum.Int64>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'count_down',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'platform')
    ..aOM<$0.Value>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'platform_song_id',
        subBuilder: $0.Value.create)
    ..aOM<$0.Value>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'platform_rank_id',
        subBuilder: $0.Value.create)
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'need_report',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'week_musical_notes',
        $pb.PbFieldType.OU3)
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rtc_stream_id')
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chorus_switch',
        $pb.PbFieldType.OU3)
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'music_id')
    ..hasRequiredFields = false;

  RoomRefersh_CurrentSong._() : super();
  factory RoomRefersh_CurrentSong({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? brc,
    $core.int? backTrack,
    $core.int? playTime,
    $core.int? brcProgress,
    $core.String? singerName,
    $core.int? sid,
    $core.String? sname,
    $core.String? status,
    $fixnum.Int64? countDown,
    $core.String? platform,
    $0.Value? platformSongId,
    $0.Value? platformRankId,
    $core.int? needReport,
    $core.int? weekMusicalNotes,
    $core.String? rtcStreamId,
    $core.int? chorusSwitch,
    $core.String? musicId,
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
    if (brc != null) {
      _result.brc = brc;
    }
    if (backTrack != null) {
      _result.backTrack = backTrack;
    }
    if (playTime != null) {
      _result.playTime = playTime;
    }
    if (brcProgress != null) {
      _result.brcProgress = brcProgress;
    }
    if (singerName != null) {
      _result.singerName = singerName;
    }
    if (sid != null) {
      _result.sid = sid;
    }
    if (sname != null) {
      _result.sname = sname;
    }
    if (status != null) {
      _result.status = status;
    }
    if (countDown != null) {
      _result.countDown = countDown;
    }
    if (platform != null) {
      _result.platform = platform;
    }
    if (platformSongId != null) {
      _result.platformSongId = platformSongId;
    }
    if (platformRankId != null) {
      _result.platformRankId = platformRankId;
    }
    if (needReport != null) {
      _result.needReport = needReport;
    }
    if (weekMusicalNotes != null) {
      _result.weekMusicalNotes = weekMusicalNotes;
    }
    if (rtcStreamId != null) {
      _result.rtcStreamId = rtcStreamId;
    }
    if (chorusSwitch != null) {
      _result.chorusSwitch = chorusSwitch;
    }
    if (musicId != null) {
      _result.musicId = musicId;
    }
    return _result;
  }
  factory RoomRefersh_CurrentSong.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_CurrentSong.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_CurrentSong clone() =>
      RoomRefersh_CurrentSong()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_CurrentSong copyWith(
          void Function(RoomRefersh_CurrentSong) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_CurrentSong))
          as RoomRefersh_CurrentSong; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CurrentSong create() => RoomRefersh_CurrentSong._();
  RoomRefersh_CurrentSong createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_CurrentSong> createRepeated() =>
      $pb.PbList<RoomRefersh_CurrentSong>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CurrentSong getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_CurrentSong>(create);
  static RoomRefersh_CurrentSong? _defaultInstance;

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
  $core.String get brc => $_getSZ(3);
  @$pb.TagNumber(4)
  set brc($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBrc() => $_has(3);
  @$pb.TagNumber(4)
  void clearBrc() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get backTrack => $_getIZ(4);
  @$pb.TagNumber(5)
  set backTrack($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBackTrack() => $_has(4);
  @$pb.TagNumber(5)
  void clearBackTrack() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get playTime => $_getIZ(5);
  @$pb.TagNumber(6)
  set playTime($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPlayTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearPlayTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get brcProgress => $_getIZ(6);
  @$pb.TagNumber(7)
  set brcProgress($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasBrcProgress() => $_has(6);
  @$pb.TagNumber(7)
  void clearBrcProgress() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get singerName => $_getSZ(7);
  @$pb.TagNumber(8)
  set singerName($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSingerName() => $_has(7);
  @$pb.TagNumber(8)
  void clearSingerName() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get sid => $_getIZ(8);
  @$pb.TagNumber(9)
  set sid($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasSid() => $_has(8);
  @$pb.TagNumber(9)
  void clearSid() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get sname => $_getSZ(9);
  @$pb.TagNumber(10)
  set sname($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasSname() => $_has(9);
  @$pb.TagNumber(10)
  void clearSname() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get status => $_getSZ(10);
  @$pb.TagNumber(11)
  set status($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearStatus() => clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get countDown => $_getI64(11);
  @$pb.TagNumber(12)
  set countDown($fixnum.Int64 v) {
    $_setInt64(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasCountDown() => $_has(11);
  @$pb.TagNumber(12)
  void clearCountDown() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get platform => $_getSZ(12);
  @$pb.TagNumber(13)
  set platform($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasPlatform() => $_has(12);
  @$pb.TagNumber(13)
  void clearPlatform() => clearField(13);

  @$pb.TagNumber(14)
  $0.Value get platformSongId => $_getN(13);
  @$pb.TagNumber(14)
  set platformSongId($0.Value v) {
    setField(14, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasPlatformSongId() => $_has(13);
  @$pb.TagNumber(14)
  void clearPlatformSongId() => clearField(14);
  @$pb.TagNumber(14)
  $0.Value ensurePlatformSongId() => $_ensure(13);

  @$pb.TagNumber(15)
  $0.Value get platformRankId => $_getN(14);
  @$pb.TagNumber(15)
  set platformRankId($0.Value v) {
    setField(15, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasPlatformRankId() => $_has(14);
  @$pb.TagNumber(15)
  void clearPlatformRankId() => clearField(15);
  @$pb.TagNumber(15)
  $0.Value ensurePlatformRankId() => $_ensure(14);

  @$pb.TagNumber(16)
  $core.int get needReport => $_getIZ(15);
  @$pb.TagNumber(16)
  set needReport($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasNeedReport() => $_has(15);
  @$pb.TagNumber(16)
  void clearNeedReport() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get weekMusicalNotes => $_getIZ(16);
  @$pb.TagNumber(17)
  set weekMusicalNotes($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasWeekMusicalNotes() => $_has(16);
  @$pb.TagNumber(17)
  void clearWeekMusicalNotes() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get rtcStreamId => $_getSZ(17);
  @$pb.TagNumber(18)
  set rtcStreamId($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasRtcStreamId() => $_has(17);
  @$pb.TagNumber(18)
  void clearRtcStreamId() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get chorusSwitch => $_getIZ(18);
  @$pb.TagNumber(19)
  set chorusSwitch($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasChorusSwitch() => $_has(18);
  @$pb.TagNumber(19)
  void clearChorusSwitch() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get musicId => $_getSZ(19);
  @$pb.TagNumber(20)
  set musicId($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasMusicId() => $_has(19);
  @$pb.TagNumber(20)
  void clearMusicId() => clearField(20);
}

class RoomRefersh_KtvInfo_OffMicList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.KtvInfo.OffMicList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
            : 'icon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..hasRequiredFields = false;

  RoomRefersh_KtvInfo_OffMicList._() : super();
  factory RoomRefersh_KtvInfo_OffMicList({
    $core.int? uid,
    $core.String? icon,
    $core.String? name,
    $core.String? frame,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    return _result;
  }
  factory RoomRefersh_KtvInfo_OffMicList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_KtvInfo_OffMicList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_KtvInfo_OffMicList clone() =>
      RoomRefersh_KtvInfo_OffMicList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_KtvInfo_OffMicList copyWith(
          void Function(RoomRefersh_KtvInfo_OffMicList) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_KtvInfo_OffMicList))
          as RoomRefersh_KtvInfo_OffMicList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_KtvInfo_OffMicList create() =>
      RoomRefersh_KtvInfo_OffMicList._();
  RoomRefersh_KtvInfo_OffMicList createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_KtvInfo_OffMicList> createRepeated() =>
      $pb.PbList<RoomRefersh_KtvInfo_OffMicList>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_KtvInfo_OffMicList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_KtvInfo_OffMicList>(create);
  static RoomRefersh_KtvInfo_OffMicList? _defaultInstance;

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
  $core.String get frame => $_getSZ(3);
  @$pb.TagNumber(4)
  set frame($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFrame() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrame() => clearField(4);
}

class RoomRefersh_KtvInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.KtvInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prop_show_time',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prop_use_time',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list_count',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pid')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'appkey')
    ..aOM<RoomRefersh_CurrentSong>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current_song',
        subBuilder: RoomRefersh_CurrentSong.create)
    ..pPS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'song_list')
    ..aOM<RoomRefersh_ChorusUser>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chorus_user',
        subBuilder: RoomRefersh_ChorusUser.create)
    ..aOM<RoomRefersh_SongDetail>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'song_detail',
        subBuilder: RoomRefersh_SongDetail.create)
    ..pc<RoomRefersh_KtvInfo_OffMicList>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'offMicList',
        $pb.PbFieldType.PM,
        protoName: 'offMicList',
        subBuilder: RoomRefersh_KtvInfo_OffMicList.create)
    ..hasRequiredFields = false;

  RoomRefersh_KtvInfo._() : super();
  factory RoomRefersh_KtvInfo({
    $core.int? propShowTime,
    $core.int? propUseTime,
    $core.int? listCount,
    $core.String? pid,
    $core.String? appkey,
    RoomRefersh_CurrentSong? currentSong,
    $core.Iterable<$core.String>? songList,
    RoomRefersh_ChorusUser? chorusUser,
    RoomRefersh_SongDetail? songDetail,
    $core.Iterable<RoomRefersh_KtvInfo_OffMicList>? offMicList,
  }) {
    final _result = create();
    if (propShowTime != null) {
      _result.propShowTime = propShowTime;
    }
    if (propUseTime != null) {
      _result.propUseTime = propUseTime;
    }
    if (listCount != null) {
      _result.listCount = listCount;
    }
    if (pid != null) {
      _result.pid = pid;
    }
    if (appkey != null) {
      _result.appkey = appkey;
    }
    if (currentSong != null) {
      _result.currentSong = currentSong;
    }
    if (songList != null) {
      _result.songList.addAll(songList);
    }
    if (chorusUser != null) {
      _result.chorusUser = chorusUser;
    }
    if (songDetail != null) {
      _result.songDetail = songDetail;
    }
    if (offMicList != null) {
      _result.offMicList.addAll(offMicList);
    }
    return _result;
  }
  factory RoomRefersh_KtvInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_KtvInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_KtvInfo clone() => RoomRefersh_KtvInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_KtvInfo copyWith(void Function(RoomRefersh_KtvInfo) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_KtvInfo))
          as RoomRefersh_KtvInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_KtvInfo create() => RoomRefersh_KtvInfo._();
  RoomRefersh_KtvInfo createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_KtvInfo> createRepeated() =>
      $pb.PbList<RoomRefersh_KtvInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_KtvInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_KtvInfo>(create);
  static RoomRefersh_KtvInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get propShowTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set propShowTime($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPropShowTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearPropShowTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get propUseTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set propUseTime($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPropUseTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearPropUseTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get listCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set listCount($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasListCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearListCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get pid => $_getSZ(3);
  @$pb.TagNumber(4)
  set pid($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPid() => $_has(3);
  @$pb.TagNumber(4)
  void clearPid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get appkey => $_getSZ(4);
  @$pb.TagNumber(5)
  set appkey($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAppkey() => $_has(4);
  @$pb.TagNumber(5)
  void clearAppkey() => clearField(5);

  @$pb.TagNumber(6)
  RoomRefersh_CurrentSong get currentSong => $_getN(5);
  @$pb.TagNumber(6)
  set currentSong(RoomRefersh_CurrentSong v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCurrentSong() => $_has(5);
  @$pb.TagNumber(6)
  void clearCurrentSong() => clearField(6);
  @$pb.TagNumber(6)
  RoomRefersh_CurrentSong ensureCurrentSong() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.List<$core.String> get songList => $_getList(6);

  @$pb.TagNumber(8)
  RoomRefersh_ChorusUser get chorusUser => $_getN(7);
  @$pb.TagNumber(8)
  set chorusUser(RoomRefersh_ChorusUser v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasChorusUser() => $_has(7);
  @$pb.TagNumber(8)
  void clearChorusUser() => clearField(8);
  @$pb.TagNumber(8)
  RoomRefersh_ChorusUser ensureChorusUser() => $_ensure(7);

  @$pb.TagNumber(9)
  RoomRefersh_SongDetail get songDetail => $_getN(8);
  @$pb.TagNumber(9)
  set songDetail(RoomRefersh_SongDetail v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasSongDetail() => $_has(8);
  @$pb.TagNumber(9)
  void clearSongDetail() => clearField(9);
  @$pb.TagNumber(9)
  RoomRefersh_SongDetail ensureSongDetail() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.List<RoomRefersh_KtvInfo_OffMicList> get offMicList => $_getList(9);
}

class RoomRefersh_PartyGameInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.PartyGameInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'game_type')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'seize')
    ..hasRequiredFields = false;

  RoomRefersh_PartyGameInfo._() : super();
  factory RoomRefersh_PartyGameInfo({
    $core.String? gameType,
    $core.bool? seize,
  }) {
    final _result = create();
    if (gameType != null) {
      _result.gameType = gameType;
    }
    if (seize != null) {
      _result.seize = seize;
    }
    return _result;
  }
  factory RoomRefersh_PartyGameInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_PartyGameInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_PartyGameInfo clone() =>
      RoomRefersh_PartyGameInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_PartyGameInfo copyWith(
          void Function(RoomRefersh_PartyGameInfo) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_PartyGameInfo))
          as RoomRefersh_PartyGameInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_PartyGameInfo create() => RoomRefersh_PartyGameInfo._();
  RoomRefersh_PartyGameInfo createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_PartyGameInfo> createRepeated() =>
      $pb.PbList<RoomRefersh_PartyGameInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_PartyGameInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_PartyGameInfo>(create);
  static RoomRefersh_PartyGameInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get gameType => $_getSZ(0);
  @$pb.TagNumber(1)
  set gameType($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGameType() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameType() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get seize => $_getBF(1);
  @$pb.TagNumber(2)
  set seize($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSeize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSeize() => clearField(2);
}

class RoomRefersh_OffMicUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.OffMicUser',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
            : 'icon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..hasRequiredFields = false;

  RoomRefersh_OffMicUser._() : super();
  factory RoomRefersh_OffMicUser({
    $core.String? uid,
    $core.String? icon,
    $core.String? name,
    $core.String? frame,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    return _result;
  }
  factory RoomRefersh_OffMicUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_OffMicUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_OffMicUser clone() =>
      RoomRefersh_OffMicUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_OffMicUser copyWith(
          void Function(RoomRefersh_OffMicUser) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_OffMicUser))
          as RoomRefersh_OffMicUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_OffMicUser create() => RoomRefersh_OffMicUser._();
  RoomRefersh_OffMicUser createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_OffMicUser> createRepeated() =>
      $pb.PbList<RoomRefersh_OffMicUser>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_OffMicUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_OffMicUser>(create);
  static RoomRefersh_OffMicUser? _defaultInstance;

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
  $core.String get frame => $_getSZ(3);
  @$pb.TagNumber(4)
  set frame($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFrame() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrame() => clearField(4);
}

class RoomRefersh_PuzzleInfo_Clues extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.PuzzleInfo.Clues',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'clue_id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'puzzle_id')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline')
    ..hasRequiredFields = false;

  RoomRefersh_PuzzleInfo_Clues._() : super();
  factory RoomRefersh_PuzzleInfo_Clues({
    $core.String? clueId,
    $core.String? puzzleId,
    $core.String? name,
    $core.String? content,
    $core.String? price,
    $core.String? dateline,
  }) {
    final _result = create();
    if (clueId != null) {
      _result.clueId = clueId;
    }
    if (puzzleId != null) {
      _result.puzzleId = puzzleId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (content != null) {
      _result.content = content;
    }
    if (price != null) {
      _result.price = price;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    return _result;
  }
  factory RoomRefersh_PuzzleInfo_Clues.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_PuzzleInfo_Clues.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_PuzzleInfo_Clues clone() =>
      RoomRefersh_PuzzleInfo_Clues()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_PuzzleInfo_Clues copyWith(
          void Function(RoomRefersh_PuzzleInfo_Clues) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_PuzzleInfo_Clues))
          as RoomRefersh_PuzzleInfo_Clues; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_PuzzleInfo_Clues create() =>
      RoomRefersh_PuzzleInfo_Clues._();
  RoomRefersh_PuzzleInfo_Clues createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_PuzzleInfo_Clues> createRepeated() =>
      $pb.PbList<RoomRefersh_PuzzleInfo_Clues>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_PuzzleInfo_Clues getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_PuzzleInfo_Clues>(create);
  static RoomRefersh_PuzzleInfo_Clues? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get clueId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clueId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasClueId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClueId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get puzzleId => $_getSZ(1);
  @$pb.TagNumber(2)
  set puzzleId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPuzzleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPuzzleId() => clearField(2);

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
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get price => $_getSZ(4);
  @$pb.TagNumber(5)
  set price($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrice() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get dateline => $_getSZ(5);
  @$pb.TagNumber(6)
  set dateline($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDateline() => $_has(5);
  @$pb.TagNumber(6)
  void clearDateline() => clearField(6);
}

class RoomRefersh_PuzzleInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.PuzzleInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleted')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'difficulty')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'like_num')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'author_uid')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'verify_state')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'create_type')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'quality')
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'author_name')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'author_image')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'puzzle_times_id')
    ..pPS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'second_time_uid')
    ..pc<RoomRefersh_OffMicUser>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'off_mic_user',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_OffMicUser.create)
    ..pc<RoomRefersh_PuzzleInfo_Clues>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'clues',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_PuzzleInfo_Clues.create)
    ..aOB(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_dm_room')
    ..a<$core.int>(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'commit_num',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RoomRefersh_PuzzleInfo._() : super();
  factory RoomRefersh_PuzzleInfo({
    $core.String? id,
    $core.String? name,
    $core.String? content,
    $core.String? description,
    $core.String? deleted,
    $core.String? difficulty,
    $core.String? type,
    $core.String? likeNum,
    $core.String? authorUid,
    $core.String? verifyState,
    $core.String? dateline,
    $core.String? createType,
    $core.String? label,
    $core.String? quality,
    $core.String? authorName,
    $core.String? authorImage,
    $core.String? state,
    $core.String? puzzleTimesId,
    $core.Iterable<$core.String>? secondTimeUid,
    $core.Iterable<RoomRefersh_OffMicUser>? offMicUser,
    $core.Iterable<RoomRefersh_PuzzleInfo_Clues>? clues,
    $core.bool? isDmRoom,
    $core.int? commitNum,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (content != null) {
      _result.content = content;
    }
    if (description != null) {
      _result.description = description;
    }
    if (deleted != null) {
      _result.deleted = deleted;
    }
    if (difficulty != null) {
      _result.difficulty = difficulty;
    }
    if (type != null) {
      _result.type = type;
    }
    if (likeNum != null) {
      _result.likeNum = likeNum;
    }
    if (authorUid != null) {
      _result.authorUid = authorUid;
    }
    if (verifyState != null) {
      _result.verifyState = verifyState;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (createType != null) {
      _result.createType = createType;
    }
    if (label != null) {
      _result.label = label;
    }
    if (quality != null) {
      _result.quality = quality;
    }
    if (authorName != null) {
      _result.authorName = authorName;
    }
    if (authorImage != null) {
      _result.authorImage = authorImage;
    }
    if (state != null) {
      _result.state = state;
    }
    if (puzzleTimesId != null) {
      _result.puzzleTimesId = puzzleTimesId;
    }
    if (secondTimeUid != null) {
      _result.secondTimeUid.addAll(secondTimeUid);
    }
    if (offMicUser != null) {
      _result.offMicUser.addAll(offMicUser);
    }
    if (clues != null) {
      _result.clues.addAll(clues);
    }
    if (isDmRoom != null) {
      _result.isDmRoom = isDmRoom;
    }
    if (commitNum != null) {
      _result.commitNum = commitNum;
    }
    return _result;
  }
  factory RoomRefersh_PuzzleInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_PuzzleInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_PuzzleInfo clone() =>
      RoomRefersh_PuzzleInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_PuzzleInfo copyWith(
          void Function(RoomRefersh_PuzzleInfo) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_PuzzleInfo))
          as RoomRefersh_PuzzleInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_PuzzleInfo create() => RoomRefersh_PuzzleInfo._();
  RoomRefersh_PuzzleInfo createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_PuzzleInfo> createRepeated() =>
      $pb.PbList<RoomRefersh_PuzzleInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_PuzzleInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_PuzzleInfo>(create);
  static RoomRefersh_PuzzleInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
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
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get deleted => $_getSZ(4);
  @$pb.TagNumber(5)
  set deleted($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDeleted() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeleted() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get difficulty => $_getSZ(5);
  @$pb.TagNumber(6)
  set difficulty($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDifficulty() => $_has(5);
  @$pb.TagNumber(6)
  void clearDifficulty() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get type => $_getSZ(6);
  @$pb.TagNumber(7)
  set type($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasType() => $_has(6);
  @$pb.TagNumber(7)
  void clearType() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get likeNum => $_getSZ(7);
  @$pb.TagNumber(8)
  set likeNum($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLikeNum() => $_has(7);
  @$pb.TagNumber(8)
  void clearLikeNum() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get authorUid => $_getSZ(8);
  @$pb.TagNumber(9)
  set authorUid($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasAuthorUid() => $_has(8);
  @$pb.TagNumber(9)
  void clearAuthorUid() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get verifyState => $_getSZ(9);
  @$pb.TagNumber(10)
  set verifyState($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasVerifyState() => $_has(9);
  @$pb.TagNumber(10)
  void clearVerifyState() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get dateline => $_getSZ(10);
  @$pb.TagNumber(11)
  set dateline($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasDateline() => $_has(10);
  @$pb.TagNumber(11)
  void clearDateline() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get createType => $_getSZ(11);
  @$pb.TagNumber(12)
  set createType($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasCreateType() => $_has(11);
  @$pb.TagNumber(12)
  void clearCreateType() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get label => $_getSZ(12);
  @$pb.TagNumber(13)
  set label($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasLabel() => $_has(12);
  @$pb.TagNumber(13)
  void clearLabel() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get quality => $_getSZ(13);
  @$pb.TagNumber(14)
  set quality($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasQuality() => $_has(13);
  @$pb.TagNumber(14)
  void clearQuality() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get authorName => $_getSZ(14);
  @$pb.TagNumber(15)
  set authorName($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasAuthorName() => $_has(14);
  @$pb.TagNumber(15)
  void clearAuthorName() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get authorImage => $_getSZ(15);
  @$pb.TagNumber(16)
  set authorImage($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasAuthorImage() => $_has(15);
  @$pb.TagNumber(16)
  void clearAuthorImage() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get state => $_getSZ(16);
  @$pb.TagNumber(17)
  set state($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasState() => $_has(16);
  @$pb.TagNumber(17)
  void clearState() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get puzzleTimesId => $_getSZ(17);
  @$pb.TagNumber(18)
  set puzzleTimesId($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasPuzzleTimesId() => $_has(17);
  @$pb.TagNumber(18)
  void clearPuzzleTimesId() => clearField(18);

  @$pb.TagNumber(19)
  $core.List<$core.String> get secondTimeUid => $_getList(18);

  @$pb.TagNumber(20)
  $core.List<RoomRefersh_OffMicUser> get offMicUser => $_getList(19);

  @$pb.TagNumber(21)
  $core.List<RoomRefersh_PuzzleInfo_Clues> get clues => $_getList(20);

  @$pb.TagNumber(22)
  $core.bool get isDmRoom => $_getBF(21);
  @$pb.TagNumber(22)
  set isDmRoom($core.bool v) {
    $_setBool(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasIsDmRoom() => $_has(21);
  @$pb.TagNumber(22)
  void clearIsDmRoom() => clearField(22);

  @$pb.TagNumber(23)
  $core.int get commitNum => $_getIZ(22);
  @$pb.TagNumber(23)
  set commitNum($core.int v) {
    $_setSignedInt32(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasCommitNum() => $_has(22);
  @$pb.TagNumber(23)
  void clearCommitNum() => clearField(23);
}

class RoomRefersh_RoomGroupPk_LeftSide extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.RoomGroupPk.LeftSide',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.OU3)
    ..pc<RoomRefersh_RoomGroupPk_List>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_RoomGroupPk_List.create)
    ..hasRequiredFields = false;

  RoomRefersh_RoomGroupPk_LeftSide._() : super();
  factory RoomRefersh_RoomGroupPk_LeftSide({
    $core.int? total,
    $core.Iterable<RoomRefersh_RoomGroupPk_List>? list,
  }) {
    final _result = create();
    if (total != null) {
      _result.total = total;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory RoomRefersh_RoomGroupPk_LeftSide.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_RoomGroupPk_LeftSide.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_RoomGroupPk_LeftSide clone() =>
      RoomRefersh_RoomGroupPk_LeftSide()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_RoomGroupPk_LeftSide copyWith(
          void Function(RoomRefersh_RoomGroupPk_LeftSide) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_RoomGroupPk_LeftSide))
          as RoomRefersh_RoomGroupPk_LeftSide; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RoomGroupPk_LeftSide create() =>
      RoomRefersh_RoomGroupPk_LeftSide._();
  RoomRefersh_RoomGroupPk_LeftSide createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_RoomGroupPk_LeftSide> createRepeated() =>
      $pb.PbList<RoomRefersh_RoomGroupPk_LeftSide>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RoomGroupPk_LeftSide getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_RoomGroupPk_LeftSide>(
          create);
  static RoomRefersh_RoomGroupPk_LeftSide? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get total => $_getIZ(0);
  @$pb.TagNumber(1)
  set total($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<RoomRefersh_RoomGroupPk_List> get list => $_getList(1);
}

class RoomRefersh_RoomGroupPk_RightSide extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.RoomGroupPk.RightSide',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.OU3)
    ..pc<RoomRefersh_RoomGroupPk_List>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_RoomGroupPk_List.create)
    ..hasRequiredFields = false;

  RoomRefersh_RoomGroupPk_RightSide._() : super();
  factory RoomRefersh_RoomGroupPk_RightSide({
    $core.int? total,
    $core.Iterable<RoomRefersh_RoomGroupPk_List>? list,
  }) {
    final _result = create();
    if (total != null) {
      _result.total = total;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory RoomRefersh_RoomGroupPk_RightSide.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_RoomGroupPk_RightSide.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_RoomGroupPk_RightSide clone() =>
      RoomRefersh_RoomGroupPk_RightSide()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_RoomGroupPk_RightSide copyWith(
          void Function(RoomRefersh_RoomGroupPk_RightSide) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_RoomGroupPk_RightSide))
          as RoomRefersh_RoomGroupPk_RightSide; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RoomGroupPk_RightSide create() =>
      RoomRefersh_RoomGroupPk_RightSide._();
  RoomRefersh_RoomGroupPk_RightSide createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_RoomGroupPk_RightSide> createRepeated() =>
      $pb.PbList<RoomRefersh_RoomGroupPk_RightSide>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RoomGroupPk_RightSide getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_RoomGroupPk_RightSide>(
          create);
  static RoomRefersh_RoomGroupPk_RightSide? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get total => $_getIZ(0);
  @$pb.TagNumber(1)
  set total($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotal() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<RoomRefersh_RoomGroupPk_List> get list => $_getList(1);
}

class RoomRefersh_RoomGroupPk_PkResult_WinnerList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.RoomGroupPk.PkResult.WinnerList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame_new')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.O3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status')
    ..hasRequiredFields = false;

  RoomRefersh_RoomGroupPk_PkResult_WinnerList._() : super();
  factory RoomRefersh_RoomGroupPk_PkResult_WinnerList({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? score,
    $core.String? frame,
    $core.String? frameNew,
    $core.int? position,
    $core.String? status,
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
    if (score != null) {
      _result.score = score;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (frameNew != null) {
      _result.frameNew = frameNew;
    }
    if (position != null) {
      _result.position = position;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory RoomRefersh_RoomGroupPk_PkResult_WinnerList.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_RoomGroupPk_PkResult_WinnerList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_RoomGroupPk_PkResult_WinnerList clone() =>
      RoomRefersh_RoomGroupPk_PkResult_WinnerList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_RoomGroupPk_PkResult_WinnerList copyWith(
          void Function(RoomRefersh_RoomGroupPk_PkResult_WinnerList) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_RoomGroupPk_PkResult_WinnerList))
          as RoomRefersh_RoomGroupPk_PkResult_WinnerList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RoomGroupPk_PkResult_WinnerList create() =>
      RoomRefersh_RoomGroupPk_PkResult_WinnerList._();
  RoomRefersh_RoomGroupPk_PkResult_WinnerList createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_RoomGroupPk_PkResult_WinnerList>
      createRepeated() =>
          $pb.PbList<RoomRefersh_RoomGroupPk_PkResult_WinnerList>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RoomGroupPk_PkResult_WinnerList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_RoomGroupPk_PkResult_WinnerList>(create);
  static RoomRefersh_RoomGroupPk_PkResult_WinnerList? _defaultInstance;

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
  $core.int get score => $_getIZ(3);
  @$pb.TagNumber(4)
  set score($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearScore() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get frame => $_getSZ(4);
  @$pb.TagNumber(5)
  set frame($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFrame() => $_has(4);
  @$pb.TagNumber(5)
  void clearFrame() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get frameNew => $_getSZ(5);
  @$pb.TagNumber(6)
  set frameNew($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasFrameNew() => $_has(5);
  @$pb.TagNumber(6)
  void clearFrameNew() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get position => $_getIZ(6);
  @$pb.TagNumber(7)
  set position($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPosition() => $_has(6);
  @$pb.TagNumber(7)
  void clearPosition() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get status => $_getSZ(7);
  @$pb.TagNumber(8)
  set status($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => clearField(8);
}

class RoomRefersh_RoomGroupPk_PkResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.RoomGroupPk.PkResult',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'winner_value',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'loser_value',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'winner_side')
    ..pc<RoomRefersh_RoomGroupPk_PkResult_WinnerList>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'winner_list',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_RoomGroupPk_PkResult_WinnerList.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_time',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mvp_uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_RoomGroupPk_PkResult._() : super();
  factory RoomRefersh_RoomGroupPk_PkResult({
    $core.int? winnerValue,
    $core.int? loserValue,
    $core.String? winnerSide,
    $core.Iterable<RoomRefersh_RoomGroupPk_PkResult_WinnerList>? winnerList,
    $core.int? showTime,
    $core.int? mvpUid,
  }) {
    final _result = create();
    if (winnerValue != null) {
      _result.winnerValue = winnerValue;
    }
    if (loserValue != null) {
      _result.loserValue = loserValue;
    }
    if (winnerSide != null) {
      _result.winnerSide = winnerSide;
    }
    if (winnerList != null) {
      _result.winnerList.addAll(winnerList);
    }
    if (showTime != null) {
      _result.showTime = showTime;
    }
    if (mvpUid != null) {
      _result.mvpUid = mvpUid;
    }
    return _result;
  }
  factory RoomRefersh_RoomGroupPk_PkResult.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_RoomGroupPk_PkResult.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_RoomGroupPk_PkResult clone() =>
      RoomRefersh_RoomGroupPk_PkResult()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_RoomGroupPk_PkResult copyWith(
          void Function(RoomRefersh_RoomGroupPk_PkResult) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_RoomGroupPk_PkResult))
          as RoomRefersh_RoomGroupPk_PkResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RoomGroupPk_PkResult create() =>
      RoomRefersh_RoomGroupPk_PkResult._();
  RoomRefersh_RoomGroupPk_PkResult createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_RoomGroupPk_PkResult> createRepeated() =>
      $pb.PbList<RoomRefersh_RoomGroupPk_PkResult>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RoomGroupPk_PkResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_RoomGroupPk_PkResult>(
          create);
  static RoomRefersh_RoomGroupPk_PkResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get winnerValue => $_getIZ(0);
  @$pb.TagNumber(1)
  set winnerValue($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasWinnerValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearWinnerValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get loserValue => $_getIZ(1);
  @$pb.TagNumber(2)
  set loserValue($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLoserValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearLoserValue() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get winnerSide => $_getSZ(2);
  @$pb.TagNumber(3)
  set winnerSide($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasWinnerSide() => $_has(2);
  @$pb.TagNumber(3)
  void clearWinnerSide() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<RoomRefersh_RoomGroupPk_PkResult_WinnerList> get winnerList =>
      $_getList(3);

  @$pb.TagNumber(5)
  $core.int get showTime => $_getIZ(4);
  @$pb.TagNumber(5)
  set showTime($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasShowTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearShowTime() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get mvpUid => $_getIZ(5);
  @$pb.TagNumber(6)
  set mvpUid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMvpUid() => $_has(5);
  @$pb.TagNumber(6)
  void clearMvpUid() => clearField(6);
}

class RoomRefersh_RoomGroupPk_List_Punish extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.RoomGroupPk.List.Punish',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..hasRequiredFields = false;

  RoomRefersh_RoomGroupPk_List_Punish._() : super();
  factory RoomRefersh_RoomGroupPk_List_Punish({
    $core.int? type,
    $core.String? content,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory RoomRefersh_RoomGroupPk_List_Punish.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_RoomGroupPk_List_Punish.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_RoomGroupPk_List_Punish clone() =>
      RoomRefersh_RoomGroupPk_List_Punish()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_RoomGroupPk_List_Punish copyWith(
          void Function(RoomRefersh_RoomGroupPk_List_Punish) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_RoomGroupPk_List_Punish))
          as RoomRefersh_RoomGroupPk_List_Punish; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RoomGroupPk_List_Punish create() =>
      RoomRefersh_RoomGroupPk_List_Punish._();
  RoomRefersh_RoomGroupPk_List_Punish createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_RoomGroupPk_List_Punish> createRepeated() =>
      $pb.PbList<RoomRefersh_RoomGroupPk_List_Punish>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RoomGroupPk_List_Punish getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_RoomGroupPk_List_Punish>(create);
  static RoomRefersh_RoomGroupPk_List_Punish? _defaultInstance;

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
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
}

class RoomRefersh_RoomGroupPk_List_PunishNew extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.RoomGroupPk.List.PunishNew',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
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
            : 'content')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'paper_count',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_RoomGroupPk_List_PunishNew._() : super();
  factory RoomRefersh_RoomGroupPk_List_PunishNew({
    $core.int? uid,
    $core.int? id,
    $core.String? type,
    $core.String? content,
    $core.int? paperCount,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (id != null) {
      _result.id = id;
    }
    if (type != null) {
      _result.type = type;
    }
    if (content != null) {
      _result.content = content;
    }
    if (paperCount != null) {
      _result.paperCount = paperCount;
    }
    return _result;
  }
  factory RoomRefersh_RoomGroupPk_List_PunishNew.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_RoomGroupPk_List_PunishNew.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_RoomGroupPk_List_PunishNew clone() =>
      RoomRefersh_RoomGroupPk_List_PunishNew()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_RoomGroupPk_List_PunishNew copyWith(
          void Function(RoomRefersh_RoomGroupPk_List_PunishNew) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_RoomGroupPk_List_PunishNew))
          as RoomRefersh_RoomGroupPk_List_PunishNew; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RoomGroupPk_List_PunishNew create() =>
      RoomRefersh_RoomGroupPk_List_PunishNew._();
  RoomRefersh_RoomGroupPk_List_PunishNew createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_RoomGroupPk_List_PunishNew> createRepeated() =>
      $pb.PbList<RoomRefersh_RoomGroupPk_List_PunishNew>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RoomGroupPk_List_PunishNew getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_RoomGroupPk_List_PunishNew>(create);
  static RoomRefersh_RoomGroupPk_List_PunishNew? _defaultInstance;

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
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

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
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get paperCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set paperCount($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPaperCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearPaperCount() => clearField(5);
}

class RoomRefersh_RoomGroupPk_List extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.RoomGroupPk.List',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame_new')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.O3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status')
    ..pc<RoomRefersh_RoomGroupPk_List_Punish>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'punish',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_RoomGroupPk_List_Punish.create)
    ..pc<RoomRefersh_RoomGroupPk_List_PunishNew>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'punish_new',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_RoomGroupPk_List_PunishNew.create)
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gs_icon')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gameZone',
        protoName: 'gameZone')
    ..hasRequiredFields = false;

  RoomRefersh_RoomGroupPk_List._() : super();
  factory RoomRefersh_RoomGroupPk_List({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? score,
    $core.String? frame,
    $core.String? frameNew,
    $core.int? position,
    $core.String? status,
    $core.Iterable<RoomRefersh_RoomGroupPk_List_Punish>? punish,
    $core.Iterable<RoomRefersh_RoomGroupPk_List_PunishNew>? punishNew,
    $core.String? gsIcon,
    $core.String? gameZone,
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
    if (score != null) {
      _result.score = score;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (frameNew != null) {
      _result.frameNew = frameNew;
    }
    if (position != null) {
      _result.position = position;
    }
    if (status != null) {
      _result.status = status;
    }
    if (punish != null) {
      _result.punish.addAll(punish);
    }
    if (punishNew != null) {
      _result.punishNew.addAll(punishNew);
    }
    if (gsIcon != null) {
      _result.gsIcon = gsIcon;
    }
    if (gameZone != null) {
      _result.gameZone = gameZone;
    }
    return _result;
  }
  factory RoomRefersh_RoomGroupPk_List.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_RoomGroupPk_List.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_RoomGroupPk_List clone() =>
      RoomRefersh_RoomGroupPk_List()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_RoomGroupPk_List copyWith(
          void Function(RoomRefersh_RoomGroupPk_List) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_RoomGroupPk_List))
          as RoomRefersh_RoomGroupPk_List; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RoomGroupPk_List create() =>
      RoomRefersh_RoomGroupPk_List._();
  RoomRefersh_RoomGroupPk_List createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_RoomGroupPk_List> createRepeated() =>
      $pb.PbList<RoomRefersh_RoomGroupPk_List>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RoomGroupPk_List getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_RoomGroupPk_List>(create);
  static RoomRefersh_RoomGroupPk_List? _defaultInstance;

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
  $core.int get score => $_getIZ(3);
  @$pb.TagNumber(4)
  set score($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearScore() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get frame => $_getSZ(4);
  @$pb.TagNumber(5)
  set frame($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFrame() => $_has(4);
  @$pb.TagNumber(5)
  void clearFrame() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get frameNew => $_getSZ(5);
  @$pb.TagNumber(6)
  set frameNew($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasFrameNew() => $_has(5);
  @$pb.TagNumber(6)
  void clearFrameNew() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get position => $_getIZ(6);
  @$pb.TagNumber(7)
  set position($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPosition() => $_has(6);
  @$pb.TagNumber(7)
  void clearPosition() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get status => $_getSZ(7);
  @$pb.TagNumber(8)
  set status($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<RoomRefersh_RoomGroupPk_List_Punish> get punish => $_getList(8);

  @$pb.TagNumber(10)
  $core.List<RoomRefersh_RoomGroupPk_List_PunishNew> get punishNew =>
      $_getList(9);

  @$pb.TagNumber(11)
  $core.String get gsIcon => $_getSZ(10);
  @$pb.TagNumber(11)
  set gsIcon($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasGsIcon() => $_has(10);
  @$pb.TagNumber(11)
  void clearGsIcon() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get gameZone => $_getSZ(11);
  @$pb.TagNumber(12)
  set gameZone($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasGameZone() => $_has(11);
  @$pb.TagNumber(12)
  void clearGameZone() => clearField(12);
}

class RoomRefersh_RoomGroupPk extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.RoomGroupPk',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..aOM<RoomRefersh_RoomGroupPk_LeftSide>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'left_side',
        subBuilder: RoomRefersh_RoomGroupPk_LeftSide.create)
    ..aOM<RoomRefersh_RoomGroupPk_RightSide>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'right_side',
        subBuilder: RoomRefersh_RoomGroupPk_RightSide.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pk_rule',
        $pb.PbFieldType.OU3)
    ..aOM<RoomRefersh_RoomGroupPk_PkResult>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pk_result',
        subBuilder: RoomRefersh_RoomGroupPk_PkResult.create)
    ..pc<RoomRefersh_Top3Sender>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'top3_sender',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_Top3Sender.create)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pk_time_left',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'punish_time_left',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'punish_name')
    ..aOM<RoomRefersh_BestReceiver>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'best_receiver',
        subBuilder: RoomRefersh_BestReceiver.create)
    ..aOM<RoomRefersh_BestSender>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'best_sender',
        subBuilder: RoomRefersh_BestSender.create)
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gs_icon')
    ..hasRequiredFields = false;

  RoomRefersh_RoomGroupPk._() : super();
  factory RoomRefersh_RoomGroupPk({
    $core.String? state,
    RoomRefersh_RoomGroupPk_LeftSide? leftSide,
    RoomRefersh_RoomGroupPk_RightSide? rightSide,
    $core.int? pkRule,
    RoomRefersh_RoomGroupPk_PkResult? pkResult,
    $core.Iterable<RoomRefersh_Top3Sender>? top3Sender,
    $core.int? pkTimeLeft,
    $core.int? punishTimeLeft,
    $core.String? punishName,
    RoomRefersh_BestReceiver? bestReceiver,
    RoomRefersh_BestSender? bestSender,
    $core.String? gsIcon,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    if (leftSide != null) {
      _result.leftSide = leftSide;
    }
    if (rightSide != null) {
      _result.rightSide = rightSide;
    }
    if (pkRule != null) {
      _result.pkRule = pkRule;
    }
    if (pkResult != null) {
      _result.pkResult = pkResult;
    }
    if (top3Sender != null) {
      _result.top3Sender.addAll(top3Sender);
    }
    if (pkTimeLeft != null) {
      _result.pkTimeLeft = pkTimeLeft;
    }
    if (punishTimeLeft != null) {
      _result.punishTimeLeft = punishTimeLeft;
    }
    if (punishName != null) {
      _result.punishName = punishName;
    }
    if (bestReceiver != null) {
      _result.bestReceiver = bestReceiver;
    }
    if (bestSender != null) {
      _result.bestSender = bestSender;
    }
    if (gsIcon != null) {
      _result.gsIcon = gsIcon;
    }
    return _result;
  }
  factory RoomRefersh_RoomGroupPk.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_RoomGroupPk.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_RoomGroupPk clone() =>
      RoomRefersh_RoomGroupPk()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_RoomGroupPk copyWith(
          void Function(RoomRefersh_RoomGroupPk) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_RoomGroupPk))
          as RoomRefersh_RoomGroupPk; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RoomGroupPk create() => RoomRefersh_RoomGroupPk._();
  RoomRefersh_RoomGroupPk createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_RoomGroupPk> createRepeated() =>
      $pb.PbList<RoomRefersh_RoomGroupPk>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RoomGroupPk getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_RoomGroupPk>(create);
  static RoomRefersh_RoomGroupPk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get state => $_getSZ(0);
  @$pb.TagNumber(1)
  set state($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);

  @$pb.TagNumber(2)
  RoomRefersh_RoomGroupPk_LeftSide get leftSide => $_getN(1);
  @$pb.TagNumber(2)
  set leftSide(RoomRefersh_RoomGroupPk_LeftSide v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLeftSide() => $_has(1);
  @$pb.TagNumber(2)
  void clearLeftSide() => clearField(2);
  @$pb.TagNumber(2)
  RoomRefersh_RoomGroupPk_LeftSide ensureLeftSide() => $_ensure(1);

  @$pb.TagNumber(3)
  RoomRefersh_RoomGroupPk_RightSide get rightSide => $_getN(2);
  @$pb.TagNumber(3)
  set rightSide(RoomRefersh_RoomGroupPk_RightSide v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRightSide() => $_has(2);
  @$pb.TagNumber(3)
  void clearRightSide() => clearField(3);
  @$pb.TagNumber(3)
  RoomRefersh_RoomGroupPk_RightSide ensureRightSide() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get pkRule => $_getIZ(3);
  @$pb.TagNumber(4)
  set pkRule($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPkRule() => $_has(3);
  @$pb.TagNumber(4)
  void clearPkRule() => clearField(4);

  @$pb.TagNumber(5)
  RoomRefersh_RoomGroupPk_PkResult get pkResult => $_getN(4);
  @$pb.TagNumber(5)
  set pkResult(RoomRefersh_RoomGroupPk_PkResult v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPkResult() => $_has(4);
  @$pb.TagNumber(5)
  void clearPkResult() => clearField(5);
  @$pb.TagNumber(5)
  RoomRefersh_RoomGroupPk_PkResult ensurePkResult() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.List<RoomRefersh_Top3Sender> get top3Sender => $_getList(5);

  @$pb.TagNumber(7)
  $core.int get pkTimeLeft => $_getIZ(6);
  @$pb.TagNumber(7)
  set pkTimeLeft($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPkTimeLeft() => $_has(6);
  @$pb.TagNumber(7)
  void clearPkTimeLeft() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get punishTimeLeft => $_getIZ(7);
  @$pb.TagNumber(8)
  set punishTimeLeft($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPunishTimeLeft() => $_has(7);
  @$pb.TagNumber(8)
  void clearPunishTimeLeft() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get punishName => $_getSZ(8);
  @$pb.TagNumber(9)
  set punishName($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPunishName() => $_has(8);
  @$pb.TagNumber(9)
  void clearPunishName() => clearField(9);

  @$pb.TagNumber(10)
  RoomRefersh_BestReceiver get bestReceiver => $_getN(9);
  @$pb.TagNumber(10)
  set bestReceiver(RoomRefersh_BestReceiver v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasBestReceiver() => $_has(9);
  @$pb.TagNumber(10)
  void clearBestReceiver() => clearField(10);
  @$pb.TagNumber(10)
  RoomRefersh_BestReceiver ensureBestReceiver() => $_ensure(9);

  @$pb.TagNumber(11)
  RoomRefersh_BestSender get bestSender => $_getN(10);
  @$pb.TagNumber(11)
  set bestSender(RoomRefersh_BestSender v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasBestSender() => $_has(10);
  @$pb.TagNumber(11)
  void clearBestSender() => clearField(11);
  @$pb.TagNumber(11)
  RoomRefersh_BestSender ensureBestSender() => $_ensure(10);

  @$pb.TagNumber(13)
  $core.String get gsIcon => $_getSZ(11);
  @$pb.TagNumber(13)
  set gsIcon($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasGsIcon() => $_has(11);
  @$pb.TagNumber(13)
  void clearGsIcon() => clearField(13);
}

class RoomRefersh_BestReceiver extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.BestReceiver',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame_new')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gs_icon')
    ..hasRequiredFields = false;

  RoomRefersh_BestReceiver._() : super();
  factory RoomRefersh_BestReceiver({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? score,
    $core.String? frame,
    $core.String? frameNew,
    $core.String? gsIcon,
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
    if (score != null) {
      _result.score = score;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (frameNew != null) {
      _result.frameNew = frameNew;
    }
    if (gsIcon != null) {
      _result.gsIcon = gsIcon;
    }
    return _result;
  }
  factory RoomRefersh_BestReceiver.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_BestReceiver.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_BestReceiver clone() =>
      RoomRefersh_BestReceiver()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_BestReceiver copyWith(
          void Function(RoomRefersh_BestReceiver) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_BestReceiver))
          as RoomRefersh_BestReceiver; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_BestReceiver create() => RoomRefersh_BestReceiver._();
  RoomRefersh_BestReceiver createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_BestReceiver> createRepeated() =>
      $pb.PbList<RoomRefersh_BestReceiver>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_BestReceiver getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_BestReceiver>(create);
  static RoomRefersh_BestReceiver? _defaultInstance;

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
  $core.int get score => $_getIZ(3);
  @$pb.TagNumber(4)
  set score($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearScore() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get frame => $_getSZ(4);
  @$pb.TagNumber(5)
  set frame($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFrame() => $_has(4);
  @$pb.TagNumber(5)
  void clearFrame() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get frameNew => $_getSZ(5);
  @$pb.TagNumber(6)
  set frameNew($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasFrameNew() => $_has(5);
  @$pb.TagNumber(6)
  void clearFrameNew() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get gsIcon => $_getSZ(6);
  @$pb.TagNumber(7)
  set gsIcon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGsIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearGsIcon() => clearField(7);
}

class RoomRefersh_BestSender extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.BestSender',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
            : 'gift_value')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame_new')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  RoomRefersh_BestSender._() : super();
  factory RoomRefersh_BestSender({
    $core.int? uid,
    $core.String? giftValue,
    $core.String? frame,
    $core.String? frameNew,
    $core.String? icon,
    $core.String? name,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (giftValue != null) {
      _result.giftValue = giftValue;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (frameNew != null) {
      _result.frameNew = frameNew;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory RoomRefersh_BestSender.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_BestSender.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_BestSender clone() =>
      RoomRefersh_BestSender()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_BestSender copyWith(
          void Function(RoomRefersh_BestSender) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_BestSender))
          as RoomRefersh_BestSender; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_BestSender create() => RoomRefersh_BestSender._();
  RoomRefersh_BestSender createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_BestSender> createRepeated() =>
      $pb.PbList<RoomRefersh_BestSender>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_BestSender getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_BestSender>(create);
  static RoomRefersh_BestSender? _defaultInstance;

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
  $core.String get giftValue => $_getSZ(1);
  @$pb.TagNumber(2)
  set giftValue($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGiftValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftValue() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get frame => $_getSZ(2);
  @$pb.TagNumber(3)
  set frame($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFrame() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrame() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get frameNew => $_getSZ(3);
  @$pb.TagNumber(4)
  set frameNew($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFrameNew() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrameNew() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => clearField(6);
}

class RoomRefersh_ZegoGameConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.ZegoGameConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'game_id')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'min_mic_num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'max_mic_num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'game_state',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_ZegoGameConfig._() : super();
  factory RoomRefersh_ZegoGameConfig({
    $core.String? gameId,
    $core.int? minMicNum,
    $core.int? maxMicNum,
    $core.int? gameState,
  }) {
    final _result = create();
    if (gameId != null) {
      _result.gameId = gameId;
    }
    if (minMicNum != null) {
      _result.minMicNum = minMicNum;
    }
    if (maxMicNum != null) {
      _result.maxMicNum = maxMicNum;
    }
    if (gameState != null) {
      _result.gameState = gameState;
    }
    return _result;
  }
  factory RoomRefersh_ZegoGameConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_ZegoGameConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_ZegoGameConfig clone() =>
      RoomRefersh_ZegoGameConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_ZegoGameConfig copyWith(
          void Function(RoomRefersh_ZegoGameConfig) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_ZegoGameConfig))
          as RoomRefersh_ZegoGameConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_ZegoGameConfig create() => RoomRefersh_ZegoGameConfig._();
  RoomRefersh_ZegoGameConfig createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_ZegoGameConfig> createRepeated() =>
      $pb.PbList<RoomRefersh_ZegoGameConfig>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_ZegoGameConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_ZegoGameConfig>(create);
  static RoomRefersh_ZegoGameConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get gameId => $_getSZ(0);
  @$pb.TagNumber(1)
  set gameId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGameId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get minMicNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set minMicNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMinMicNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinMicNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get maxMicNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set maxMicNum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMaxMicNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxMicNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get gameState => $_getIZ(3);
  @$pb.TagNumber(4)
  set gameState($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGameState() => $_has(3);
  @$pb.TagNumber(4)
  void clearGameState() => clearField(4);
}

class RoomRefersh_Creator extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Creator',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gameId',
        protoName: 'gameId')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gameZone',
        protoName: 'gameZone')
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
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'package',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_Creator._() : super();
  factory RoomRefersh_Creator({
    $core.int? age,
    $core.String? gameId,
    $core.String? gameZone,
    $core.String? icon,
    $core.String? name,
    $core.int? role,
    $core.int? sex,
    $core.int? uid,
    $core.int? package,
  }) {
    final _result = create();
    if (age != null) {
      _result.age = age;
    }
    if (gameId != null) {
      _result.gameId = gameId;
    }
    if (gameZone != null) {
      _result.gameZone = gameZone;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (role != null) {
      _result.role = role;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (package != null) {
      _result.package = package;
    }
    return _result;
  }
  factory RoomRefersh_Creator.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Creator.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Creator clone() => RoomRefersh_Creator()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Creator copyWith(void Function(RoomRefersh_Creator) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_Creator))
          as RoomRefersh_Creator; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Creator create() => RoomRefersh_Creator._();
  RoomRefersh_Creator createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Creator> createRepeated() =>
      $pb.PbList<RoomRefersh_Creator>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Creator getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Creator>(create);
  static RoomRefersh_Creator? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get age => $_getIZ(0);
  @$pb.TagNumber(1)
  set age($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAge() => $_has(0);
  @$pb.TagNumber(1)
  void clearAge() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get gameId => $_getSZ(1);
  @$pb.TagNumber(2)
  set gameId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGameId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGameId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get gameZone => $_getSZ(2);
  @$pb.TagNumber(3)
  set gameZone($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGameZone() => $_has(2);
  @$pb.TagNumber(3)
  void clearGameZone() => clearField(3);

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

  @$pb.TagNumber(6)
  $core.int get role => $_getIZ(5);
  @$pb.TagNumber(6)
  set role($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRole() => $_has(5);
  @$pb.TagNumber(6)
  void clearRole() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get sex => $_getIZ(6);
  @$pb.TagNumber(7)
  set sex($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSex() => $_has(6);
  @$pb.TagNumber(7)
  void clearSex() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get uid => $_getIZ(7);
  @$pb.TagNumber(8)
  set uid($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasUid() => $_has(7);
  @$pb.TagNumber(8)
  void clearUid() => clearField(8);

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
}

class RoomRefersh_CrossPk extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.CrossPk',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cross_pk_enable',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_cross_pk',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_CrossPk._() : super();
  factory RoomRefersh_CrossPk({
    $core.int? crossPkEnable,
    $core.int? showCrossPk,
  }) {
    final _result = create();
    if (crossPkEnable != null) {
      _result.crossPkEnable = crossPkEnable;
    }
    if (showCrossPk != null) {
      _result.showCrossPk = showCrossPk;
    }
    return _result;
  }
  factory RoomRefersh_CrossPk.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_CrossPk.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_CrossPk clone() => RoomRefersh_CrossPk()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_CrossPk copyWith(void Function(RoomRefersh_CrossPk) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_CrossPk))
          as RoomRefersh_CrossPk; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CrossPk create() => RoomRefersh_CrossPk._();
  RoomRefersh_CrossPk createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_CrossPk> createRepeated() =>
      $pb.PbList<RoomRefersh_CrossPk>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CrossPk getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_CrossPk>(create);
  static RoomRefersh_CrossPk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get crossPkEnable => $_getIZ(0);
  @$pb.TagNumber(1)
  set crossPkEnable($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCrossPkEnable() => $_has(0);
  @$pb.TagNumber(1)
  void clearCrossPkEnable() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get showCrossPk => $_getIZ(1);
  @$pb.TagNumber(2)
  set showCrossPk($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasShowCrossPk() => $_has(1);
  @$pb.TagNumber(2)
  void clearShowCrossPk() => clearField(2);
}

class RoomRefersh_GiftWish_Gifts extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.GiftWish.Gifts',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift_id',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  RoomRefersh_GiftWish_Gifts._() : super();
  factory RoomRefersh_GiftWish_Gifts({
    $core.int? giftId,
    $core.String? name,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory RoomRefersh_GiftWish_Gifts.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_GiftWish_Gifts.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_GiftWish_Gifts clone() =>
      RoomRefersh_GiftWish_Gifts()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_GiftWish_Gifts copyWith(
          void Function(RoomRefersh_GiftWish_Gifts) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_GiftWish_Gifts))
          as RoomRefersh_GiftWish_Gifts; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GiftWish_Gifts create() => RoomRefersh_GiftWish_Gifts._();
  RoomRefersh_GiftWish_Gifts createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_GiftWish_Gifts> createRepeated() =>
      $pb.PbList<RoomRefersh_GiftWish_Gifts>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GiftWish_Gifts getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_GiftWish_Gifts>(create);
  static RoomRefersh_GiftWish_Gifts? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get giftId => $_getIZ(0);
  @$pb.TagNumber(1)
  set giftId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => clearField(1);

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

class RoomRefersh_GiftWish_Champion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.GiftWish.Champion',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
            : 'icon')
    ..hasRequiredFields = false;

  RoomRefersh_GiftWish_Champion._() : super();
  factory RoomRefersh_GiftWish_Champion({
    $core.String? uid,
    $core.String? icon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory RoomRefersh_GiftWish_Champion.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_GiftWish_Champion.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_GiftWish_Champion clone() =>
      RoomRefersh_GiftWish_Champion()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_GiftWish_Champion copyWith(
          void Function(RoomRefersh_GiftWish_Champion) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_GiftWish_Champion))
          as RoomRefersh_GiftWish_Champion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GiftWish_Champion create() =>
      RoomRefersh_GiftWish_Champion._();
  RoomRefersh_GiftWish_Champion createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_GiftWish_Champion> createRepeated() =>
      $pb.PbList<RoomRefersh_GiftWish_Champion>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GiftWish_Champion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_GiftWish_Champion>(create);
  static RoomRefersh_GiftWish_Champion? _defaultInstance;

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

class RoomRefersh_GiftWish extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.GiftWish',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..pc<RoomRefersh_GiftWish_Gifts>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gifts',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_GiftWish_Gifts.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'percent',
        $pb.PbFieldType.OU3)
    ..aOM<RoomRefersh_GiftWish_Champion>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'champion',
        subBuilder: RoomRefersh_GiftWish_Champion.create)
    ..hasRequiredFields = false;

  RoomRefersh_GiftWish._() : super();
  factory RoomRefersh_GiftWish({
    $core.bool? show,
    $core.Iterable<RoomRefersh_GiftWish_Gifts>? gifts,
    $core.int? percent,
    RoomRefersh_GiftWish_Champion? champion,
  }) {
    final _result = create();
    if (show != null) {
      _result.show = show;
    }
    if (gifts != null) {
      _result.gifts.addAll(gifts);
    }
    if (percent != null) {
      _result.percent = percent;
    }
    if (champion != null) {
      _result.champion = champion;
    }
    return _result;
  }
  factory RoomRefersh_GiftWish.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_GiftWish.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_GiftWish clone() =>
      RoomRefersh_GiftWish()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_GiftWish copyWith(void Function(RoomRefersh_GiftWish) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_GiftWish))
          as RoomRefersh_GiftWish; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GiftWish create() => RoomRefersh_GiftWish._();
  RoomRefersh_GiftWish createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_GiftWish> createRepeated() =>
      $pb.PbList<RoomRefersh_GiftWish>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GiftWish getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_GiftWish>(create);
  static RoomRefersh_GiftWish? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get show => $_getBF(0);
  @$pb.TagNumber(1)
  set show($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShow() => $_has(0);
  @$pb.TagNumber(1)
  void clearShow() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<RoomRefersh_GiftWish_Gifts> get gifts => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get percent => $_getIZ(2);
  @$pb.TagNumber(3)
  set percent($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPercent() => $_has(2);
  @$pb.TagNumber(3)
  void clearPercent() => clearField(3);

  @$pb.TagNumber(4)
  RoomRefersh_GiftWish_Champion get champion => $_getN(3);
  @$pb.TagNumber(4)
  set champion(RoomRefersh_GiftWish_Champion v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasChampion() => $_has(3);
  @$pb.TagNumber(4)
  void clearChampion() => clearField(4);
  @$pb.TagNumber(4)
  RoomRefersh_GiftWish_Champion ensureChampion() => $_ensure(3);
}

class RoomRefersh_OffMicList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.OffMicList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
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
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_OffMicList._() : super();
  factory RoomRefersh_OffMicList({
    $core.String? frame,
    $core.String? icon,
    $core.String? name,
    $core.int? uid,
  }) {
    final _result = create();
    if (frame != null) {
      _result.frame = frame;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory RoomRefersh_OffMicList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_OffMicList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_OffMicList clone() =>
      RoomRefersh_OffMicList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_OffMicList copyWith(
          void Function(RoomRefersh_OffMicList) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_OffMicList))
          as RoomRefersh_OffMicList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_OffMicList create() => RoomRefersh_OffMicList._();
  RoomRefersh_OffMicList createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_OffMicList> createRepeated() =>
      $pb.PbList<RoomRefersh_OffMicList>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_OffMicList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_OffMicList>(create);
  static RoomRefersh_OffMicList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get frame => $_getSZ(0);
  @$pb.TagNumber(1)
  set frame($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFrame() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrame() => clearField(1);

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
  $core.int get uid => $_getIZ(3);
  @$pb.TagNumber(4)
  set uid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearUid() => clearField(4);
}

class RoomRefersh_List_Punish extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.List.Punish',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..hasRequiredFields = false;

  RoomRefersh_List_Punish._() : super();
  factory RoomRefersh_List_Punish({
    $core.int? type,
    $core.String? content,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory RoomRefersh_List_Punish.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_List_Punish.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_List_Punish clone() =>
      RoomRefersh_List_Punish()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_List_Punish copyWith(
          void Function(RoomRefersh_List_Punish) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_List_Punish))
          as RoomRefersh_List_Punish; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_List_Punish create() => RoomRefersh_List_Punish._();
  RoomRefersh_List_Punish createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_List_Punish> createRepeated() =>
      $pb.PbList<RoomRefersh_List_Punish>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_List_Punish getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_List_Punish>(create);
  static RoomRefersh_List_Punish? _defaultInstance;

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
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
}

class RoomRefersh_List_PunishNew extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.List.PunishNew',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
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
            : 'content')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'paper_count',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_List_PunishNew._() : super();
  factory RoomRefersh_List_PunishNew({
    $core.int? uid,
    $core.int? id,
    $core.String? type,
    $core.String? content,
    $core.int? paperCount,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (id != null) {
      _result.id = id;
    }
    if (type != null) {
      _result.type = type;
    }
    if (content != null) {
      _result.content = content;
    }
    if (paperCount != null) {
      _result.paperCount = paperCount;
    }
    return _result;
  }
  factory RoomRefersh_List_PunishNew.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_List_PunishNew.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_List_PunishNew clone() =>
      RoomRefersh_List_PunishNew()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_List_PunishNew copyWith(
          void Function(RoomRefersh_List_PunishNew) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_List_PunishNew))
          as RoomRefersh_List_PunishNew; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_List_PunishNew create() => RoomRefersh_List_PunishNew._();
  RoomRefersh_List_PunishNew createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_List_PunishNew> createRepeated() =>
      $pb.PbList<RoomRefersh_List_PunishNew>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_List_PunishNew getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_List_PunishNew>(create);
  static RoomRefersh_List_PunishNew? _defaultInstance;

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
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

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
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get paperCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set paperCount($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPaperCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearPaperCount() => clearField(5);
}

class RoomRefersh_List extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.List',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
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
            : 'lock',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'forbidden',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'counter',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'package',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mic_status',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inflexion',
        $pb.PbFieldType.OU3)
    ..aOM<$0.Value>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'credit_score',
        subBuilder: $0.Value.create)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOM<$0.Value>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        subBuilder: $0.Value.create)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline',
        $pb.PbFieldType.OU3)
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame_new')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ring')
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cp_display',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cp_target',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title_new',
        $pb.PbFieldType.OU3)
    ..aOM<$0.Value>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gu_origin',
        subBuilder: $0.Value.create)
    ..a<$core.int>(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_playing_cloud_game',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sort_score',
        $pb.PbFieldType.OU3)
    ..pc<RoomRefersh_List_Punish>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'punish',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_List_Punish.create)
    ..pc<RoomRefersh_List_PunishNew>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'punish_new',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_List_PunishNew.create)
    ..a<$core.int>(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guess_queue_line_id',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guess_queue_is_finish',
        $pb.PbFieldType.OU3)
    ..aOB(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guess_queue_word_choosed')
    ..aOB(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_new_shower')
    ..a<$core.int>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'want_play_cloud_game',
        $pb.PbFieldType.OU3)
    ..aOS(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gu_role')
    ..a<$core.int>(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gu_aid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gu_score',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gu_thumbs_up',
        $pb.PbFieldType.OU3)
    ..aOS(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gu_guess_text')
    ..a<$core.int>(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gu_guess_right',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        38,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knight_level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_origin',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        40,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_vote',
        $pb.PbFieldType.OU3)
    ..aOS(
        41,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_role')
    ..a<$core.int>(
        42,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_aid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        43,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_price',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        44,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_isDesc',
        $pb.PbFieldType.OU3,
        protoName: 'wo_isDesc')
    ..a<$core.int>(
        45,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_count',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        46,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_target',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        47,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_voteTarget',
        $pb.PbFieldType.OU3,
        protoName: 'wo_voteTarget')
    ..a<$core.int>(
        48,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_can_action',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        49,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_can_be_selected',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        50,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_action_uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        51,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_is_ready',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        52,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_is_police',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        53,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_action_status',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        54,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_is_publish_role',
        $pb.PbFieldType.OU3)
    ..aOS(
        55,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_dead_type')
    ..aOS(
        56,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_title_url')
    ..a<$core.int>(
        57,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wo_isDead',
        $pb.PbFieldType.OU3,
        protoName: 'wo_isDead')
    ..a<$core.int>(
        58,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'un_origin',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        59,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'un_vote',
        $pb.PbFieldType.O3)
    ..aOS(
        60,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'un_role')
    ..a<$core.int>(
        61,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'un_aid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        62,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'un_enable',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        63,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'un_admin',
        $pb.PbFieldType.OU3)
    ..aOS(
        64,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'music_name')
    ..a<$core.int>(
        65,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'live_only',
        $pb.PbFieldType.OU3)
    ..aOS(
        66,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'live_label')
    ..aOS(
        67,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gameZone',
        protoName: 'gameZone')
    ..aOS(
        68,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gameId',
        protoName: 'gameId')
    ..a<$core.int>(
        69,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'game_online',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        70,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position_role',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        71,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position_state',
        $pb.PbFieldType.OU3)
    ..aOS(
        72,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'throne_img')
    ..aOS(
        74,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position_label')
    ..aOS(
        75,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color_name')
    ..hasRequiredFields = false;

  RoomRefersh_List._() : super();
  factory RoomRefersh_List({
    $core.int? position,
    $core.int? uid,
    $core.int? lock,
    $core.int? forbidden,
    $core.int? counter,
    $core.int? package,
    $core.int? micStatus,
    $core.int? inflexion,
    $0.Value? creditScore,
    $core.String? name,
    $0.Value? sex,
    $core.int? age,
    $core.String? icon,
    $core.int? role,
    $core.int? dateline,
    $core.String? frameNew,
    $core.String? frame,
    $core.String? ring,
    $core.int? cpDisplay,
    $core.int? cpTarget,
    $core.int? titleNew,
    $0.Value? guOrigin,
    $core.int? isPlayingCloudGame,
    $core.int? sortScore,
    $core.Iterable<RoomRefersh_List_Punish>? punish,
    $core.Iterable<RoomRefersh_List_PunishNew>? punishNew,
    $core.int? guessQueueLineId,
    $core.int? guessQueueIsFinish,
    $core.bool? guessQueueWordChoosed,
    $core.bool? isNewShower,
    $core.int? wantPlayCloudGame,
    $core.String? guRole,
    $core.int? guAid,
    $core.int? guScore,
    $core.int? guThumbsUp,
    $core.String? guGuessText,
    $core.int? guGuessRight,
    $core.int? knightLevel,
    $core.int? woOrigin,
    $core.int? woVote,
    $core.String? woRole,
    $core.int? woAid,
    $core.int? woPrice,
    $core.int? woIsDesc,
    $core.int? woCount,
    $core.int? woTarget,
    $core.int? woVoteTarget,
    $core.int? woCanAction,
    $core.int? woCanBeSelected,
    $core.int? woActionUid,
    $core.int? woIsReady,
    $core.int? woIsPolice,
    $core.int? woActionStatus,
    $core.int? woIsPublishRole,
    $core.String? woDeadType,
    $core.String? woTitleUrl,
    $core.int? woIsDead,
    $core.int? unOrigin,
    $core.int? unVote,
    $core.String? unRole,
    $core.int? unAid,
    $core.int? unEnable,
    $core.int? unAdmin,
    $core.String? musicName,
    $core.int? liveOnly,
    $core.String? liveLabel,
    $core.String? gameZone,
    $core.String? gameId,
    $core.int? gameOnline,
    $core.int? positionRole,
    $core.int? positionState,
    $core.String? throneImg,
    $core.String? positionLabel,
    $core.String? colorName,
  }) {
    final _result = create();
    if (position != null) {
      _result.position = position;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (lock != null) {
      _result.lock = lock;
    }
    if (forbidden != null) {
      _result.forbidden = forbidden;
    }
    if (counter != null) {
      _result.counter = counter;
    }
    if (package != null) {
      _result.package = package;
    }
    if (micStatus != null) {
      _result.micStatus = micStatus;
    }
    if (inflexion != null) {
      _result.inflexion = inflexion;
    }
    if (creditScore != null) {
      _result.creditScore = creditScore;
    }
    if (name != null) {
      _result.name = name;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (age != null) {
      _result.age = age;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (role != null) {
      _result.role = role;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (frameNew != null) {
      _result.frameNew = frameNew;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (ring != null) {
      _result.ring = ring;
    }
    if (cpDisplay != null) {
      _result.cpDisplay = cpDisplay;
    }
    if (cpTarget != null) {
      _result.cpTarget = cpTarget;
    }
    if (titleNew != null) {
      _result.titleNew = titleNew;
    }
    if (guOrigin != null) {
      _result.guOrigin = guOrigin;
    }
    if (isPlayingCloudGame != null) {
      _result.isPlayingCloudGame = isPlayingCloudGame;
    }
    if (sortScore != null) {
      _result.sortScore = sortScore;
    }
    if (punish != null) {
      _result.punish.addAll(punish);
    }
    if (punishNew != null) {
      _result.punishNew.addAll(punishNew);
    }
    if (guessQueueLineId != null) {
      _result.guessQueueLineId = guessQueueLineId;
    }
    if (guessQueueIsFinish != null) {
      _result.guessQueueIsFinish = guessQueueIsFinish;
    }
    if (guessQueueWordChoosed != null) {
      _result.guessQueueWordChoosed = guessQueueWordChoosed;
    }
    if (isNewShower != null) {
      _result.isNewShower = isNewShower;
    }
    if (wantPlayCloudGame != null) {
      _result.wantPlayCloudGame = wantPlayCloudGame;
    }
    if (guRole != null) {
      _result.guRole = guRole;
    }
    if (guAid != null) {
      _result.guAid = guAid;
    }
    if (guScore != null) {
      _result.guScore = guScore;
    }
    if (guThumbsUp != null) {
      _result.guThumbsUp = guThumbsUp;
    }
    if (guGuessText != null) {
      _result.guGuessText = guGuessText;
    }
    if (guGuessRight != null) {
      _result.guGuessRight = guGuessRight;
    }
    if (knightLevel != null) {
      _result.knightLevel = knightLevel;
    }
    if (woOrigin != null) {
      _result.woOrigin = woOrigin;
    }
    if (woVote != null) {
      _result.woVote = woVote;
    }
    if (woRole != null) {
      _result.woRole = woRole;
    }
    if (woAid != null) {
      _result.woAid = woAid;
    }
    if (woPrice != null) {
      _result.woPrice = woPrice;
    }
    if (woIsDesc != null) {
      _result.woIsDesc = woIsDesc;
    }
    if (woCount != null) {
      _result.woCount = woCount;
    }
    if (woTarget != null) {
      _result.woTarget = woTarget;
    }
    if (woVoteTarget != null) {
      _result.woVoteTarget = woVoteTarget;
    }
    if (woCanAction != null) {
      _result.woCanAction = woCanAction;
    }
    if (woCanBeSelected != null) {
      _result.woCanBeSelected = woCanBeSelected;
    }
    if (woActionUid != null) {
      _result.woActionUid = woActionUid;
    }
    if (woIsReady != null) {
      _result.woIsReady = woIsReady;
    }
    if (woIsPolice != null) {
      _result.woIsPolice = woIsPolice;
    }
    if (woActionStatus != null) {
      _result.woActionStatus = woActionStatus;
    }
    if (woIsPublishRole != null) {
      _result.woIsPublishRole = woIsPublishRole;
    }
    if (woDeadType != null) {
      _result.woDeadType = woDeadType;
    }
    if (woTitleUrl != null) {
      _result.woTitleUrl = woTitleUrl;
    }
    if (woIsDead != null) {
      _result.woIsDead = woIsDead;
    }
    if (unOrigin != null) {
      _result.unOrigin = unOrigin;
    }
    if (unVote != null) {
      _result.unVote = unVote;
    }
    if (unRole != null) {
      _result.unRole = unRole;
    }
    if (unAid != null) {
      _result.unAid = unAid;
    }
    if (unEnable != null) {
      _result.unEnable = unEnable;
    }
    if (unAdmin != null) {
      _result.unAdmin = unAdmin;
    }
    if (musicName != null) {
      _result.musicName = musicName;
    }
    if (liveOnly != null) {
      _result.liveOnly = liveOnly;
    }
    if (liveLabel != null) {
      _result.liveLabel = liveLabel;
    }
    if (gameZone != null) {
      _result.gameZone = gameZone;
    }
    if (gameId != null) {
      _result.gameId = gameId;
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
    if (positionLabel != null) {
      _result.positionLabel = positionLabel;
    }
    if (colorName != null) {
      _result.colorName = colorName;
    }
    return _result;
  }
  factory RoomRefersh_List.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_List.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_List clone() => RoomRefersh_List()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_List copyWith(void Function(RoomRefersh_List) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_List))
          as RoomRefersh_List; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_List create() => RoomRefersh_List._();
  RoomRefersh_List createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_List> createRepeated() =>
      $pb.PbList<RoomRefersh_List>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_List getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_List>(create);
  static RoomRefersh_List? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get position => $_getIZ(0);
  @$pb.TagNumber(1)
  set position($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => clearField(1);

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
  $core.int get lock => $_getIZ(2);
  @$pb.TagNumber(3)
  set lock($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLock() => $_has(2);
  @$pb.TagNumber(3)
  void clearLock() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get forbidden => $_getIZ(3);
  @$pb.TagNumber(4)
  set forbidden($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasForbidden() => $_has(3);
  @$pb.TagNumber(4)
  void clearForbidden() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get counter => $_getIZ(4);
  @$pb.TagNumber(5)
  set counter($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCounter() => $_has(4);
  @$pb.TagNumber(5)
  void clearCounter() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get package => $_getIZ(5);
  @$pb.TagNumber(6)
  set package($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPackage() => $_has(5);
  @$pb.TagNumber(6)
  void clearPackage() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get micStatus => $_getIZ(6);
  @$pb.TagNumber(7)
  set micStatus($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMicStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearMicStatus() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get inflexion => $_getIZ(7);
  @$pb.TagNumber(8)
  set inflexion($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasInflexion() => $_has(7);
  @$pb.TagNumber(8)
  void clearInflexion() => clearField(8);

  @$pb.TagNumber(9)
  $0.Value get creditScore => $_getN(8);
  @$pb.TagNumber(9)
  set creditScore($0.Value v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasCreditScore() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreditScore() => clearField(9);
  @$pb.TagNumber(9)
  $0.Value ensureCreditScore() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.String get name => $_getSZ(9);
  @$pb.TagNumber(10)
  set name($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasName() => $_has(9);
  @$pb.TagNumber(10)
  void clearName() => clearField(10);

  @$pb.TagNumber(11)
  $0.Value get sex => $_getN(10);
  @$pb.TagNumber(11)
  set sex($0.Value v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasSex() => $_has(10);
  @$pb.TagNumber(11)
  void clearSex() => clearField(11);
  @$pb.TagNumber(11)
  $0.Value ensureSex() => $_ensure(10);

  @$pb.TagNumber(12)
  $core.int get age => $_getIZ(11);
  @$pb.TagNumber(12)
  set age($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasAge() => $_has(11);
  @$pb.TagNumber(12)
  void clearAge() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get icon => $_getSZ(12);
  @$pb.TagNumber(13)
  set icon($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasIcon() => $_has(12);
  @$pb.TagNumber(13)
  void clearIcon() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get role => $_getIZ(13);
  @$pb.TagNumber(14)
  set role($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasRole() => $_has(13);
  @$pb.TagNumber(14)
  void clearRole() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get dateline => $_getIZ(14);
  @$pb.TagNumber(15)
  set dateline($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasDateline() => $_has(14);
  @$pb.TagNumber(15)
  void clearDateline() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get frameNew => $_getSZ(15);
  @$pb.TagNumber(16)
  set frameNew($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasFrameNew() => $_has(15);
  @$pb.TagNumber(16)
  void clearFrameNew() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get frame => $_getSZ(16);
  @$pb.TagNumber(17)
  set frame($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasFrame() => $_has(16);
  @$pb.TagNumber(17)
  void clearFrame() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get ring => $_getSZ(17);
  @$pb.TagNumber(18)
  set ring($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasRing() => $_has(17);
  @$pb.TagNumber(18)
  void clearRing() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get cpDisplay => $_getIZ(18);
  @$pb.TagNumber(19)
  set cpDisplay($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasCpDisplay() => $_has(18);
  @$pb.TagNumber(19)
  void clearCpDisplay() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get cpTarget => $_getIZ(19);
  @$pb.TagNumber(20)
  set cpTarget($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasCpTarget() => $_has(19);
  @$pb.TagNumber(20)
  void clearCpTarget() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get titleNew => $_getIZ(20);
  @$pb.TagNumber(21)
  set titleNew($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasTitleNew() => $_has(20);
  @$pb.TagNumber(21)
  void clearTitleNew() => clearField(21);

  @$pb.TagNumber(22)
  $0.Value get guOrigin => $_getN(21);
  @$pb.TagNumber(22)
  set guOrigin($0.Value v) {
    setField(22, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasGuOrigin() => $_has(21);
  @$pb.TagNumber(22)
  void clearGuOrigin() => clearField(22);
  @$pb.TagNumber(22)
  $0.Value ensureGuOrigin() => $_ensure(21);

  @$pb.TagNumber(23)
  $core.int get isPlayingCloudGame => $_getIZ(22);
  @$pb.TagNumber(23)
  set isPlayingCloudGame($core.int v) {
    $_setUnsignedInt32(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasIsPlayingCloudGame() => $_has(22);
  @$pb.TagNumber(23)
  void clearIsPlayingCloudGame() => clearField(23);

  @$pb.TagNumber(24)
  $core.int get sortScore => $_getIZ(23);
  @$pb.TagNumber(24)
  set sortScore($core.int v) {
    $_setUnsignedInt32(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasSortScore() => $_has(23);
  @$pb.TagNumber(24)
  void clearSortScore() => clearField(24);

  @$pb.TagNumber(25)
  $core.List<RoomRefersh_List_Punish> get punish => $_getList(24);

  @$pb.TagNumber(26)
  $core.List<RoomRefersh_List_PunishNew> get punishNew => $_getList(25);

  @$pb.TagNumber(27)
  $core.int get guessQueueLineId => $_getIZ(26);
  @$pb.TagNumber(27)
  set guessQueueLineId($core.int v) {
    $_setUnsignedInt32(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasGuessQueueLineId() => $_has(26);
  @$pb.TagNumber(27)
  void clearGuessQueueLineId() => clearField(27);

  @$pb.TagNumber(28)
  $core.int get guessQueueIsFinish => $_getIZ(27);
  @$pb.TagNumber(28)
  set guessQueueIsFinish($core.int v) {
    $_setUnsignedInt32(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasGuessQueueIsFinish() => $_has(27);
  @$pb.TagNumber(28)
  void clearGuessQueueIsFinish() => clearField(28);

  @$pb.TagNumber(29)
  $core.bool get guessQueueWordChoosed => $_getBF(28);
  @$pb.TagNumber(29)
  set guessQueueWordChoosed($core.bool v) {
    $_setBool(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasGuessQueueWordChoosed() => $_has(28);
  @$pb.TagNumber(29)
  void clearGuessQueueWordChoosed() => clearField(29);

  @$pb.TagNumber(30)
  $core.bool get isNewShower => $_getBF(29);
  @$pb.TagNumber(30)
  set isNewShower($core.bool v) {
    $_setBool(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasIsNewShower() => $_has(29);
  @$pb.TagNumber(30)
  void clearIsNewShower() => clearField(30);

  @$pb.TagNumber(31)
  $core.int get wantPlayCloudGame => $_getIZ(30);
  @$pb.TagNumber(31)
  set wantPlayCloudGame($core.int v) {
    $_setUnsignedInt32(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasWantPlayCloudGame() => $_has(30);
  @$pb.TagNumber(31)
  void clearWantPlayCloudGame() => clearField(31);

  @$pb.TagNumber(32)
  $core.String get guRole => $_getSZ(31);
  @$pb.TagNumber(32)
  set guRole($core.String v) {
    $_setString(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasGuRole() => $_has(31);
  @$pb.TagNumber(32)
  void clearGuRole() => clearField(32);

  @$pb.TagNumber(33)
  $core.int get guAid => $_getIZ(32);
  @$pb.TagNumber(33)
  set guAid($core.int v) {
    $_setUnsignedInt32(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasGuAid() => $_has(32);
  @$pb.TagNumber(33)
  void clearGuAid() => clearField(33);

  @$pb.TagNumber(34)
  $core.int get guScore => $_getIZ(33);
  @$pb.TagNumber(34)
  set guScore($core.int v) {
    $_setUnsignedInt32(33, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasGuScore() => $_has(33);
  @$pb.TagNumber(34)
  void clearGuScore() => clearField(34);

  @$pb.TagNumber(35)
  $core.int get guThumbsUp => $_getIZ(34);
  @$pb.TagNumber(35)
  set guThumbsUp($core.int v) {
    $_setUnsignedInt32(34, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasGuThumbsUp() => $_has(34);
  @$pb.TagNumber(35)
  void clearGuThumbsUp() => clearField(35);

  @$pb.TagNumber(36)
  $core.String get guGuessText => $_getSZ(35);
  @$pb.TagNumber(36)
  set guGuessText($core.String v) {
    $_setString(35, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasGuGuessText() => $_has(35);
  @$pb.TagNumber(36)
  void clearGuGuessText() => clearField(36);

  @$pb.TagNumber(37)
  $core.int get guGuessRight => $_getIZ(36);
  @$pb.TagNumber(37)
  set guGuessRight($core.int v) {
    $_setUnsignedInt32(36, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasGuGuessRight() => $_has(36);
  @$pb.TagNumber(37)
  void clearGuGuessRight() => clearField(37);

  @$pb.TagNumber(38)
  $core.int get knightLevel => $_getIZ(37);
  @$pb.TagNumber(38)
  set knightLevel($core.int v) {
    $_setUnsignedInt32(37, v);
  }

  @$pb.TagNumber(38)
  $core.bool hasKnightLevel() => $_has(37);
  @$pb.TagNumber(38)
  void clearKnightLevel() => clearField(38);

  @$pb.TagNumber(39)
  $core.int get woOrigin => $_getIZ(38);
  @$pb.TagNumber(39)
  set woOrigin($core.int v) {
    $_setUnsignedInt32(38, v);
  }

  @$pb.TagNumber(39)
  $core.bool hasWoOrigin() => $_has(38);
  @$pb.TagNumber(39)
  void clearWoOrigin() => clearField(39);

  @$pb.TagNumber(40)
  $core.int get woVote => $_getIZ(39);
  @$pb.TagNumber(40)
  set woVote($core.int v) {
    $_setUnsignedInt32(39, v);
  }

  @$pb.TagNumber(40)
  $core.bool hasWoVote() => $_has(39);
  @$pb.TagNumber(40)
  void clearWoVote() => clearField(40);

  @$pb.TagNumber(41)
  $core.String get woRole => $_getSZ(40);
  @$pb.TagNumber(41)
  set woRole($core.String v) {
    $_setString(40, v);
  }

  @$pb.TagNumber(41)
  $core.bool hasWoRole() => $_has(40);
  @$pb.TagNumber(41)
  void clearWoRole() => clearField(41);

  @$pb.TagNumber(42)
  $core.int get woAid => $_getIZ(41);
  @$pb.TagNumber(42)
  set woAid($core.int v) {
    $_setUnsignedInt32(41, v);
  }

  @$pb.TagNumber(42)
  $core.bool hasWoAid() => $_has(41);
  @$pb.TagNumber(42)
  void clearWoAid() => clearField(42);

  @$pb.TagNumber(43)
  $core.int get woPrice => $_getIZ(42);
  @$pb.TagNumber(43)
  set woPrice($core.int v) {
    $_setUnsignedInt32(42, v);
  }

  @$pb.TagNumber(43)
  $core.bool hasWoPrice() => $_has(42);
  @$pb.TagNumber(43)
  void clearWoPrice() => clearField(43);

  @$pb.TagNumber(44)
  $core.int get woIsDesc => $_getIZ(43);
  @$pb.TagNumber(44)
  set woIsDesc($core.int v) {
    $_setUnsignedInt32(43, v);
  }

  @$pb.TagNumber(44)
  $core.bool hasWoIsDesc() => $_has(43);
  @$pb.TagNumber(44)
  void clearWoIsDesc() => clearField(44);

  @$pb.TagNumber(45)
  $core.int get woCount => $_getIZ(44);
  @$pb.TagNumber(45)
  set woCount($core.int v) {
    $_setUnsignedInt32(44, v);
  }

  @$pb.TagNumber(45)
  $core.bool hasWoCount() => $_has(44);
  @$pb.TagNumber(45)
  void clearWoCount() => clearField(45);

  @$pb.TagNumber(46)
  $core.int get woTarget => $_getIZ(45);
  @$pb.TagNumber(46)
  set woTarget($core.int v) {
    $_setUnsignedInt32(45, v);
  }

  @$pb.TagNumber(46)
  $core.bool hasWoTarget() => $_has(45);
  @$pb.TagNumber(46)
  void clearWoTarget() => clearField(46);

  @$pb.TagNumber(47)
  $core.int get woVoteTarget => $_getIZ(46);
  @$pb.TagNumber(47)
  set woVoteTarget($core.int v) {
    $_setUnsignedInt32(46, v);
  }

  @$pb.TagNumber(47)
  $core.bool hasWoVoteTarget() => $_has(46);
  @$pb.TagNumber(47)
  void clearWoVoteTarget() => clearField(47);

  @$pb.TagNumber(48)
  $core.int get woCanAction => $_getIZ(47);
  @$pb.TagNumber(48)
  set woCanAction($core.int v) {
    $_setUnsignedInt32(47, v);
  }

  @$pb.TagNumber(48)
  $core.bool hasWoCanAction() => $_has(47);
  @$pb.TagNumber(48)
  void clearWoCanAction() => clearField(48);

  @$pb.TagNumber(49)
  $core.int get woCanBeSelected => $_getIZ(48);
  @$pb.TagNumber(49)
  set woCanBeSelected($core.int v) {
    $_setUnsignedInt32(48, v);
  }

  @$pb.TagNumber(49)
  $core.bool hasWoCanBeSelected() => $_has(48);
  @$pb.TagNumber(49)
  void clearWoCanBeSelected() => clearField(49);

  @$pb.TagNumber(50)
  $core.int get woActionUid => $_getIZ(49);
  @$pb.TagNumber(50)
  set woActionUid($core.int v) {
    $_setUnsignedInt32(49, v);
  }

  @$pb.TagNumber(50)
  $core.bool hasWoActionUid() => $_has(49);
  @$pb.TagNumber(50)
  void clearWoActionUid() => clearField(50);

  @$pb.TagNumber(51)
  $core.int get woIsReady => $_getIZ(50);
  @$pb.TagNumber(51)
  set woIsReady($core.int v) {
    $_setUnsignedInt32(50, v);
  }

  @$pb.TagNumber(51)
  $core.bool hasWoIsReady() => $_has(50);
  @$pb.TagNumber(51)
  void clearWoIsReady() => clearField(51);

  @$pb.TagNumber(52)
  $core.int get woIsPolice => $_getIZ(51);
  @$pb.TagNumber(52)
  set woIsPolice($core.int v) {
    $_setUnsignedInt32(51, v);
  }

  @$pb.TagNumber(52)
  $core.bool hasWoIsPolice() => $_has(51);
  @$pb.TagNumber(52)
  void clearWoIsPolice() => clearField(52);

  @$pb.TagNumber(53)
  $core.int get woActionStatus => $_getIZ(52);
  @$pb.TagNumber(53)
  set woActionStatus($core.int v) {
    $_setUnsignedInt32(52, v);
  }

  @$pb.TagNumber(53)
  $core.bool hasWoActionStatus() => $_has(52);
  @$pb.TagNumber(53)
  void clearWoActionStatus() => clearField(53);

  @$pb.TagNumber(54)
  $core.int get woIsPublishRole => $_getIZ(53);
  @$pb.TagNumber(54)
  set woIsPublishRole($core.int v) {
    $_setUnsignedInt32(53, v);
  }

  @$pb.TagNumber(54)
  $core.bool hasWoIsPublishRole() => $_has(53);
  @$pb.TagNumber(54)
  void clearWoIsPublishRole() => clearField(54);

  @$pb.TagNumber(55)
  $core.String get woDeadType => $_getSZ(54);
  @$pb.TagNumber(55)
  set woDeadType($core.String v) {
    $_setString(54, v);
  }

  @$pb.TagNumber(55)
  $core.bool hasWoDeadType() => $_has(54);
  @$pb.TagNumber(55)
  void clearWoDeadType() => clearField(55);

  @$pb.TagNumber(56)
  $core.String get woTitleUrl => $_getSZ(55);
  @$pb.TagNumber(56)
  set woTitleUrl($core.String v) {
    $_setString(55, v);
  }

  @$pb.TagNumber(56)
  $core.bool hasWoTitleUrl() => $_has(55);
  @$pb.TagNumber(56)
  void clearWoTitleUrl() => clearField(56);

  @$pb.TagNumber(57)
  $core.int get woIsDead => $_getIZ(56);
  @$pb.TagNumber(57)
  set woIsDead($core.int v) {
    $_setUnsignedInt32(56, v);
  }

  @$pb.TagNumber(57)
  $core.bool hasWoIsDead() => $_has(56);
  @$pb.TagNumber(57)
  void clearWoIsDead() => clearField(57);

  @$pb.TagNumber(58)
  $core.int get unOrigin => $_getIZ(57);
  @$pb.TagNumber(58)
  set unOrigin($core.int v) {
    $_setUnsignedInt32(57, v);
  }

  @$pb.TagNumber(58)
  $core.bool hasUnOrigin() => $_has(57);
  @$pb.TagNumber(58)
  void clearUnOrigin() => clearField(58);

  @$pb.TagNumber(59)
  $core.int get unVote => $_getIZ(58);
  @$pb.TagNumber(59)
  set unVote($core.int v) {
    $_setSignedInt32(58, v);
  }

  @$pb.TagNumber(59)
  $core.bool hasUnVote() => $_has(58);
  @$pb.TagNumber(59)
  void clearUnVote() => clearField(59);

  @$pb.TagNumber(60)
  $core.String get unRole => $_getSZ(59);
  @$pb.TagNumber(60)
  set unRole($core.String v) {
    $_setString(59, v);
  }

  @$pb.TagNumber(60)
  $core.bool hasUnRole() => $_has(59);
  @$pb.TagNumber(60)
  void clearUnRole() => clearField(60);

  @$pb.TagNumber(61)
  $core.int get unAid => $_getIZ(60);
  @$pb.TagNumber(61)
  set unAid($core.int v) {
    $_setUnsignedInt32(60, v);
  }

  @$pb.TagNumber(61)
  $core.bool hasUnAid() => $_has(60);
  @$pb.TagNumber(61)
  void clearUnAid() => clearField(61);

  @$pb.TagNumber(62)
  $core.int get unEnable => $_getIZ(61);
  @$pb.TagNumber(62)
  set unEnable($core.int v) {
    $_setUnsignedInt32(61, v);
  }

  @$pb.TagNumber(62)
  $core.bool hasUnEnable() => $_has(61);
  @$pb.TagNumber(62)
  void clearUnEnable() => clearField(62);

  @$pb.TagNumber(63)
  $core.int get unAdmin => $_getIZ(62);
  @$pb.TagNumber(63)
  set unAdmin($core.int v) {
    $_setUnsignedInt32(62, v);
  }

  @$pb.TagNumber(63)
  $core.bool hasUnAdmin() => $_has(62);
  @$pb.TagNumber(63)
  void clearUnAdmin() => clearField(63);

  @$pb.TagNumber(64)
  $core.String get musicName => $_getSZ(63);
  @$pb.TagNumber(64)
  set musicName($core.String v) {
    $_setString(63, v);
  }

  @$pb.TagNumber(64)
  $core.bool hasMusicName() => $_has(63);
  @$pb.TagNumber(64)
  void clearMusicName() => clearField(64);

  @$pb.TagNumber(65)
  $core.int get liveOnly => $_getIZ(64);
  @$pb.TagNumber(65)
  set liveOnly($core.int v) {
    $_setUnsignedInt32(64, v);
  }

  @$pb.TagNumber(65)
  $core.bool hasLiveOnly() => $_has(64);
  @$pb.TagNumber(65)
  void clearLiveOnly() => clearField(65);

  @$pb.TagNumber(66)
  $core.String get liveLabel => $_getSZ(65);
  @$pb.TagNumber(66)
  set liveLabel($core.String v) {
    $_setString(65, v);
  }

  @$pb.TagNumber(66)
  $core.bool hasLiveLabel() => $_has(65);
  @$pb.TagNumber(66)
  void clearLiveLabel() => clearField(66);

  @$pb.TagNumber(67)
  $core.String get gameZone => $_getSZ(66);
  @$pb.TagNumber(67)
  set gameZone($core.String v) {
    $_setString(66, v);
  }

  @$pb.TagNumber(67)
  $core.bool hasGameZone() => $_has(66);
  @$pb.TagNumber(67)
  void clearGameZone() => clearField(67);

  @$pb.TagNumber(68)
  $core.String get gameId => $_getSZ(67);
  @$pb.TagNumber(68)
  set gameId($core.String v) {
    $_setString(67, v);
  }

  @$pb.TagNumber(68)
  $core.bool hasGameId() => $_has(67);
  @$pb.TagNumber(68)
  void clearGameId() => clearField(68);

  @$pb.TagNumber(69)
  $core.int get gameOnline => $_getIZ(68);
  @$pb.TagNumber(69)
  set gameOnline($core.int v) {
    $_setSignedInt32(68, v);
  }

  @$pb.TagNumber(69)
  $core.bool hasGameOnline() => $_has(68);
  @$pb.TagNumber(69)
  void clearGameOnline() => clearField(69);

  @$pb.TagNumber(70)
  $core.int get positionRole => $_getIZ(69);
  @$pb.TagNumber(70)
  set positionRole($core.int v) {
    $_setUnsignedInt32(69, v);
  }

  @$pb.TagNumber(70)
  $core.bool hasPositionRole() => $_has(69);
  @$pb.TagNumber(70)
  void clearPositionRole() => clearField(70);

  @$pb.TagNumber(71)
  $core.int get positionState => $_getIZ(70);
  @$pb.TagNumber(71)
  set positionState($core.int v) {
    $_setUnsignedInt32(70, v);
  }

  @$pb.TagNumber(71)
  $core.bool hasPositionState() => $_has(70);
  @$pb.TagNumber(71)
  void clearPositionState() => clearField(71);

  @$pb.TagNumber(72)
  $core.String get throneImg => $_getSZ(71);
  @$pb.TagNumber(72)
  set throneImg($core.String v) {
    $_setString(71, v);
  }

  @$pb.TagNumber(72)
  $core.bool hasThroneImg() => $_has(71);
  @$pb.TagNumber(72)
  void clearThroneImg() => clearField(72);

  @$pb.TagNumber(74)
  $core.String get positionLabel => $_getSZ(72);
  @$pb.TagNumber(74)
  set positionLabel($core.String v) {
    $_setString(72, v);
  }

  @$pb.TagNumber(74)
  $core.bool hasPositionLabel() => $_has(72);
  @$pb.TagNumber(74)
  void clearPositionLabel() => clearField(74);

  @$pb.TagNumber(75)
  $core.String get colorName => $_getSZ(73);
  @$pb.TagNumber(75)
  set colorName($core.String v) {
    $_setString(73, v);
  }

  @$pb.TagNumber(75)
  $core.bool hasColorName() => $_has(73);
  @$pb.TagNumber(75)
  void clearColorName() => clearField(75);
}

class RoomRefersh_DmConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.DmConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'counter',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'forbidden',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lock',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mic_status',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
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
            : 'position',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prepared',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title_new',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_DmConfig._() : super();
  factory RoomRefersh_DmConfig({
    $core.int? age,
    $core.int? counter,
    $core.int? forbidden,
    $core.String? frame,
    $core.String? icon,
    $core.int? lock,
    $core.int? micStatus,
    $core.String? name,
    $core.int? package,
    $core.int? position,
    $core.int? prepared,
    $core.int? role,
    $core.int? sex,
    $core.int? uid,
    $core.int? titleNew,
  }) {
    final _result = create();
    if (age != null) {
      _result.age = age;
    }
    if (counter != null) {
      _result.counter = counter;
    }
    if (forbidden != null) {
      _result.forbidden = forbidden;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (lock != null) {
      _result.lock = lock;
    }
    if (micStatus != null) {
      _result.micStatus = micStatus;
    }
    if (name != null) {
      _result.name = name;
    }
    if (package != null) {
      _result.package = package;
    }
    if (position != null) {
      _result.position = position;
    }
    if (prepared != null) {
      _result.prepared = prepared;
    }
    if (role != null) {
      _result.role = role;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (titleNew != null) {
      _result.titleNew = titleNew;
    }
    return _result;
  }
  factory RoomRefersh_DmConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_DmConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_DmConfig clone() =>
      RoomRefersh_DmConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_DmConfig copyWith(void Function(RoomRefersh_DmConfig) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_DmConfig))
          as RoomRefersh_DmConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_DmConfig create() => RoomRefersh_DmConfig._();
  RoomRefersh_DmConfig createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_DmConfig> createRepeated() =>
      $pb.PbList<RoomRefersh_DmConfig>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_DmConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_DmConfig>(create);
  static RoomRefersh_DmConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get age => $_getIZ(0);
  @$pb.TagNumber(1)
  set age($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAge() => $_has(0);
  @$pb.TagNumber(1)
  void clearAge() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get counter => $_getIZ(1);
  @$pb.TagNumber(2)
  set counter($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCounter() => $_has(1);
  @$pb.TagNumber(2)
  void clearCounter() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get forbidden => $_getIZ(2);
  @$pb.TagNumber(3)
  set forbidden($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasForbidden() => $_has(2);
  @$pb.TagNumber(3)
  void clearForbidden() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get frame => $_getSZ(3);
  @$pb.TagNumber(4)
  set frame($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFrame() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrame() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get lock => $_getIZ(5);
  @$pb.TagNumber(6)
  set lock($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLock() => $_has(5);
  @$pb.TagNumber(6)
  void clearLock() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get micStatus => $_getIZ(6);
  @$pb.TagNumber(7)
  set micStatus($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMicStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearMicStatus() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get name => $_getSZ(7);
  @$pb.TagNumber(8)
  set name($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasName() => $_has(7);
  @$pb.TagNumber(8)
  void clearName() => clearField(8);

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
  $core.int get position => $_getIZ(9);
  @$pb.TagNumber(10)
  set position($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasPosition() => $_has(9);
  @$pb.TagNumber(10)
  void clearPosition() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get prepared => $_getIZ(10);
  @$pb.TagNumber(11)
  set prepared($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasPrepared() => $_has(10);
  @$pb.TagNumber(11)
  void clearPrepared() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get role => $_getIZ(11);
  @$pb.TagNumber(12)
  set role($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasRole() => $_has(11);
  @$pb.TagNumber(12)
  void clearRole() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get sex => $_getIZ(12);
  @$pb.TagNumber(13)
  set sex($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasSex() => $_has(12);
  @$pb.TagNumber(13)
  void clearSex() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get uid => $_getIZ(13);
  @$pb.TagNumber(14)
  set uid($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasUid() => $_has(13);
  @$pb.TagNumber(14)
  void clearUid() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get titleNew => $_getIZ(14);
  @$pb.TagNumber(15)
  set titleNew($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasTitleNew() => $_has(14);
  @$pb.TagNumber(15)
  void clearTitleNew() => clearField(15);
}

class RoomRefersh_MicExtra_RunInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.MicExtra.RunInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'out_time',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_MicExtra_RunInfo._() : super();
  factory RoomRefersh_MicExtra_RunInfo({
    $core.int? uid,
    $core.int? outTime,
    $core.int? duration,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (outTime != null) {
      _result.outTime = outTime;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    return _result;
  }
  factory RoomRefersh_MicExtra_RunInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_MicExtra_RunInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_MicExtra_RunInfo clone() =>
      RoomRefersh_MicExtra_RunInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_MicExtra_RunInfo copyWith(
          void Function(RoomRefersh_MicExtra_RunInfo) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_MicExtra_RunInfo))
          as RoomRefersh_MicExtra_RunInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_MicExtra_RunInfo create() =>
      RoomRefersh_MicExtra_RunInfo._();
  RoomRefersh_MicExtra_RunInfo createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_MicExtra_RunInfo> createRepeated() =>
      $pb.PbList<RoomRefersh_MicExtra_RunInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_MicExtra_RunInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_MicExtra_RunInfo>(create);
  static RoomRefersh_MicExtra_RunInfo? _defaultInstance;

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
  $core.int get outTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set outTime($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOutTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearOutTime() => clearField(2);

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

class RoomRefersh_MicExtra extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.MicExtra',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'credit_restoring',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'play_again',
        $pb.PbFieldType.OU3)
    ..aOM<RoomRefersh_MicExtra_RunInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'run_info',
        subBuilder: RoomRefersh_MicExtra_RunInfo.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_MicExtra._() : super();
  factory RoomRefersh_MicExtra({
    $core.int? creditRestoring,
    $core.int? playAgain,
    RoomRefersh_MicExtra_RunInfo? runInfo,
    $core.int? uid,
  }) {
    final _result = create();
    if (creditRestoring != null) {
      _result.creditRestoring = creditRestoring;
    }
    if (playAgain != null) {
      _result.playAgain = playAgain;
    }
    if (runInfo != null) {
      _result.runInfo = runInfo;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory RoomRefersh_MicExtra.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_MicExtra.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_MicExtra clone() =>
      RoomRefersh_MicExtra()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_MicExtra copyWith(void Function(RoomRefersh_MicExtra) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_MicExtra))
          as RoomRefersh_MicExtra; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_MicExtra create() => RoomRefersh_MicExtra._();
  RoomRefersh_MicExtra createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_MicExtra> createRepeated() =>
      $pb.PbList<RoomRefersh_MicExtra>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_MicExtra getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_MicExtra>(create);
  static RoomRefersh_MicExtra? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get creditRestoring => $_getIZ(0);
  @$pb.TagNumber(1)
  set creditRestoring($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCreditRestoring() => $_has(0);
  @$pb.TagNumber(1)
  void clearCreditRestoring() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get playAgain => $_getIZ(1);
  @$pb.TagNumber(2)
  set playAgain($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPlayAgain() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlayAgain() => clearField(2);

  @$pb.TagNumber(3)
  RoomRefersh_MicExtra_RunInfo get runInfo => $_getN(2);
  @$pb.TagNumber(3)
  set runInfo(RoomRefersh_MicExtra_RunInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRunInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearRunInfo() => clearField(3);
  @$pb.TagNumber(3)
  RoomRefersh_MicExtra_RunInfo ensureRunInfo() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get uid => $_getIZ(3);
  @$pb.TagNumber(4)
  set uid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearUid() => clearField(4);
}

class RoomRefersh_JuConfig_MicGroup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.JuConfig.MicGroup',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
            : 'header')
    ..hasRequiredFields = false;

  RoomRefersh_JuConfig_MicGroup._() : super();
  factory RoomRefersh_JuConfig_MicGroup({
    $core.int? uid,
    $core.String? header,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (header != null) {
      _result.header = header;
    }
    return _result;
  }
  factory RoomRefersh_JuConfig_MicGroup.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_JuConfig_MicGroup.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_JuConfig_MicGroup clone() =>
      RoomRefersh_JuConfig_MicGroup()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_JuConfig_MicGroup copyWith(
          void Function(RoomRefersh_JuConfig_MicGroup) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_JuConfig_MicGroup))
          as RoomRefersh_JuConfig_MicGroup; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_JuConfig_MicGroup create() =>
      RoomRefersh_JuConfig_MicGroup._();
  RoomRefersh_JuConfig_MicGroup createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_JuConfig_MicGroup> createRepeated() =>
      $pb.PbList<RoomRefersh_JuConfig_MicGroup>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_JuConfig_MicGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_JuConfig_MicGroup>(create);
  static RoomRefersh_JuConfig_MicGroup? _defaultInstance;

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
  $core.String get header => $_getSZ(1);
  @$pb.TagNumber(2)
  set header($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHeader() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeader() => clearField(2);
}

class RoomRefersh_JuConfig_UserCommodity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.JuConfig.UserCommodity',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image_bg')
    ..hasRequiredFields = false;

  RoomRefersh_JuConfig_UserCommodity._() : super();
  factory RoomRefersh_JuConfig_UserCommodity({
    $core.int? cid,
    $core.String? image,
    $core.String? imageBg,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (image != null) {
      _result.image = image;
    }
    if (imageBg != null) {
      _result.imageBg = imageBg;
    }
    return _result;
  }
  factory RoomRefersh_JuConfig_UserCommodity.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_JuConfig_UserCommodity.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_JuConfig_UserCommodity clone() =>
      RoomRefersh_JuConfig_UserCommodity()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_JuConfig_UserCommodity copyWith(
          void Function(RoomRefersh_JuConfig_UserCommodity) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_JuConfig_UserCommodity))
          as RoomRefersh_JuConfig_UserCommodity; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_JuConfig_UserCommodity create() =>
      RoomRefersh_JuConfig_UserCommodity._();
  RoomRefersh_JuConfig_UserCommodity createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_JuConfig_UserCommodity> createRepeated() =>
      $pb.PbList<RoomRefersh_JuConfig_UserCommodity>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_JuConfig_UserCommodity getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_JuConfig_UserCommodity>(
          create);
  static RoomRefersh_JuConfig_UserCommodity? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cid => $_getIZ(0);
  @$pb.TagNumber(1)
  set cid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get image => $_getSZ(1);
  @$pb.TagNumber(2)
  set image($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get imageBg => $_getSZ(2);
  @$pb.TagNumber(3)
  set imageBg($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImageBg() => $_has(2);
  @$pb.TagNumber(3)
  void clearImageBg() => clearField(3);
}

class RoomRefersh_JuConfig_JuConfigList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.JuConfig.JuConfigList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'collectClue',
        protoName: 'collectClue')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current_show')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isOut',
        protoName: 'isOut')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isWin',
        protoName: 'isWin')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jid')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'meeting')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'multi_win')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'offline')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'oneSearch',
        protoName: 'oneSearch')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'twoSearch',
        protoName: 'twoSearch')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'oneSearchClueSurplus',
        protoName: 'oneSearchClueSurplus')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position')
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'public')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'read')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ready')
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roleGroupName',
        protoName: 'roleGroupName')
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roleIcon',
        protoName: 'roleIcon')
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roleId',
        protoName: 'roleId')
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roleName',
        protoName: 'roleName')
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rolePosition',
        protoName: 'rolePosition')
    ..aOS(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score')
    ..aOS(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'self')
    ..aOS(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..aOS(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'threeSearch',
        protoName: 'threeSearch')
    ..aOS(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'threeSearchClueSurplus',
        protoName: 'threeSearchClueSurplus')
    ..aOS(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'turns')
    ..aOS(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'twoSearchClueSurplus',
        protoName: 'twoSearchClueSurplus')
    ..aOS(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
    ..aOS(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userEndTime',
        protoName: 'userEndTime')
    ..aOS(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userStartTime',
        protoName: 'userStartTime')
    ..aOS(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vote')
    ..hasRequiredFields = false;

  RoomRefersh_JuConfig_JuConfigList._() : super();
  factory RoomRefersh_JuConfig_JuConfigList({
    $core.String? collectClue,
    $core.String? currentShow,
    $core.String? dateline,
    $core.String? id,
    $core.String? isOut,
    $core.String? isWin,
    $core.String? jid,
    $core.String? meeting,
    $core.String? multiWin,
    $core.String? offline,
    $core.String? oneSearch,
    $core.String? twoSearch,
    $core.String? oneSearchClueSurplus,
    $core.String? position,
    $core.String? public,
    $core.String? read,
    $core.String? ready,
    $core.String? rid,
    $core.String? roleGroupName,
    $core.String? roleIcon,
    $core.String? roleId,
    $core.String? roleName,
    $core.String? rolePosition,
    $core.String? score,
    $core.String? self,
    $core.String? show,
    $core.String? threeSearch,
    $core.String? threeSearchClueSurplus,
    $core.String? turns,
    $core.String? twoSearchClueSurplus,
    $core.String? uid,
    $core.String? userEndTime,
    $core.String? userStartTime,
    $core.String? vote,
  }) {
    final _result = create();
    if (collectClue != null) {
      _result.collectClue = collectClue;
    }
    if (currentShow != null) {
      _result.currentShow = currentShow;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (id != null) {
      _result.id = id;
    }
    if (isOut != null) {
      _result.isOut = isOut;
    }
    if (isWin != null) {
      _result.isWin = isWin;
    }
    if (jid != null) {
      _result.jid = jid;
    }
    if (meeting != null) {
      _result.meeting = meeting;
    }
    if (multiWin != null) {
      _result.multiWin = multiWin;
    }
    if (offline != null) {
      _result.offline = offline;
    }
    if (oneSearch != null) {
      _result.oneSearch = oneSearch;
    }
    if (twoSearch != null) {
      _result.twoSearch = twoSearch;
    }
    if (oneSearchClueSurplus != null) {
      _result.oneSearchClueSurplus = oneSearchClueSurplus;
    }
    if (position != null) {
      _result.position = position;
    }
    if (public != null) {
      _result.public = public;
    }
    if (read != null) {
      _result.read = read;
    }
    if (ready != null) {
      _result.ready = ready;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (roleGroupName != null) {
      _result.roleGroupName = roleGroupName;
    }
    if (roleIcon != null) {
      _result.roleIcon = roleIcon;
    }
    if (roleId != null) {
      _result.roleId = roleId;
    }
    if (roleName != null) {
      _result.roleName = roleName;
    }
    if (rolePosition != null) {
      _result.rolePosition = rolePosition;
    }
    if (score != null) {
      _result.score = score;
    }
    if (self != null) {
      _result.self = self;
    }
    if (show != null) {
      _result.show = show;
    }
    if (threeSearch != null) {
      _result.threeSearch = threeSearch;
    }
    if (threeSearchClueSurplus != null) {
      _result.threeSearchClueSurplus = threeSearchClueSurplus;
    }
    if (turns != null) {
      _result.turns = turns;
    }
    if (twoSearchClueSurplus != null) {
      _result.twoSearchClueSurplus = twoSearchClueSurplus;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (userEndTime != null) {
      _result.userEndTime = userEndTime;
    }
    if (userStartTime != null) {
      _result.userStartTime = userStartTime;
    }
    if (vote != null) {
      _result.vote = vote;
    }
    return _result;
  }
  factory RoomRefersh_JuConfig_JuConfigList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_JuConfig_JuConfigList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_JuConfig_JuConfigList clone() =>
      RoomRefersh_JuConfig_JuConfigList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_JuConfig_JuConfigList copyWith(
          void Function(RoomRefersh_JuConfig_JuConfigList) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_JuConfig_JuConfigList))
          as RoomRefersh_JuConfig_JuConfigList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_JuConfig_JuConfigList create() =>
      RoomRefersh_JuConfig_JuConfigList._();
  RoomRefersh_JuConfig_JuConfigList createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_JuConfig_JuConfigList> createRepeated() =>
      $pb.PbList<RoomRefersh_JuConfig_JuConfigList>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_JuConfig_JuConfigList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_JuConfig_JuConfigList>(
          create);
  static RoomRefersh_JuConfig_JuConfigList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get collectClue => $_getSZ(0);
  @$pb.TagNumber(1)
  set collectClue($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCollectClue() => $_has(0);
  @$pb.TagNumber(1)
  void clearCollectClue() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get currentShow => $_getSZ(1);
  @$pb.TagNumber(2)
  set currentShow($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCurrentShow() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentShow() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get dateline => $_getSZ(2);
  @$pb.TagNumber(3)
  set dateline($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDateline() => $_has(2);
  @$pb.TagNumber(3)
  void clearDateline() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get id => $_getSZ(3);
  @$pb.TagNumber(4)
  set id($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(4)
  void clearId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get isOut => $_getSZ(4);
  @$pb.TagNumber(5)
  set isOut($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIsOut() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsOut() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get isWin => $_getSZ(5);
  @$pb.TagNumber(6)
  set isWin($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIsWin() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsWin() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get jid => $_getSZ(6);
  @$pb.TagNumber(7)
  set jid($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasJid() => $_has(6);
  @$pb.TagNumber(7)
  void clearJid() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get meeting => $_getSZ(7);
  @$pb.TagNumber(8)
  set meeting($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasMeeting() => $_has(7);
  @$pb.TagNumber(8)
  void clearMeeting() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get multiWin => $_getSZ(8);
  @$pb.TagNumber(9)
  set multiWin($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasMultiWin() => $_has(8);
  @$pb.TagNumber(9)
  void clearMultiWin() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get offline => $_getSZ(9);
  @$pb.TagNumber(10)
  set offline($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasOffline() => $_has(9);
  @$pb.TagNumber(10)
  void clearOffline() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get oneSearch => $_getSZ(10);
  @$pb.TagNumber(11)
  set oneSearch($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasOneSearch() => $_has(10);
  @$pb.TagNumber(11)
  void clearOneSearch() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get twoSearch => $_getSZ(11);
  @$pb.TagNumber(12)
  set twoSearch($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasTwoSearch() => $_has(11);
  @$pb.TagNumber(12)
  void clearTwoSearch() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get oneSearchClueSurplus => $_getSZ(12);
  @$pb.TagNumber(13)
  set oneSearchClueSurplus($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasOneSearchClueSurplus() => $_has(12);
  @$pb.TagNumber(13)
  void clearOneSearchClueSurplus() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get position => $_getSZ(13);
  @$pb.TagNumber(14)
  set position($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasPosition() => $_has(13);
  @$pb.TagNumber(14)
  void clearPosition() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get public => $_getSZ(14);
  @$pb.TagNumber(15)
  set public($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasPublic() => $_has(14);
  @$pb.TagNumber(15)
  void clearPublic() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get read => $_getSZ(15);
  @$pb.TagNumber(16)
  set read($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasRead() => $_has(15);
  @$pb.TagNumber(16)
  void clearRead() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get ready => $_getSZ(16);
  @$pb.TagNumber(17)
  set ready($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasReady() => $_has(16);
  @$pb.TagNumber(17)
  void clearReady() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get rid => $_getSZ(17);
  @$pb.TagNumber(18)
  set rid($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasRid() => $_has(17);
  @$pb.TagNumber(18)
  void clearRid() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get roleGroupName => $_getSZ(18);
  @$pb.TagNumber(19)
  set roleGroupName($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasRoleGroupName() => $_has(18);
  @$pb.TagNumber(19)
  void clearRoleGroupName() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get roleIcon => $_getSZ(19);
  @$pb.TagNumber(20)
  set roleIcon($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasRoleIcon() => $_has(19);
  @$pb.TagNumber(20)
  void clearRoleIcon() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get roleId => $_getSZ(20);
  @$pb.TagNumber(21)
  set roleId($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasRoleId() => $_has(20);
  @$pb.TagNumber(21)
  void clearRoleId() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get roleName => $_getSZ(21);
  @$pb.TagNumber(22)
  set roleName($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasRoleName() => $_has(21);
  @$pb.TagNumber(22)
  void clearRoleName() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get rolePosition => $_getSZ(22);
  @$pb.TagNumber(23)
  set rolePosition($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasRolePosition() => $_has(22);
  @$pb.TagNumber(23)
  void clearRolePosition() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get score => $_getSZ(23);
  @$pb.TagNumber(24)
  set score($core.String v) {
    $_setString(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasScore() => $_has(23);
  @$pb.TagNumber(24)
  void clearScore() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get self => $_getSZ(24);
  @$pb.TagNumber(25)
  set self($core.String v) {
    $_setString(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasSelf() => $_has(24);
  @$pb.TagNumber(25)
  void clearSelf() => clearField(25);

  @$pb.TagNumber(26)
  $core.String get show => $_getSZ(25);
  @$pb.TagNumber(26)
  set show($core.String v) {
    $_setString(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasShow() => $_has(25);
  @$pb.TagNumber(26)
  void clearShow() => clearField(26);

  @$pb.TagNumber(27)
  $core.String get threeSearch => $_getSZ(26);
  @$pb.TagNumber(27)
  set threeSearch($core.String v) {
    $_setString(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasThreeSearch() => $_has(26);
  @$pb.TagNumber(27)
  void clearThreeSearch() => clearField(27);

  @$pb.TagNumber(28)
  $core.String get threeSearchClueSurplus => $_getSZ(27);
  @$pb.TagNumber(28)
  set threeSearchClueSurplus($core.String v) {
    $_setString(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasThreeSearchClueSurplus() => $_has(27);
  @$pb.TagNumber(28)
  void clearThreeSearchClueSurplus() => clearField(28);

  @$pb.TagNumber(29)
  $core.String get turns => $_getSZ(28);
  @$pb.TagNumber(29)
  set turns($core.String v) {
    $_setString(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasTurns() => $_has(28);
  @$pb.TagNumber(29)
  void clearTurns() => clearField(29);

  @$pb.TagNumber(30)
  $core.String get twoSearchClueSurplus => $_getSZ(29);
  @$pb.TagNumber(30)
  set twoSearchClueSurplus($core.String v) {
    $_setString(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasTwoSearchClueSurplus() => $_has(29);
  @$pb.TagNumber(30)
  void clearTwoSearchClueSurplus() => clearField(30);

  @$pb.TagNumber(31)
  $core.String get uid => $_getSZ(30);
  @$pb.TagNumber(31)
  set uid($core.String v) {
    $_setString(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasUid() => $_has(30);
  @$pb.TagNumber(31)
  void clearUid() => clearField(31);

  @$pb.TagNumber(32)
  $core.String get userEndTime => $_getSZ(31);
  @$pb.TagNumber(32)
  set userEndTime($core.String v) {
    $_setString(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasUserEndTime() => $_has(31);
  @$pb.TagNumber(32)
  void clearUserEndTime() => clearField(32);

  @$pb.TagNumber(33)
  $core.String get userStartTime => $_getSZ(32);
  @$pb.TagNumber(33)
  set userStartTime($core.String v) {
    $_setString(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasUserStartTime() => $_has(32);
  @$pb.TagNumber(33)
  void clearUserStartTime() => clearField(33);

  @$pb.TagNumber(34)
  $core.String get vote => $_getSZ(33);
  @$pb.TagNumber(34)
  set vote($core.String v) {
    $_setString(33, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasVote() => $_has(33);
  @$pb.TagNumber(34)
  void clearVote() => clearField(34);
}

class RoomRefersh_JuConfig_Steps extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.JuConfig.Steps',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'readStory',
        protoName: 'readStory')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'selfIntroduction',
        protoName: 'selfIntroduction')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'meeting')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vote')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'oneSearch',
        protoName: 'oneSearch')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'twoSearch',
        protoName: 'twoSearch')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'publicStory',
        protoName: 'publicStory')
    ..hasRequiredFields = false;

  RoomRefersh_JuConfig_Steps._() : super();
  factory RoomRefersh_JuConfig_Steps({
    $core.String? readStory,
    $core.String? selfIntroduction,
    $core.String? meeting,
    $core.String? vote,
    $core.String? oneSearch,
    $core.String? twoSearch,
    $core.String? publicStory,
  }) {
    final _result = create();
    if (readStory != null) {
      _result.readStory = readStory;
    }
    if (selfIntroduction != null) {
      _result.selfIntroduction = selfIntroduction;
    }
    if (meeting != null) {
      _result.meeting = meeting;
    }
    if (vote != null) {
      _result.vote = vote;
    }
    if (oneSearch != null) {
      _result.oneSearch = oneSearch;
    }
    if (twoSearch != null) {
      _result.twoSearch = twoSearch;
    }
    if (publicStory != null) {
      _result.publicStory = publicStory;
    }
    return _result;
  }
  factory RoomRefersh_JuConfig_Steps.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_JuConfig_Steps.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_JuConfig_Steps clone() =>
      RoomRefersh_JuConfig_Steps()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_JuConfig_Steps copyWith(
          void Function(RoomRefersh_JuConfig_Steps) updates) =>
      super.copyWith(
              (message) => updates(message as RoomRefersh_JuConfig_Steps))
          as RoomRefersh_JuConfig_Steps; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_JuConfig_Steps create() => RoomRefersh_JuConfig_Steps._();
  RoomRefersh_JuConfig_Steps createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_JuConfig_Steps> createRepeated() =>
      $pb.PbList<RoomRefersh_JuConfig_Steps>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_JuConfig_Steps getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_JuConfig_Steps>(create);
  static RoomRefersh_JuConfig_Steps? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get readStory => $_getSZ(0);
  @$pb.TagNumber(1)
  set readStory($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasReadStory() => $_has(0);
  @$pb.TagNumber(1)
  void clearReadStory() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get selfIntroduction => $_getSZ(1);
  @$pb.TagNumber(2)
  set selfIntroduction($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSelfIntroduction() => $_has(1);
  @$pb.TagNumber(2)
  void clearSelfIntroduction() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get meeting => $_getSZ(2);
  @$pb.TagNumber(3)
  set meeting($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMeeting() => $_has(2);
  @$pb.TagNumber(3)
  void clearMeeting() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get vote => $_getSZ(3);
  @$pb.TagNumber(4)
  set vote($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasVote() => $_has(3);
  @$pb.TagNumber(4)
  void clearVote() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get oneSearch => $_getSZ(4);
  @$pb.TagNumber(5)
  set oneSearch($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOneSearch() => $_has(4);
  @$pb.TagNumber(5)
  void clearOneSearch() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get twoSearch => $_getSZ(5);
  @$pb.TagNumber(6)
  set twoSearch($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTwoSearch() => $_has(5);
  @$pb.TagNumber(6)
  void clearTwoSearch() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get publicStory => $_getSZ(6);
  @$pb.TagNumber(7)
  set publicStory($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPublicStory() => $_has(6);
  @$pb.TagNumber(7)
  void clearPublicStory() => clearField(7);
}

class RoomRefersh_JuConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.JuConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'autoJoinMic',
        $pb.PbFieldType.OU3,
        protoName: 'autoJoinMic')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'back_img')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'back_img_md5')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cover')
    ..aOM<RoomRefersh_DmConfig>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dmConfig',
        protoName: 'dmConfig',
        subBuilder: RoomRefersh_DmConfig.create)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isLimitVisit',
        $pb.PbFieldType.OU3,
        protoName: 'isLimitVisit')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isRecruit',
        $pb.PbFieldType.OU3,
        protoName: 'isRecruit')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jid',
        $pb.PbFieldType.OU3)
    ..pc<RoomRefersh_JuConfig_JuConfigList>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_JuConfig_JuConfigList.create)
    ..m<$core.String, $core.String>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'micGroup',
        protoName: 'micGroup',
        entryClassName: 'RoomRefersh.JuConfig.MicGroupEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('room.refersh'))
    ..p<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'micList',
        $pb.PbFieldType.PU3,
        protoName: 'micList')
    ..pc<RoomRefersh_MicExtra>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mic_extra',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_MicExtra.create)
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_bag',
        $pb.PbFieldType.OU3)
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_index')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..aOM<$0.ListValue>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'steps',
        subBuilder: $0.ListValue.create)
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'turns')
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..m<$core.String, RoomRefersh_JuConfig_UserCommodity>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user_commodity',
        entryClassName: 'RoomRefersh.JuConfig.UserCommodityEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: RoomRefersh_JuConfig_UserCommodity.create,
        packageName: const $pb.PackageName('room.refersh'))
    ..hasRequiredFields = false;

  RoomRefersh_JuConfig._() : super();
  factory RoomRefersh_JuConfig({
    $core.int? autoJoinMic,
    $core.String? backImg,
    $core.String? backImgMd5,
    $core.String? cover,
    RoomRefersh_DmConfig? dmConfig,
    $core.String? icon,
    $core.int? isLimitVisit,
    $core.int? isRecruit,
    $core.int? jid,
    $core.Iterable<RoomRefersh_JuConfig_JuConfigList>? list,
    $core.Map<$core.String, $core.String>? micGroup,
    $core.Iterable<$core.int>? micList,
    $core.Iterable<RoomRefersh_MicExtra>? micExtra,
    $core.String? name,
    $core.int? showBag,
    $core.String? showIndex,
    $core.String? state,
    $0.ListValue? steps,
    $core.String? turns,
    $core.String? type,
    $core.Map<$core.String, RoomRefersh_JuConfig_UserCommodity>? userCommodity,
  }) {
    final _result = create();
    if (autoJoinMic != null) {
      _result.autoJoinMic = autoJoinMic;
    }
    if (backImg != null) {
      _result.backImg = backImg;
    }
    if (backImgMd5 != null) {
      _result.backImgMd5 = backImgMd5;
    }
    if (cover != null) {
      _result.cover = cover;
    }
    if (dmConfig != null) {
      _result.dmConfig = dmConfig;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (isLimitVisit != null) {
      _result.isLimitVisit = isLimitVisit;
    }
    if (isRecruit != null) {
      _result.isRecruit = isRecruit;
    }
    if (jid != null) {
      _result.jid = jid;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (micGroup != null) {
      _result.micGroup.addAll(micGroup);
    }
    if (micList != null) {
      _result.micList.addAll(micList);
    }
    if (micExtra != null) {
      _result.micExtra.addAll(micExtra);
    }
    if (name != null) {
      _result.name = name;
    }
    if (showBag != null) {
      _result.showBag = showBag;
    }
    if (showIndex != null) {
      _result.showIndex = showIndex;
    }
    if (state != null) {
      _result.state = state;
    }
    if (steps != null) {
      _result.steps = steps;
    }
    if (turns != null) {
      _result.turns = turns;
    }
    if (type != null) {
      _result.type = type;
    }
    if (userCommodity != null) {
      _result.userCommodity.addAll(userCommodity);
    }
    return _result;
  }
  factory RoomRefersh_JuConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_JuConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_JuConfig clone() =>
      RoomRefersh_JuConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_JuConfig copyWith(void Function(RoomRefersh_JuConfig) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_JuConfig))
          as RoomRefersh_JuConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_JuConfig create() => RoomRefersh_JuConfig._();
  RoomRefersh_JuConfig createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_JuConfig> createRepeated() =>
      $pb.PbList<RoomRefersh_JuConfig>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_JuConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_JuConfig>(create);
  static RoomRefersh_JuConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get autoJoinMic => $_getIZ(0);
  @$pb.TagNumber(1)
  set autoJoinMic($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAutoJoinMic() => $_has(0);
  @$pb.TagNumber(1)
  void clearAutoJoinMic() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get backImg => $_getSZ(1);
  @$pb.TagNumber(2)
  set backImg($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBackImg() => $_has(1);
  @$pb.TagNumber(2)
  void clearBackImg() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get backImgMd5 => $_getSZ(2);
  @$pb.TagNumber(3)
  set backImgMd5($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBackImgMd5() => $_has(2);
  @$pb.TagNumber(3)
  void clearBackImgMd5() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get cover => $_getSZ(3);
  @$pb.TagNumber(4)
  set cover($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCover() => $_has(3);
  @$pb.TagNumber(4)
  void clearCover() => clearField(4);

  @$pb.TagNumber(5)
  RoomRefersh_DmConfig get dmConfig => $_getN(4);
  @$pb.TagNumber(5)
  set dmConfig(RoomRefersh_DmConfig v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDmConfig() => $_has(4);
  @$pb.TagNumber(5)
  void clearDmConfig() => clearField(5);
  @$pb.TagNumber(5)
  RoomRefersh_DmConfig ensureDmConfig() => $_ensure(4);

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
  $core.int get isLimitVisit => $_getIZ(6);
  @$pb.TagNumber(7)
  set isLimitVisit($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIsLimitVisit() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsLimitVisit() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get isRecruit => $_getIZ(7);
  @$pb.TagNumber(8)
  set isRecruit($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasIsRecruit() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsRecruit() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get jid => $_getIZ(8);
  @$pb.TagNumber(9)
  set jid($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasJid() => $_has(8);
  @$pb.TagNumber(9)
  void clearJid() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<RoomRefersh_JuConfig_JuConfigList> get list => $_getList(9);

  @$pb.TagNumber(11)
  $core.Map<$core.String, $core.String> get micGroup => $_getMap(10);

  @$pb.TagNumber(12)
  $core.List<$core.int> get micList => $_getList(11);

  @$pb.TagNumber(13)
  $core.List<RoomRefersh_MicExtra> get micExtra => $_getList(12);

  @$pb.TagNumber(14)
  $core.String get name => $_getSZ(13);
  @$pb.TagNumber(14)
  set name($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasName() => $_has(13);
  @$pb.TagNumber(14)
  void clearName() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get showBag => $_getIZ(14);
  @$pb.TagNumber(15)
  set showBag($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasShowBag() => $_has(14);
  @$pb.TagNumber(15)
  void clearShowBag() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get showIndex => $_getSZ(15);
  @$pb.TagNumber(16)
  set showIndex($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasShowIndex() => $_has(15);
  @$pb.TagNumber(16)
  void clearShowIndex() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get state => $_getSZ(16);
  @$pb.TagNumber(17)
  set state($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasState() => $_has(16);
  @$pb.TagNumber(17)
  void clearState() => clearField(17);

  @$pb.TagNumber(18)
  $0.ListValue get steps => $_getN(17);
  @$pb.TagNumber(18)
  set steps($0.ListValue v) {
    setField(18, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasSteps() => $_has(17);
  @$pb.TagNumber(18)
  void clearSteps() => clearField(18);
  @$pb.TagNumber(18)
  $0.ListValue ensureSteps() => $_ensure(17);

  @$pb.TagNumber(19)
  $core.String get turns => $_getSZ(18);
  @$pb.TagNumber(19)
  set turns($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasTurns() => $_has(18);
  @$pb.TagNumber(19)
  void clearTurns() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get type => $_getSZ(19);
  @$pb.TagNumber(20)
  set type($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasType() => $_has(19);
  @$pb.TagNumber(20)
  void clearType() => clearField(20);

  @$pb.TagNumber(21)
  $core.Map<$core.String, RoomRefersh_JuConfig_UserCommodity>
      get userCommodity => $_getMap(20);
}

class RoomRefersh_Match extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Match',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'left_seconds',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_Match._() : super();
  factory RoomRefersh_Match({
    $core.int? leftSeconds,
    $core.int? status,
  }) {
    final _result = create();
    if (leftSeconds != null) {
      _result.leftSeconds = leftSeconds;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory RoomRefersh_Match.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Match.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Match clone() => RoomRefersh_Match()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Match copyWith(void Function(RoomRefersh_Match) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_Match))
          as RoomRefersh_Match; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Match create() => RoomRefersh_Match._();
  RoomRefersh_Match createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Match> createRepeated() =>
      $pb.PbList<RoomRefersh_Match>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Match getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Match>(create);
  static RoomRefersh_Match? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get leftSeconds => $_getIZ(0);
  @$pb.TagNumber(1)
  set leftSeconds($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeftSeconds() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeftSeconds() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get status => $_getIZ(1);
  @$pb.TagNumber(2)
  set status($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
}

class RoomRefersh_KtvPkRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.KtvPkRank',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'before_score',
        $pb.PbFieldType.O3)
    ..aOM<$0.Value>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chorus_before_score',
        subBuilder: $0.Value.create)
    ..aOM<$0.Value>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chorus_current_score',
        subBuilder: $0.Value.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chorus_uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current_score',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'on_mic_uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pk_mode',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_KtvPkRank._() : super();
  factory RoomRefersh_KtvPkRank({
    $core.int? beforeScore,
    $0.Value? chorusBeforeScore,
    $0.Value? chorusCurrentScore,
    $core.int? chorusUid,
    $core.int? currentScore,
    $core.int? onMicUid,
    $core.int? pkMode,
  }) {
    final _result = create();
    if (beforeScore != null) {
      _result.beforeScore = beforeScore;
    }
    if (chorusBeforeScore != null) {
      _result.chorusBeforeScore = chorusBeforeScore;
    }
    if (chorusCurrentScore != null) {
      _result.chorusCurrentScore = chorusCurrentScore;
    }
    if (chorusUid != null) {
      _result.chorusUid = chorusUid;
    }
    if (currentScore != null) {
      _result.currentScore = currentScore;
    }
    if (onMicUid != null) {
      _result.onMicUid = onMicUid;
    }
    if (pkMode != null) {
      _result.pkMode = pkMode;
    }
    return _result;
  }
  factory RoomRefersh_KtvPkRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_KtvPkRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_KtvPkRank clone() =>
      RoomRefersh_KtvPkRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_KtvPkRank copyWith(
          void Function(RoomRefersh_KtvPkRank) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_KtvPkRank))
          as RoomRefersh_KtvPkRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_KtvPkRank create() => RoomRefersh_KtvPkRank._();
  RoomRefersh_KtvPkRank createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_KtvPkRank> createRepeated() =>
      $pb.PbList<RoomRefersh_KtvPkRank>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_KtvPkRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_KtvPkRank>(create);
  static RoomRefersh_KtvPkRank? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get beforeScore => $_getIZ(0);
  @$pb.TagNumber(1)
  set beforeScore($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBeforeScore() => $_has(0);
  @$pb.TagNumber(1)
  void clearBeforeScore() => clearField(1);

  @$pb.TagNumber(2)
  $0.Value get chorusBeforeScore => $_getN(1);
  @$pb.TagNumber(2)
  set chorusBeforeScore($0.Value v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasChorusBeforeScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearChorusBeforeScore() => clearField(2);
  @$pb.TagNumber(2)
  $0.Value ensureChorusBeforeScore() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.Value get chorusCurrentScore => $_getN(2);
  @$pb.TagNumber(3)
  set chorusCurrentScore($0.Value v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasChorusCurrentScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearChorusCurrentScore() => clearField(3);
  @$pb.TagNumber(3)
  $0.Value ensureChorusCurrentScore() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get chorusUid => $_getIZ(3);
  @$pb.TagNumber(4)
  set chorusUid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasChorusUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearChorusUid() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get currentScore => $_getIZ(4);
  @$pb.TagNumber(5)
  set currentScore($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCurrentScore() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrentScore() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get onMicUid => $_getIZ(5);
  @$pb.TagNumber(6)
  set onMicUid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasOnMicUid() => $_has(5);
  @$pb.TagNumber(6)
  void clearOnMicUid() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get pkMode => $_getIZ(6);
  @$pb.TagNumber(7)
  set pkMode($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPkMode() => $_has(6);
  @$pb.TagNumber(7)
  void clearPkMode() => clearField(7);
}

class RoomRefersh_GamePlayList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.GamePlayList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_GamePlayList._() : super();
  factory RoomRefersh_GamePlayList({
    $core.int? show,
  }) {
    final _result = create();
    if (show != null) {
      _result.show = show;
    }
    return _result;
  }
  factory RoomRefersh_GamePlayList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_GamePlayList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_GamePlayList clone() =>
      RoomRefersh_GamePlayList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_GamePlayList copyWith(
          void Function(RoomRefersh_GamePlayList) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_GamePlayList))
          as RoomRefersh_GamePlayList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GamePlayList create() => RoomRefersh_GamePlayList._();
  RoomRefersh_GamePlayList createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_GamePlayList> createRepeated() =>
      $pb.PbList<RoomRefersh_GamePlayList>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_GamePlayList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_GamePlayList>(create);
  static RoomRefersh_GamePlayList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get show => $_getIZ(0);
  @$pb.TagNumber(1)
  set show($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShow() => $_has(0);
  @$pb.TagNumber(1)
  void clearShow() => clearField(1);
}

class RoomRefersh_RoomDefend extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.RoomDefend',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.double>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'next_level_score',
        $pb.PbFieldType.OD)
    ..a<$core.double>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OD)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_next')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_RoomDefend._() : super();
  factory RoomRefersh_RoomDefend({
    $core.int? level,
    $core.double? nextLevelScore,
    $core.double? score,
    $core.bool? showNext,
    $core.int? uid,
  }) {
    final _result = create();
    if (level != null) {
      _result.level = level;
    }
    if (nextLevelScore != null) {
      _result.nextLevelScore = nextLevelScore;
    }
    if (score != null) {
      _result.score = score;
    }
    if (showNext != null) {
      _result.showNext = showNext;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory RoomRefersh_RoomDefend.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_RoomDefend.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_RoomDefend clone() =>
      RoomRefersh_RoomDefend()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_RoomDefend copyWith(
          void Function(RoomRefersh_RoomDefend) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_RoomDefend))
          as RoomRefersh_RoomDefend; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RoomDefend create() => RoomRefersh_RoomDefend._();
  RoomRefersh_RoomDefend createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_RoomDefend> createRepeated() =>
      $pb.PbList<RoomRefersh_RoomDefend>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_RoomDefend getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_RoomDefend>(create);
  static RoomRefersh_RoomDefend? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get level => $_getIZ(0);
  @$pb.TagNumber(1)
  set level($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get nextLevelScore => $_getN(1);
  @$pb.TagNumber(2)
  set nextLevelScore($core.double v) {
    $_setDouble(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNextLevelScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextLevelScore() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get score => $_getN(2);
  @$pb.TagNumber(3)
  set score($core.double v) {
    $_setDouble(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearScore() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get showNext => $_getBF(3);
  @$pb.TagNumber(4)
  set showNext($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasShowNext() => $_has(3);
  @$pb.TagNumber(4)
  void clearShowNext() => clearField(4);

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

class RoomRefersh_ArtCenter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.ArtCenter',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_admin')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room_factory_type')
    ..hasRequiredFields = false;

  RoomRefersh_ArtCenter._() : super();
  factory RoomRefersh_ArtCenter({
    $core.bool? isAdmin,
    $core.String? roomFactoryType,
  }) {
    final _result = create();
    if (isAdmin != null) {
      _result.isAdmin = isAdmin;
    }
    if (roomFactoryType != null) {
      _result.roomFactoryType = roomFactoryType;
    }
    return _result;
  }
  factory RoomRefersh_ArtCenter.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_ArtCenter.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_ArtCenter clone() =>
      RoomRefersh_ArtCenter()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_ArtCenter copyWith(
          void Function(RoomRefersh_ArtCenter) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_ArtCenter))
          as RoomRefersh_ArtCenter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_ArtCenter create() => RoomRefersh_ArtCenter._();
  RoomRefersh_ArtCenter createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_ArtCenter> createRepeated() =>
      $pb.PbList<RoomRefersh_ArtCenter>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_ArtCenter getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_ArtCenter>(create);
  static RoomRefersh_ArtCenter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAdmin => $_getBF(0);
  @$pb.TagNumber(1)
  set isAdmin($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIsAdmin() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAdmin() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomFactoryType => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomFactoryType($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRoomFactoryType() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomFactoryType() => clearField(2);
}

class RoomRefersh_MateData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.MateData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_intimate')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_order')
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_confess')
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'can_slide')
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'can_scroll')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'broker_user',
        $pb.PbFieldType.OU3)
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_week_star')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hat_state',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_MateData._() : super();
  factory RoomRefersh_MateData({
    $core.bool? showIntimate,
    $core.bool? showOrder,
    $core.bool? showConfess,
    $core.bool? canSlide,
    $core.bool? canScroll,
    $core.int? brokerUser,
    $core.bool? showWeekStar,
    $core.int? hatState,
  }) {
    final _result = create();
    if (showIntimate != null) {
      _result.showIntimate = showIntimate;
    }
    if (showOrder != null) {
      _result.showOrder = showOrder;
    }
    if (showConfess != null) {
      _result.showConfess = showConfess;
    }
    if (canSlide != null) {
      _result.canSlide = canSlide;
    }
    if (canScroll != null) {
      _result.canScroll = canScroll;
    }
    if (brokerUser != null) {
      _result.brokerUser = brokerUser;
    }
    if (showWeekStar != null) {
      _result.showWeekStar = showWeekStar;
    }
    if (hatState != null) {
      _result.hatState = hatState;
    }
    return _result;
  }
  factory RoomRefersh_MateData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_MateData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_MateData clone() =>
      RoomRefersh_MateData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_MateData copyWith(void Function(RoomRefersh_MateData) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_MateData))
          as RoomRefersh_MateData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_MateData create() => RoomRefersh_MateData._();
  RoomRefersh_MateData createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_MateData> createRepeated() =>
      $pb.PbList<RoomRefersh_MateData>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_MateData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_MateData>(create);
  static RoomRefersh_MateData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get showIntimate => $_getBF(0);
  @$pb.TagNumber(1)
  set showIntimate($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShowIntimate() => $_has(0);
  @$pb.TagNumber(1)
  void clearShowIntimate() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get showOrder => $_getBF(1);
  @$pb.TagNumber(2)
  set showOrder($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasShowOrder() => $_has(1);
  @$pb.TagNumber(2)
  void clearShowOrder() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get showConfess => $_getBF(2);
  @$pb.TagNumber(3)
  set showConfess($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasShowConfess() => $_has(2);
  @$pb.TagNumber(3)
  void clearShowConfess() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get canSlide => $_getBF(3);
  @$pb.TagNumber(4)
  set canSlide($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCanSlide() => $_has(3);
  @$pb.TagNumber(4)
  void clearCanSlide() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get canScroll => $_getBF(4);
  @$pb.TagNumber(5)
  set canScroll($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCanScroll() => $_has(4);
  @$pb.TagNumber(5)
  void clearCanScroll() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get brokerUser => $_getIZ(5);
  @$pb.TagNumber(6)
  set brokerUser($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasBrokerUser() => $_has(5);
  @$pb.TagNumber(6)
  void clearBrokerUser() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get showWeekStar => $_getBF(6);
  @$pb.TagNumber(7)
  set showWeekStar($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasShowWeekStar() => $_has(6);
  @$pb.TagNumber(7)
  void clearShowWeekStar() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get hatState => $_getIZ(7);
  @$pb.TagNumber(8)
  set hatState($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasHatState() => $_has(7);
  @$pb.TagNumber(8)
  void clearHatState() => clearField(8);
}

class RoomRefersh_UnionData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.UnionData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
            : 'icon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'owner_uid')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'owner_name')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'un_id',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_UnionData._() : super();
  factory RoomRefersh_UnionData({
    $core.String? name,
    $core.String? icon,
    $core.String? ownerUid,
    $core.String? ownerName,
    $core.int? unId,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (ownerUid != null) {
      _result.ownerUid = ownerUid;
    }
    if (ownerName != null) {
      _result.ownerName = ownerName;
    }
    if (unId != null) {
      _result.unId = unId;
    }
    return _result;
  }
  factory RoomRefersh_UnionData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_UnionData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_UnionData clone() =>
      RoomRefersh_UnionData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_UnionData copyWith(
          void Function(RoomRefersh_UnionData) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_UnionData))
          as RoomRefersh_UnionData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_UnionData create() => RoomRefersh_UnionData._();
  RoomRefersh_UnionData createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_UnionData> createRepeated() =>
      $pb.PbList<RoomRefersh_UnionData>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_UnionData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_UnionData>(create);
  static RoomRefersh_UnionData? _defaultInstance;

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
  $core.String get ownerUid => $_getSZ(2);
  @$pb.TagNumber(3)
  set ownerUid($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOwnerUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearOwnerUid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get ownerName => $_getSZ(3);
  @$pb.TagNumber(4)
  set ownerName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOwnerName() => $_has(3);
  @$pb.TagNumber(4)
  void clearOwnerName() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get unId => $_getIZ(4);
  @$pb.TagNumber(5)
  set unId($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUnId() => $_has(4);
  @$pb.TagNumber(5)
  void clearUnId() => clearField(5);
}

class RoomRefersh_Top3Sender extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.Top3Sender',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
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
            : 'gift_value')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame_new')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  RoomRefersh_Top3Sender._() : super();
  factory RoomRefersh_Top3Sender({
    $core.int? uid,
    $core.String? giftValue,
    $core.String? frame,
    $core.String? frameNew,
    $core.String? icon,
    $core.String? name,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (giftValue != null) {
      _result.giftValue = giftValue;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (frameNew != null) {
      _result.frameNew = frameNew;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory RoomRefersh_Top3Sender.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_Top3Sender.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_Top3Sender clone() =>
      RoomRefersh_Top3Sender()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_Top3Sender copyWith(
          void Function(RoomRefersh_Top3Sender) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_Top3Sender))
          as RoomRefersh_Top3Sender; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Top3Sender create() => RoomRefersh_Top3Sender._();
  RoomRefersh_Top3Sender createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_Top3Sender> createRepeated() =>
      $pb.PbList<RoomRefersh_Top3Sender>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_Top3Sender getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_Top3Sender>(create);
  static RoomRefersh_Top3Sender? _defaultInstance;

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
  $core.String get giftValue => $_getSZ(1);
  @$pb.TagNumber(2)
  set giftValue($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGiftValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftValue() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get frame => $_getSZ(2);
  @$pb.TagNumber(3)
  set frame($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFrame() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrame() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get frameNew => $_getSZ(3);
  @$pb.TagNumber(4)
  set frameNew($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFrameNew() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrameNew() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => clearField(6);
}

class RoomRefersh_CloudGameInfo_UserList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.CloudGameInfo.UserList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role_index',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'want_play_cloud_game',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_CloudGameInfo_UserList._() : super();
  factory RoomRefersh_CloudGameInfo_UserList({
    $core.int? uid,
    $core.int? roleIndex,
    $core.int? wantPlayCloudGame,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (roleIndex != null) {
      _result.roleIndex = roleIndex;
    }
    if (wantPlayCloudGame != null) {
      _result.wantPlayCloudGame = wantPlayCloudGame;
    }
    return _result;
  }
  factory RoomRefersh_CloudGameInfo_UserList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_CloudGameInfo_UserList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_CloudGameInfo_UserList clone() =>
      RoomRefersh_CloudGameInfo_UserList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_CloudGameInfo_UserList copyWith(
          void Function(RoomRefersh_CloudGameInfo_UserList) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_CloudGameInfo_UserList))
          as RoomRefersh_CloudGameInfo_UserList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CloudGameInfo_UserList create() =>
      RoomRefersh_CloudGameInfo_UserList._();
  RoomRefersh_CloudGameInfo_UserList createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_CloudGameInfo_UserList> createRepeated() =>
      $pb.PbList<RoomRefersh_CloudGameInfo_UserList>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CloudGameInfo_UserList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_CloudGameInfo_UserList>(
          create);
  static RoomRefersh_CloudGameInfo_UserList? _defaultInstance;

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
  $core.int get roleIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set roleIndex($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRoleIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoleIndex() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get wantPlayCloudGame => $_getIZ(2);
  @$pb.TagNumber(3)
  set wantPlayCloudGame($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasWantPlayCloudGame() => $_has(2);
  @$pb.TagNumber(3)
  void clearWantPlayCloudGame() => clearField(3);
}

class RoomRefersh_CloudGameInfo_Authentication extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.CloudGameInfo.Authentication',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bid')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'channel_id',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'game_channel')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'game_pkg')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'c_token')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pin_code')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stream_type',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RoomRefersh_CloudGameInfo_Authentication._() : super();
  factory RoomRefersh_CloudGameInfo_Authentication({
    $core.String? bid,
    $core.int? channelId,
    $core.String? gameChannel,
    $core.String? gamePkg,
    $core.String? cToken,
    $core.String? cid,
    $core.String? pinCode,
    $core.int? streamType,
  }) {
    final _result = create();
    if (bid != null) {
      _result.bid = bid;
    }
    if (channelId != null) {
      _result.channelId = channelId;
    }
    if (gameChannel != null) {
      _result.gameChannel = gameChannel;
    }
    if (gamePkg != null) {
      _result.gamePkg = gamePkg;
    }
    if (cToken != null) {
      _result.cToken = cToken;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (pinCode != null) {
      _result.pinCode = pinCode;
    }
    if (streamType != null) {
      _result.streamType = streamType;
    }
    return _result;
  }
  factory RoomRefersh_CloudGameInfo_Authentication.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_CloudGameInfo_Authentication.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_CloudGameInfo_Authentication clone() =>
      RoomRefersh_CloudGameInfo_Authentication()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_CloudGameInfo_Authentication copyWith(
          void Function(RoomRefersh_CloudGameInfo_Authentication) updates) =>
      super.copyWith((message) =>
              updates(message as RoomRefersh_CloudGameInfo_Authentication))
          as RoomRefersh_CloudGameInfo_Authentication; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CloudGameInfo_Authentication create() =>
      RoomRefersh_CloudGameInfo_Authentication._();
  RoomRefersh_CloudGameInfo_Authentication createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_CloudGameInfo_Authentication>
      createRepeated() =>
          $pb.PbList<RoomRefersh_CloudGameInfo_Authentication>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CloudGameInfo_Authentication getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RoomRefersh_CloudGameInfo_Authentication>(create);
  static RoomRefersh_CloudGameInfo_Authentication? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bid => $_getSZ(0);
  @$pb.TagNumber(1)
  set bid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get channelId => $_getIZ(1);
  @$pb.TagNumber(2)
  set channelId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasChannelId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannelId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get gameChannel => $_getSZ(2);
  @$pb.TagNumber(3)
  set gameChannel($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGameChannel() => $_has(2);
  @$pb.TagNumber(3)
  void clearGameChannel() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get gamePkg => $_getSZ(3);
  @$pb.TagNumber(4)
  set gamePkg($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGamePkg() => $_has(3);
  @$pb.TagNumber(4)
  void clearGamePkg() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get cToken => $_getSZ(4);
  @$pb.TagNumber(5)
  set cToken($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCToken() => $_has(4);
  @$pb.TagNumber(5)
  void clearCToken() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get cid => $_getSZ(5);
  @$pb.TagNumber(6)
  set cid($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCid() => $_has(5);
  @$pb.TagNumber(6)
  void clearCid() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get pinCode => $_getSZ(6);
  @$pb.TagNumber(7)
  set pinCode($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPinCode() => $_has(6);
  @$pb.TagNumber(7)
  void clearPinCode() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get streamType => $_getIZ(7);
  @$pb.TagNumber(8)
  set streamType($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasStreamType() => $_has(7);
  @$pb.TagNumber(8)
  void clearStreamType() => clearField(8);
}

class RoomRefersh_CloudGameInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh.CloudGameInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'instance_id')
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
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_horizontal',
        $pb.PbFieldType.OU3)
    ..pPS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tag')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'game_type')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'archive_support',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'service_provider')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'machine_type')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_free',
        $pb.PbFieldType.OU3)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'landscape_icon')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tab')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cgi_id',
        $pb.PbFieldType.OU3)
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'border')
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..pc<RoomRefersh_CloudGameInfo_UserList>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user_list',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_CloudGameInfo_UserList.create)
    ..aOM<RoomRefersh_CloudGameInfo_Authentication>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'authentication',
        subBuilder: RoomRefersh_CloudGameInfo_Authentication.create)
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vendor')
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'live_url')
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hide_mouse',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomRefersh_CloudGameInfo._() : super();
  factory RoomRefersh_CloudGameInfo({
    $core.String? id,
    $core.String? instanceId,
    $core.String? name,
    $core.String? icon,
    $core.int? isHorizontal,
    $core.Iterable<$core.String>? tag,
    $core.String? gameType,
    $core.int? archiveSupport,
    $core.String? serviceProvider,
    $core.String? machineType,
    $core.int? isFree,
    $core.String? landscapeIcon,
    $core.String? tab,
    $core.int? cgiId,
    $core.String? border,
    $core.int? state,
    $core.Iterable<RoomRefersh_CloudGameInfo_UserList>? userList,
    RoomRefersh_CloudGameInfo_Authentication? authentication,
    $core.String? vendor,
    $core.String? liveUrl,
    $core.int? hideMouse,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (instanceId != null) {
      _result.instanceId = instanceId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (isHorizontal != null) {
      _result.isHorizontal = isHorizontal;
    }
    if (tag != null) {
      _result.tag.addAll(tag);
    }
    if (gameType != null) {
      _result.gameType = gameType;
    }
    if (archiveSupport != null) {
      _result.archiveSupport = archiveSupport;
    }
    if (serviceProvider != null) {
      _result.serviceProvider = serviceProvider;
    }
    if (machineType != null) {
      _result.machineType = machineType;
    }
    if (isFree != null) {
      _result.isFree = isFree;
    }
    if (landscapeIcon != null) {
      _result.landscapeIcon = landscapeIcon;
    }
    if (tab != null) {
      _result.tab = tab;
    }
    if (cgiId != null) {
      _result.cgiId = cgiId;
    }
    if (border != null) {
      _result.border = border;
    }
    if (state != null) {
      _result.state = state;
    }
    if (userList != null) {
      _result.userList.addAll(userList);
    }
    if (authentication != null) {
      _result.authentication = authentication;
    }
    if (vendor != null) {
      _result.vendor = vendor;
    }
    if (liveUrl != null) {
      _result.liveUrl = liveUrl;
    }
    if (hideMouse != null) {
      _result.hideMouse = hideMouse;
    }
    return _result;
  }
  factory RoomRefersh_CloudGameInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh_CloudGameInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh_CloudGameInfo clone() =>
      RoomRefersh_CloudGameInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh_CloudGameInfo copyWith(
          void Function(RoomRefersh_CloudGameInfo) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh_CloudGameInfo))
          as RoomRefersh_CloudGameInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CloudGameInfo create() => RoomRefersh_CloudGameInfo._();
  RoomRefersh_CloudGameInfo createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh_CloudGameInfo> createRepeated() =>
      $pb.PbList<RoomRefersh_CloudGameInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh_CloudGameInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh_CloudGameInfo>(create);
  static RoomRefersh_CloudGameInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get instanceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set instanceId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasInstanceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearInstanceId() => clearField(2);

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
  $core.int get isHorizontal => $_getIZ(4);
  @$pb.TagNumber(5)
  set isHorizontal($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIsHorizontal() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsHorizontal() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get tag => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get gameType => $_getSZ(6);
  @$pb.TagNumber(7)
  set gameType($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGameType() => $_has(6);
  @$pb.TagNumber(7)
  void clearGameType() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get archiveSupport => $_getIZ(7);
  @$pb.TagNumber(8)
  set archiveSupport($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasArchiveSupport() => $_has(7);
  @$pb.TagNumber(8)
  void clearArchiveSupport() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get serviceProvider => $_getSZ(8);
  @$pb.TagNumber(9)
  set serviceProvider($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasServiceProvider() => $_has(8);
  @$pb.TagNumber(9)
  void clearServiceProvider() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get machineType => $_getSZ(9);
  @$pb.TagNumber(10)
  set machineType($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasMachineType() => $_has(9);
  @$pb.TagNumber(10)
  void clearMachineType() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get isFree => $_getIZ(10);
  @$pb.TagNumber(11)
  set isFree($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasIsFree() => $_has(10);
  @$pb.TagNumber(11)
  void clearIsFree() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get landscapeIcon => $_getSZ(11);
  @$pb.TagNumber(12)
  set landscapeIcon($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasLandscapeIcon() => $_has(11);
  @$pb.TagNumber(12)
  void clearLandscapeIcon() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get tab => $_getSZ(12);
  @$pb.TagNumber(13)
  set tab($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasTab() => $_has(12);
  @$pb.TagNumber(13)
  void clearTab() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get cgiId => $_getIZ(13);
  @$pb.TagNumber(14)
  set cgiId($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasCgiId() => $_has(13);
  @$pb.TagNumber(14)
  void clearCgiId() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get border => $_getSZ(14);
  @$pb.TagNumber(15)
  set border($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasBorder() => $_has(14);
  @$pb.TagNumber(15)
  void clearBorder() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get state => $_getIZ(15);
  @$pb.TagNumber(16)
  set state($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasState() => $_has(15);
  @$pb.TagNumber(16)
  void clearState() => clearField(16);

  @$pb.TagNumber(17)
  $core.List<RoomRefersh_CloudGameInfo_UserList> get userList => $_getList(16);

  @$pb.TagNumber(18)
  RoomRefersh_CloudGameInfo_Authentication get authentication => $_getN(17);
  @$pb.TagNumber(18)
  set authentication(RoomRefersh_CloudGameInfo_Authentication v) {
    setField(18, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasAuthentication() => $_has(17);
  @$pb.TagNumber(18)
  void clearAuthentication() => clearField(18);
  @$pb.TagNumber(18)
  RoomRefersh_CloudGameInfo_Authentication ensureAuthentication() =>
      $_ensure(17);

  @$pb.TagNumber(19)
  $core.String get vendor => $_getSZ(18);
  @$pb.TagNumber(19)
  set vendor($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasVendor() => $_has(18);
  @$pb.TagNumber(19)
  void clearVendor() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get liveUrl => $_getSZ(19);
  @$pb.TagNumber(20)
  set liveUrl($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasLiveUrl() => $_has(19);
  @$pb.TagNumber(20)
  void clearLiveUrl() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get hideMouse => $_getIZ(20);
  @$pb.TagNumber(21)
  set hideMouse($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasHideMouse() => $_has(20);
  @$pb.TagNumber(21)
  void clearHideMouse() => clearField(21);
}

class RoomRefersh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomRefersh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.refersh'),
      createEmptyInstance: create)
    ..aOM<RoomRefersh_Options>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : '_options',
        subBuilder: RoomRefersh_Options.create)
    ..aOM<RoomRefersh_Config>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'config',
        subBuilder: RoomRefersh_Config.create)
    ..aOM<RoomRefersh_Creator>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createor',
        subBuilder: RoomRefersh_Creator.create)
    ..aOM<RoomRefersh_CrossPk>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'crosspk',
        subBuilder: RoomRefersh_CrossPk.create)
    ..aOM<RoomRefersh_GiftWish>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift_wish',
        subBuilder: RoomRefersh_GiftWish.create)
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gpk_enable')
    ..pPS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gpk_uids')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'now',
        $pb.PbFieldType.OU3)
    ..pc<RoomRefersh_OffMicList>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'offMicList',
        $pb.PbFieldType.PM,
        protoName: 'offMicList',
        subBuilder: RoomRefersh_OffMicList.create)
    ..pPS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'plugin_list')
    ..aOB(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_gpk')
    ..aOB(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_packet')
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_hidden_mic_room',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_newer_guide_room',
        $pb.PbFieldType.OU3)
    ..pc<RoomRefersh_List>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_List.create)
    ..aOB(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_lucky_bag')
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'micQueueModify',
        $pb.PbFieldType.OU3,
        protoName: 'micQueueModify')
    ..aOM<$0.ListValue>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wait',
        subBuilder: $0.ListValue.create)
    ..aOM<$0.ListValue>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'waitForAuction',
        protoName: 'waitForAuction',
        subBuilder: $0.ListValue.create)
    ..aOM<$0.ListValue>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'waitForBoss',
        protoName: 'waitForBoss',
        subBuilder: $0.ListValue.create)
    ..aOB(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unity_gaming')
    ..aOM<RoomRefersh_JuConfig>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ju_config',
        subBuilder: RoomRefersh_JuConfig.create)
    ..aOM<RoomRefersh_Match>(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'match',
        subBuilder: RoomRefersh_Match.create)
    ..aOM<RoomRefersh_KtvPkRank>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ktv_pk_rank',
        subBuilder: RoomRefersh_KtvPkRank.create)
    ..a<$core.int>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ame_virtual_rid',
        $pb.PbFieldType.OU3)
    ..aOM<RoomRefersh_GamePlayList>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'game_play_list',
        subBuilder: RoomRefersh_GamePlayList.create)
    ..a<$core.int>(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cplink_assist',
        $pb.PbFieldType.OU3)
    ..p<$core.int>(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cplink_line_colors_money',
        $pb.PbFieldType.PU3)
    ..a<$core.int>(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cplink_notice',
        $pb.PbFieldType.OU3)
    ..p<$core.int>(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'admins',
        $pb.PbFieldType.PU3)
    ..pc<RoomRefersh_RoomDefend>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room_defend',
        $pb.PbFieldType.PM,
        subBuilder: RoomRefersh_RoomDefend.create)
    ..aOM<$0.Value>(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        subBuilder: $0.Value.create)
    ..aOM<RoomRefersh_ArtCenter>(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'art_center',
        subBuilder: RoomRefersh_ArtCenter.create)
    ..a<$core.int>(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cloud_game_want_play_count',
        $pb.PbFieldType.OU3)
    ..aOS(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'regulation')
    ..aOM<RoomRefersh_CloudGameInfo>(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cloud_game_info',
        subBuilder: RoomRefersh_CloudGameInfo.create)
    ..aOM<RoomRefersh_Nest>(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nest',
        subBuilder: RoomRefersh_Nest.create)
    ..aOM<RoomRefersh_PrivateNest>(
        38,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'private_nest',
        subBuilder: RoomRefersh_PrivateNest.create)
    ..aOM<RoomRefersh_VipMic>(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vipmic',
        subBuilder: RoomRefersh_VipMic.create)
    ..aOM<RoomRefersh_Tower>(
        40,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tower',
        subBuilder: RoomRefersh_Tower.create)
    ..aOM<RoomRefersh_VehicleTeam>(
        41,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vehicle_team',
        subBuilder: RoomRefersh_VehicleTeam.create)
    ..aOS(
        42,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room_pretty_id')
    ..a<$core.int>(
        43,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wave_show',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        45,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ktv_source_type',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RoomRefersh._() : super();
  factory RoomRefersh({
    RoomRefersh_Options? options,
    RoomRefersh_Config? config,
    RoomRefersh_Creator? createor,
    RoomRefersh_CrossPk? crosspk,
    RoomRefersh_GiftWish? giftWish,
    $core.bool? gpkEnable,
    $core.Iterable<$core.String>? gpkUids,
    $core.int? now,
    $core.Iterable<RoomRefersh_OffMicList>? offMicList,
    $core.Iterable<$core.String>? pluginList,
    $core.bool? showGpk,
    $core.bool? showPacket,
    $core.int? isHiddenMicRoom,
    $core.int? isNewerGuideRoom,
    $core.Iterable<RoomRefersh_List>? list,
    $core.bool? showLuckyBag,
    $core.int? micQueueModify,
    $0.ListValue? wait,
    $0.ListValue? waitForAuction,
    $0.ListValue? waitForBoss,
    $core.bool? unityGaming,
    RoomRefersh_JuConfig? juConfig,
    RoomRefersh_Match? match,
    RoomRefersh_KtvPkRank? ktvPkRank,
    $core.int? ameVirtualRid,
    RoomRefersh_GamePlayList? gamePlayList,
    $core.int? cplinkAssist,
    $core.Iterable<$core.int>? cplinkLineColorsMoney,
    $core.int? cplinkNotice,
    $core.Iterable<$core.int>? admins,
    $core.Iterable<RoomRefersh_RoomDefend>? roomDefend,
    $0.Value? rid,
    RoomRefersh_ArtCenter? artCenter,
    $core.int? cloudGameWantPlayCount,
    $core.String? regulation,
    RoomRefersh_CloudGameInfo? cloudGameInfo,
    RoomRefersh_Nest? nest,
    RoomRefersh_PrivateNest? privateNest,
    RoomRefersh_VipMic? vipmic,
    RoomRefersh_Tower? tower,
    RoomRefersh_VehicleTeam? vehicleTeam,
    $core.String? roomPrettyId,
    $core.int? waveShow,
    $core.int? ktvSourceType,
  }) {
    final _result = create();
    if (options != null) {
      _result.options = options;
    }
    if (config != null) {
      _result.config = config;
    }
    if (createor != null) {
      _result.createor = createor;
    }
    if (crosspk != null) {
      _result.crosspk = crosspk;
    }
    if (giftWish != null) {
      _result.giftWish = giftWish;
    }
    if (gpkEnable != null) {
      _result.gpkEnable = gpkEnable;
    }
    if (gpkUids != null) {
      _result.gpkUids.addAll(gpkUids);
    }
    if (now != null) {
      _result.now = now;
    }
    if (offMicList != null) {
      _result.offMicList.addAll(offMicList);
    }
    if (pluginList != null) {
      _result.pluginList.addAll(pluginList);
    }
    if (showGpk != null) {
      _result.showGpk = showGpk;
    }
    if (showPacket != null) {
      _result.showPacket = showPacket;
    }
    if (isHiddenMicRoom != null) {
      _result.isHiddenMicRoom = isHiddenMicRoom;
    }
    if (isNewerGuideRoom != null) {
      _result.isNewerGuideRoom = isNewerGuideRoom;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (showLuckyBag != null) {
      _result.showLuckyBag = showLuckyBag;
    }
    if (micQueueModify != null) {
      _result.micQueueModify = micQueueModify;
    }
    if (wait != null) {
      _result.wait = wait;
    }
    if (waitForAuction != null) {
      _result.waitForAuction = waitForAuction;
    }
    if (waitForBoss != null) {
      _result.waitForBoss = waitForBoss;
    }
    if (unityGaming != null) {
      _result.unityGaming = unityGaming;
    }
    if (juConfig != null) {
      _result.juConfig = juConfig;
    }
    if (match != null) {
      _result.match = match;
    }
    if (ktvPkRank != null) {
      _result.ktvPkRank = ktvPkRank;
    }
    if (ameVirtualRid != null) {
      _result.ameVirtualRid = ameVirtualRid;
    }
    if (gamePlayList != null) {
      _result.gamePlayList = gamePlayList;
    }
    if (cplinkAssist != null) {
      _result.cplinkAssist = cplinkAssist;
    }
    if (cplinkLineColorsMoney != null) {
      _result.cplinkLineColorsMoney.addAll(cplinkLineColorsMoney);
    }
    if (cplinkNotice != null) {
      _result.cplinkNotice = cplinkNotice;
    }
    if (admins != null) {
      _result.admins.addAll(admins);
    }
    if (roomDefend != null) {
      _result.roomDefend.addAll(roomDefend);
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (artCenter != null) {
      _result.artCenter = artCenter;
    }
    if (cloudGameWantPlayCount != null) {
      _result.cloudGameWantPlayCount = cloudGameWantPlayCount;
    }
    if (regulation != null) {
      _result.regulation = regulation;
    }
    if (cloudGameInfo != null) {
      _result.cloudGameInfo = cloudGameInfo;
    }
    if (nest != null) {
      _result.nest = nest;
    }
    if (privateNest != null) {
      _result.privateNest = privateNest;
    }
    if (vipmic != null) {
      _result.vipmic = vipmic;
    }
    if (tower != null) {
      _result.tower = tower;
    }
    if (vehicleTeam != null) {
      _result.vehicleTeam = vehicleTeam;
    }
    if (roomPrettyId != null) {
      _result.roomPrettyId = roomPrettyId;
    }
    if (waveShow != null) {
      _result.waveShow = waveShow;
    }
    if (ktvSourceType != null) {
      _result.ktvSourceType = ktvSourceType;
    }
    return _result;
  }
  factory RoomRefersh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomRefersh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomRefersh clone() => RoomRefersh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomRefersh copyWith(void Function(RoomRefersh) updates) =>
      super.copyWith((message) => updates(message as RoomRefersh))
          as RoomRefersh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomRefersh create() => RoomRefersh._();
  RoomRefersh createEmptyInstance() => create();
  static $pb.PbList<RoomRefersh> createRepeated() => $pb.PbList<RoomRefersh>();
  @$core.pragma('dart2js:noInline')
  static RoomRefersh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomRefersh>(create);
  static RoomRefersh? _defaultInstance;

  @$pb.TagNumber(1)
  RoomRefersh_Options get options => $_getN(0);
  @$pb.TagNumber(1)
  set options(RoomRefersh_Options v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOptions() => $_has(0);
  @$pb.TagNumber(1)
  void clearOptions() => clearField(1);
  @$pb.TagNumber(1)
  RoomRefersh_Options ensureOptions() => $_ensure(0);

  @$pb.TagNumber(2)
  RoomRefersh_Config get config => $_getN(1);
  @$pb.TagNumber(2)
  set config(RoomRefersh_Config v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasConfig() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfig() => clearField(2);
  @$pb.TagNumber(2)
  RoomRefersh_Config ensureConfig() => $_ensure(1);

  @$pb.TagNumber(3)
  RoomRefersh_Creator get createor => $_getN(2);
  @$pb.TagNumber(3)
  set createor(RoomRefersh_Creator v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCreateor() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreateor() => clearField(3);
  @$pb.TagNumber(3)
  RoomRefersh_Creator ensureCreateor() => $_ensure(2);

  @$pb.TagNumber(4)
  RoomRefersh_CrossPk get crosspk => $_getN(3);
  @$pb.TagNumber(4)
  set crosspk(RoomRefersh_CrossPk v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCrosspk() => $_has(3);
  @$pb.TagNumber(4)
  void clearCrosspk() => clearField(4);
  @$pb.TagNumber(4)
  RoomRefersh_CrossPk ensureCrosspk() => $_ensure(3);

  @$pb.TagNumber(5)
  RoomRefersh_GiftWish get giftWish => $_getN(4);
  @$pb.TagNumber(5)
  set giftWish(RoomRefersh_GiftWish v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGiftWish() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftWish() => clearField(5);
  @$pb.TagNumber(5)
  RoomRefersh_GiftWish ensureGiftWish() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.bool get gpkEnable => $_getBF(5);
  @$pb.TagNumber(6)
  set gpkEnable($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGpkEnable() => $_has(5);
  @$pb.TagNumber(6)
  void clearGpkEnable() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.String> get gpkUids => $_getList(6);

  @$pb.TagNumber(8)
  $core.int get now => $_getIZ(7);
  @$pb.TagNumber(8)
  set now($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasNow() => $_has(7);
  @$pb.TagNumber(8)
  void clearNow() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<RoomRefersh_OffMicList> get offMicList => $_getList(8);

  @$pb.TagNumber(10)
  $core.List<$core.String> get pluginList => $_getList(9);

  @$pb.TagNumber(11)
  $core.bool get showGpk => $_getBF(10);
  @$pb.TagNumber(11)
  set showGpk($core.bool v) {
    $_setBool(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasShowGpk() => $_has(10);
  @$pb.TagNumber(11)
  void clearShowGpk() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get showPacket => $_getBF(11);
  @$pb.TagNumber(12)
  set showPacket($core.bool v) {
    $_setBool(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasShowPacket() => $_has(11);
  @$pb.TagNumber(12)
  void clearShowPacket() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get isHiddenMicRoom => $_getIZ(12);
  @$pb.TagNumber(13)
  set isHiddenMicRoom($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasIsHiddenMicRoom() => $_has(12);
  @$pb.TagNumber(13)
  void clearIsHiddenMicRoom() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get isNewerGuideRoom => $_getIZ(13);
  @$pb.TagNumber(14)
  set isNewerGuideRoom($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasIsNewerGuideRoom() => $_has(13);
  @$pb.TagNumber(14)
  void clearIsNewerGuideRoom() => clearField(14);

  @$pb.TagNumber(15)
  $core.List<RoomRefersh_List> get list => $_getList(14);

  @$pb.TagNumber(16)
  $core.bool get showLuckyBag => $_getBF(15);
  @$pb.TagNumber(16)
  set showLuckyBag($core.bool v) {
    $_setBool(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasShowLuckyBag() => $_has(15);
  @$pb.TagNumber(16)
  void clearShowLuckyBag() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get micQueueModify => $_getIZ(16);
  @$pb.TagNumber(17)
  set micQueueModify($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasMicQueueModify() => $_has(16);
  @$pb.TagNumber(17)
  void clearMicQueueModify() => clearField(17);

  @$pb.TagNumber(18)
  $0.ListValue get wait => $_getN(17);
  @$pb.TagNumber(18)
  set wait($0.ListValue v) {
    setField(18, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasWait() => $_has(17);
  @$pb.TagNumber(18)
  void clearWait() => clearField(18);
  @$pb.TagNumber(18)
  $0.ListValue ensureWait() => $_ensure(17);

  @$pb.TagNumber(19)
  $0.ListValue get waitForAuction => $_getN(18);
  @$pb.TagNumber(19)
  set waitForAuction($0.ListValue v) {
    setField(19, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasWaitForAuction() => $_has(18);
  @$pb.TagNumber(19)
  void clearWaitForAuction() => clearField(19);
  @$pb.TagNumber(19)
  $0.ListValue ensureWaitForAuction() => $_ensure(18);

  @$pb.TagNumber(20)
  $0.ListValue get waitForBoss => $_getN(19);
  @$pb.TagNumber(20)
  set waitForBoss($0.ListValue v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasWaitForBoss() => $_has(19);
  @$pb.TagNumber(20)
  void clearWaitForBoss() => clearField(20);
  @$pb.TagNumber(20)
  $0.ListValue ensureWaitForBoss() => $_ensure(19);

  @$pb.TagNumber(21)
  $core.bool get unityGaming => $_getBF(20);
  @$pb.TagNumber(21)
  set unityGaming($core.bool v) {
    $_setBool(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasUnityGaming() => $_has(20);
  @$pb.TagNumber(21)
  void clearUnityGaming() => clearField(21);

  @$pb.TagNumber(22)
  RoomRefersh_JuConfig get juConfig => $_getN(21);
  @$pb.TagNumber(22)
  set juConfig(RoomRefersh_JuConfig v) {
    setField(22, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasJuConfig() => $_has(21);
  @$pb.TagNumber(22)
  void clearJuConfig() => clearField(22);
  @$pb.TagNumber(22)
  RoomRefersh_JuConfig ensureJuConfig() => $_ensure(21);

  @$pb.TagNumber(23)
  RoomRefersh_Match get match => $_getN(22);
  @$pb.TagNumber(23)
  set match(RoomRefersh_Match v) {
    setField(23, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasMatch() => $_has(22);
  @$pb.TagNumber(23)
  void clearMatch() => clearField(23);
  @$pb.TagNumber(23)
  RoomRefersh_Match ensureMatch() => $_ensure(22);

  @$pb.TagNumber(24)
  RoomRefersh_KtvPkRank get ktvPkRank => $_getN(23);
  @$pb.TagNumber(24)
  set ktvPkRank(RoomRefersh_KtvPkRank v) {
    setField(24, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasKtvPkRank() => $_has(23);
  @$pb.TagNumber(24)
  void clearKtvPkRank() => clearField(24);
  @$pb.TagNumber(24)
  RoomRefersh_KtvPkRank ensureKtvPkRank() => $_ensure(23);

  @$pb.TagNumber(25)
  $core.int get ameVirtualRid => $_getIZ(24);
  @$pb.TagNumber(25)
  set ameVirtualRid($core.int v) {
    $_setUnsignedInt32(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasAmeVirtualRid() => $_has(24);
  @$pb.TagNumber(25)
  void clearAmeVirtualRid() => clearField(25);

  @$pb.TagNumber(26)
  RoomRefersh_GamePlayList get gamePlayList => $_getN(25);
  @$pb.TagNumber(26)
  set gamePlayList(RoomRefersh_GamePlayList v) {
    setField(26, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasGamePlayList() => $_has(25);
  @$pb.TagNumber(26)
  void clearGamePlayList() => clearField(26);
  @$pb.TagNumber(26)
  RoomRefersh_GamePlayList ensureGamePlayList() => $_ensure(25);

  @$pb.TagNumber(27)
  $core.int get cplinkAssist => $_getIZ(26);
  @$pb.TagNumber(27)
  set cplinkAssist($core.int v) {
    $_setUnsignedInt32(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasCplinkAssist() => $_has(26);
  @$pb.TagNumber(27)
  void clearCplinkAssist() => clearField(27);

  @$pb.TagNumber(28)
  $core.List<$core.int> get cplinkLineColorsMoney => $_getList(27);

  @$pb.TagNumber(29)
  $core.int get cplinkNotice => $_getIZ(28);
  @$pb.TagNumber(29)
  set cplinkNotice($core.int v) {
    $_setUnsignedInt32(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasCplinkNotice() => $_has(28);
  @$pb.TagNumber(29)
  void clearCplinkNotice() => clearField(29);

  @$pb.TagNumber(30)
  $core.List<$core.int> get admins => $_getList(29);

  @$pb.TagNumber(31)
  $core.List<RoomRefersh_RoomDefend> get roomDefend => $_getList(30);

  @$pb.TagNumber(32)
  $0.Value get rid => $_getN(31);
  @$pb.TagNumber(32)
  set rid($0.Value v) {
    setField(32, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasRid() => $_has(31);
  @$pb.TagNumber(32)
  void clearRid() => clearField(32);
  @$pb.TagNumber(32)
  $0.Value ensureRid() => $_ensure(31);

  @$pb.TagNumber(33)
  RoomRefersh_ArtCenter get artCenter => $_getN(32);
  @$pb.TagNumber(33)
  set artCenter(RoomRefersh_ArtCenter v) {
    setField(33, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasArtCenter() => $_has(32);
  @$pb.TagNumber(33)
  void clearArtCenter() => clearField(33);
  @$pb.TagNumber(33)
  RoomRefersh_ArtCenter ensureArtCenter() => $_ensure(32);

  @$pb.TagNumber(34)
  $core.int get cloudGameWantPlayCount => $_getIZ(33);
  @$pb.TagNumber(34)
  set cloudGameWantPlayCount($core.int v) {
    $_setUnsignedInt32(33, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasCloudGameWantPlayCount() => $_has(33);
  @$pb.TagNumber(34)
  void clearCloudGameWantPlayCount() => clearField(34);

  @$pb.TagNumber(35)
  $core.String get regulation => $_getSZ(34);
  @$pb.TagNumber(35)
  set regulation($core.String v) {
    $_setString(34, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasRegulation() => $_has(34);
  @$pb.TagNumber(35)
  void clearRegulation() => clearField(35);

  @$pb.TagNumber(36)
  RoomRefersh_CloudGameInfo get cloudGameInfo => $_getN(35);
  @$pb.TagNumber(36)
  set cloudGameInfo(RoomRefersh_CloudGameInfo v) {
    setField(36, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasCloudGameInfo() => $_has(35);
  @$pb.TagNumber(36)
  void clearCloudGameInfo() => clearField(36);
  @$pb.TagNumber(36)
  RoomRefersh_CloudGameInfo ensureCloudGameInfo() => $_ensure(35);

  @$pb.TagNumber(37)
  RoomRefersh_Nest get nest => $_getN(36);
  @$pb.TagNumber(37)
  set nest(RoomRefersh_Nest v) {
    setField(37, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasNest() => $_has(36);
  @$pb.TagNumber(37)
  void clearNest() => clearField(37);
  @$pb.TagNumber(37)
  RoomRefersh_Nest ensureNest() => $_ensure(36);

  @$pb.TagNumber(38)
  RoomRefersh_PrivateNest get privateNest => $_getN(37);
  @$pb.TagNumber(38)
  set privateNest(RoomRefersh_PrivateNest v) {
    setField(38, v);
  }

  @$pb.TagNumber(38)
  $core.bool hasPrivateNest() => $_has(37);
  @$pb.TagNumber(38)
  void clearPrivateNest() => clearField(38);
  @$pb.TagNumber(38)
  RoomRefersh_PrivateNest ensurePrivateNest() => $_ensure(37);

  @$pb.TagNumber(39)
  RoomRefersh_VipMic get vipmic => $_getN(38);
  @$pb.TagNumber(39)
  set vipmic(RoomRefersh_VipMic v) {
    setField(39, v);
  }

  @$pb.TagNumber(39)
  $core.bool hasVipmic() => $_has(38);
  @$pb.TagNumber(39)
  void clearVipmic() => clearField(39);
  @$pb.TagNumber(39)
  RoomRefersh_VipMic ensureVipmic() => $_ensure(38);

  @$pb.TagNumber(40)
  RoomRefersh_Tower get tower => $_getN(39);
  @$pb.TagNumber(40)
  set tower(RoomRefersh_Tower v) {
    setField(40, v);
  }

  @$pb.TagNumber(40)
  $core.bool hasTower() => $_has(39);
  @$pb.TagNumber(40)
  void clearTower() => clearField(40);
  @$pb.TagNumber(40)
  RoomRefersh_Tower ensureTower() => $_ensure(39);

  @$pb.TagNumber(41)
  RoomRefersh_VehicleTeam get vehicleTeam => $_getN(40);
  @$pb.TagNumber(41)
  set vehicleTeam(RoomRefersh_VehicleTeam v) {
    setField(41, v);
  }

  @$pb.TagNumber(41)
  $core.bool hasVehicleTeam() => $_has(40);
  @$pb.TagNumber(41)
  void clearVehicleTeam() => clearField(41);
  @$pb.TagNumber(41)
  RoomRefersh_VehicleTeam ensureVehicleTeam() => $_ensure(40);

  @$pb.TagNumber(42)
  $core.String get roomPrettyId => $_getSZ(41);
  @$pb.TagNumber(42)
  set roomPrettyId($core.String v) {
    $_setString(41, v);
  }

  @$pb.TagNumber(42)
  $core.bool hasRoomPrettyId() => $_has(41);
  @$pb.TagNumber(42)
  void clearRoomPrettyId() => clearField(42);

  @$pb.TagNumber(43)
  $core.int get waveShow => $_getIZ(42);
  @$pb.TagNumber(43)
  set waveShow($core.int v) {
    $_setUnsignedInt32(42, v);
  }

  @$pb.TagNumber(43)
  $core.bool hasWaveShow() => $_has(42);
  @$pb.TagNumber(43)
  void clearWaveShow() => clearField(43);

  @$pb.TagNumber(45)
  $core.int get ktvSourceType => $_getIZ(43);
  @$pb.TagNumber(45)
  set ktvSourceType($core.int v) {
    $_setSignedInt32(43, v);
  }

  @$pb.TagNumber(45)
  $core.bool hasKtvSourceType() => $_has(43);
  @$pb.TagNumber(45)
  void clearKtvSourceType() => clearField(45);
}
