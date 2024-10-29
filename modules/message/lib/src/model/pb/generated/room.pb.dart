///
//  Generated code. Do not modify.
//  source: room.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'entity_xs_chatroom.pb.dart' as $0;

class RoomTypeName extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomTypeName',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'val')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color')
    ..pPS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bg')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'homeIcon')
    ..hasRequiredFields = false;

  RoomTypeName._() : super();
  factory RoomTypeName({
    $core.String? label,
    $core.String? val,
    $core.String? color,
    $core.Iterable<$core.String>? bg,
    $core.String? show,
    $core.String? icon,
    $core.String? homeIcon,
  }) {
    final _result = create();
    if (label != null) {
      _result.label = label;
    }
    if (val != null) {
      _result.val = val;
    }
    if (color != null) {
      _result.color = color;
    }
    if (bg != null) {
      _result.bg.addAll(bg);
    }
    if (show != null) {
      _result.show = show;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (homeIcon != null) {
      _result.homeIcon = homeIcon;
    }
    return _result;
  }
  factory RoomTypeName.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomTypeName.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomTypeName clone() => RoomTypeName()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomTypeName copyWith(void Function(RoomTypeName) updates) =>
      super.copyWith((message) => updates(message as RoomTypeName))
          as RoomTypeName; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomTypeName create() => RoomTypeName._();
  RoomTypeName createEmptyInstance() => create();
  static $pb.PbList<RoomTypeName> createRepeated() =>
      $pb.PbList<RoomTypeName>();
  @$core.pragma('dart2js:noInline')
  static RoomTypeName getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomTypeName>(create);
  static RoomTypeName? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get label => $_getSZ(0);
  @$pb.TagNumber(1)
  set label($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get val => $_getSZ(1);
  @$pb.TagNumber(2)
  set val($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVal() => $_has(1);
  @$pb.TagNumber(2)
  void clearVal() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get color => $_getSZ(2);
  @$pb.TagNumber(3)
  set color($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasColor() => $_has(2);
  @$pb.TagNumber(3)
  void clearColor() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get bg => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get show => $_getSZ(4);
  @$pb.TagNumber(5)
  set show($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasShow() => $_has(4);
  @$pb.TagNumber(5)
  void clearShow() => clearField(5);

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
  $core.String get homeIcon => $_getSZ(6);
  @$pb.TagNumber(7)
  set homeIcon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasHomeIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearHomeIcon() => clearField(7);
}

class RoomOmTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomOmTab',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  RoomOmTab._() : super();
  factory RoomOmTab({
    $core.String? label,
    $core.String? icon,
  }) {
    final _result = create();
    if (label != null) {
      _result.label = label;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory RoomOmTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomOmTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomOmTab clone() => RoomOmTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomOmTab copyWith(void Function(RoomOmTab) updates) =>
      super.copyWith((message) => updates(message as RoomOmTab))
          as RoomOmTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomOmTab create() => RoomOmTab._();
  RoomOmTab createEmptyInstance() => create();
  static $pb.PbList<RoomOmTab> createRepeated() => $pb.PbList<RoomOmTab>();
  @$core.pragma('dart2js:noInline')
  static RoomOmTab getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomOmTab>(create);
  static RoomOmTab? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get label => $_getSZ(0);
  @$pb.TagNumber(1)
  set label($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => clearField(1);

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

class FormattedRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FormattedRoom',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<$0.EntityXsChatroom>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room',
        subBuilder: $0.EntityXsChatroom.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'real',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isPk')
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasPassword')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftFrame')
    ..aOM<RoomOmTab>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'omTab',
        subBuilder: RoomOmTab.create)
    ..aOM<RoomTypeName>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeName',
        subBuilder: RoomTypeName.create)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uname')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uicon')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'utitle',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'receptionUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bossUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numBoy',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hourRank',
        $pb.PbFieldType.OU3)
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'packetIcon')
    ..pPS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'micIcons')
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomDesc')
    ..a<$core.int>(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numGirl',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  FormattedRoom._() : super();
  factory FormattedRoom({
    $0.EntityXsChatroom? room,
    $core.int? onlineNum,
    $core.int? real,
    $core.int? score,
    $core.bool? isPk,
    $core.bool? hasPassword,
    $core.String? frame,
    $core.String? leftFrame,
    RoomOmTab? omTab,
    RoomTypeName? typeName,
    $core.int? vip,
    $core.String? uname,
    $core.String? uicon,
    $core.int? utitle,
    $core.int? sex,
    $core.int? receptionUid,
    $core.int? bossUid,
    $core.int? numBoy,
    $core.int? hourRank,
    $core.String? packetIcon,
    $core.Iterable<$core.String>? micIcons,
    $core.String? roomDesc,
    $core.int? numGirl,
  }) {
    final _result = create();
    if (room != null) {
      _result.room = room;
    }
    if (onlineNum != null) {
      _result.onlineNum = onlineNum;
    }
    if (real != null) {
      _result.real = real;
    }
    if (score != null) {
      _result.score = score;
    }
    if (isPk != null) {
      _result.isPk = isPk;
    }
    if (hasPassword != null) {
      _result.hasPassword = hasPassword;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (leftFrame != null) {
      _result.leftFrame = leftFrame;
    }
    if (omTab != null) {
      _result.omTab = omTab;
    }
    if (typeName != null) {
      _result.typeName = typeName;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (uname != null) {
      _result.uname = uname;
    }
    if (uicon != null) {
      _result.uicon = uicon;
    }
    if (utitle != null) {
      _result.utitle = utitle;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (receptionUid != null) {
      _result.receptionUid = receptionUid;
    }
    if (bossUid != null) {
      _result.bossUid = bossUid;
    }
    if (numBoy != null) {
      _result.numBoy = numBoy;
    }
    if (hourRank != null) {
      _result.hourRank = hourRank;
    }
    if (packetIcon != null) {
      _result.packetIcon = packetIcon;
    }
    if (micIcons != null) {
      _result.micIcons.addAll(micIcons);
    }
    if (roomDesc != null) {
      _result.roomDesc = roomDesc;
    }
    if (numGirl != null) {
      _result.numGirl = numGirl;
    }
    return _result;
  }
  factory FormattedRoom.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FormattedRoom.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FormattedRoom clone() => FormattedRoom()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FormattedRoom copyWith(void Function(FormattedRoom) updates) =>
      super.copyWith((message) => updates(message as FormattedRoom))
          as FormattedRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FormattedRoom create() => FormattedRoom._();
  FormattedRoom createEmptyInstance() => create();
  static $pb.PbList<FormattedRoom> createRepeated() =>
      $pb.PbList<FormattedRoom>();
  @$core.pragma('dart2js:noInline')
  static FormattedRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FormattedRoom>(create);
  static FormattedRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $0.EntityXsChatroom get room => $_getN(0);
  @$pb.TagNumber(1)
  set room($0.EntityXsChatroom v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);
  @$pb.TagNumber(1)
  $0.EntityXsChatroom ensureRoom() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get onlineNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set onlineNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOnlineNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearOnlineNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get real => $_getIZ(2);
  @$pb.TagNumber(3)
  set real($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasReal() => $_has(2);
  @$pb.TagNumber(3)
  void clearReal() => clearField(3);

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
  $core.bool get isPk => $_getBF(4);
  @$pb.TagNumber(5)
  set isPk($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIsPk() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsPk() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get hasPassword => $_getBF(5);
  @$pb.TagNumber(6)
  set hasPassword($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasHasPassword() => $_has(5);
  @$pb.TagNumber(6)
  void clearHasPassword() => clearField(6);

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
  $core.String get leftFrame => $_getSZ(7);
  @$pb.TagNumber(8)
  set leftFrame($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLeftFrame() => $_has(7);
  @$pb.TagNumber(8)
  void clearLeftFrame() => clearField(8);

  @$pb.TagNumber(9)
  RoomOmTab get omTab => $_getN(8);
  @$pb.TagNumber(9)
  set omTab(RoomOmTab v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasOmTab() => $_has(8);
  @$pb.TagNumber(9)
  void clearOmTab() => clearField(9);
  @$pb.TagNumber(9)
  RoomOmTab ensureOmTab() => $_ensure(8);

  @$pb.TagNumber(10)
  RoomTypeName get typeName => $_getN(9);
  @$pb.TagNumber(10)
  set typeName(RoomTypeName v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTypeName() => $_has(9);
  @$pb.TagNumber(10)
  void clearTypeName() => clearField(10);
  @$pb.TagNumber(10)
  RoomTypeName ensureTypeName() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.int get vip => $_getIZ(10);
  @$pb.TagNumber(11)
  set vip($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasVip() => $_has(10);
  @$pb.TagNumber(11)
  void clearVip() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get uname => $_getSZ(11);
  @$pb.TagNumber(12)
  set uname($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasUname() => $_has(11);
  @$pb.TagNumber(12)
  void clearUname() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get uicon => $_getSZ(12);
  @$pb.TagNumber(13)
  set uicon($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasUicon() => $_has(12);
  @$pb.TagNumber(13)
  void clearUicon() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get utitle => $_getIZ(13);
  @$pb.TagNumber(14)
  set utitle($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasUtitle() => $_has(13);
  @$pb.TagNumber(14)
  void clearUtitle() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get sex => $_getIZ(14);
  @$pb.TagNumber(15)
  set sex($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasSex() => $_has(14);
  @$pb.TagNumber(15)
  void clearSex() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get receptionUid => $_getIZ(15);
  @$pb.TagNumber(16)
  set receptionUid($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasReceptionUid() => $_has(15);
  @$pb.TagNumber(16)
  void clearReceptionUid() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get bossUid => $_getIZ(16);
  @$pb.TagNumber(17)
  set bossUid($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasBossUid() => $_has(16);
  @$pb.TagNumber(17)
  void clearBossUid() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get numBoy => $_getIZ(17);
  @$pb.TagNumber(18)
  set numBoy($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasNumBoy() => $_has(17);
  @$pb.TagNumber(18)
  void clearNumBoy() => clearField(18);

  @$pb.TagNumber(20)
  $core.int get hourRank => $_getIZ(18);
  @$pb.TagNumber(20)
  set hourRank($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasHourRank() => $_has(18);
  @$pb.TagNumber(20)
  void clearHourRank() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get packetIcon => $_getSZ(19);
  @$pb.TagNumber(21)
  set packetIcon($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasPacketIcon() => $_has(19);
  @$pb.TagNumber(21)
  void clearPacketIcon() => clearField(21);

  @$pb.TagNumber(22)
  $core.List<$core.String> get micIcons => $_getList(20);

  @$pb.TagNumber(23)
  $core.String get roomDesc => $_getSZ(21);
  @$pb.TagNumber(23)
  set roomDesc($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasRoomDesc() => $_has(21);
  @$pb.TagNumber(23)
  void clearRoomDesc() => clearField(23);

  @$pb.TagNumber(29)
  $core.int get numGirl => $_getIZ(22);
  @$pb.TagNumber(29)
  set numGirl($core.int v) {
    $_setUnsignedInt32(22, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasNumGirl() => $_has(22);
  @$pb.TagNumber(29)
  void clearNumGirl() => clearField(29);
}

class FormattedRooms extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FormattedRooms',
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
    ..pc<FormattedRoom>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: FormattedRoom.create)
    ..hasRequiredFields = false;

  FormattedRooms._() : super();
  factory FormattedRooms({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<FormattedRoom>? data,
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
  factory FormattedRooms.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FormattedRooms.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FormattedRooms clone() => FormattedRooms()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FormattedRooms copyWith(void Function(FormattedRooms) updates) =>
      super.copyWith((message) => updates(message as FormattedRooms))
          as FormattedRooms; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FormattedRooms create() => FormattedRooms._();
  FormattedRooms createEmptyInstance() => create();
  static $pb.PbList<FormattedRooms> createRepeated() =>
      $pb.PbList<FormattedRooms>();
  @$core.pragma('dart2js:noInline')
  static FormattedRooms getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FormattedRooms>(create);
  static FormattedRooms? _defaultInstance;

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
  $core.List<FormattedRoom> get data => $_getList(2);
}

class InRoomFriends extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'InRoomFriends',
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
    ..hasRequiredFields = false;

  InRoomFriends._() : super();
  factory InRoomFriends({
    $core.int? uid,
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
  factory InRoomFriends.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory InRoomFriends.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  InRoomFriends clone() => InRoomFriends()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  InRoomFriends copyWith(void Function(InRoomFriends) updates) =>
      super.copyWith((message) => updates(message as InRoomFriends))
          as InRoomFriends; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InRoomFriends create() => InRoomFriends._();
  InRoomFriends createEmptyInstance() => create();
  static $pb.PbList<InRoomFriends> createRepeated() =>
      $pb.PbList<InRoomFriends>();
  @$core.pragma('dart2js:noInline')
  static InRoomFriends getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InRoomFriends>(create);
  static InRoomFriends? _defaultInstance;

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
}

class TogetherPlayUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TogetherPlayUser',
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
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'togetherTime',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomType')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  TogetherPlayUser._() : super();
  factory TogetherPlayUser({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? togetherTime,
    $core.String? roomType,
    $core.int? dateline,
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
    if (togetherTime != null) {
      _result.togetherTime = togetherTime;
    }
    if (roomType != null) {
      _result.roomType = roomType;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    return _result;
  }
  factory TogetherPlayUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TogetherPlayUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TogetherPlayUser clone() => TogetherPlayUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TogetherPlayUser copyWith(void Function(TogetherPlayUser) updates) =>
      super.copyWith((message) => updates(message as TogetherPlayUser))
          as TogetherPlayUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TogetherPlayUser create() => TogetherPlayUser._();
  TogetherPlayUser createEmptyInstance() => create();
  static $pb.PbList<TogetherPlayUser> createRepeated() =>
      $pb.PbList<TogetherPlayUser>();
  @$core.pragma('dart2js:noInline')
  static TogetherPlayUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TogetherPlayUser>(create);
  static TogetherPlayUser? _defaultInstance;

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
  $core.int get togetherTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set togetherTime($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTogetherTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearTogetherTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get roomType => $_getSZ(4);
  @$pb.TagNumber(5)
  set roomType($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRoomType() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomType() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get dateline => $_getIZ(5);
  @$pb.TagNumber(6)
  set dateline($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDateline() => $_has(5);
  @$pb.TagNumber(6)
  void clearDateline() => clearField(6);
}
