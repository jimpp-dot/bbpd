///
//  Generated code. Do not modify.
//  source: room.achievement.notice.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomAchievementNotice_FansLabel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomAchievementNotice.FansLabel',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.achievement.notice'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'credit',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomAchievementNotice_FansLabel._() : super();
  factory RoomAchievementNotice_FansLabel({
    $core.String? label,
    $core.int? credit,
    $core.int? level,
  }) {
    final _result = create();
    if (label != null) {
      _result.label = label;
    }
    if (credit != null) {
      _result.credit = credit;
    }
    if (level != null) {
      _result.level = level;
    }
    return _result;
  }
  factory RoomAchievementNotice_FansLabel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomAchievementNotice_FansLabel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomAchievementNotice_FansLabel clone() =>
      RoomAchievementNotice_FansLabel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomAchievementNotice_FansLabel copyWith(
          void Function(RoomAchievementNotice_FansLabel) updates) =>
      super.copyWith(
              (message) => updates(message as RoomAchievementNotice_FansLabel))
          as RoomAchievementNotice_FansLabel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomAchievementNotice_FansLabel create() =>
      RoomAchievementNotice_FansLabel._();
  RoomAchievementNotice_FansLabel createEmptyInstance() => create();
  static $pb.PbList<RoomAchievementNotice_FansLabel> createRepeated() =>
      $pb.PbList<RoomAchievementNotice_FansLabel>();
  @$core.pragma('dart2js:noInline')
  static RoomAchievementNotice_FansLabel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomAchievementNotice_FansLabel>(
          create);
  static RoomAchievementNotice_FansLabel? _defaultInstance;

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
  $core.int get credit => $_getIZ(1);
  @$pb.TagNumber(2)
  set credit($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCredit() => $_has(1);
  @$pb.TagNumber(2)
  void clearCredit() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get level => $_getIZ(2);
  @$pb.TagNumber(3)
  set level($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLevel() => clearField(3);
}

class RoomAchievementNotice extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomAchievementNotice',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.achievement.notice'),
      createEmptyInstance: create)
    ..aOM<RoomAchievementNotice_FansLabel>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fans_label',
        subBuilder: RoomAchievementNotice_FansLabel.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftImage',
        protoName: 'giftImage')
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icongray')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rname')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toname')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tovip',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uicon')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uname')
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'utitle',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'utitle_new',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uvip',
        $pb.PbFieldType.OU3)
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'word')
    ..hasRequiredFields = false;

  RoomAchievementNotice._() : super();
  factory RoomAchievementNotice({
    RoomAchievementNotice_FansLabel? fansLabel,
    $core.String? frame,
    $core.String? giftImage,
    $core.bool? icongray,
    $core.int? money,
    $core.int? rid,
    $core.String? rname,
    $core.String? toname,
    $core.int? tovip,
    $core.String? type,
    $core.String? uicon,
    $core.String? uname,
    $core.int? utitle,
    $core.int? utitleNew,
    $core.int? uvip,
    $core.String? word,
  }) {
    final _result = create();
    if (fansLabel != null) {
      _result.fansLabel = fansLabel;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (giftImage != null) {
      _result.giftImage = giftImage;
    }
    if (icongray != null) {
      _result.icongray = icongray;
    }
    if (money != null) {
      _result.money = money;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (rname != null) {
      _result.rname = rname;
    }
    if (toname != null) {
      _result.toname = toname;
    }
    if (tovip != null) {
      _result.tovip = tovip;
    }
    if (type != null) {
      _result.type = type;
    }
    if (uicon != null) {
      _result.uicon = uicon;
    }
    if (uname != null) {
      _result.uname = uname;
    }
    if (utitle != null) {
      _result.utitle = utitle;
    }
    if (utitleNew != null) {
      _result.utitleNew = utitleNew;
    }
    if (uvip != null) {
      _result.uvip = uvip;
    }
    if (word != null) {
      _result.word = word;
    }
    return _result;
  }
  factory RoomAchievementNotice.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomAchievementNotice.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomAchievementNotice clone() =>
      RoomAchievementNotice()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomAchievementNotice copyWith(
          void Function(RoomAchievementNotice) updates) =>
      super.copyWith((message) => updates(message as RoomAchievementNotice))
          as RoomAchievementNotice; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomAchievementNotice create() => RoomAchievementNotice._();
  RoomAchievementNotice createEmptyInstance() => create();
  static $pb.PbList<RoomAchievementNotice> createRepeated() =>
      $pb.PbList<RoomAchievementNotice>();
  @$core.pragma('dart2js:noInline')
  static RoomAchievementNotice getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomAchievementNotice>(create);
  static RoomAchievementNotice? _defaultInstance;

  @$pb.TagNumber(1)
  RoomAchievementNotice_FansLabel get fansLabel => $_getN(0);
  @$pb.TagNumber(1)
  set fansLabel(RoomAchievementNotice_FansLabel v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFansLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearFansLabel() => clearField(1);
  @$pb.TagNumber(1)
  RoomAchievementNotice_FansLabel ensureFansLabel() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get frame => $_getSZ(1);
  @$pb.TagNumber(2)
  set frame($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFrame() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrame() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get giftImage => $_getSZ(2);
  @$pb.TagNumber(3)
  set giftImage($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGiftImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftImage() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get icongray => $_getBF(3);
  @$pb.TagNumber(4)
  set icongray($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIcongray() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcongray() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get money => $_getIZ(4);
  @$pb.TagNumber(5)
  set money($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMoney() => $_has(4);
  @$pb.TagNumber(5)
  void clearMoney() => clearField(5);

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
  $core.String get rname => $_getSZ(6);
  @$pb.TagNumber(7)
  set rname($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRname() => $_has(6);
  @$pb.TagNumber(7)
  void clearRname() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get toname => $_getSZ(7);
  @$pb.TagNumber(8)
  set toname($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasToname() => $_has(7);
  @$pb.TagNumber(8)
  void clearToname() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get tovip => $_getIZ(8);
  @$pb.TagNumber(9)
  set tovip($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTovip() => $_has(8);
  @$pb.TagNumber(9)
  void clearTovip() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get type => $_getSZ(9);
  @$pb.TagNumber(10)
  set type($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasType() => $_has(9);
  @$pb.TagNumber(10)
  void clearType() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get uicon => $_getSZ(10);
  @$pb.TagNumber(11)
  set uicon($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasUicon() => $_has(10);
  @$pb.TagNumber(11)
  void clearUicon() => clearField(11);

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
  $core.int get utitle => $_getIZ(12);
  @$pb.TagNumber(13)
  set utitle($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasUtitle() => $_has(12);
  @$pb.TagNumber(13)
  void clearUtitle() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get utitleNew => $_getIZ(13);
  @$pb.TagNumber(14)
  set utitleNew($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasUtitleNew() => $_has(13);
  @$pb.TagNumber(14)
  void clearUtitleNew() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get uvip => $_getIZ(14);
  @$pb.TagNumber(15)
  set uvip($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasUvip() => $_has(14);
  @$pb.TagNumber(15)
  void clearUvip() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get word => $_getSZ(15);
  @$pb.TagNumber(16)
  set word($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasWord() => $_has(15);
  @$pb.TagNumber(16)
  void clearWord() => clearField(16);
}
