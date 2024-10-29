///
//  Generated code. Do not modify.
//  source: room_list.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class RoomTypeName extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomTypeName',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..pPS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bg')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'acuteIcon')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'partyStyle',
        $pb.PbFieldType.O3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'abstractIcon')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagColor')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagIcon')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeIcon')
    ..pPS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeBg')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bottomIcon')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bottomRecommendText')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cornerIcon')
    ..pPS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagBgColor')
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomText')
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomDecorate')
    ..hasRequiredFields = false;

  RoomTypeName._() : super();
  factory RoomTypeName({
    $core.String? show,
    $core.String? label,
    $core.Iterable<$core.String>? bg,
    $core.String? acuteIcon,
    $core.int? partyStyle,
    $core.String? abstractIcon,
    $core.String? tagColor,
    $core.String? tagIcon,
    $core.String? typeIcon,
    $core.Iterable<$core.String>? typeBg,
    $core.String? bottomIcon,
    $core.String? bottomRecommendText,
    $core.String? cornerIcon,
    $core.Iterable<$core.String>? tagBgColor,
    $core.String? roomText,
    $core.String? roomDecorate,
  }) {
    final _result = create();
    if (show != null) {
      _result.show = show;
    }
    if (label != null) {
      _result.label = label;
    }
    if (bg != null) {
      _result.bg.addAll(bg);
    }
    if (acuteIcon != null) {
      _result.acuteIcon = acuteIcon;
    }
    if (partyStyle != null) {
      _result.partyStyle = partyStyle;
    }
    if (abstractIcon != null) {
      _result.abstractIcon = abstractIcon;
    }
    if (tagColor != null) {
      _result.tagColor = tagColor;
    }
    if (tagIcon != null) {
      _result.tagIcon = tagIcon;
    }
    if (typeIcon != null) {
      _result.typeIcon = typeIcon;
    }
    if (typeBg != null) {
      _result.typeBg.addAll(typeBg);
    }
    if (bottomIcon != null) {
      _result.bottomIcon = bottomIcon;
    }
    if (bottomRecommendText != null) {
      _result.bottomRecommendText = bottomRecommendText;
    }
    if (cornerIcon != null) {
      _result.cornerIcon = cornerIcon;
    }
    if (tagBgColor != null) {
      _result.tagBgColor.addAll(tagBgColor);
    }
    if (roomText != null) {
      _result.roomText = roomText;
    }
    if (roomDecorate != null) {
      _result.roomDecorate = roomDecorate;
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
  $core.String get show => $_getSZ(0);
  @$pb.TagNumber(1)
  set show($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShow() => $_has(0);
  @$pb.TagNumber(1)
  void clearShow() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get label => $_getSZ(1);
  @$pb.TagNumber(2)
  set label($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLabel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLabel() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get bg => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get acuteIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set acuteIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAcuteIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearAcuteIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get partyStyle => $_getIZ(4);
  @$pb.TagNumber(5)
  set partyStyle($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPartyStyle() => $_has(4);
  @$pb.TagNumber(5)
  void clearPartyStyle() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get abstractIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set abstractIcon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAbstractIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearAbstractIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get tagColor => $_getSZ(6);
  @$pb.TagNumber(7)
  set tagColor($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTagColor() => $_has(6);
  @$pb.TagNumber(7)
  void clearTagColor() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get tagIcon => $_getSZ(7);
  @$pb.TagNumber(8)
  set tagIcon($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTagIcon() => $_has(7);
  @$pb.TagNumber(8)
  void clearTagIcon() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get typeIcon => $_getSZ(8);
  @$pb.TagNumber(9)
  set typeIcon($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTypeIcon() => $_has(8);
  @$pb.TagNumber(9)
  void clearTypeIcon() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.String> get typeBg => $_getList(9);

  @$pb.TagNumber(11)
  $core.String get bottomIcon => $_getSZ(10);
  @$pb.TagNumber(11)
  set bottomIcon($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasBottomIcon() => $_has(10);
  @$pb.TagNumber(11)
  void clearBottomIcon() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get bottomRecommendText => $_getSZ(11);
  @$pb.TagNumber(12)
  set bottomRecommendText($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasBottomRecommendText() => $_has(11);
  @$pb.TagNumber(12)
  void clearBottomRecommendText() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get cornerIcon => $_getSZ(12);
  @$pb.TagNumber(13)
  set cornerIcon($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasCornerIcon() => $_has(12);
  @$pb.TagNumber(13)
  void clearCornerIcon() => clearField(13);

  @$pb.TagNumber(14)
  $core.List<$core.String> get tagBgColor => $_getList(13);

  @$pb.TagNumber(15)
  $core.String get roomText => $_getSZ(14);
  @$pb.TagNumber(15)
  set roomText($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasRoomText() => $_has(14);
  @$pb.TagNumber(15)
  void clearRoomText() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get roomDecorate => $_getSZ(15);
  @$pb.TagNumber(16)
  set roomDecorate($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasRoomDecorate() => $_has(15);
  @$pb.TagNumber(16)
  void clearRoomDecorate() => clearField(16);
}

class RoomItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'property')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'types')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numBoy',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numGirl',
        $pb.PbFieldType.O3)
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uname')
    ..aOM<RoomTypeName>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeName',
        protoName: 'typeName',
        subBuilder: RoomTypeName.create)
    ..a<$core.int>(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gameStatus',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'patternStyle',
        $pb.PbFieldType.O3)
    ..pPS(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'micIcons')
    ..a<$core.int>(
        40,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hotNum',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RoomItem._() : super();
  factory RoomItem({
    $core.int? rid,
    $core.int? uid,
    $core.String? name,
    $core.String? type,
    $core.String? property,
    $core.String? types,
    $core.String? icon,
    $core.int? numBoy,
    $core.int? numGirl,
    $core.String? uname,
    RoomTypeName? typeName,
    $core.int? sex,
    $core.int? gameStatus,
    $core.int? patternStyle,
    $core.Iterable<$core.String>? micIcons,
    $core.int? hotNum,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (type != null) {
      _result.type = type;
    }
    if (property != null) {
      _result.property = property;
    }
    if (types != null) {
      _result.types = types;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (numBoy != null) {
      _result.numBoy = numBoy;
    }
    if (numGirl != null) {
      _result.numGirl = numGirl;
    }
    if (uname != null) {
      _result.uname = uname;
    }
    if (typeName != null) {
      _result.typeName = typeName;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (gameStatus != null) {
      _result.gameStatus = gameStatus;
    }
    if (patternStyle != null) {
      _result.patternStyle = patternStyle;
    }
    if (micIcons != null) {
      _result.micIcons.addAll(micIcons);
    }
    if (hotNum != null) {
      _result.hotNum = hotNum;
    }
    return _result;
  }
  factory RoomItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomItem clone() => RoomItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomItem copyWith(void Function(RoomItem) updates) =>
      super.copyWith((message) => updates(message as RoomItem))
          as RoomItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomItem create() => RoomItem._();
  RoomItem createEmptyInstance() => create();
  static $pb.PbList<RoomItem> createRepeated() => $pb.PbList<RoomItem>();
  @$core.pragma('dart2js:noInline')
  static RoomItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomItem>(create);
  static RoomItem? _defaultInstance;

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
  $core.int get uid => $_getIZ(1);
  @$pb.TagNumber(2)
  set uid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);

  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(5)
  set name($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(6)
  set type($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get property => $_getSZ(4);
  @$pb.TagNumber(7)
  set property($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasProperty() => $_has(4);
  @$pb.TagNumber(7)
  void clearProperty() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get types => $_getSZ(5);
  @$pb.TagNumber(8)
  set types($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTypes() => $_has(5);
  @$pb.TagNumber(8)
  void clearTypes() => clearField(8);

  @$pb.TagNumber(10)
  $core.String get icon => $_getSZ(6);
  @$pb.TagNumber(10)
  set icon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasIcon() => $_has(6);
  @$pb.TagNumber(10)
  void clearIcon() => clearField(10);

  @$pb.TagNumber(16)
  $core.int get numBoy => $_getIZ(7);
  @$pb.TagNumber(16)
  set numBoy($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasNumBoy() => $_has(7);
  @$pb.TagNumber(16)
  void clearNumBoy() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get numGirl => $_getIZ(8);
  @$pb.TagNumber(17)
  set numGirl($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasNumGirl() => $_has(8);
  @$pb.TagNumber(17)
  void clearNumGirl() => clearField(17);

  @$pb.TagNumber(19)
  $core.String get uname => $_getSZ(9);
  @$pb.TagNumber(19)
  set uname($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasUname() => $_has(9);
  @$pb.TagNumber(19)
  void clearUname() => clearField(19);

  @$pb.TagNumber(22)
  RoomTypeName get typeName => $_getN(10);
  @$pb.TagNumber(22)
  set typeName(RoomTypeName v) {
    setField(22, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasTypeName() => $_has(10);
  @$pb.TagNumber(22)
  void clearTypeName() => clearField(22);
  @$pb.TagNumber(22)
  RoomTypeName ensureTypeName() => $_ensure(10);

  @$pb.TagNumber(29)
  $core.int get sex => $_getIZ(11);
  @$pb.TagNumber(29)
  set sex($core.int v) {
    $_setSignedInt32(11, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasSex() => $_has(11);
  @$pb.TagNumber(29)
  void clearSex() => clearField(29);

  @$pb.TagNumber(36)
  $core.int get gameStatus => $_getIZ(12);
  @$pb.TagNumber(36)
  set gameStatus($core.int v) {
    $_setSignedInt32(12, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasGameStatus() => $_has(12);
  @$pb.TagNumber(36)
  void clearGameStatus() => clearField(36);

  @$pb.TagNumber(37)
  $core.int get patternStyle => $_getIZ(13);
  @$pb.TagNumber(37)
  set patternStyle($core.int v) {
    $_setSignedInt32(13, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasPatternStyle() => $_has(13);
  @$pb.TagNumber(37)
  void clearPatternStyle() => clearField(37);

  @$pb.TagNumber(39)
  $core.List<$core.String> get micIcons => $_getList(14);

  @$pb.TagNumber(40)
  $core.int get hotNum => $_getIZ(15);
  @$pb.TagNumber(40)
  set hotNum($core.int v) {
    $_setSignedInt32(15, v);
  }

  @$pb.TagNumber(40)
  $core.bool hasHotNum() => $_has(15);
  @$pb.TagNumber(40)
  void clearHotNum() => clearField(40);
}

class RoomListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomListData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'page',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more',
        $pb.PbFieldType.O3)
    ..pc<RoomItem>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: RoomItem.create)
    ..hasRequiredFields = false;

  RoomListData._() : super();
  factory RoomListData({
    $core.int? page,
    $core.int? more,
    $core.Iterable<RoomItem>? list,
  }) {
    final _result = create();
    if (page != null) {
      _result.page = page;
    }
    if (more != null) {
      _result.more = more;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory RoomListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomListData clone() => RoomListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomListData copyWith(void Function(RoomListData) updates) =>
      super.copyWith((message) => updates(message as RoomListData))
          as RoomListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomListData create() => RoomListData._();
  RoomListData createEmptyInstance() => create();
  static $pb.PbList<RoomListData> createRepeated() =>
      $pb.PbList<RoomListData>();
  @$core.pragma('dart2js:noInline')
  static RoomListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomListData>(create);
  static RoomListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get page => $_getIZ(0);
  @$pb.TagNumber(1)
  set page($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get more => $_getIZ(1);
  @$pb.TagNumber(2)
  set more($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearMore() => clearField(2);

  @$pb.TagNumber(5)
  $core.List<RoomItem> get list => $_getList(2);
}

class ResRoomList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
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
    ..aOM<RoomListData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomListData.create)
    ..hasRequiredFields = false;

  ResRoomList._() : super();
  factory ResRoomList({
    $core.bool? success,
    $core.String? msg,
    RoomListData? data,
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
  factory ResRoomList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomList clone() => ResRoomList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomList copyWith(void Function(ResRoomList) updates) =>
      super.copyWith((message) => updates(message as ResRoomList))
          as ResRoomList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomList create() => ResRoomList._();
  ResRoomList createEmptyInstance() => create();
  static $pb.PbList<ResRoomList> createRepeated() => $pb.PbList<ResRoomList>();
  @$core.pragma('dart2js:noInline')
  static ResRoomList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomList>(create);
  static ResRoomList? _defaultInstance;

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
  RoomListData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomListData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomListData ensureData() => $_ensure(2);
}

class RoomGuideIdleUserData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomGuideIdleUserData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomName')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomNum',
        $pb.PbFieldType.OU3)
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
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomGuideIdleUserData._() : super();
  factory RoomGuideIdleUserData({
    $core.int? rid,
    $core.String? roomName,
    $core.int? roomNum,
    $core.String? name,
    $core.String? icon,
    $core.int? age,
    $core.int? sex,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (roomName != null) {
      _result.roomName = roomName;
    }
    if (roomNum != null) {
      _result.roomNum = roomNum;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (age != null) {
      _result.age = age;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    return _result;
  }
  factory RoomGuideIdleUserData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomGuideIdleUserData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomGuideIdleUserData clone() =>
      RoomGuideIdleUserData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomGuideIdleUserData copyWith(
          void Function(RoomGuideIdleUserData) updates) =>
      super.copyWith((message) => updates(message as RoomGuideIdleUserData))
          as RoomGuideIdleUserData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomGuideIdleUserData create() => RoomGuideIdleUserData._();
  RoomGuideIdleUserData createEmptyInstance() => create();
  static $pb.PbList<RoomGuideIdleUserData> createRepeated() =>
      $pb.PbList<RoomGuideIdleUserData>();
  @$core.pragma('dart2js:noInline')
  static RoomGuideIdleUserData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomGuideIdleUserData>(create);
  static RoomGuideIdleUserData? _defaultInstance;

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
  $core.String get roomName => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRoomName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get roomNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set roomNum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRoomNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomNum() => clearField(3);

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
  $core.int get age => $_getIZ(5);
  @$pb.TagNumber(6)
  set age($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAge() => $_has(5);
  @$pb.TagNumber(6)
  void clearAge() => clearField(6);

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
}

class ResRoomGuideIdleUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomGuideIdleUser',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
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
    ..aOM<RoomGuideIdleUserData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomGuideIdleUserData.create)
    ..hasRequiredFields = false;

  ResRoomGuideIdleUser._() : super();
  factory ResRoomGuideIdleUser({
    $core.bool? success,
    $core.String? msg,
    RoomGuideIdleUserData? data,
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
  factory ResRoomGuideIdleUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomGuideIdleUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomGuideIdleUser clone() =>
      ResRoomGuideIdleUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomGuideIdleUser copyWith(void Function(ResRoomGuideIdleUser) updates) =>
      super.copyWith((message) => updates(message as ResRoomGuideIdleUser))
          as ResRoomGuideIdleUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomGuideIdleUser create() => ResRoomGuideIdleUser._();
  ResRoomGuideIdleUser createEmptyInstance() => create();
  static $pb.PbList<ResRoomGuideIdleUser> createRepeated() =>
      $pb.PbList<ResRoomGuideIdleUser>();
  @$core.pragma('dart2js:noInline')
  static ResRoomGuideIdleUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomGuideIdleUser>(create);
  static ResRoomGuideIdleUser? _defaultInstance;

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
  RoomGuideIdleUserData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomGuideIdleUserData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomGuideIdleUserData ensureData() => $_ensure(2);
}

class ResRoomPkUserData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPkUserData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'supportName')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'support',
        $pb.PbFieldType.OU3)
    ..aInt64(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'blueScore')
    ..aInt64(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'redScore')
    ..pc<PkText>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tips',
        $pb.PbFieldType.PM,
        subBuilder: PkText.create)
    ..hasRequiredFields = false;

  ResRoomPkUserData._() : super();
  factory ResRoomPkUserData({
    $core.String? supportName,
    $core.int? support,
    $fixnum.Int64? blueScore,
    $fixnum.Int64? redScore,
    $core.Iterable<PkText>? tips,
  }) {
    final _result = create();
    if (supportName != null) {
      _result.supportName = supportName;
    }
    if (support != null) {
      _result.support = support;
    }
    if (blueScore != null) {
      _result.blueScore = blueScore;
    }
    if (redScore != null) {
      _result.redScore = redScore;
    }
    if (tips != null) {
      _result.tips.addAll(tips);
    }
    return _result;
  }
  factory ResRoomPkUserData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPkUserData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPkUserData clone() => ResRoomPkUserData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPkUserData copyWith(void Function(ResRoomPkUserData) updates) =>
      super.copyWith((message) => updates(message as ResRoomPkUserData))
          as ResRoomPkUserData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPkUserData create() => ResRoomPkUserData._();
  ResRoomPkUserData createEmptyInstance() => create();
  static $pb.PbList<ResRoomPkUserData> createRepeated() =>
      $pb.PbList<ResRoomPkUserData>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPkUserData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPkUserData>(create);
  static ResRoomPkUserData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get supportName => $_getSZ(0);
  @$pb.TagNumber(1)
  set supportName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSupportName() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupportName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get support => $_getIZ(1);
  @$pb.TagNumber(2)
  set support($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSupport() => $_has(1);
  @$pb.TagNumber(2)
  void clearSupport() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get blueScore => $_getI64(2);
  @$pb.TagNumber(3)
  set blueScore($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBlueScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearBlueScore() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get redScore => $_getI64(3);
  @$pb.TagNumber(4)
  set redScore($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRedScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearRedScore() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<PkText> get tips => $_getList(4);
}

class PkText extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PkText',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tipTxt')
    ..pPS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'highlight')
    ..hasRequiredFields = false;

  PkText._() : super();
  factory PkText({
    $core.String? tipTxt,
    $core.Iterable<$core.String>? highlight,
  }) {
    final _result = create();
    if (tipTxt != null) {
      _result.tipTxt = tipTxt;
    }
    if (highlight != null) {
      _result.highlight.addAll(highlight);
    }
    return _result;
  }
  factory PkText.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PkText.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PkText clone() => PkText()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PkText copyWith(void Function(PkText) updates) =>
      super.copyWith((message) => updates(message as PkText))
          as PkText; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PkText create() => PkText._();
  PkText createEmptyInstance() => create();
  static $pb.PbList<PkText> createRepeated() => $pb.PbList<PkText>();
  @$core.pragma('dart2js:noInline')
  static PkText getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PkText>(create);
  static PkText? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tipTxt => $_getSZ(0);
  @$pb.TagNumber(1)
  set tipTxt($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTipTxt() => $_has(0);
  @$pb.TagNumber(1)
  void clearTipTxt() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get highlight => $_getList(1);
}

class ResRoomPkUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPkUser',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
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
    ..aOM<ResRoomPkUserData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ResRoomPkUserData.create)
    ..hasRequiredFields = false;

  ResRoomPkUser._() : super();
  factory ResRoomPkUser({
    $core.bool? success,
    $core.String? msg,
    ResRoomPkUserData? data,
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
  factory ResRoomPkUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPkUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPkUser clone() => ResRoomPkUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPkUser copyWith(void Function(ResRoomPkUser) updates) =>
      super.copyWith((message) => updates(message as ResRoomPkUser))
          as ResRoomPkUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPkUser create() => ResRoomPkUser._();
  ResRoomPkUser createEmptyInstance() => create();
  static $pb.PbList<ResRoomPkUser> createRepeated() =>
      $pb.PbList<ResRoomPkUser>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPkUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPkUser>(create);
  static ResRoomPkUser? _defaultInstance;

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
  ResRoomPkUserData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ResRoomPkUserData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ResRoomPkUserData ensureData() => $_ensure(2);
}

class ResRoomPkRoomData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPkRoomData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
      createEmptyInstance: create)
    ..aInt64(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deadline')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainRid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestRid',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainIcon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainName')
    ..aInt64(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainScore')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestIcon')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestName')
    ..aInt64(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestScore')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainMvpUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestMvpUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainMvpName')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestMvpName')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mainMvpIcon')
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'guestMvpIcon')
    ..hasRequiredFields = false;

  ResRoomPkRoomData._() : super();
  factory ResRoomPkRoomData({
    $fixnum.Int64? deadline,
    $core.int? mainRid,
    $core.int? guestRid,
    $core.String? mainIcon,
    $core.String? mainName,
    $fixnum.Int64? mainScore,
    $core.String? guestIcon,
    $core.String? guestName,
    $fixnum.Int64? guestScore,
    $core.int? mainMvpUid,
    $core.int? guestMvpUid,
    $core.String? mainMvpName,
    $core.String? guestMvpName,
    $core.String? mainMvpIcon,
    $core.String? guestMvpIcon,
  }) {
    final _result = create();
    if (deadline != null) {
      _result.deadline = deadline;
    }
    if (mainRid != null) {
      _result.mainRid = mainRid;
    }
    if (guestRid != null) {
      _result.guestRid = guestRid;
    }
    if (mainIcon != null) {
      _result.mainIcon = mainIcon;
    }
    if (mainName != null) {
      _result.mainName = mainName;
    }
    if (mainScore != null) {
      _result.mainScore = mainScore;
    }
    if (guestIcon != null) {
      _result.guestIcon = guestIcon;
    }
    if (guestName != null) {
      _result.guestName = guestName;
    }
    if (guestScore != null) {
      _result.guestScore = guestScore;
    }
    if (mainMvpUid != null) {
      _result.mainMvpUid = mainMvpUid;
    }
    if (guestMvpUid != null) {
      _result.guestMvpUid = guestMvpUid;
    }
    if (mainMvpName != null) {
      _result.mainMvpName = mainMvpName;
    }
    if (guestMvpName != null) {
      _result.guestMvpName = guestMvpName;
    }
    if (mainMvpIcon != null) {
      _result.mainMvpIcon = mainMvpIcon;
    }
    if (guestMvpIcon != null) {
      _result.guestMvpIcon = guestMvpIcon;
    }
    return _result;
  }
  factory ResRoomPkRoomData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPkRoomData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPkRoomData clone() => ResRoomPkRoomData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPkRoomData copyWith(void Function(ResRoomPkRoomData) updates) =>
      super.copyWith((message) => updates(message as ResRoomPkRoomData))
          as ResRoomPkRoomData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPkRoomData create() => ResRoomPkRoomData._();
  ResRoomPkRoomData createEmptyInstance() => create();
  static $pb.PbList<ResRoomPkRoomData> createRepeated() =>
      $pb.PbList<ResRoomPkRoomData>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPkRoomData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPkRoomData>(create);
  static ResRoomPkRoomData? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get deadline => $_getI64(0);
  @$pb.TagNumber(1)
  set deadline($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDeadline() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeadline() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get mainRid => $_getIZ(1);
  @$pb.TagNumber(2)
  set mainRid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMainRid() => $_has(1);
  @$pb.TagNumber(2)
  void clearMainRid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get guestRid => $_getIZ(2);
  @$pb.TagNumber(3)
  set guestRid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGuestRid() => $_has(2);
  @$pb.TagNumber(3)
  void clearGuestRid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get mainIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set mainIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMainIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearMainIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get mainName => $_getSZ(4);
  @$pb.TagNumber(5)
  set mainName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMainName() => $_has(4);
  @$pb.TagNumber(5)
  void clearMainName() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get mainScore => $_getI64(5);
  @$pb.TagNumber(6)
  set mainScore($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMainScore() => $_has(5);
  @$pb.TagNumber(6)
  void clearMainScore() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get guestIcon => $_getSZ(6);
  @$pb.TagNumber(7)
  set guestIcon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGuestIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearGuestIcon() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get guestName => $_getSZ(7);
  @$pb.TagNumber(8)
  set guestName($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasGuestName() => $_has(7);
  @$pb.TagNumber(8)
  void clearGuestName() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get guestScore => $_getI64(8);
  @$pb.TagNumber(9)
  set guestScore($fixnum.Int64 v) {
    $_setInt64(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasGuestScore() => $_has(8);
  @$pb.TagNumber(9)
  void clearGuestScore() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get mainMvpUid => $_getIZ(9);
  @$pb.TagNumber(10)
  set mainMvpUid($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasMainMvpUid() => $_has(9);
  @$pb.TagNumber(10)
  void clearMainMvpUid() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get guestMvpUid => $_getIZ(10);
  @$pb.TagNumber(11)
  set guestMvpUid($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasGuestMvpUid() => $_has(10);
  @$pb.TagNumber(11)
  void clearGuestMvpUid() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get mainMvpName => $_getSZ(11);
  @$pb.TagNumber(12)
  set mainMvpName($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasMainMvpName() => $_has(11);
  @$pb.TagNumber(12)
  void clearMainMvpName() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get guestMvpName => $_getSZ(12);
  @$pb.TagNumber(13)
  set guestMvpName($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasGuestMvpName() => $_has(12);
  @$pb.TagNumber(13)
  void clearGuestMvpName() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get mainMvpIcon => $_getSZ(13);
  @$pb.TagNumber(14)
  set mainMvpIcon($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasMainMvpIcon() => $_has(13);
  @$pb.TagNumber(14)
  void clearMainMvpIcon() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get guestMvpIcon => $_getSZ(14);
  @$pb.TagNumber(15)
  set guestMvpIcon($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasGuestMvpIcon() => $_has(14);
  @$pb.TagNumber(15)
  void clearGuestMvpIcon() => clearField(15);
}

class ResPkRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResPkRoom',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
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
    ..aOM<ResRoomPkRoomData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ResRoomPkRoomData.create)
    ..hasRequiredFields = false;

  ResPkRoom._() : super();
  factory ResPkRoom({
    $core.bool? success,
    $core.String? msg,
    ResRoomPkRoomData? data,
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
  factory ResPkRoom.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResPkRoom.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResPkRoom clone() => ResPkRoom()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResPkRoom copyWith(void Function(ResPkRoom) updates) =>
      super.copyWith((message) => updates(message as ResPkRoom))
          as ResPkRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResPkRoom create() => ResPkRoom._();
  ResPkRoom createEmptyInstance() => create();
  static $pb.PbList<ResPkRoom> createRepeated() => $pb.PbList<ResPkRoom>();
  @$core.pragma('dart2js:noInline')
  static ResPkRoom getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResPkRoom>(create);
  static ResPkRoom? _defaultInstance;

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
  ResRoomPkRoomData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ResRoomPkRoomData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ResRoomPkRoomData ensureData() => $_ensure(2);
}

class ResRoomConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
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
    ..aOM<RoomConfigEncounter>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomConfigEncounter.create)
    ..hasRequiredFields = false;

  ResRoomConfig._() : super();
  factory ResRoomConfig({
    $core.bool? success,
    $core.String? msg,
    RoomConfigEncounter? data,
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
  factory ResRoomConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomConfig clone() => ResRoomConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomConfig copyWith(void Function(ResRoomConfig) updates) =>
      super.copyWith((message) => updates(message as ResRoomConfig))
          as ResRoomConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomConfig create() => ResRoomConfig._();
  ResRoomConfig createEmptyInstance() => create();
  static $pb.PbList<ResRoomConfig> createRepeated() =>
      $pb.PbList<ResRoomConfig>();
  @$core.pragma('dart2js:noInline')
  static ResRoomConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomConfig>(create);
  static ResRoomConfig? _defaultInstance;

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
  RoomConfigEncounter get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomConfigEncounter v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomConfigEncounter ensureData() => $_ensure(2);
}

class RoomConfigEncounter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomConfigEncounter',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titlePic')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bgPlanet')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bgLove')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'countdown',
        $pb.PbFieldType.OU3)
    ..pPS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomTip')
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'follow')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sbanner')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payAmount',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showBanner',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'encounterState',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'encounterId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'encounterRole',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'actionType',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'thirdId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomConfigEncounter._() : super();
  factory RoomConfigEncounter({
    $core.String? titlePic,
    $core.String? bgPlanet,
    $core.String? bgLove,
    $core.int? countdown,
    $core.Iterable<$core.String>? roomTip,
    $core.bool? follow,
    $core.String? title,
    $core.String? sbanner,
    $core.int? payAmount,
    $core.int? showBanner,
    $core.int? encounterState,
    $core.int? encounterId,
    $core.int? encounterRole,
    $core.int? actionType,
    $core.int? thirdId,
  }) {
    final _result = create();
    if (titlePic != null) {
      _result.titlePic = titlePic;
    }
    if (bgPlanet != null) {
      _result.bgPlanet = bgPlanet;
    }
    if (bgLove != null) {
      _result.bgLove = bgLove;
    }
    if (countdown != null) {
      _result.countdown = countdown;
    }
    if (roomTip != null) {
      _result.roomTip.addAll(roomTip);
    }
    if (follow != null) {
      _result.follow = follow;
    }
    if (title != null) {
      _result.title = title;
    }
    if (sbanner != null) {
      _result.sbanner = sbanner;
    }
    if (payAmount != null) {
      _result.payAmount = payAmount;
    }
    if (showBanner != null) {
      _result.showBanner = showBanner;
    }
    if (encounterState != null) {
      _result.encounterState = encounterState;
    }
    if (encounterId != null) {
      _result.encounterId = encounterId;
    }
    if (encounterRole != null) {
      _result.encounterRole = encounterRole;
    }
    if (actionType != null) {
      _result.actionType = actionType;
    }
    if (thirdId != null) {
      _result.thirdId = thirdId;
    }
    return _result;
  }
  factory RoomConfigEncounter.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomConfigEncounter.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomConfigEncounter clone() => RoomConfigEncounter()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomConfigEncounter copyWith(void Function(RoomConfigEncounter) updates) =>
      super.copyWith((message) => updates(message as RoomConfigEncounter))
          as RoomConfigEncounter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomConfigEncounter create() => RoomConfigEncounter._();
  RoomConfigEncounter createEmptyInstance() => create();
  static $pb.PbList<RoomConfigEncounter> createRepeated() =>
      $pb.PbList<RoomConfigEncounter>();
  @$core.pragma('dart2js:noInline')
  static RoomConfigEncounter getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomConfigEncounter>(create);
  static RoomConfigEncounter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get titlePic => $_getSZ(0);
  @$pb.TagNumber(1)
  set titlePic($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitlePic() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitlePic() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get bgPlanet => $_getSZ(1);
  @$pb.TagNumber(2)
  set bgPlanet($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBgPlanet() => $_has(1);
  @$pb.TagNumber(2)
  void clearBgPlanet() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get bgLove => $_getSZ(2);
  @$pb.TagNumber(3)
  set bgLove($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBgLove() => $_has(2);
  @$pb.TagNumber(3)
  void clearBgLove() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get countdown => $_getIZ(3);
  @$pb.TagNumber(4)
  set countdown($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCountdown() => $_has(3);
  @$pb.TagNumber(4)
  void clearCountdown() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get roomTip => $_getList(4);

  @$pb.TagNumber(6)
  $core.bool get follow => $_getBF(5);
  @$pb.TagNumber(6)
  set follow($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasFollow() => $_has(5);
  @$pb.TagNumber(6)
  void clearFollow() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get title => $_getSZ(6);
  @$pb.TagNumber(7)
  set title($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTitle() => $_has(6);
  @$pb.TagNumber(7)
  void clearTitle() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get sbanner => $_getSZ(7);
  @$pb.TagNumber(8)
  set sbanner($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSbanner() => $_has(7);
  @$pb.TagNumber(8)
  void clearSbanner() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get payAmount => $_getIZ(8);
  @$pb.TagNumber(9)
  set payAmount($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPayAmount() => $_has(8);
  @$pb.TagNumber(9)
  void clearPayAmount() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get showBanner => $_getIZ(9);
  @$pb.TagNumber(10)
  set showBanner($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasShowBanner() => $_has(9);
  @$pb.TagNumber(10)
  void clearShowBanner() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get encounterState => $_getIZ(10);
  @$pb.TagNumber(11)
  set encounterState($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasEncounterState() => $_has(10);
  @$pb.TagNumber(11)
  void clearEncounterState() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get encounterId => $_getIZ(11);
  @$pb.TagNumber(12)
  set encounterId($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasEncounterId() => $_has(11);
  @$pb.TagNumber(12)
  void clearEncounterId() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get encounterRole => $_getIZ(12);
  @$pb.TagNumber(13)
  set encounterRole($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasEncounterRole() => $_has(12);
  @$pb.TagNumber(13)
  void clearEncounterRole() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get actionType => $_getIZ(13);
  @$pb.TagNumber(14)
  set actionType($core.int v) {
    $_setSignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasActionType() => $_has(13);
  @$pb.TagNumber(14)
  void clearActionType() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get thirdId => $_getIZ(14);
  @$pb.TagNumber(15)
  set thirdId($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasThirdId() => $_has(14);
  @$pb.TagNumber(15)
  void clearThirdId() => clearField(15);
}

class ResSlideRoomData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSlideRoomData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
      createEmptyInstance: create)
    ..p<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rids',
        $pb.PbFieldType.PU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..hasRequiredFields = false;

  ResSlideRoomData._() : super();
  factory ResSlideRoomData({
    $core.Iterable<$core.int>? rids,
    $core.String? type,
  }) {
    final _result = create();
    if (rids != null) {
      _result.rids.addAll(rids);
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory ResSlideRoomData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSlideRoomData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSlideRoomData clone() => ResSlideRoomData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSlideRoomData copyWith(void Function(ResSlideRoomData) updates) =>
      super.copyWith((message) => updates(message as ResSlideRoomData))
          as ResSlideRoomData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSlideRoomData create() => ResSlideRoomData._();
  ResSlideRoomData createEmptyInstance() => create();
  static $pb.PbList<ResSlideRoomData> createRepeated() =>
      $pb.PbList<ResSlideRoomData>();
  @$core.pragma('dart2js:noInline')
  static ResSlideRoomData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSlideRoomData>(create);
  static ResSlideRoomData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get rids => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);
}

class ResSlideRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResSlideRoom',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'matepb'),
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
    ..aOM<ResSlideRoomData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ResSlideRoomData.create)
    ..hasRequiredFields = false;

  ResSlideRoom._() : super();
  factory ResSlideRoom({
    $core.bool? success,
    $core.String? msg,
    ResSlideRoomData? data,
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
  factory ResSlideRoom.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResSlideRoom.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResSlideRoom clone() => ResSlideRoom()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResSlideRoom copyWith(void Function(ResSlideRoom) updates) =>
      super.copyWith((message) => updates(message as ResSlideRoom))
          as ResSlideRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResSlideRoom create() => ResSlideRoom._();
  ResSlideRoom createEmptyInstance() => create();
  static $pb.PbList<ResSlideRoom> createRepeated() =>
      $pb.PbList<ResSlideRoom>();
  @$core.pragma('dart2js:noInline')
  static ResSlideRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResSlideRoom>(create);
  static ResSlideRoom? _defaultInstance;

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
  ResSlideRoomData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ResSlideRoomData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ResSlideRoomData ensureData() => $_ensure(2);
}
