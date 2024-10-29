///
//  Generated code. Do not modify.
//  source: system.screen.message.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/struct.pb.dart' as $0;

class ScreenMessage_Extra_Viability extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.Viability',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mlevel',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'slevel',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  ScreenMessage_Extra_Viability._() : super();
  factory ScreenMessage_Extra_Viability({
    $core.String? title,
    $core.int? mlevel,
    $core.int? slevel,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (mlevel != null) {
      _result.mlevel = mlevel;
    }
    if (slevel != null) {
      _result.slevel = slevel;
    }
    return _result;
  }
  factory ScreenMessage_Extra_Viability.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_Viability.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Viability clone() =>
      ScreenMessage_Extra_Viability()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Viability copyWith(
          void Function(ScreenMessage_Extra_Viability) updates) =>
      super.copyWith(
              (message) => updates(message as ScreenMessage_Extra_Viability))
          as ScreenMessage_Extra_Viability; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Viability create() =>
      ScreenMessage_Extra_Viability._();
  ScreenMessage_Extra_Viability createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_Viability> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_Viability>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Viability getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra_Viability>(create);
  static ScreenMessage_Extra_Viability? _defaultInstance;

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
  $core.int get mlevel => $_getIZ(1);
  @$pb.TagNumber(2)
  set mlevel($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMlevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearMlevel() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get slevel => $_getIZ(2);
  @$pb.TagNumber(3)
  set slevel($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSlevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearSlevel() => clearField(3);
}

class ScreenMessage_Extra_WarpUserBubbleTail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.WarpUserBubbleTail',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ScreenMessage_Extra_WarpUserBubbleTail._() : super();
  factory ScreenMessage_Extra_WarpUserBubbleTail({
    $core.int? cid,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    return _result;
  }
  factory ScreenMessage_Extra_WarpUserBubbleTail.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_WarpUserBubbleTail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_WarpUserBubbleTail clone() =>
      ScreenMessage_Extra_WarpUserBubbleTail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_WarpUserBubbleTail copyWith(
          void Function(ScreenMessage_Extra_WarpUserBubbleTail) updates) =>
      super.copyWith((message) =>
              updates(message as ScreenMessage_Extra_WarpUserBubbleTail))
          as ScreenMessage_Extra_WarpUserBubbleTail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_WarpUserBubbleTail create() =>
      ScreenMessage_Extra_WarpUserBubbleTail._();
  ScreenMessage_Extra_WarpUserBubbleTail createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_WarpUserBubbleTail> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_WarpUserBubbleTail>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_WarpUserBubbleTail getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ScreenMessage_Extra_WarpUserBubbleTail>(create);
  static ScreenMessage_Extra_WarpUserBubbleTail? _defaultInstance;

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
}

class ScreenMessage_Extra_RedPacketV2 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.RedPacketV2',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
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
            : 'icon')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift_num',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rob_name')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rob_name_color')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'author_name')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'author_name_color')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'red_name')
    ..hasRequiredFields = false;

  ScreenMessage_Extra_RedPacketV2._() : super();
  factory ScreenMessage_Extra_RedPacketV2({
    $core.int? type,
    $core.String? icon,
    $core.int? giftNum,
    $core.String? robName,
    $core.String? robNameColor,
    $core.String? authorName,
    $core.String? authorNameColor,
    $core.String? redName,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (giftNum != null) {
      _result.giftNum = giftNum;
    }
    if (robName != null) {
      _result.robName = robName;
    }
    if (robNameColor != null) {
      _result.robNameColor = robNameColor;
    }
    if (authorName != null) {
      _result.authorName = authorName;
    }
    if (authorNameColor != null) {
      _result.authorNameColor = authorNameColor;
    }
    if (redName != null) {
      _result.redName = redName;
    }
    return _result;
  }
  factory ScreenMessage_Extra_RedPacketV2.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_RedPacketV2.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_RedPacketV2 clone() =>
      ScreenMessage_Extra_RedPacketV2()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_RedPacketV2 copyWith(
          void Function(ScreenMessage_Extra_RedPacketV2) updates) =>
      super.copyWith(
              (message) => updates(message as ScreenMessage_Extra_RedPacketV2))
          as ScreenMessage_Extra_RedPacketV2; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_RedPacketV2 create() =>
      ScreenMessage_Extra_RedPacketV2._();
  ScreenMessage_Extra_RedPacketV2 createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_RedPacketV2> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_RedPacketV2>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_RedPacketV2 getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra_RedPacketV2>(
          create);
  static ScreenMessage_Extra_RedPacketV2? _defaultInstance;

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
  $core.int get giftNum => $_getIZ(2);
  @$pb.TagNumber(3)
  set giftNum($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGiftNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get robName => $_getSZ(3);
  @$pb.TagNumber(4)
  set robName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRobName() => $_has(3);
  @$pb.TagNumber(4)
  void clearRobName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get robNameColor => $_getSZ(4);
  @$pb.TagNumber(5)
  set robNameColor($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRobNameColor() => $_has(4);
  @$pb.TagNumber(5)
  void clearRobNameColor() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get authorName => $_getSZ(5);
  @$pb.TagNumber(6)
  set authorName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAuthorName() => $_has(5);
  @$pb.TagNumber(6)
  void clearAuthorName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get authorNameColor => $_getSZ(6);
  @$pb.TagNumber(7)
  set authorNameColor($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasAuthorNameColor() => $_has(6);
  @$pb.TagNumber(7)
  void clearAuthorNameColor() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get redName => $_getSZ(7);
  @$pb.TagNumber(8)
  set redName($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasRedName() => $_has(7);
  @$pb.TagNumber(8)
  void clearRedName() => clearField(8);
}

class ScreenMessage_Extra_OutstandingBox extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.OutstandingBox',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'luck_level',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sender_suffix')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sender_box_tag')
    ..hasRequiredFields = false;

  ScreenMessage_Extra_OutstandingBox._() : super();
  factory ScreenMessage_Extra_OutstandingBox({
    $core.int? luckLevel,
    $core.String? senderSuffix,
    $core.String? senderBoxTag,
  }) {
    final _result = create();
    if (luckLevel != null) {
      _result.luckLevel = luckLevel;
    }
    if (senderSuffix != null) {
      _result.senderSuffix = senderSuffix;
    }
    if (senderBoxTag != null) {
      _result.senderBoxTag = senderBoxTag;
    }
    return _result;
  }
  factory ScreenMessage_Extra_OutstandingBox.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_OutstandingBox.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_OutstandingBox clone() =>
      ScreenMessage_Extra_OutstandingBox()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_OutstandingBox copyWith(
          void Function(ScreenMessage_Extra_OutstandingBox) updates) =>
      super.copyWith((message) =>
              updates(message as ScreenMessage_Extra_OutstandingBox))
          as ScreenMessage_Extra_OutstandingBox; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_OutstandingBox create() =>
      ScreenMessage_Extra_OutstandingBox._();
  ScreenMessage_Extra_OutstandingBox createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_OutstandingBox> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_OutstandingBox>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_OutstandingBox getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra_OutstandingBox>(
          create);
  static ScreenMessage_Extra_OutstandingBox? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get luckLevel => $_getIZ(0);
  @$pb.TagNumber(1)
  set luckLevel($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLuckLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLuckLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get senderSuffix => $_getSZ(1);
  @$pb.TagNumber(2)
  set senderSuffix($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSenderSuffix() => $_has(1);
  @$pb.TagNumber(2)
  void clearSenderSuffix() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get senderBoxTag => $_getSZ(2);
  @$pb.TagNumber(3)
  set senderBoxTag($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSenderBoxTag() => $_has(2);
  @$pb.TagNumber(3)
  void clearSenderBoxTag() => clearField(3);
}

class ScreenMessage_Extra_GiftFirework extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.GiftFirework',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..a<$fixnum.Int64>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'size',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aInt64(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'width')
    ..aInt64(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'height')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.O3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..hasRequiredFields = false;

  ScreenMessage_Extra_GiftFirework._() : super();
  factory ScreenMessage_Extra_GiftFirework({
    $core.String? url,
    $fixnum.Int64? size,
    $fixnum.Int64? width,
    $fixnum.Int64? height,
    $core.int? num,
    $core.String? type,
  }) {
    final _result = create();
    if (url != null) {
      _result.url = url;
    }
    if (size != null) {
      _result.size = size;
    }
    if (width != null) {
      _result.width = width;
    }
    if (height != null) {
      _result.height = height;
    }
    if (num != null) {
      _result.num = num;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory ScreenMessage_Extra_GiftFirework.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_GiftFirework.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_GiftFirework clone() =>
      ScreenMessage_Extra_GiftFirework()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_GiftFirework copyWith(
          void Function(ScreenMessage_Extra_GiftFirework) updates) =>
      super.copyWith(
              (message) => updates(message as ScreenMessage_Extra_GiftFirework))
          as ScreenMessage_Extra_GiftFirework; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_GiftFirework create() =>
      ScreenMessage_Extra_GiftFirework._();
  ScreenMessage_Extra_GiftFirework createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_GiftFirework> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_GiftFirework>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_GiftFirework getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra_GiftFirework>(
          create);
  static ScreenMessage_Extra_GiftFirework? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get size => $_getI64(1);
  @$pb.TagNumber(2)
  set size($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSize() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get width => $_getI64(2);
  @$pb.TagNumber(3)
  set width($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get height => $_getI64(3);
  @$pb.TagNumber(4)
  set height($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get num => $_getIZ(4);
  @$pb.TagNumber(5)
  set num($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get type => $_getSZ(5);
  @$pb.TagNumber(6)
  set type($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);
}

class ScreenMessage_Extra_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time_interval',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
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
            : 'msg_tail')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name_color')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg_tail_color')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bg_img')
    ..hasRequiredFields = false;

  ScreenMessage_Extra_Data._() : super();
  factory ScreenMessage_Extra_Data({
    $core.int? timeInterval,
    $core.String? type,
    $core.int? level,
    $core.String? name,
    $core.String? msgTail,
    $core.String? nameColor,
    $core.String? msgTailColor,
    $core.String? bgImg,
  }) {
    final _result = create();
    if (timeInterval != null) {
      _result.timeInterval = timeInterval;
    }
    if (type != null) {
      _result.type = type;
    }
    if (level != null) {
      _result.level = level;
    }
    if (name != null) {
      _result.name = name;
    }
    if (msgTail != null) {
      _result.msgTail = msgTail;
    }
    if (nameColor != null) {
      _result.nameColor = nameColor;
    }
    if (msgTailColor != null) {
      _result.msgTailColor = msgTailColor;
    }
    if (bgImg != null) {
      _result.bgImg = bgImg;
    }
    return _result;
  }
  factory ScreenMessage_Extra_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Data clone() =>
      ScreenMessage_Extra_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Data copyWith(
          void Function(ScreenMessage_Extra_Data) updates) =>
      super.copyWith((message) => updates(message as ScreenMessage_Extra_Data))
          as ScreenMessage_Extra_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Data create() => ScreenMessage_Extra_Data._();
  ScreenMessage_Extra_Data createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_Data> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_Data>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra_Data>(create);
  static ScreenMessage_Extra_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get timeInterval => $_getIZ(0);
  @$pb.TagNumber(1)
  set timeInterval($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTimeInterval() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimeInterval() => clearField(1);

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
  $core.String get msgTail => $_getSZ(4);
  @$pb.TagNumber(5)
  set msgTail($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMsgTail() => $_has(4);
  @$pb.TagNumber(5)
  void clearMsgTail() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get nameColor => $_getSZ(5);
  @$pb.TagNumber(6)
  set nameColor($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasNameColor() => $_has(5);
  @$pb.TagNumber(6)
  void clearNameColor() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get msgTailColor => $_getSZ(6);
  @$pb.TagNumber(7)
  set msgTailColor($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMsgTailColor() => $_has(6);
  @$pb.TagNumber(7)
  void clearMsgTailColor() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get bgImg => $_getSZ(7);
  @$pb.TagNumber(8)
  set bgImg($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasBgImg() => $_has(7);
  @$pb.TagNumber(8)
  void clearBgImg() => clearField(8);
}

class ScreenMessage_Extra_At extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.At',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
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
    ..hasRequiredFields = false;

  ScreenMessage_Extra_At._() : super();
  factory ScreenMessage_Extra_At({
    $core.int? uid,
    $core.String? name,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory ScreenMessage_Extra_At.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_At.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_At clone() =>
      ScreenMessage_Extra_At()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_At copyWith(
          void Function(ScreenMessage_Extra_At) updates) =>
      super.copyWith((message) => updates(message as ScreenMessage_Extra_At))
          as ScreenMessage_Extra_At; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_At create() => ScreenMessage_Extra_At._();
  ScreenMessage_Extra_At createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_At> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_At>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_At getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra_At>(create);
  static ScreenMessage_Extra_At? _defaultInstance;

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
}

class ScreenMessage_Extra_Truth_Question extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.Truth.Question',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
      createEmptyInstance: create)
    ..pPS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'answers')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex')
    ..hasRequiredFields = false;

  ScreenMessage_Extra_Truth_Question._() : super();
  factory ScreenMessage_Extra_Truth_Question({
    $core.Iterable<$core.String>? answers,
    $core.String? id,
    $core.String? content,
    $core.String? type,
    $core.String? dateline,
    $core.String? sex,
  }) {
    final _result = create();
    if (answers != null) {
      _result.answers.addAll(answers);
    }
    if (id != null) {
      _result.id = id;
    }
    if (content != null) {
      _result.content = content;
    }
    if (type != null) {
      _result.type = type;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    return _result;
  }
  factory ScreenMessage_Extra_Truth_Question.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_Truth_Question.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Truth_Question clone() =>
      ScreenMessage_Extra_Truth_Question()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Truth_Question copyWith(
          void Function(ScreenMessage_Extra_Truth_Question) updates) =>
      super.copyWith((message) =>
              updates(message as ScreenMessage_Extra_Truth_Question))
          as ScreenMessage_Extra_Truth_Question; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Truth_Question create() =>
      ScreenMessage_Extra_Truth_Question._();
  ScreenMessage_Extra_Truth_Question createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_Truth_Question> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_Truth_Question>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Truth_Question getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra_Truth_Question>(
          create);
  static ScreenMessage_Extra_Truth_Question? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get answers => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

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
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get dateline => $_getSZ(4);
  @$pb.TagNumber(5)
  set dateline($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDateline() => $_has(4);
  @$pb.TagNumber(5)
  void clearDateline() => clearField(5);

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
}

class ScreenMessage_Extra_Truth extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.Truth',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'conversation')
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
            : 'type')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mode',
        $pb.PbFieldType.OU3)
    ..aOM<ScreenMessage_Extra_Truth_Question>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'question',
        subBuilder: ScreenMessage_Extra_Truth_Question.create)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'source',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'target',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ScreenMessage_Extra_Truth._() : super();
  factory ScreenMessage_Extra_Truth({
    $core.String? conversation,
    $core.int? rid,
    $core.String? type,
    $core.int? mode,
    ScreenMessage_Extra_Truth_Question? question,
    $core.String? content,
    $core.int? source,
    $core.int? target,
  }) {
    final _result = create();
    if (conversation != null) {
      _result.conversation = conversation;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (type != null) {
      _result.type = type;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (question != null) {
      _result.question = question;
    }
    if (content != null) {
      _result.content = content;
    }
    if (source != null) {
      _result.source = source;
    }
    if (target != null) {
      _result.target = target;
    }
    return _result;
  }
  factory ScreenMessage_Extra_Truth.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_Truth.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Truth clone() =>
      ScreenMessage_Extra_Truth()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Truth copyWith(
          void Function(ScreenMessage_Extra_Truth) updates) =>
      super.copyWith((message) => updates(message as ScreenMessage_Extra_Truth))
          as ScreenMessage_Extra_Truth; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Truth create() => ScreenMessage_Extra_Truth._();
  ScreenMessage_Extra_Truth createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_Truth> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_Truth>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Truth getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra_Truth>(create);
  static ScreenMessage_Extra_Truth? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get conversation => $_getSZ(0);
  @$pb.TagNumber(1)
  set conversation($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasConversation() => $_has(0);
  @$pb.TagNumber(1)
  void clearConversation() => clearField(1);

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
  $core.int get mode => $_getIZ(3);
  @$pb.TagNumber(4)
  set mode($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMode() => $_has(3);
  @$pb.TagNumber(4)
  void clearMode() => clearField(4);

  @$pb.TagNumber(5)
  ScreenMessage_Extra_Truth_Question get question => $_getN(4);
  @$pb.TagNumber(5)
  set question(ScreenMessage_Extra_Truth_Question v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasQuestion() => $_has(4);
  @$pb.TagNumber(5)
  void clearQuestion() => clearField(5);
  @$pb.TagNumber(5)
  ScreenMessage_Extra_Truth_Question ensureQuestion() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get content => $_getSZ(5);
  @$pb.TagNumber(6)
  set content($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasContent() => $_has(5);
  @$pb.TagNumber(6)
  void clearContent() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get source => $_getIZ(6);
  @$pb.TagNumber(7)
  set source($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSource() => $_has(6);
  @$pb.TagNumber(7)
  void clearSource() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get target => $_getIZ(7);
  @$pb.TagNumber(8)
  set target($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTarget() => $_has(7);
  @$pb.TagNumber(8)
  void clearTarget() => clearField(8);
}

class ScreenMessage_Extra_Gift_Header_From extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.Gift.Header.From',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
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
    ..hasRequiredFields = false;

  ScreenMessage_Extra_Gift_Header_From._() : super();
  factory ScreenMessage_Extra_Gift_Header_From({
    $core.String? uid,
    $core.String? icon,
    $core.String? name,
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
    return _result;
  }
  factory ScreenMessage_Extra_Gift_Header_From.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_Gift_Header_From.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Gift_Header_From clone() =>
      ScreenMessage_Extra_Gift_Header_From()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Gift_Header_From copyWith(
          void Function(ScreenMessage_Extra_Gift_Header_From) updates) =>
      super.copyWith((message) =>
              updates(message as ScreenMessage_Extra_Gift_Header_From))
          as ScreenMessage_Extra_Gift_Header_From; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Gift_Header_From create() =>
      ScreenMessage_Extra_Gift_Header_From._();
  ScreenMessage_Extra_Gift_Header_From createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_Gift_Header_From> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_Gift_Header_From>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Gift_Header_From getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ScreenMessage_Extra_Gift_Header_From>(create);
  static ScreenMessage_Extra_Gift_Header_From? _defaultInstance;

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
}

class ScreenMessage_Extra_Gift_Header_To extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.Gift.Header.To',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
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
    ..hasRequiredFields = false;

  ScreenMessage_Extra_Gift_Header_To._() : super();
  factory ScreenMessage_Extra_Gift_Header_To({
    $core.String? uid,
    $core.String? icon,
    $core.String? name,
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
    return _result;
  }
  factory ScreenMessage_Extra_Gift_Header_To.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_Gift_Header_To.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Gift_Header_To clone() =>
      ScreenMessage_Extra_Gift_Header_To()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Gift_Header_To copyWith(
          void Function(ScreenMessage_Extra_Gift_Header_To) updates) =>
      super.copyWith((message) =>
              updates(message as ScreenMessage_Extra_Gift_Header_To))
          as ScreenMessage_Extra_Gift_Header_To; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Gift_Header_To create() =>
      ScreenMessage_Extra_Gift_Header_To._();
  ScreenMessage_Extra_Gift_Header_To createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_Gift_Header_To> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_Gift_Header_To>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Gift_Header_To getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra_Gift_Header_To>(
          create);
  static ScreenMessage_Extra_Gift_Header_To? _defaultInstance;

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
}

class ScreenMessage_Extra_Gift_Header extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.Gift.Header',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
      createEmptyInstance: create)
    ..aOM<ScreenMessage_Extra_Gift_Header_From>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'from',
        subBuilder: ScreenMessage_Extra_Gift_Header_From.create)
    ..aOM<ScreenMessage_Extra_Gift_Header_To>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'to',
        subBuilder: ScreenMessage_Extra_Gift_Header_To.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'start',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'end',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ScreenMessage_Extra_Gift_Header._() : super();
  factory ScreenMessage_Extra_Gift_Header({
    ScreenMessage_Extra_Gift_Header_From? from,
    ScreenMessage_Extra_Gift_Header_To? to,
    $core.int? start,
    $core.int? end,
  }) {
    final _result = create();
    if (from != null) {
      _result.from = from;
    }
    if (to != null) {
      _result.to = to;
    }
    if (start != null) {
      _result.start = start;
    }
    if (end != null) {
      _result.end = end;
    }
    return _result;
  }
  factory ScreenMessage_Extra_Gift_Header.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_Gift_Header.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Gift_Header clone() =>
      ScreenMessage_Extra_Gift_Header()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Gift_Header copyWith(
          void Function(ScreenMessage_Extra_Gift_Header) updates) =>
      super.copyWith(
              (message) => updates(message as ScreenMessage_Extra_Gift_Header))
          as ScreenMessage_Extra_Gift_Header; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Gift_Header create() =>
      ScreenMessage_Extra_Gift_Header._();
  ScreenMessage_Extra_Gift_Header createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_Gift_Header> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_Gift_Header>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Gift_Header getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra_Gift_Header>(
          create);
  static ScreenMessage_Extra_Gift_Header? _defaultInstance;

  @$pb.TagNumber(1)
  ScreenMessage_Extra_Gift_Header_From get from => $_getN(0);
  @$pb.TagNumber(1)
  set from(ScreenMessage_Extra_Gift_Header_From v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);
  @$pb.TagNumber(1)
  ScreenMessage_Extra_Gift_Header_From ensureFrom() => $_ensure(0);

  @$pb.TagNumber(2)
  ScreenMessage_Extra_Gift_Header_To get to => $_getN(1);
  @$pb.TagNumber(2)
  set to(ScreenMessage_Extra_Gift_Header_To v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => clearField(2);
  @$pb.TagNumber(2)
  ScreenMessage_Extra_Gift_Header_To ensureTo() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get start => $_getIZ(2);
  @$pb.TagNumber(3)
  set start($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasStart() => $_has(2);
  @$pb.TagNumber(3)
  void clearStart() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get end => $_getIZ(3);
  @$pb.TagNumber(4)
  set end($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasEnd() => $_has(3);
  @$pb.TagNumber(4)
  void clearEnd() => clearField(4);
}

class ScreenMessage_Extra_Gift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.Gift',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vap_header_start')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vap_header',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : '_num',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vap_header_end')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'magic_size',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'displayNormalGiftType',
        protoName: 'displayNormalGiftType')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'with_end',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift_type')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'size',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vap_type')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vap_size',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_start_end',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'magic',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'worthy',
        $pb.PbFieldType.OU3)
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'displayNormalGiftRatio',
        protoName: 'displayNormalGiftRatio')
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'size_big',
        $pb.PbFieldType.OU3)
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : '_position',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cplink_gift_lev',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id_origin',
        $pb.PbFieldType.OU3)
    ..aOM<ScreenMessage_Extra_Gift_Header>(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'header',
        subBuilder: ScreenMessage_Extra_Gift_Header.create)
    ..a<$core.int>(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unity_rocket_version',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diy_unity_android_size',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diy_unity_ios_size',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        38,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'riveValue',
        $pb.PbFieldType.OU3,
        protoName: 'riveValue')
    ..hasRequiredFields = false;

  ScreenMessage_Extra_Gift._() : super();
  factory ScreenMessage_Extra_Gift({
    $core.String? vapHeaderStart,
    $core.int? vapHeader,
    $core.int? num,
    $core.String? vapHeaderEnd,
    $core.int? magicSize,
    $core.String? displayNormalGiftType,
    $core.int? withEnd,
    $core.String? giftType,
    $core.int? size,
    $core.String? price,
    $core.String? vapType,
    $core.int? vapSize,
    $core.int? showStartEnd,
    $core.int? id,
    $core.String? name,
    $core.int? magic,
    $core.int? worthy,
    $core.String? displayNormalGiftRatio,
    $core.int? sizeBig,
    $core.String? type,
    $core.int? position,
    $core.int? cplinkGiftLev,
    $core.int? idOrigin,
    ScreenMessage_Extra_Gift_Header? header,
    $core.int? unityRocketVersion,
    $core.int? diyUnityAndroidSize,
    $core.int? diyUnityIosSize,
    $core.int? riveValue,
  }) {
    final _result = create();
    if (vapHeaderStart != null) {
      _result.vapHeaderStart = vapHeaderStart;
    }
    if (vapHeader != null) {
      _result.vapHeader = vapHeader;
    }
    if (num != null) {
      _result.num = num;
    }
    if (vapHeaderEnd != null) {
      _result.vapHeaderEnd = vapHeaderEnd;
    }
    if (magicSize != null) {
      _result.magicSize = magicSize;
    }
    if (displayNormalGiftType != null) {
      _result.displayNormalGiftType = displayNormalGiftType;
    }
    if (withEnd != null) {
      _result.withEnd = withEnd;
    }
    if (giftType != null) {
      _result.giftType = giftType;
    }
    if (size != null) {
      _result.size = size;
    }
    if (price != null) {
      _result.price = price;
    }
    if (vapType != null) {
      _result.vapType = vapType;
    }
    if (vapSize != null) {
      _result.vapSize = vapSize;
    }
    if (showStartEnd != null) {
      _result.showStartEnd = showStartEnd;
    }
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (magic != null) {
      _result.magic = magic;
    }
    if (worthy != null) {
      _result.worthy = worthy;
    }
    if (displayNormalGiftRatio != null) {
      _result.displayNormalGiftRatio = displayNormalGiftRatio;
    }
    if (sizeBig != null) {
      _result.sizeBig = sizeBig;
    }
    if (type != null) {
      _result.type = type;
    }
    if (position != null) {
      _result.position = position;
    }
    if (cplinkGiftLev != null) {
      _result.cplinkGiftLev = cplinkGiftLev;
    }
    if (idOrigin != null) {
      _result.idOrigin = idOrigin;
    }
    if (header != null) {
      _result.header = header;
    }
    if (unityRocketVersion != null) {
      _result.unityRocketVersion = unityRocketVersion;
    }
    if (diyUnityAndroidSize != null) {
      _result.diyUnityAndroidSize = diyUnityAndroidSize;
    }
    if (diyUnityIosSize != null) {
      _result.diyUnityIosSize = diyUnityIosSize;
    }
    if (riveValue != null) {
      _result.riveValue = riveValue;
    }
    return _result;
  }
  factory ScreenMessage_Extra_Gift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_Gift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Gift clone() =>
      ScreenMessage_Extra_Gift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Gift copyWith(
          void Function(ScreenMessage_Extra_Gift) updates) =>
      super.copyWith((message) => updates(message as ScreenMessage_Extra_Gift))
          as ScreenMessage_Extra_Gift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Gift create() => ScreenMessage_Extra_Gift._();
  ScreenMessage_Extra_Gift createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_Gift> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_Gift>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Gift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra_Gift>(create);
  static ScreenMessage_Extra_Gift? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get vapHeaderStart => $_getSZ(0);
  @$pb.TagNumber(1)
  set vapHeaderStart($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasVapHeaderStart() => $_has(0);
  @$pb.TagNumber(1)
  void clearVapHeaderStart() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get vapHeader => $_getIZ(1);
  @$pb.TagNumber(2)
  set vapHeader($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVapHeader() => $_has(1);
  @$pb.TagNumber(2)
  void clearVapHeader() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get num => $_getIZ(2);
  @$pb.TagNumber(3)
  set num($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get vapHeaderEnd => $_getSZ(3);
  @$pb.TagNumber(4)
  set vapHeaderEnd($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasVapHeaderEnd() => $_has(3);
  @$pb.TagNumber(4)
  void clearVapHeaderEnd() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get magicSize => $_getIZ(4);
  @$pb.TagNumber(5)
  set magicSize($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMagicSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearMagicSize() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get displayNormalGiftType => $_getSZ(5);
  @$pb.TagNumber(6)
  set displayNormalGiftType($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDisplayNormalGiftType() => $_has(5);
  @$pb.TagNumber(6)
  void clearDisplayNormalGiftType() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get withEnd => $_getIZ(6);
  @$pb.TagNumber(7)
  set withEnd($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasWithEnd() => $_has(6);
  @$pb.TagNumber(7)
  void clearWithEnd() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get giftType => $_getSZ(7);
  @$pb.TagNumber(8)
  set giftType($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasGiftType() => $_has(7);
  @$pb.TagNumber(8)
  void clearGiftType() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get size => $_getIZ(8);
  @$pb.TagNumber(9)
  set size($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasSize() => $_has(8);
  @$pb.TagNumber(9)
  void clearSize() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get price => $_getSZ(9);
  @$pb.TagNumber(10)
  set price($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasPrice() => $_has(9);
  @$pb.TagNumber(10)
  void clearPrice() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get vapType => $_getSZ(10);
  @$pb.TagNumber(11)
  set vapType($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasVapType() => $_has(10);
  @$pb.TagNumber(11)
  void clearVapType() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get vapSize => $_getIZ(11);
  @$pb.TagNumber(12)
  set vapSize($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasVapSize() => $_has(11);
  @$pb.TagNumber(12)
  void clearVapSize() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get showStartEnd => $_getIZ(12);
  @$pb.TagNumber(13)
  set showStartEnd($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasShowStartEnd() => $_has(12);
  @$pb.TagNumber(13)
  void clearShowStartEnd() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get id => $_getIZ(13);
  @$pb.TagNumber(14)
  set id($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasId() => $_has(13);
  @$pb.TagNumber(14)
  void clearId() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get name => $_getSZ(14);
  @$pb.TagNumber(15)
  set name($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasName() => $_has(14);
  @$pb.TagNumber(15)
  void clearName() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get magic => $_getIZ(15);
  @$pb.TagNumber(16)
  set magic($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasMagic() => $_has(15);
  @$pb.TagNumber(16)
  void clearMagic() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get worthy => $_getIZ(16);
  @$pb.TagNumber(17)
  set worthy($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasWorthy() => $_has(16);
  @$pb.TagNumber(17)
  void clearWorthy() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get displayNormalGiftRatio => $_getSZ(17);
  @$pb.TagNumber(18)
  set displayNormalGiftRatio($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasDisplayNormalGiftRatio() => $_has(17);
  @$pb.TagNumber(18)
  void clearDisplayNormalGiftRatio() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get sizeBig => $_getIZ(18);
  @$pb.TagNumber(19)
  set sizeBig($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasSizeBig() => $_has(18);
  @$pb.TagNumber(19)
  void clearSizeBig() => clearField(19);

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
  $core.int get position => $_getIZ(20);
  @$pb.TagNumber(21)
  set position($core.int v) {
    $_setSignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasPosition() => $_has(20);
  @$pb.TagNumber(21)
  void clearPosition() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get cplinkGiftLev => $_getIZ(21);
  @$pb.TagNumber(22)
  set cplinkGiftLev($core.int v) {
    $_setUnsignedInt32(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasCplinkGiftLev() => $_has(21);
  @$pb.TagNumber(22)
  void clearCplinkGiftLev() => clearField(22);

  @$pb.TagNumber(33)
  $core.int get idOrigin => $_getIZ(22);
  @$pb.TagNumber(33)
  set idOrigin($core.int v) {
    $_setUnsignedInt32(22, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasIdOrigin() => $_has(22);
  @$pb.TagNumber(33)
  void clearIdOrigin() => clearField(33);

  @$pb.TagNumber(34)
  ScreenMessage_Extra_Gift_Header get header => $_getN(23);
  @$pb.TagNumber(34)
  set header(ScreenMessage_Extra_Gift_Header v) {
    setField(34, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasHeader() => $_has(23);
  @$pb.TagNumber(34)
  void clearHeader() => clearField(34);
  @$pb.TagNumber(34)
  ScreenMessage_Extra_Gift_Header ensureHeader() => $_ensure(23);

  @$pb.TagNumber(35)
  $core.int get unityRocketVersion => $_getIZ(24);
  @$pb.TagNumber(35)
  set unityRocketVersion($core.int v) {
    $_setUnsignedInt32(24, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasUnityRocketVersion() => $_has(24);
  @$pb.TagNumber(35)
  void clearUnityRocketVersion() => clearField(35);

  @$pb.TagNumber(36)
  $core.int get diyUnityAndroidSize => $_getIZ(25);
  @$pb.TagNumber(36)
  set diyUnityAndroidSize($core.int v) {
    $_setUnsignedInt32(25, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasDiyUnityAndroidSize() => $_has(25);
  @$pb.TagNumber(36)
  void clearDiyUnityAndroidSize() => clearField(36);

  @$pb.TagNumber(37)
  $core.int get diyUnityIosSize => $_getIZ(26);
  @$pb.TagNumber(37)
  set diyUnityIosSize($core.int v) {
    $_setUnsignedInt32(26, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasDiyUnityIosSize() => $_has(26);
  @$pb.TagNumber(37)
  void clearDiyUnityIosSize() => clearField(37);

  @$pb.TagNumber(38)
  $core.int get riveValue => $_getIZ(27);
  @$pb.TagNumber(38)
  set riveValue($core.int v) {
    $_setUnsignedInt32(27, v);
  }

  @$pb.TagNumber(38)
  $core.bool hasRiveValue() => $_has(27);
  @$pb.TagNumber(38)
  void clearRiveValue() => clearField(38);
}

class ScreenMessage_Extra_Effect extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.Effect',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'font_color')
    ..hasRequiredFields = false;

  ScreenMessage_Extra_Effect._() : super();
  factory ScreenMessage_Extra_Effect({
    $core.String? image,
    $core.String? fontColor,
  }) {
    final _result = create();
    if (image != null) {
      _result.image = image;
    }
    if (fontColor != null) {
      _result.fontColor = fontColor;
    }
    return _result;
  }
  factory ScreenMessage_Extra_Effect.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_Effect.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Effect clone() =>
      ScreenMessage_Extra_Effect()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Effect copyWith(
          void Function(ScreenMessage_Extra_Effect) updates) =>
      super.copyWith(
              (message) => updates(message as ScreenMessage_Extra_Effect))
          as ScreenMessage_Extra_Effect; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Effect create() => ScreenMessage_Extra_Effect._();
  ScreenMessage_Extra_Effect createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_Effect> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_Effect>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Effect getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra_Effect>(create);
  static ScreenMessage_Extra_Effect? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get image => $_getSZ(0);
  @$pb.TagNumber(1)
  set image($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearImage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fontColor => $_getSZ(1);
  @$pb.TagNumber(2)
  set fontColor($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFontColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearFontColor() => clearField(2);
}

class ScreenMessage_Extra_BtnData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.BtnData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
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
            : 'text')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'permanent_vvc',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'day',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ScreenMessage_Extra_BtnData._() : super();
  factory ScreenMessage_Extra_BtnData({
    $core.String? type,
    $core.String? id,
    $core.int? rid,
    $core.String? text,
    $core.int? permanentVvc,
    $core.int? day,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (id != null) {
      _result.id = id;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (text != null) {
      _result.text = text;
    }
    if (permanentVvc != null) {
      _result.permanentVvc = permanentVvc;
    }
    if (day != null) {
      _result.day = day;
    }
    return _result;
  }
  factory ScreenMessage_Extra_BtnData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_BtnData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_BtnData clone() =>
      ScreenMessage_Extra_BtnData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_BtnData copyWith(
          void Function(ScreenMessage_Extra_BtnData) updates) =>
      super.copyWith(
              (message) => updates(message as ScreenMessage_Extra_BtnData))
          as ScreenMessage_Extra_BtnData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_BtnData create() =>
      ScreenMessage_Extra_BtnData._();
  ScreenMessage_Extra_BtnData createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_BtnData> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_BtnData>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_BtnData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra_BtnData>(create);
  static ScreenMessage_Extra_BtnData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

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
  $core.String get text => $_getSZ(3);
  @$pb.TagNumber(4)
  set text($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasText() => $_has(3);
  @$pb.TagNumber(4)
  void clearText() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get permanentVvc => $_getIZ(4);
  @$pb.TagNumber(5)
  set permanentVvc($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPermanentVvc() => $_has(4);
  @$pb.TagNumber(5)
  void clearPermanentVvc() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get day => $_getIZ(5);
  @$pb.TagNumber(6)
  set day($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDay() => $_has(5);
  @$pb.TagNumber(6)
  void clearDay() => clearField(6);
}

class ScreenMessage_Extra_Tags extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.Tags',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content_type',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content_value')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_type',
        $pb.PbFieldType.OU3)
    ..pPS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'colors')
    ..hasRequiredFields = false;

  ScreenMessage_Extra_Tags._() : super();
  factory ScreenMessage_Extra_Tags({
    $core.int? contentType,
    $core.String? contentValue,
    $core.int? showType,
    $core.Iterable<$core.String>? colors,
  }) {
    final _result = create();
    if (contentType != null) {
      _result.contentType = contentType;
    }
    if (contentValue != null) {
      _result.contentValue = contentValue;
    }
    if (showType != null) {
      _result.showType = showType;
    }
    if (colors != null) {
      _result.colors.addAll(colors);
    }
    return _result;
  }
  factory ScreenMessage_Extra_Tags.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_Tags.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Tags clone() =>
      ScreenMessage_Extra_Tags()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Tags copyWith(
          void Function(ScreenMessage_Extra_Tags) updates) =>
      super.copyWith((message) => updates(message as ScreenMessage_Extra_Tags))
          as ScreenMessage_Extra_Tags; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Tags create() => ScreenMessage_Extra_Tags._();
  ScreenMessage_Extra_Tags createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_Tags> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_Tags>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Tags getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra_Tags>(create);
  static ScreenMessage_Extra_Tags? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get contentType => $_getIZ(0);
  @$pb.TagNumber(1)
  set contentType($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasContentType() => $_has(0);
  @$pb.TagNumber(1)
  void clearContentType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get contentValue => $_getSZ(1);
  @$pb.TagNumber(2)
  set contentValue($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasContentValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearContentValue() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get showType => $_getIZ(2);
  @$pb.TagNumber(3)
  set showType($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasShowType() => $_has(2);
  @$pb.TagNumber(3)
  void clearShowType() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get colors => $_getList(3);
}

class ScreenMessage_Extra_Mounts extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.Mounts',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
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
    ..aOS(
        40,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon_url')
    ..a<$core.int>(
        41,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : '_num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        42,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : '_position',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  ScreenMessage_Extra_Mounts._() : super();
  factory ScreenMessage_Extra_Mounts({
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
    $core.String? iconUrl,
    $core.int? num,
    $core.int? position,
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
    if (iconUrl != null) {
      _result.iconUrl = iconUrl;
    }
    if (num != null) {
      _result.num = num;
    }
    if (position != null) {
      _result.position = position;
    }
    return _result;
  }
  factory ScreenMessage_Extra_Mounts.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_Mounts.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Mounts clone() =>
      ScreenMessage_Extra_Mounts()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Mounts copyWith(
          void Function(ScreenMessage_Extra_Mounts) updates) =>
      super.copyWith(
              (message) => updates(message as ScreenMessage_Extra_Mounts))
          as ScreenMessage_Extra_Mounts; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Mounts create() => ScreenMessage_Extra_Mounts._();
  ScreenMessage_Extra_Mounts createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_Mounts> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_Mounts>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Mounts getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra_Mounts>(create);
  static ScreenMessage_Extra_Mounts? _defaultInstance;

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

  @$pb.TagNumber(40)
  $core.String get iconUrl => $_getSZ(39);
  @$pb.TagNumber(40)
  set iconUrl($core.String v) {
    $_setString(39, v);
  }

  @$pb.TagNumber(40)
  $core.bool hasIconUrl() => $_has(39);
  @$pb.TagNumber(40)
  void clearIconUrl() => clearField(40);

  @$pb.TagNumber(41)
  $core.int get num => $_getIZ(40);
  @$pb.TagNumber(41)
  set num($core.int v) {
    $_setUnsignedInt32(40, v);
  }

  @$pb.TagNumber(41)
  $core.bool hasNum() => $_has(40);
  @$pb.TagNumber(41)
  void clearNum() => clearField(41);

  @$pb.TagNumber(42)
  $core.int get position => $_getIZ(41);
  @$pb.TagNumber(42)
  set position($core.int v) {
    $_setSignedInt32(41, v);
  }

  @$pb.TagNumber(42)
  $core.bool hasPosition() => $_has(41);
  @$pb.TagNumber(42)
  void clearPosition() => clearField(42);
}

class ScreenMessage_Extra_FansLabel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.FansLabel',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
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

  ScreenMessage_Extra_FansLabel._() : super();
  factory ScreenMessage_Extra_FansLabel({
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
  factory ScreenMessage_Extra_FansLabel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_FansLabel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_FansLabel clone() =>
      ScreenMessage_Extra_FansLabel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_FansLabel copyWith(
          void Function(ScreenMessage_Extra_FansLabel) updates) =>
      super.copyWith(
              (message) => updates(message as ScreenMessage_Extra_FansLabel))
          as ScreenMessage_Extra_FansLabel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_FansLabel create() =>
      ScreenMessage_Extra_FansLabel._();
  ScreenMessage_Extra_FansLabel createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_FansLabel> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_FansLabel>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_FansLabel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra_FansLabel>(create);
  static ScreenMessage_Extra_FansLabel? _defaultInstance;

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

class ScreenMessage_Extra_DefendLabel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.DefendLabel',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user_name')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'relation')
    ..hasRequiredFields = false;

  ScreenMessage_Extra_DefendLabel._() : super();
  factory ScreenMessage_Extra_DefendLabel({
    $core.String? userName,
    $core.String? relation,
  }) {
    final _result = create();
    if (userName != null) {
      _result.userName = userName;
    }
    if (relation != null) {
      _result.relation = relation;
    }
    return _result;
  }
  factory ScreenMessage_Extra_DefendLabel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_DefendLabel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_DefendLabel clone() =>
      ScreenMessage_Extra_DefendLabel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_DefendLabel copyWith(
          void Function(ScreenMessage_Extra_DefendLabel) updates) =>
      super.copyWith(
              (message) => updates(message as ScreenMessage_Extra_DefendLabel))
          as ScreenMessage_Extra_DefendLabel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_DefendLabel create() =>
      ScreenMessage_Extra_DefendLabel._();
  ScreenMessage_Extra_DefendLabel createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_DefendLabel> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_DefendLabel>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_DefendLabel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra_DefendLabel>(
          create);
  static ScreenMessage_Extra_DefendLabel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userName => $_getSZ(0);
  @$pb.TagNumber(1)
  set userName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserName() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get relation => $_getSZ(1);
  @$pb.TagNumber(2)
  set relation($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRelation() => $_has(1);
  @$pb.TagNumber(2)
  void clearRelation() => clearField(2);
}

class ScreenMessage_Extra_MsgData_LiveList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.MsgData.LiveList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
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

  ScreenMessage_Extra_MsgData_LiveList._() : super();
  factory ScreenMessage_Extra_MsgData_LiveList({
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
  factory ScreenMessage_Extra_MsgData_LiveList.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_MsgData_LiveList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_MsgData_LiveList clone() =>
      ScreenMessage_Extra_MsgData_LiveList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_MsgData_LiveList copyWith(
          void Function(ScreenMessage_Extra_MsgData_LiveList) updates) =>
      super.copyWith((message) =>
              updates(message as ScreenMessage_Extra_MsgData_LiveList))
          as ScreenMessage_Extra_MsgData_LiveList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_MsgData_LiveList create() =>
      ScreenMessage_Extra_MsgData_LiveList._();
  ScreenMessage_Extra_MsgData_LiveList createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_MsgData_LiveList> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_MsgData_LiveList>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_MsgData_LiveList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ScreenMessage_Extra_MsgData_LiveList>(create);
  static ScreenMessage_Extra_MsgData_LiveList? _defaultInstance;

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

class ScreenMessage_Extra_MsgData_DeadList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.MsgData.DeadList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
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

  ScreenMessage_Extra_MsgData_DeadList._() : super();
  factory ScreenMessage_Extra_MsgData_DeadList({
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
  factory ScreenMessage_Extra_MsgData_DeadList.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_MsgData_DeadList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_MsgData_DeadList clone() =>
      ScreenMessage_Extra_MsgData_DeadList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_MsgData_DeadList copyWith(
          void Function(ScreenMessage_Extra_MsgData_DeadList) updates) =>
      super.copyWith((message) =>
              updates(message as ScreenMessage_Extra_MsgData_DeadList))
          as ScreenMessage_Extra_MsgData_DeadList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_MsgData_DeadList create() =>
      ScreenMessage_Extra_MsgData_DeadList._();
  ScreenMessage_Extra_MsgData_DeadList createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_MsgData_DeadList> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_MsgData_DeadList>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_MsgData_DeadList getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ScreenMessage_Extra_MsgData_DeadList>(create);
  static ScreenMessage_Extra_MsgData_DeadList? _defaultInstance;

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

class ScreenMessage_Extra_MsgData_NewVoteResultPosMap
    extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.MsgData.NewVoteResultPosMap',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'key',
        $pb.PbFieldType.O3)
    ..p<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value',
        $pb.PbFieldType.PU3)
    ..hasRequiredFields = false;

  ScreenMessage_Extra_MsgData_NewVoteResultPosMap._() : super();
  factory ScreenMessage_Extra_MsgData_NewVoteResultPosMap({
    $core.int? key,
    $core.Iterable<$core.int>? value,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (value != null) {
      _result.value.addAll(value);
    }
    return _result;
  }
  factory ScreenMessage_Extra_MsgData_NewVoteResultPosMap.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_MsgData_NewVoteResultPosMap.fromJson(
          $core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_MsgData_NewVoteResultPosMap clone() =>
      ScreenMessage_Extra_MsgData_NewVoteResultPosMap()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_MsgData_NewVoteResultPosMap copyWith(
          void Function(ScreenMessage_Extra_MsgData_NewVoteResultPosMap)
              updates) =>
      super.copyWith((message) => updates(
              message as ScreenMessage_Extra_MsgData_NewVoteResultPosMap))
          as ScreenMessage_Extra_MsgData_NewVoteResultPosMap; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_MsgData_NewVoteResultPosMap create() =>
      ScreenMessage_Extra_MsgData_NewVoteResultPosMap._();
  ScreenMessage_Extra_MsgData_NewVoteResultPosMap createEmptyInstance() =>
      create();
  static $pb.PbList<ScreenMessage_Extra_MsgData_NewVoteResultPosMap>
      createRepeated() =>
          $pb.PbList<ScreenMessage_Extra_MsgData_NewVoteResultPosMap>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_MsgData_NewVoteResultPosMap getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ScreenMessage_Extra_MsgData_NewVoteResultPosMap>(create);
  static ScreenMessage_Extra_MsgData_NewVoteResultPosMap? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get key => $_getIZ(0);
  @$pb.TagNumber(1)
  set key($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get value => $_getList(1);
}

class ScreenMessage_Extra_MsgData_PosUserDataMap extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.MsgData.PosUserDataMap',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  ScreenMessage_Extra_MsgData_PosUserDataMap._() : super();
  factory ScreenMessage_Extra_MsgData_PosUserDataMap({
    $core.String? position,
    $core.String? uid,
    $core.String? role,
    $core.String? icon,
  }) {
    final _result = create();
    if (position != null) {
      _result.position = position;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (role != null) {
      _result.role = role;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory ScreenMessage_Extra_MsgData_PosUserDataMap.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_MsgData_PosUserDataMap.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_MsgData_PosUserDataMap clone() =>
      ScreenMessage_Extra_MsgData_PosUserDataMap()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_MsgData_PosUserDataMap copyWith(
          void Function(ScreenMessage_Extra_MsgData_PosUserDataMap) updates) =>
      super.copyWith((message) =>
              updates(message as ScreenMessage_Extra_MsgData_PosUserDataMap))
          as ScreenMessage_Extra_MsgData_PosUserDataMap; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_MsgData_PosUserDataMap create() =>
      ScreenMessage_Extra_MsgData_PosUserDataMap._();
  ScreenMessage_Extra_MsgData_PosUserDataMap createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_MsgData_PosUserDataMap>
      createRepeated() =>
          $pb.PbList<ScreenMessage_Extra_MsgData_PosUserDataMap>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_MsgData_PosUserDataMap getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ScreenMessage_Extra_MsgData_PosUserDataMap>(create);
  static ScreenMessage_Extra_MsgData_PosUserDataMap? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get position => $_getSZ(0);
  @$pb.TagNumber(1)
  set position($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => clearField(1);

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
  $core.String get role => $_getSZ(2);
  @$pb.TagNumber(3)
  set role($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearRole() => clearField(3);

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

class ScreenMessage_Extra_MsgData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.MsgData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
      createEmptyInstance: create)
    ..pc<ScreenMessage_Extra_MsgData_NewVoteResultPosMap>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'newVoteResultPosMap',
        $pb.PbFieldType.PM,
        protoName: 'newVoteResultPosMap',
        subBuilder: ScreenMessage_Extra_MsgData_NewVoteResultPosMap.create)
    ..pc<ScreenMessage_Extra_MsgData_PosUserDataMap>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'posUserDataMap',
        $pb.PbFieldType.PM,
        protoName: 'posUserDataMap',
        subBuilder: ScreenMessage_Extra_MsgData_PosUserDataMap.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'killPosition',
        $pb.PbFieldType.O3,
        protoName: 'killPosition')
    ..m<$core.String, $0.ListValue>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'voteResList',
        protoName: 'voteResList',
        entryClassName: 'ScreenMessage.Extra.MsgData.VoteResListEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: $0.ListValue.create,
        packageName: const $pb.PackageName('system.screen.message'))
    ..pc<ScreenMessage_Extra_MsgData_DeadList>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deadList',
        $pb.PbFieldType.PM,
        protoName: 'deadList',
        subBuilder: ScreenMessage_Extra_MsgData_DeadList.create)
    ..aOM<ScreenMessage_Extra_MsgData_LiveList>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveList',
        protoName: 'liveList',
        subBuilder: ScreenMessage_Extra_MsgData_LiveList.create)
    ..hasRequiredFields = false;

  ScreenMessage_Extra_MsgData._() : super();
  factory ScreenMessage_Extra_MsgData({
    $core.Iterable<ScreenMessage_Extra_MsgData_NewVoteResultPosMap>?
        newVoteResultPosMap,
    $core.Iterable<ScreenMessage_Extra_MsgData_PosUserDataMap>? posUserDataMap,
    $core.int? killPosition,
    $core.Map<$core.String, $0.ListValue>? voteResList,
    $core.Iterable<ScreenMessage_Extra_MsgData_DeadList>? deadList,
    ScreenMessage_Extra_MsgData_LiveList? liveList,
  }) {
    final _result = create();
    if (newVoteResultPosMap != null) {
      _result.newVoteResultPosMap.addAll(newVoteResultPosMap);
    }
    if (posUserDataMap != null) {
      _result.posUserDataMap.addAll(posUserDataMap);
    }
    if (killPosition != null) {
      _result.killPosition = killPosition;
    }
    if (voteResList != null) {
      _result.voteResList.addAll(voteResList);
    }
    if (deadList != null) {
      _result.deadList.addAll(deadList);
    }
    if (liveList != null) {
      _result.liveList = liveList;
    }
    return _result;
  }
  factory ScreenMessage_Extra_MsgData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_MsgData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_MsgData clone() =>
      ScreenMessage_Extra_MsgData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_MsgData copyWith(
          void Function(ScreenMessage_Extra_MsgData) updates) =>
      super.copyWith(
              (message) => updates(message as ScreenMessage_Extra_MsgData))
          as ScreenMessage_Extra_MsgData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_MsgData create() =>
      ScreenMessage_Extra_MsgData._();
  ScreenMessage_Extra_MsgData createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_MsgData> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_MsgData>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_MsgData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra_MsgData>(create);
  static ScreenMessage_Extra_MsgData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ScreenMessage_Extra_MsgData_NewVoteResultPosMap>
      get newVoteResultPosMap => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<ScreenMessage_Extra_MsgData_PosUserDataMap> get posUserDataMap =>
      $_getList(1);

  @$pb.TagNumber(3)
  $core.int get killPosition => $_getIZ(2);
  @$pb.TagNumber(3)
  set killPosition($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasKillPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearKillPosition() => clearField(3);

  @$pb.TagNumber(4)
  $core.Map<$core.String, $0.ListValue> get voteResList => $_getMap(3);

  @$pb.TagNumber(5)
  $core.List<ScreenMessage_Extra_MsgData_DeadList> get deadList => $_getList(4);

  @$pb.TagNumber(6)
  ScreenMessage_Extra_MsgData_LiveList get liveList => $_getN(5);
  @$pb.TagNumber(6)
  set liveList(ScreenMessage_Extra_MsgData_LiveList v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLiveList() => $_has(5);
  @$pb.TagNumber(6)
  void clearLiveList() => clearField(6);
  @$pb.TagNumber(6)
  ScreenMessage_Extra_MsgData_LiveList ensureLiveList() => $_ensure(5);
}

class ScreenMessage_Extra_Decorate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.Decorate',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
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
            : 'num',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..hasRequiredFields = false;

  ScreenMessage_Extra_Decorate._() : super();
  factory ScreenMessage_Extra_Decorate({
    $core.String? name,
    $core.int? num,
    $core.String? image,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (num != null) {
      _result.num = num;
    }
    if (image != null) {
      _result.image = image;
    }
    return _result;
  }
  factory ScreenMessage_Extra_Decorate.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_Decorate.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Decorate clone() =>
      ScreenMessage_Extra_Decorate()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Decorate copyWith(
          void Function(ScreenMessage_Extra_Decorate) updates) =>
      super.copyWith(
              (message) => updates(message as ScreenMessage_Extra_Decorate))
          as ScreenMessage_Extra_Decorate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Decorate create() =>
      ScreenMessage_Extra_Decorate._();
  ScreenMessage_Extra_Decorate createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_Decorate> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_Decorate>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Decorate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra_Decorate>(create);
  static ScreenMessage_Extra_Decorate? _defaultInstance;

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
  $core.int get num => $_getIZ(1);
  @$pb.TagNumber(2)
  set num($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get image => $_getSZ(2);
  @$pb.TagNumber(3)
  set image($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);
}

class ScreenMessage_Extra_Artist extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra.Artist',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
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
            : 'sex')
    ..hasRequiredFields = false;

  ScreenMessage_Extra_Artist._() : super();
  factory ScreenMessage_Extra_Artist({
    $core.String? name,
    $core.String? icon,
    $core.String? sex,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    return _result;
  }
  factory ScreenMessage_Extra_Artist.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra_Artist.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Artist clone() =>
      ScreenMessage_Extra_Artist()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra_Artist copyWith(
          void Function(ScreenMessage_Extra_Artist) updates) =>
      super.copyWith(
              (message) => updates(message as ScreenMessage_Extra_Artist))
          as ScreenMessage_Extra_Artist; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Artist create() => ScreenMessage_Extra_Artist._();
  ScreenMessage_Extra_Artist createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra_Artist> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra_Artist>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra_Artist getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra_Artist>(create);
  static ScreenMessage_Extra_Artist? _defaultInstance;

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
  $core.String get sex => $_getSZ(2);
  @$pb.TagNumber(3)
  set sex($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSex() => $_has(2);
  @$pb.TagNumber(3)
  void clearSex() => clearField(3);
}

class ScreenMessage_Extra extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.Extra',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icongray')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ka_white_icon')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'star_singer',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'app_platform')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title_new',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hitNum',
        $pb.PbFieldType.OU3,
        protoName: 'hitNum')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'emote')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defends',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_newer',
        $pb.PbFieldType.OU3)
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : '_uuid',
        protoName: 'new_uuid')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..m<$core.String, $core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftNumMap',
        protoName: 'giftNumMap',
        entryClassName: 'ScreenMessage.Extra.GiftNumMapEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OU3,
        packageName: const $pb.PackageName('system.screen.message'))
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'box-gift',
        $pb.PbFieldType.OU3,
        protoName: 'box_gift')
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bubble_front_color')
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'top',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'official_tag')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tyrant_msg_content')
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tyrant_msg',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_recall',
        $pb.PbFieldType.OU3)
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nameplate')
    ..aOS(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'beautiful_remark')
    ..a<$core.int>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip_new',
        $pb.PbFieldType.OU3)
    ..aOS(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..a<$core.int>(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..pPS(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vap_diy_gift_imgs')
    ..a<$core.int>(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'all_mic',
        $pb.PbFieldType.OU3)
    ..aOM<$0.Value>(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'juben_title',
        subBuilder: $0.Value.create)
    ..a<$core.int>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hit_num',
        $pb.PbFieldType.OU3,
        protoName: 'new_hit_num')
    ..aOB(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_animation')
    ..a<$core.int>(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'new_noble',
        $pb.PbFieldType.OU3)
    ..aOB(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'skipHistoryMsg',
        protoName: 'skipHistoryMsg')
    ..a<$core.int>(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'top_month',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diy_gift_sign_direction',
        $pb.PbFieldType.OU3)
    ..aOS(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'from_pub_type')
    ..aOS(
        38,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'little_alarm')
    ..a<$core.int>(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defend',
        $pb.PbFieldType.OU3)
    ..p<$core.int>(
        40,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toUid',
        $pb.PbFieldType.PU3,
        protoName: 'new_to_uid')
    ..a<$core.int>(
        41,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'online',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        42,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'top_week',
        $pb.PbFieldType.OU3)
    ..aOM<ScreenMessage_Extra_Truth>(
        43,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'truth',
        subBuilder: ScreenMessage_Extra_Truth.create)
    ..a<$core.int>(
        44,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'beautiful_id',
        $pb.PbFieldType.OU3)
    ..aOM<$0.Value>(
        45,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'star_verify_tag',
        subBuilder: $0.Value.create)
    ..aOB(
        46,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_live')
    ..aOS(
        47,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..a<$core.int>(
        48,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'now',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        49,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_grow_user',
        $pb.PbFieldType.OU3)
    ..aOS(
        50,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift_icon')
    ..aOS(
        51,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift_id')
    ..aOM<$0.Value>(
        52,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        subBuilder: $0.Value.create)
    ..aOM<ScreenMessage_Extra_BtnData>(
        53,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'btnData',
        protoName: 'btnData',
        subBuilder: ScreenMessage_Extra_BtnData.create)
    ..aOS(
        54,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boxName',
        protoName: 'boxName')
    ..aOS(
        55,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'badge_icon_in_use')
    ..aOS(
        56,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tyrant_msg_type')
    ..a<$core.int>(
        57,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'seven_new',
        $pb.PbFieldType.OU3)
    ..aOS(
        58,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'live_label_effect')
    ..a<$core.int>(
        59,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'agent_level',
        $pb.PbFieldType.OU3)
    ..aOS(
        60,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sub_type')
    ..a<$core.int>(
        61,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pay_level',
        $pb.PbFieldType.OU3)
    ..aOB(
        62,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_guess')
    ..a<$core.int>(
        63,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'emote_sender',
        $pb.PbFieldType.OU3)
    ..p<$core.int>(
        64,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'emote_data',
        $pb.PbFieldType.PU3)
    ..a<$core.int>(
        65,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'live_only',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        66,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..aOM<ScreenMessage_Extra_FansLabel>(
        67,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fans_label',
        subBuilder: ScreenMessage_Extra_FansLabel.create)
    ..aOS(
        68,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tag_text')
    ..aOS(
        69,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'puzzle_times_id')
    ..aOS(
        70,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..a<$core.int>(
        71,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knight_level',
        $pb.PbFieldType.OU3)
    ..aOB(
        72,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_cplink_aid')
    ..a<$core.int>(
        73,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        74,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'emote_position',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        75,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popularity_level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        76,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_dm',
        $pb.PbFieldType.OU3)
    ..aOS(
        77,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardTitle',
        protoName: 'awardTitle')
    ..aOM<$0.Value>(
        78,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        subBuilder: $0.Value.create)
    ..pPS(
        79,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vap_diy_gift_sign')
    ..aOM<ScreenMessage_Extra_Effect>(
        80,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'effect',
        subBuilder: ScreenMessage_Extra_Effect.create)
    ..a<$core.int>(
        81,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state_new',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        82,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'img_format',
        $pb.PbFieldType.OU3)
    ..aOS(
        83,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'live_label_header')
    ..aOB(
        84,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'consume_label')
    ..a<$core.int>(
        85,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'diy_gift_color',
        $pb.PbFieldType.O3)
    ..aOM<$0.Value>(
        86,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        subBuilder: $0.Value.create)
    ..aOS(
        87,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..a<$core.int>(
        88,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..aOS(
        89,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message_background')
    ..a<$core.int>(
        90,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'applause',
        $pb.PbFieldType.OU3)
    ..aOM<ScreenMessage_Extra_Gift>(
        91,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift',
        subBuilder: ScreenMessage_Extra_Gift.create)
    ..aOM<ScreenMessage_Extra_MsgData>(
        92,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msgData',
        protoName: 'msgData',
        subBuilder: ScreenMessage_Extra_MsgData.create)
    ..a<$core.int>(
        93,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'join_fans_group',
        $pb.PbFieldType.OU3)
    ..aOS(
        94,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image_type')
    ..aOS(
        95,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hit_id')
    ..aOS(
        96,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uuid')
    ..a<$core.int>(
        97,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hotNum',
        $pb.PbFieldType.OU3,
        protoName: 'hotNum')
    ..a<$core.int>(
        98,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'artist_level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        99,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'seven_love_tag',
        $pb.PbFieldType.OU3)
    ..aOS(
        100,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jukebox')
    ..a<$core.int>(
        101,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..aOB(
        102,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'recharge_label')
    ..aOS(
        103,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg_action')
    ..pPS(
        104,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icons')
    ..aOM<ScreenMessage_Extra_Mounts>(
        105,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mounts',
        subBuilder: ScreenMessage_Extra_Mounts.create)
    ..aOM<ScreenMessage_Extra_DefendLabel>(
        106,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defend_label',
        subBuilder: ScreenMessage_Extra_DefendLabel.create)
    ..aOS(
        107,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'live_label_bubble')
    ..pPS(
        108,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'highLightContent',
        protoName: 'highLightContent')
    ..a<$core.int>(
        109,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'from_pub_rid',
        $pb.PbFieldType.OU3)
    ..pc<ScreenMessage_Extra_Tags>(
        110,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tags',
        $pb.PbFieldType.PM,
        subBuilder: ScreenMessage_Extra_Tags.create)
    ..aOS(
        111,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'portraitUri',
        protoName: 'portraitUri')
    ..aOS(
        112,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tail_light')
    ..aOB(
        113,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_show_title')
    ..p<$core.int>(
        114,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uids',
        $pb.PbFieldType.PU3)
    ..aOB(
        115,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sign')
    ..aOS(
        116,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vedio')
    ..aOS(
        117,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knight_name')
    ..aOS(
        118,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subType',
        protoName: 'new_sub_type')
    ..aOS(
        119,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'to')
    ..aOS(
        120,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'purpose')
    ..aOS(
        121,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'background_new')
    ..a<$core.int>(
        122,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onceHitNum',
        $pb.PbFieldType.OU3,
        protoName: 'onceHitNum')
    ..pPS(
        123,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room_tags')
    ..a<$core.int>(
        124,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'to_uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        125,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'from')
    ..a<$core.int>(
        126,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'money',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        127,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pid',
        $pb.PbFieldType.OU3)
    ..aOM<ScreenMessage_Extra_At>(
        128,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'at',
        subBuilder: ScreenMessage_Extra_At.create)
    ..a<$core.int>(
        129,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'live_uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        130,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'master_uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        131,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..aOS(
        132,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knight_target_name')
    ..aOS(
        133,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'op')
    ..aOM<ScreenMessage_Extra_Data>(
        134,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ScreenMessage_Extra_Data.create)
    ..aOS(
        135,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'acute_icon')
    ..a<$core.int>(
        136,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prop_id',
        $pb.PbFieldType.OU3)
    ..aOS(
        137,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color')
    ..aOS(
        138,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room_name')
    ..aOS(
        139,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_name')
    ..pPS(
        140,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bg')
    ..aOM<ScreenMessage_Extra_Decorate>(
        141,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'decorate',
        subBuilder: ScreenMessage_Extra_Decorate.create)
    ..aOM<ScreenMessage_Extra_Artist>(
        142,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'artist',
        subBuilder: ScreenMessage_Extra_Artist.create)
    ..a<$core.int>(
        143,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pk_id',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        144,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total_num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        145,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vrid',
        $pb.PbFieldType.OU3)
    ..aOS(
        146,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'username')
    ..aOS(
        147,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'srv')
    ..a<$core.int>(
        148,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current_num',
        $pb.PbFieldType.OU3)
    ..aOS(
        149,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'game_name')
    ..a<$core.int>(
        150,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fee_type',
        $pb.PbFieldType.OU3)
    ..aOS(
        151,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tag')
    ..a<$core.int>(
        152,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ftype',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        153,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fvalue',
        $pb.PbFieldType.OU3)
    ..aOS(
        154,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'voice_url')
    ..a<$core.int>(
        155,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'glory_level',
        $pb.PbFieldType.O3)
    ..aOB(
        156,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_normal_glory')
    ..aOS(
        157,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gs_msg_action')
    ..aOM<ScreenMessage_Extra_Viability>(
        158,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'viability',
        subBuilder: ScreenMessage_Extra_Viability.create)
    ..a<$core.int>(
        159,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'from_outstanding_box',
        $pb.PbFieldType.OU3)
    ..aOM<ScreenMessage_Extra_OutstandingBox>(
        160,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'outstanding_box',
        subBuilder: ScreenMessage_Extra_OutstandingBox.create)
    ..aOM<ScreenMessage_Extra_GiftFirework>(
        161,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift_firework',
        subBuilder: ScreenMessage_Extra_GiftFirework.create)
    ..aOM<ScreenMessage_ScreenMessageRoomBirthdayGift>(
        162,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'birthday_room_gift',
        subBuilder: ScreenMessage_ScreenMessageRoomBirthdayGift.create)
    ..aOS(
        167,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'achieve_wear_icon')
    ..aOM<ScreenMessage_Extra_RedPacketV2>(
        168,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'red_packet_v2',
        subBuilder: ScreenMessage_Extra_RedPacketV2.create)
    ..pc<ScreenMessage_Extra_WarpUserBubbleTail>(
        201,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bubble_tail',
        $pb.PbFieldType.PM,
        subBuilder: ScreenMessage_Extra_WarpUserBubbleTail.create)
    ..aOS(
        202,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ktv')
    ..hasRequiredFields = false;

  ScreenMessage_Extra._() : super();
  factory ScreenMessage_Extra({
    $core.bool? icongray,
    $core.bool? kaWhiteIcon,
    $core.int? starSinger,
    $core.String? appPlatform,
    $core.int? titleNew,
    $core.int? hitNum,
    $core.String? emote,
    $core.int? defends,
    $core.String? name,
    $core.int? isNewer,
    $core.String? newUuid,
    $core.String? icon,
    $core.Map<$core.String, $core.int>? giftNumMap,
    $core.int? boxGift,
    $core.String? bubbleFrontColor,
    $core.int? top,
    $core.int? uid,
    $core.String? officialTag,
    $core.String? tyrantMsgContent,
    $core.String? frame,
    $core.int? tyrantMsg,
    $core.int? isRecall,
    $core.String? nameplate,
    $core.String? beautifulRemark,
    $core.int? vipNew,
    $core.String? message,
    $core.int? rid,
    $core.Iterable<$core.String>? vapDiyGiftImgs,
    $core.int? allMic,
    $0.Value? jubenTitle,
    $core.int? newHitNum,
    $core.bool? showAnimation,
    $core.int? newNoble,
    $core.bool? skipHistoryMsg,
    $core.int? topMonth,
    $core.int? diyGiftSignDirection,
    $core.String? fromPubType,
    $core.String? littleAlarm,
    $core.int? defend,
    $core.Iterable<$core.int>? newToUid,
    $core.int? online,
    $core.int? topWeek,
    ScreenMessage_Extra_Truth? truth,
    $core.int? beautifulId,
    $0.Value? starVerifyTag,
    $core.bool? isLive,
    $core.String? type,
    $core.int? now,
    $core.int? isGrowUser,
    $core.String? giftIcon,
    $core.String? giftId,
    $0.Value? price,
    ScreenMessage_Extra_BtnData? btnData,
    $core.String? boxName,
    $core.String? badgeIconInUse,
    $core.String? tyrantMsgType,
    $core.int? sevenNew,
    $core.String? liveLabelEffect,
    $core.int? agentLevel,
    $core.String? subType,
    $core.int? payLevel,
    $core.bool? isGuess,
    $core.int? emoteSender,
    $core.Iterable<$core.int>? emoteData,
    $core.int? liveOnly,
    $core.int? vip,
    ScreenMessage_Extra_FansLabel? fansLabel,
    $core.String? tagText,
    $core.String? puzzleTimesId,
    $core.String? image,
    $core.int? knightLevel,
    $core.bool? isCplinkAid,
    $core.int? title,
    $core.int? emotePosition,
    $core.int? popularityLevel,
    $core.int? isDm,
    $core.String? awardTitle,
    $0.Value? state,
    $core.Iterable<$core.String>? vapDiyGiftSign,
    ScreenMessage_Extra_Effect? effect,
    $core.int? stateNew,
    $core.int? imgFormat,
    $core.String? liveLabelHeader,
    $core.bool? consumeLabel,
    $core.int? diyGiftColor,
    $0.Value? id,
    $core.String? label,
    $core.int? version,
    $core.String? messageBackground,
    $core.int? applause,
    ScreenMessage_Extra_Gift? gift,
    ScreenMessage_Extra_MsgData? msgData,
    $core.int? joinFansGroup,
    $core.String? imageType,
    $core.String? hitId,
    $core.String? uuid,
    $core.int? hotNum,
    $core.int? artistLevel,
    $core.int? sevenLoveTag,
    $core.String? jukebox,
    $core.int? duration,
    $core.bool? rechargeLabel,
    $core.String? msgAction,
    $core.Iterable<$core.String>? icons,
    ScreenMessage_Extra_Mounts? mounts,
    ScreenMessage_Extra_DefendLabel? defendLabel,
    $core.String? liveLabelBubble,
    $core.Iterable<$core.String>? highLightContent,
    $core.int? fromPubRid,
    $core.Iterable<ScreenMessage_Extra_Tags>? tags,
    $core.String? portraitUri,
    $core.String? tailLight,
    $core.bool? isShowTitle,
    $core.Iterable<$core.int>? uids,
    $core.bool? sign,
    $core.String? vedio,
    $core.String? knightName,
    $core.String? newSubType,
    $core.String? to,
    $core.String? purpose,
    $core.String? backgroundNew,
    $core.int? onceHitNum,
    $core.Iterable<$core.String>? roomTags,
    $core.int? toUid,
    $core.String? from,
    $core.int? money,
    $core.int? pid,
    ScreenMessage_Extra_At? at,
    $core.int? liveUid,
    $core.int? masterUid,
    $core.String? msg,
    $core.String? knightTargetName,
    $core.String? op,
    ScreenMessage_Extra_Data? data,
    $core.String? acuteIcon,
    $core.int? propId,
    $core.String? color,
    $core.String? roomName,
    $core.String? showName,
    $core.Iterable<$core.String>? bg,
    ScreenMessage_Extra_Decorate? decorate,
    ScreenMessage_Extra_Artist? artist,
    $core.int? pkId,
    $core.int? totalNum,
    $core.int? vrid,
    $core.String? username,
    $core.String? srv,
    $core.int? currentNum,
    $core.String? gameName,
    $core.int? feeType,
    $core.String? tag,
    $core.int? ftype,
    $core.int? fvalue,
    $core.String? voiceUrl,
    $core.int? gloryLevel,
    $core.bool? isNormalGlory,
    $core.String? gsMsgAction,
    ScreenMessage_Extra_Viability? viability,
    $core.int? fromOutstandingBox,
    ScreenMessage_Extra_OutstandingBox? outstandingBox,
    ScreenMessage_Extra_GiftFirework? giftFirework,
    ScreenMessage_ScreenMessageRoomBirthdayGift? birthdayRoomGift,
    $core.String? achieveWearIcon,
    ScreenMessage_Extra_RedPacketV2? redPacketV2,
    $core.Iterable<ScreenMessage_Extra_WarpUserBubbleTail>? bubbleTail,
    $core.String? ktv,
  }) {
    final _result = create();
    if (icongray != null) {
      _result.icongray = icongray;
    }
    if (kaWhiteIcon != null) {
      _result.kaWhiteIcon = kaWhiteIcon;
    }
    if (starSinger != null) {
      _result.starSinger = starSinger;
    }
    if (appPlatform != null) {
      _result.appPlatform = appPlatform;
    }
    if (titleNew != null) {
      _result.titleNew = titleNew;
    }
    if (hitNum != null) {
      _result.hitNum = hitNum;
    }
    if (emote != null) {
      _result.emote = emote;
    }
    if (defends != null) {
      _result.defends = defends;
    }
    if (name != null) {
      _result.name = name;
    }
    if (isNewer != null) {
      _result.isNewer = isNewer;
    }
    if (newUuid != null) {
      _result.newUuid = newUuid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (giftNumMap != null) {
      _result.giftNumMap.addAll(giftNumMap);
    }
    if (boxGift != null) {
      _result.boxGift = boxGift;
    }
    if (bubbleFrontColor != null) {
      _result.bubbleFrontColor = bubbleFrontColor;
    }
    if (top != null) {
      _result.top = top;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (officialTag != null) {
      _result.officialTag = officialTag;
    }
    if (tyrantMsgContent != null) {
      _result.tyrantMsgContent = tyrantMsgContent;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (tyrantMsg != null) {
      _result.tyrantMsg = tyrantMsg;
    }
    if (isRecall != null) {
      _result.isRecall = isRecall;
    }
    if (nameplate != null) {
      _result.nameplate = nameplate;
    }
    if (beautifulRemark != null) {
      _result.beautifulRemark = beautifulRemark;
    }
    if (vipNew != null) {
      _result.vipNew = vipNew;
    }
    if (message != null) {
      _result.message = message;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (vapDiyGiftImgs != null) {
      _result.vapDiyGiftImgs.addAll(vapDiyGiftImgs);
    }
    if (allMic != null) {
      _result.allMic = allMic;
    }
    if (jubenTitle != null) {
      _result.jubenTitle = jubenTitle;
    }
    if (newHitNum != null) {
      _result.newHitNum = newHitNum;
    }
    if (showAnimation != null) {
      _result.showAnimation = showAnimation;
    }
    if (newNoble != null) {
      _result.newNoble = newNoble;
    }
    if (skipHistoryMsg != null) {
      _result.skipHistoryMsg = skipHistoryMsg;
    }
    if (topMonth != null) {
      _result.topMonth = topMonth;
    }
    if (diyGiftSignDirection != null) {
      _result.diyGiftSignDirection = diyGiftSignDirection;
    }
    if (fromPubType != null) {
      _result.fromPubType = fromPubType;
    }
    if (littleAlarm != null) {
      _result.littleAlarm = littleAlarm;
    }
    if (defend != null) {
      _result.defend = defend;
    }
    if (newToUid != null) {
      _result.newToUid.addAll(newToUid);
    }
    if (online != null) {
      _result.online = online;
    }
    if (topWeek != null) {
      _result.topWeek = topWeek;
    }
    if (truth != null) {
      _result.truth = truth;
    }
    if (beautifulId != null) {
      _result.beautifulId = beautifulId;
    }
    if (starVerifyTag != null) {
      _result.starVerifyTag = starVerifyTag;
    }
    if (isLive != null) {
      _result.isLive = isLive;
    }
    if (type != null) {
      _result.type = type;
    }
    if (now != null) {
      _result.now = now;
    }
    if (isGrowUser != null) {
      _result.isGrowUser = isGrowUser;
    }
    if (giftIcon != null) {
      _result.giftIcon = giftIcon;
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (price != null) {
      _result.price = price;
    }
    if (btnData != null) {
      _result.btnData = btnData;
    }
    if (boxName != null) {
      _result.boxName = boxName;
    }
    if (badgeIconInUse != null) {
      _result.badgeIconInUse = badgeIconInUse;
    }
    if (tyrantMsgType != null) {
      _result.tyrantMsgType = tyrantMsgType;
    }
    if (sevenNew != null) {
      _result.sevenNew = sevenNew;
    }
    if (liveLabelEffect != null) {
      _result.liveLabelEffect = liveLabelEffect;
    }
    if (agentLevel != null) {
      _result.agentLevel = agentLevel;
    }
    if (subType != null) {
      _result.subType = subType;
    }
    if (payLevel != null) {
      _result.payLevel = payLevel;
    }
    if (isGuess != null) {
      _result.isGuess = isGuess;
    }
    if (emoteSender != null) {
      _result.emoteSender = emoteSender;
    }
    if (emoteData != null) {
      _result.emoteData.addAll(emoteData);
    }
    if (liveOnly != null) {
      _result.liveOnly = liveOnly;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (fansLabel != null) {
      _result.fansLabel = fansLabel;
    }
    if (tagText != null) {
      _result.tagText = tagText;
    }
    if (puzzleTimesId != null) {
      _result.puzzleTimesId = puzzleTimesId;
    }
    if (image != null) {
      _result.image = image;
    }
    if (knightLevel != null) {
      _result.knightLevel = knightLevel;
    }
    if (isCplinkAid != null) {
      _result.isCplinkAid = isCplinkAid;
    }
    if (title != null) {
      _result.title = title;
    }
    if (emotePosition != null) {
      _result.emotePosition = emotePosition;
    }
    if (popularityLevel != null) {
      _result.popularityLevel = popularityLevel;
    }
    if (isDm != null) {
      _result.isDm = isDm;
    }
    if (awardTitle != null) {
      _result.awardTitle = awardTitle;
    }
    if (state != null) {
      _result.state = state;
    }
    if (vapDiyGiftSign != null) {
      _result.vapDiyGiftSign.addAll(vapDiyGiftSign);
    }
    if (effect != null) {
      _result.effect = effect;
    }
    if (stateNew != null) {
      _result.stateNew = stateNew;
    }
    if (imgFormat != null) {
      _result.imgFormat = imgFormat;
    }
    if (liveLabelHeader != null) {
      _result.liveLabelHeader = liveLabelHeader;
    }
    if (consumeLabel != null) {
      _result.consumeLabel = consumeLabel;
    }
    if (diyGiftColor != null) {
      _result.diyGiftColor = diyGiftColor;
    }
    if (id != null) {
      _result.id = id;
    }
    if (label != null) {
      _result.label = label;
    }
    if (version != null) {
      _result.version = version;
    }
    if (messageBackground != null) {
      _result.messageBackground = messageBackground;
    }
    if (applause != null) {
      _result.applause = applause;
    }
    if (gift != null) {
      _result.gift = gift;
    }
    if (msgData != null) {
      _result.msgData = msgData;
    }
    if (joinFansGroup != null) {
      _result.joinFansGroup = joinFansGroup;
    }
    if (imageType != null) {
      _result.imageType = imageType;
    }
    if (hitId != null) {
      _result.hitId = hitId;
    }
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (hotNum != null) {
      _result.hotNum = hotNum;
    }
    if (artistLevel != null) {
      _result.artistLevel = artistLevel;
    }
    if (sevenLoveTag != null) {
      _result.sevenLoveTag = sevenLoveTag;
    }
    if (jukebox != null) {
      _result.jukebox = jukebox;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (rechargeLabel != null) {
      _result.rechargeLabel = rechargeLabel;
    }
    if (msgAction != null) {
      _result.msgAction = msgAction;
    }
    if (icons != null) {
      _result.icons.addAll(icons);
    }
    if (mounts != null) {
      _result.mounts = mounts;
    }
    if (defendLabel != null) {
      _result.defendLabel = defendLabel;
    }
    if (liveLabelBubble != null) {
      _result.liveLabelBubble = liveLabelBubble;
    }
    if (highLightContent != null) {
      _result.highLightContent.addAll(highLightContent);
    }
    if (fromPubRid != null) {
      _result.fromPubRid = fromPubRid;
    }
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    if (portraitUri != null) {
      _result.portraitUri = portraitUri;
    }
    if (tailLight != null) {
      _result.tailLight = tailLight;
    }
    if (isShowTitle != null) {
      _result.isShowTitle = isShowTitle;
    }
    if (uids != null) {
      _result.uids.addAll(uids);
    }
    if (sign != null) {
      _result.sign = sign;
    }
    if (vedio != null) {
      _result.vedio = vedio;
    }
    if (knightName != null) {
      _result.knightName = knightName;
    }
    if (newSubType != null) {
      _result.newSubType = newSubType;
    }
    if (to != null) {
      _result.to = to;
    }
    if (purpose != null) {
      _result.purpose = purpose;
    }
    if (backgroundNew != null) {
      _result.backgroundNew = backgroundNew;
    }
    if (onceHitNum != null) {
      _result.onceHitNum = onceHitNum;
    }
    if (roomTags != null) {
      _result.roomTags.addAll(roomTags);
    }
    if (toUid != null) {
      _result.toUid = toUid;
    }
    if (from != null) {
      _result.from = from;
    }
    if (money != null) {
      _result.money = money;
    }
    if (pid != null) {
      _result.pid = pid;
    }
    if (at != null) {
      _result.at = at;
    }
    if (liveUid != null) {
      _result.liveUid = liveUid;
    }
    if (masterUid != null) {
      _result.masterUid = masterUid;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (knightTargetName != null) {
      _result.knightTargetName = knightTargetName;
    }
    if (op != null) {
      _result.op = op;
    }
    if (data != null) {
      _result.data = data;
    }
    if (acuteIcon != null) {
      _result.acuteIcon = acuteIcon;
    }
    if (propId != null) {
      _result.propId = propId;
    }
    if (color != null) {
      _result.color = color;
    }
    if (roomName != null) {
      _result.roomName = roomName;
    }
    if (showName != null) {
      _result.showName = showName;
    }
    if (bg != null) {
      _result.bg.addAll(bg);
    }
    if (decorate != null) {
      _result.decorate = decorate;
    }
    if (artist != null) {
      _result.artist = artist;
    }
    if (pkId != null) {
      _result.pkId = pkId;
    }
    if (totalNum != null) {
      _result.totalNum = totalNum;
    }
    if (vrid != null) {
      _result.vrid = vrid;
    }
    if (username != null) {
      _result.username = username;
    }
    if (srv != null) {
      _result.srv = srv;
    }
    if (currentNum != null) {
      _result.currentNum = currentNum;
    }
    if (gameName != null) {
      _result.gameName = gameName;
    }
    if (feeType != null) {
      _result.feeType = feeType;
    }
    if (tag != null) {
      _result.tag = tag;
    }
    if (ftype != null) {
      _result.ftype = ftype;
    }
    if (fvalue != null) {
      _result.fvalue = fvalue;
    }
    if (voiceUrl != null) {
      _result.voiceUrl = voiceUrl;
    }
    if (gloryLevel != null) {
      _result.gloryLevel = gloryLevel;
    }
    if (isNormalGlory != null) {
      _result.isNormalGlory = isNormalGlory;
    }
    if (gsMsgAction != null) {
      _result.gsMsgAction = gsMsgAction;
    }
    if (viability != null) {
      _result.viability = viability;
    }
    if (fromOutstandingBox != null) {
      _result.fromOutstandingBox = fromOutstandingBox;
    }
    if (outstandingBox != null) {
      _result.outstandingBox = outstandingBox;
    }
    if (giftFirework != null) {
      _result.giftFirework = giftFirework;
    }
    if (birthdayRoomGift != null) {
      _result.birthdayRoomGift = birthdayRoomGift;
    }
    if (achieveWearIcon != null) {
      _result.achieveWearIcon = achieveWearIcon;
    }
    if (redPacketV2 != null) {
      _result.redPacketV2 = redPacketV2;
    }
    if (bubbleTail != null) {
      _result.bubbleTail.addAll(bubbleTail);
    }
    if (ktv != null) {
      _result.ktv = ktv;
    }
    return _result;
  }
  factory ScreenMessage_Extra.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_Extra.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra clone() => ScreenMessage_Extra()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_Extra copyWith(void Function(ScreenMessage_Extra) updates) =>
      super.copyWith((message) => updates(message as ScreenMessage_Extra))
          as ScreenMessage_Extra; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra create() => ScreenMessage_Extra._();
  ScreenMessage_Extra createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_Extra> createRepeated() =>
      $pb.PbList<ScreenMessage_Extra>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_Extra getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_Extra>(create);
  static ScreenMessage_Extra? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get icongray => $_getBF(0);
  @$pb.TagNumber(1)
  set icongray($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIcongray() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcongray() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get kaWhiteIcon => $_getBF(1);
  @$pb.TagNumber(2)
  set kaWhiteIcon($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasKaWhiteIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearKaWhiteIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get starSinger => $_getIZ(2);
  @$pb.TagNumber(3)
  set starSinger($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasStarSinger() => $_has(2);
  @$pb.TagNumber(3)
  void clearStarSinger() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get appPlatform => $_getSZ(3);
  @$pb.TagNumber(4)
  set appPlatform($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAppPlatform() => $_has(3);
  @$pb.TagNumber(4)
  void clearAppPlatform() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get titleNew => $_getIZ(4);
  @$pb.TagNumber(5)
  set titleNew($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTitleNew() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitleNew() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get hitNum => $_getIZ(5);
  @$pb.TagNumber(6)
  set hitNum($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasHitNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearHitNum() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get emote => $_getSZ(6);
  @$pb.TagNumber(7)
  set emote($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasEmote() => $_has(6);
  @$pb.TagNumber(7)
  void clearEmote() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get defends => $_getIZ(7);
  @$pb.TagNumber(8)
  set defends($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDefends() => $_has(7);
  @$pb.TagNumber(8)
  void clearDefends() => clearField(8);

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
  $core.int get isNewer => $_getIZ(9);
  @$pb.TagNumber(10)
  set isNewer($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasIsNewer() => $_has(9);
  @$pb.TagNumber(10)
  void clearIsNewer() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get newUuid => $_getSZ(10);
  @$pb.TagNumber(11)
  set newUuid($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasNewUuid() => $_has(10);
  @$pb.TagNumber(11)
  void clearNewUuid() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get icon => $_getSZ(11);
  @$pb.TagNumber(12)
  set icon($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasIcon() => $_has(11);
  @$pb.TagNumber(12)
  void clearIcon() => clearField(12);

  @$pb.TagNumber(13)
  $core.Map<$core.String, $core.int> get giftNumMap => $_getMap(12);

  @$pb.TagNumber(14)
  $core.int get boxGift => $_getIZ(13);
  @$pb.TagNumber(14)
  set boxGift($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasBoxGift() => $_has(13);
  @$pb.TagNumber(14)
  void clearBoxGift() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get bubbleFrontColor => $_getSZ(14);
  @$pb.TagNumber(15)
  set bubbleFrontColor($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasBubbleFrontColor() => $_has(14);
  @$pb.TagNumber(15)
  void clearBubbleFrontColor() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get top => $_getIZ(15);
  @$pb.TagNumber(16)
  set top($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasTop() => $_has(15);
  @$pb.TagNumber(16)
  void clearTop() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get uid => $_getIZ(16);
  @$pb.TagNumber(17)
  set uid($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasUid() => $_has(16);
  @$pb.TagNumber(17)
  void clearUid() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get officialTag => $_getSZ(17);
  @$pb.TagNumber(18)
  set officialTag($core.String v) {
    $_setString(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasOfficialTag() => $_has(17);
  @$pb.TagNumber(18)
  void clearOfficialTag() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get tyrantMsgContent => $_getSZ(18);
  @$pb.TagNumber(19)
  set tyrantMsgContent($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasTyrantMsgContent() => $_has(18);
  @$pb.TagNumber(19)
  void clearTyrantMsgContent() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get frame => $_getSZ(19);
  @$pb.TagNumber(20)
  set frame($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasFrame() => $_has(19);
  @$pb.TagNumber(20)
  void clearFrame() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get tyrantMsg => $_getIZ(20);
  @$pb.TagNumber(21)
  set tyrantMsg($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasTyrantMsg() => $_has(20);
  @$pb.TagNumber(21)
  void clearTyrantMsg() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get isRecall => $_getIZ(21);
  @$pb.TagNumber(22)
  set isRecall($core.int v) {
    $_setUnsignedInt32(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasIsRecall() => $_has(21);
  @$pb.TagNumber(22)
  void clearIsRecall() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get nameplate => $_getSZ(22);
  @$pb.TagNumber(23)
  set nameplate($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasNameplate() => $_has(22);
  @$pb.TagNumber(23)
  void clearNameplate() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get beautifulRemark => $_getSZ(23);
  @$pb.TagNumber(24)
  set beautifulRemark($core.String v) {
    $_setString(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasBeautifulRemark() => $_has(23);
  @$pb.TagNumber(24)
  void clearBeautifulRemark() => clearField(24);

  @$pb.TagNumber(25)
  $core.int get vipNew => $_getIZ(24);
  @$pb.TagNumber(25)
  set vipNew($core.int v) {
    $_setUnsignedInt32(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasVipNew() => $_has(24);
  @$pb.TagNumber(25)
  void clearVipNew() => clearField(25);

  @$pb.TagNumber(26)
  $core.String get message => $_getSZ(25);
  @$pb.TagNumber(26)
  set message($core.String v) {
    $_setString(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasMessage() => $_has(25);
  @$pb.TagNumber(26)
  void clearMessage() => clearField(26);

  @$pb.TagNumber(27)
  $core.int get rid => $_getIZ(26);
  @$pb.TagNumber(27)
  set rid($core.int v) {
    $_setUnsignedInt32(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasRid() => $_has(26);
  @$pb.TagNumber(27)
  void clearRid() => clearField(27);

  @$pb.TagNumber(28)
  $core.List<$core.String> get vapDiyGiftImgs => $_getList(27);

  @$pb.TagNumber(29)
  $core.int get allMic => $_getIZ(28);
  @$pb.TagNumber(29)
  set allMic($core.int v) {
    $_setUnsignedInt32(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasAllMic() => $_has(28);
  @$pb.TagNumber(29)
  void clearAllMic() => clearField(29);

  @$pb.TagNumber(30)
  $0.Value get jubenTitle => $_getN(29);
  @$pb.TagNumber(30)
  set jubenTitle($0.Value v) {
    setField(30, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasJubenTitle() => $_has(29);
  @$pb.TagNumber(30)
  void clearJubenTitle() => clearField(30);
  @$pb.TagNumber(30)
  $0.Value ensureJubenTitle() => $_ensure(29);

  @$pb.TagNumber(31)
  $core.int get newHitNum => $_getIZ(30);
  @$pb.TagNumber(31)
  set newHitNum($core.int v) {
    $_setUnsignedInt32(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasNewHitNum() => $_has(30);
  @$pb.TagNumber(31)
  void clearNewHitNum() => clearField(31);

  @$pb.TagNumber(32)
  $core.bool get showAnimation => $_getBF(31);
  @$pb.TagNumber(32)
  set showAnimation($core.bool v) {
    $_setBool(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasShowAnimation() => $_has(31);
  @$pb.TagNumber(32)
  void clearShowAnimation() => clearField(32);

  @$pb.TagNumber(33)
  $core.int get newNoble => $_getIZ(32);
  @$pb.TagNumber(33)
  set newNoble($core.int v) {
    $_setUnsignedInt32(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasNewNoble() => $_has(32);
  @$pb.TagNumber(33)
  void clearNewNoble() => clearField(33);

  @$pb.TagNumber(34)
  $core.bool get skipHistoryMsg => $_getBF(33);
  @$pb.TagNumber(34)
  set skipHistoryMsg($core.bool v) {
    $_setBool(33, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasSkipHistoryMsg() => $_has(33);
  @$pb.TagNumber(34)
  void clearSkipHistoryMsg() => clearField(34);

  @$pb.TagNumber(35)
  $core.int get topMonth => $_getIZ(34);
  @$pb.TagNumber(35)
  set topMonth($core.int v) {
    $_setUnsignedInt32(34, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasTopMonth() => $_has(34);
  @$pb.TagNumber(35)
  void clearTopMonth() => clearField(35);

  @$pb.TagNumber(36)
  $core.int get diyGiftSignDirection => $_getIZ(35);
  @$pb.TagNumber(36)
  set diyGiftSignDirection($core.int v) {
    $_setUnsignedInt32(35, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasDiyGiftSignDirection() => $_has(35);
  @$pb.TagNumber(36)
  void clearDiyGiftSignDirection() => clearField(36);

  @$pb.TagNumber(37)
  $core.String get fromPubType => $_getSZ(36);
  @$pb.TagNumber(37)
  set fromPubType($core.String v) {
    $_setString(36, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasFromPubType() => $_has(36);
  @$pb.TagNumber(37)
  void clearFromPubType() => clearField(37);

  @$pb.TagNumber(38)
  $core.String get littleAlarm => $_getSZ(37);
  @$pb.TagNumber(38)
  set littleAlarm($core.String v) {
    $_setString(37, v);
  }

  @$pb.TagNumber(38)
  $core.bool hasLittleAlarm() => $_has(37);
  @$pb.TagNumber(38)
  void clearLittleAlarm() => clearField(38);

  @$pb.TagNumber(39)
  $core.int get defend => $_getIZ(38);
  @$pb.TagNumber(39)
  set defend($core.int v) {
    $_setUnsignedInt32(38, v);
  }

  @$pb.TagNumber(39)
  $core.bool hasDefend() => $_has(38);
  @$pb.TagNumber(39)
  void clearDefend() => clearField(39);

  @$pb.TagNumber(40)
  $core.List<$core.int> get newToUid => $_getList(39);

  @$pb.TagNumber(41)
  $core.int get online => $_getIZ(40);
  @$pb.TagNumber(41)
  set online($core.int v) {
    $_setUnsignedInt32(40, v);
  }

  @$pb.TagNumber(41)
  $core.bool hasOnline() => $_has(40);
  @$pb.TagNumber(41)
  void clearOnline() => clearField(41);

  @$pb.TagNumber(42)
  $core.int get topWeek => $_getIZ(41);
  @$pb.TagNumber(42)
  set topWeek($core.int v) {
    $_setUnsignedInt32(41, v);
  }

  @$pb.TagNumber(42)
  $core.bool hasTopWeek() => $_has(41);
  @$pb.TagNumber(42)
  void clearTopWeek() => clearField(42);

  @$pb.TagNumber(43)
  ScreenMessage_Extra_Truth get truth => $_getN(42);
  @$pb.TagNumber(43)
  set truth(ScreenMessage_Extra_Truth v) {
    setField(43, v);
  }

  @$pb.TagNumber(43)
  $core.bool hasTruth() => $_has(42);
  @$pb.TagNumber(43)
  void clearTruth() => clearField(43);
  @$pb.TagNumber(43)
  ScreenMessage_Extra_Truth ensureTruth() => $_ensure(42);

  @$pb.TagNumber(44)
  $core.int get beautifulId => $_getIZ(43);
  @$pb.TagNumber(44)
  set beautifulId($core.int v) {
    $_setUnsignedInt32(43, v);
  }

  @$pb.TagNumber(44)
  $core.bool hasBeautifulId() => $_has(43);
  @$pb.TagNumber(44)
  void clearBeautifulId() => clearField(44);

  @$pb.TagNumber(45)
  $0.Value get starVerifyTag => $_getN(44);
  @$pb.TagNumber(45)
  set starVerifyTag($0.Value v) {
    setField(45, v);
  }

  @$pb.TagNumber(45)
  $core.bool hasStarVerifyTag() => $_has(44);
  @$pb.TagNumber(45)
  void clearStarVerifyTag() => clearField(45);
  @$pb.TagNumber(45)
  $0.Value ensureStarVerifyTag() => $_ensure(44);

  @$pb.TagNumber(46)
  $core.bool get isLive => $_getBF(45);
  @$pb.TagNumber(46)
  set isLive($core.bool v) {
    $_setBool(45, v);
  }

  @$pb.TagNumber(46)
  $core.bool hasIsLive() => $_has(45);
  @$pb.TagNumber(46)
  void clearIsLive() => clearField(46);

  @$pb.TagNumber(47)
  $core.String get type => $_getSZ(46);
  @$pb.TagNumber(47)
  set type($core.String v) {
    $_setString(46, v);
  }

  @$pb.TagNumber(47)
  $core.bool hasType() => $_has(46);
  @$pb.TagNumber(47)
  void clearType() => clearField(47);

  @$pb.TagNumber(48)
  $core.int get now => $_getIZ(47);
  @$pb.TagNumber(48)
  set now($core.int v) {
    $_setUnsignedInt32(47, v);
  }

  @$pb.TagNumber(48)
  $core.bool hasNow() => $_has(47);
  @$pb.TagNumber(48)
  void clearNow() => clearField(48);

  @$pb.TagNumber(49)
  $core.int get isGrowUser => $_getIZ(48);
  @$pb.TagNumber(49)
  set isGrowUser($core.int v) {
    $_setUnsignedInt32(48, v);
  }

  @$pb.TagNumber(49)
  $core.bool hasIsGrowUser() => $_has(48);
  @$pb.TagNumber(49)
  void clearIsGrowUser() => clearField(49);

  @$pb.TagNumber(50)
  $core.String get giftIcon => $_getSZ(49);
  @$pb.TagNumber(50)
  set giftIcon($core.String v) {
    $_setString(49, v);
  }

  @$pb.TagNumber(50)
  $core.bool hasGiftIcon() => $_has(49);
  @$pb.TagNumber(50)
  void clearGiftIcon() => clearField(50);

  @$pb.TagNumber(51)
  $core.String get giftId => $_getSZ(50);
  @$pb.TagNumber(51)
  set giftId($core.String v) {
    $_setString(50, v);
  }

  @$pb.TagNumber(51)
  $core.bool hasGiftId() => $_has(50);
  @$pb.TagNumber(51)
  void clearGiftId() => clearField(51);

  @$pb.TagNumber(52)
  $0.Value get price => $_getN(51);
  @$pb.TagNumber(52)
  set price($0.Value v) {
    setField(52, v);
  }

  @$pb.TagNumber(52)
  $core.bool hasPrice() => $_has(51);
  @$pb.TagNumber(52)
  void clearPrice() => clearField(52);
  @$pb.TagNumber(52)
  $0.Value ensurePrice() => $_ensure(51);

  @$pb.TagNumber(53)
  ScreenMessage_Extra_BtnData get btnData => $_getN(52);
  @$pb.TagNumber(53)
  set btnData(ScreenMessage_Extra_BtnData v) {
    setField(53, v);
  }

  @$pb.TagNumber(53)
  $core.bool hasBtnData() => $_has(52);
  @$pb.TagNumber(53)
  void clearBtnData() => clearField(53);
  @$pb.TagNumber(53)
  ScreenMessage_Extra_BtnData ensureBtnData() => $_ensure(52);

  @$pb.TagNumber(54)
  $core.String get boxName => $_getSZ(53);
  @$pb.TagNumber(54)
  set boxName($core.String v) {
    $_setString(53, v);
  }

  @$pb.TagNumber(54)
  $core.bool hasBoxName() => $_has(53);
  @$pb.TagNumber(54)
  void clearBoxName() => clearField(54);

  @$pb.TagNumber(55)
  $core.String get badgeIconInUse => $_getSZ(54);
  @$pb.TagNumber(55)
  set badgeIconInUse($core.String v) {
    $_setString(54, v);
  }

  @$pb.TagNumber(55)
  $core.bool hasBadgeIconInUse() => $_has(54);
  @$pb.TagNumber(55)
  void clearBadgeIconInUse() => clearField(55);

  @$pb.TagNumber(56)
  $core.String get tyrantMsgType => $_getSZ(55);
  @$pb.TagNumber(56)
  set tyrantMsgType($core.String v) {
    $_setString(55, v);
  }

  @$pb.TagNumber(56)
  $core.bool hasTyrantMsgType() => $_has(55);
  @$pb.TagNumber(56)
  void clearTyrantMsgType() => clearField(56);

  @$pb.TagNumber(57)
  $core.int get sevenNew => $_getIZ(56);
  @$pb.TagNumber(57)
  set sevenNew($core.int v) {
    $_setUnsignedInt32(56, v);
  }

  @$pb.TagNumber(57)
  $core.bool hasSevenNew() => $_has(56);
  @$pb.TagNumber(57)
  void clearSevenNew() => clearField(57);

  @$pb.TagNumber(58)
  $core.String get liveLabelEffect => $_getSZ(57);
  @$pb.TagNumber(58)
  set liveLabelEffect($core.String v) {
    $_setString(57, v);
  }

  @$pb.TagNumber(58)
  $core.bool hasLiveLabelEffect() => $_has(57);
  @$pb.TagNumber(58)
  void clearLiveLabelEffect() => clearField(58);

  @$pb.TagNumber(59)
  $core.int get agentLevel => $_getIZ(58);
  @$pb.TagNumber(59)
  set agentLevel($core.int v) {
    $_setUnsignedInt32(58, v);
  }

  @$pb.TagNumber(59)
  $core.bool hasAgentLevel() => $_has(58);
  @$pb.TagNumber(59)
  void clearAgentLevel() => clearField(59);

  @$pb.TagNumber(60)
  $core.String get subType => $_getSZ(59);
  @$pb.TagNumber(60)
  set subType($core.String v) {
    $_setString(59, v);
  }

  @$pb.TagNumber(60)
  $core.bool hasSubType() => $_has(59);
  @$pb.TagNumber(60)
  void clearSubType() => clearField(60);

  @$pb.TagNumber(61)
  $core.int get payLevel => $_getIZ(60);
  @$pb.TagNumber(61)
  set payLevel($core.int v) {
    $_setUnsignedInt32(60, v);
  }

  @$pb.TagNumber(61)
  $core.bool hasPayLevel() => $_has(60);
  @$pb.TagNumber(61)
  void clearPayLevel() => clearField(61);

  @$pb.TagNumber(62)
  $core.bool get isGuess => $_getBF(61);
  @$pb.TagNumber(62)
  set isGuess($core.bool v) {
    $_setBool(61, v);
  }

  @$pb.TagNumber(62)
  $core.bool hasIsGuess() => $_has(61);
  @$pb.TagNumber(62)
  void clearIsGuess() => clearField(62);

  @$pb.TagNumber(63)
  $core.int get emoteSender => $_getIZ(62);
  @$pb.TagNumber(63)
  set emoteSender($core.int v) {
    $_setUnsignedInt32(62, v);
  }

  @$pb.TagNumber(63)
  $core.bool hasEmoteSender() => $_has(62);
  @$pb.TagNumber(63)
  void clearEmoteSender() => clearField(63);

  @$pb.TagNumber(64)
  $core.List<$core.int> get emoteData => $_getList(63);

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
  $core.int get vip => $_getIZ(65);
  @$pb.TagNumber(66)
  set vip($core.int v) {
    $_setUnsignedInt32(65, v);
  }

  @$pb.TagNumber(66)
  $core.bool hasVip() => $_has(65);
  @$pb.TagNumber(66)
  void clearVip() => clearField(66);

  @$pb.TagNumber(67)
  ScreenMessage_Extra_FansLabel get fansLabel => $_getN(66);
  @$pb.TagNumber(67)
  set fansLabel(ScreenMessage_Extra_FansLabel v) {
    setField(67, v);
  }

  @$pb.TagNumber(67)
  $core.bool hasFansLabel() => $_has(66);
  @$pb.TagNumber(67)
  void clearFansLabel() => clearField(67);
  @$pb.TagNumber(67)
  ScreenMessage_Extra_FansLabel ensureFansLabel() => $_ensure(66);

  @$pb.TagNumber(68)
  $core.String get tagText => $_getSZ(67);
  @$pb.TagNumber(68)
  set tagText($core.String v) {
    $_setString(67, v);
  }

  @$pb.TagNumber(68)
  $core.bool hasTagText() => $_has(67);
  @$pb.TagNumber(68)
  void clearTagText() => clearField(68);

  @$pb.TagNumber(69)
  $core.String get puzzleTimesId => $_getSZ(68);
  @$pb.TagNumber(69)
  set puzzleTimesId($core.String v) {
    $_setString(68, v);
  }

  @$pb.TagNumber(69)
  $core.bool hasPuzzleTimesId() => $_has(68);
  @$pb.TagNumber(69)
  void clearPuzzleTimesId() => clearField(69);

  @$pb.TagNumber(70)
  $core.String get image => $_getSZ(69);
  @$pb.TagNumber(70)
  set image($core.String v) {
    $_setString(69, v);
  }

  @$pb.TagNumber(70)
  $core.bool hasImage() => $_has(69);
  @$pb.TagNumber(70)
  void clearImage() => clearField(70);

  @$pb.TagNumber(71)
  $core.int get knightLevel => $_getIZ(70);
  @$pb.TagNumber(71)
  set knightLevel($core.int v) {
    $_setUnsignedInt32(70, v);
  }

  @$pb.TagNumber(71)
  $core.bool hasKnightLevel() => $_has(70);
  @$pb.TagNumber(71)
  void clearKnightLevel() => clearField(71);

  @$pb.TagNumber(72)
  $core.bool get isCplinkAid => $_getBF(71);
  @$pb.TagNumber(72)
  set isCplinkAid($core.bool v) {
    $_setBool(71, v);
  }

  @$pb.TagNumber(72)
  $core.bool hasIsCplinkAid() => $_has(71);
  @$pb.TagNumber(72)
  void clearIsCplinkAid() => clearField(72);

  @$pb.TagNumber(73)
  $core.int get title => $_getIZ(72);
  @$pb.TagNumber(73)
  set title($core.int v) {
    $_setUnsignedInt32(72, v);
  }

  @$pb.TagNumber(73)
  $core.bool hasTitle() => $_has(72);
  @$pb.TagNumber(73)
  void clearTitle() => clearField(73);

  @$pb.TagNumber(74)
  $core.int get emotePosition => $_getIZ(73);
  @$pb.TagNumber(74)
  set emotePosition($core.int v) {
    $_setUnsignedInt32(73, v);
  }

  @$pb.TagNumber(74)
  $core.bool hasEmotePosition() => $_has(73);
  @$pb.TagNumber(74)
  void clearEmotePosition() => clearField(74);

  @$pb.TagNumber(75)
  $core.int get popularityLevel => $_getIZ(74);
  @$pb.TagNumber(75)
  set popularityLevel($core.int v) {
    $_setUnsignedInt32(74, v);
  }

  @$pb.TagNumber(75)
  $core.bool hasPopularityLevel() => $_has(74);
  @$pb.TagNumber(75)
  void clearPopularityLevel() => clearField(75);

  @$pb.TagNumber(76)
  $core.int get isDm => $_getIZ(75);
  @$pb.TagNumber(76)
  set isDm($core.int v) {
    $_setUnsignedInt32(75, v);
  }

  @$pb.TagNumber(76)
  $core.bool hasIsDm() => $_has(75);
  @$pb.TagNumber(76)
  void clearIsDm() => clearField(76);

  @$pb.TagNumber(77)
  $core.String get awardTitle => $_getSZ(76);
  @$pb.TagNumber(77)
  set awardTitle($core.String v) {
    $_setString(76, v);
  }

  @$pb.TagNumber(77)
  $core.bool hasAwardTitle() => $_has(76);
  @$pb.TagNumber(77)
  void clearAwardTitle() => clearField(77);

  @$pb.TagNumber(78)
  $0.Value get state => $_getN(77);
  @$pb.TagNumber(78)
  set state($0.Value v) {
    setField(78, v);
  }

  @$pb.TagNumber(78)
  $core.bool hasState() => $_has(77);
  @$pb.TagNumber(78)
  void clearState() => clearField(78);
  @$pb.TagNumber(78)
  $0.Value ensureState() => $_ensure(77);

  @$pb.TagNumber(79)
  $core.List<$core.String> get vapDiyGiftSign => $_getList(78);

  @$pb.TagNumber(80)
  ScreenMessage_Extra_Effect get effect => $_getN(79);
  @$pb.TagNumber(80)
  set effect(ScreenMessage_Extra_Effect v) {
    setField(80, v);
  }

  @$pb.TagNumber(80)
  $core.bool hasEffect() => $_has(79);
  @$pb.TagNumber(80)
  void clearEffect() => clearField(80);
  @$pb.TagNumber(80)
  ScreenMessage_Extra_Effect ensureEffect() => $_ensure(79);

  @$pb.TagNumber(81)
  $core.int get stateNew => $_getIZ(80);
  @$pb.TagNumber(81)
  set stateNew($core.int v) {
    $_setUnsignedInt32(80, v);
  }

  @$pb.TagNumber(81)
  $core.bool hasStateNew() => $_has(80);
  @$pb.TagNumber(81)
  void clearStateNew() => clearField(81);

  @$pb.TagNumber(82)
  $core.int get imgFormat => $_getIZ(81);
  @$pb.TagNumber(82)
  set imgFormat($core.int v) {
    $_setUnsignedInt32(81, v);
  }

  @$pb.TagNumber(82)
  $core.bool hasImgFormat() => $_has(81);
  @$pb.TagNumber(82)
  void clearImgFormat() => clearField(82);

  @$pb.TagNumber(83)
  $core.String get liveLabelHeader => $_getSZ(82);
  @$pb.TagNumber(83)
  set liveLabelHeader($core.String v) {
    $_setString(82, v);
  }

  @$pb.TagNumber(83)
  $core.bool hasLiveLabelHeader() => $_has(82);
  @$pb.TagNumber(83)
  void clearLiveLabelHeader() => clearField(83);

  @$pb.TagNumber(84)
  $core.bool get consumeLabel => $_getBF(83);
  @$pb.TagNumber(84)
  set consumeLabel($core.bool v) {
    $_setBool(83, v);
  }

  @$pb.TagNumber(84)
  $core.bool hasConsumeLabel() => $_has(83);
  @$pb.TagNumber(84)
  void clearConsumeLabel() => clearField(84);

  @$pb.TagNumber(85)
  $core.int get diyGiftColor => $_getIZ(84);
  @$pb.TagNumber(85)
  set diyGiftColor($core.int v) {
    $_setSignedInt32(84, v);
  }

  @$pb.TagNumber(85)
  $core.bool hasDiyGiftColor() => $_has(84);
  @$pb.TagNumber(85)
  void clearDiyGiftColor() => clearField(85);

  @$pb.TagNumber(86)
  $0.Value get id => $_getN(85);
  @$pb.TagNumber(86)
  set id($0.Value v) {
    setField(86, v);
  }

  @$pb.TagNumber(86)
  $core.bool hasId() => $_has(85);
  @$pb.TagNumber(86)
  void clearId() => clearField(86);
  @$pb.TagNumber(86)
  $0.Value ensureId() => $_ensure(85);

  @$pb.TagNumber(87)
  $core.String get label => $_getSZ(86);
  @$pb.TagNumber(87)
  set label($core.String v) {
    $_setString(86, v);
  }

  @$pb.TagNumber(87)
  $core.bool hasLabel() => $_has(86);
  @$pb.TagNumber(87)
  void clearLabel() => clearField(87);

  @$pb.TagNumber(88)
  $core.int get version => $_getIZ(87);
  @$pb.TagNumber(88)
  set version($core.int v) {
    $_setUnsignedInt32(87, v);
  }

  @$pb.TagNumber(88)
  $core.bool hasVersion() => $_has(87);
  @$pb.TagNumber(88)
  void clearVersion() => clearField(88);

  @$pb.TagNumber(89)
  $core.String get messageBackground => $_getSZ(88);
  @$pb.TagNumber(89)
  set messageBackground($core.String v) {
    $_setString(88, v);
  }

  @$pb.TagNumber(89)
  $core.bool hasMessageBackground() => $_has(88);
  @$pb.TagNumber(89)
  void clearMessageBackground() => clearField(89);

  @$pb.TagNumber(90)
  $core.int get applause => $_getIZ(89);
  @$pb.TagNumber(90)
  set applause($core.int v) {
    $_setUnsignedInt32(89, v);
  }

  @$pb.TagNumber(90)
  $core.bool hasApplause() => $_has(89);
  @$pb.TagNumber(90)
  void clearApplause() => clearField(90);

  @$pb.TagNumber(91)
  ScreenMessage_Extra_Gift get gift => $_getN(90);
  @$pb.TagNumber(91)
  set gift(ScreenMessage_Extra_Gift v) {
    setField(91, v);
  }

  @$pb.TagNumber(91)
  $core.bool hasGift() => $_has(90);
  @$pb.TagNumber(91)
  void clearGift() => clearField(91);
  @$pb.TagNumber(91)
  ScreenMessage_Extra_Gift ensureGift() => $_ensure(90);

  @$pb.TagNumber(92)
  ScreenMessage_Extra_MsgData get msgData => $_getN(91);
  @$pb.TagNumber(92)
  set msgData(ScreenMessage_Extra_MsgData v) {
    setField(92, v);
  }

  @$pb.TagNumber(92)
  $core.bool hasMsgData() => $_has(91);
  @$pb.TagNumber(92)
  void clearMsgData() => clearField(92);
  @$pb.TagNumber(92)
  ScreenMessage_Extra_MsgData ensureMsgData() => $_ensure(91);

  @$pb.TagNumber(93)
  $core.int get joinFansGroup => $_getIZ(92);
  @$pb.TagNumber(93)
  set joinFansGroup($core.int v) {
    $_setUnsignedInt32(92, v);
  }

  @$pb.TagNumber(93)
  $core.bool hasJoinFansGroup() => $_has(92);
  @$pb.TagNumber(93)
  void clearJoinFansGroup() => clearField(93);

  @$pb.TagNumber(94)
  $core.String get imageType => $_getSZ(93);
  @$pb.TagNumber(94)
  set imageType($core.String v) {
    $_setString(93, v);
  }

  @$pb.TagNumber(94)
  $core.bool hasImageType() => $_has(93);
  @$pb.TagNumber(94)
  void clearImageType() => clearField(94);

  @$pb.TagNumber(95)
  $core.String get hitId => $_getSZ(94);
  @$pb.TagNumber(95)
  set hitId($core.String v) {
    $_setString(94, v);
  }

  @$pb.TagNumber(95)
  $core.bool hasHitId() => $_has(94);
  @$pb.TagNumber(95)
  void clearHitId() => clearField(95);

  @$pb.TagNumber(96)
  $core.String get uuid => $_getSZ(95);
  @$pb.TagNumber(96)
  set uuid($core.String v) {
    $_setString(95, v);
  }

  @$pb.TagNumber(96)
  $core.bool hasUuid() => $_has(95);
  @$pb.TagNumber(96)
  void clearUuid() => clearField(96);

  @$pb.TagNumber(97)
  $core.int get hotNum => $_getIZ(96);
  @$pb.TagNumber(97)
  set hotNum($core.int v) {
    $_setUnsignedInt32(96, v);
  }

  @$pb.TagNumber(97)
  $core.bool hasHotNum() => $_has(96);
  @$pb.TagNumber(97)
  void clearHotNum() => clearField(97);

  @$pb.TagNumber(98)
  $core.int get artistLevel => $_getIZ(97);
  @$pb.TagNumber(98)
  set artistLevel($core.int v) {
    $_setUnsignedInt32(97, v);
  }

  @$pb.TagNumber(98)
  $core.bool hasArtistLevel() => $_has(97);
  @$pb.TagNumber(98)
  void clearArtistLevel() => clearField(98);

  @$pb.TagNumber(99)
  $core.int get sevenLoveTag => $_getIZ(98);
  @$pb.TagNumber(99)
  set sevenLoveTag($core.int v) {
    $_setUnsignedInt32(98, v);
  }

  @$pb.TagNumber(99)
  $core.bool hasSevenLoveTag() => $_has(98);
  @$pb.TagNumber(99)
  void clearSevenLoveTag() => clearField(99);

  @$pb.TagNumber(100)
  $core.String get jukebox => $_getSZ(99);
  @$pb.TagNumber(100)
  set jukebox($core.String v) {
    $_setString(99, v);
  }

  @$pb.TagNumber(100)
  $core.bool hasJukebox() => $_has(99);
  @$pb.TagNumber(100)
  void clearJukebox() => clearField(100);

  @$pb.TagNumber(101)
  $core.int get duration => $_getIZ(100);
  @$pb.TagNumber(101)
  set duration($core.int v) {
    $_setUnsignedInt32(100, v);
  }

  @$pb.TagNumber(101)
  $core.bool hasDuration() => $_has(100);
  @$pb.TagNumber(101)
  void clearDuration() => clearField(101);

  @$pb.TagNumber(102)
  $core.bool get rechargeLabel => $_getBF(101);
  @$pb.TagNumber(102)
  set rechargeLabel($core.bool v) {
    $_setBool(101, v);
  }

  @$pb.TagNumber(102)
  $core.bool hasRechargeLabel() => $_has(101);
  @$pb.TagNumber(102)
  void clearRechargeLabel() => clearField(102);

  @$pb.TagNumber(103)
  $core.String get msgAction => $_getSZ(102);
  @$pb.TagNumber(103)
  set msgAction($core.String v) {
    $_setString(102, v);
  }

  @$pb.TagNumber(103)
  $core.bool hasMsgAction() => $_has(102);
  @$pb.TagNumber(103)
  void clearMsgAction() => clearField(103);

  @$pb.TagNumber(104)
  $core.List<$core.String> get icons => $_getList(103);

  @$pb.TagNumber(105)
  ScreenMessage_Extra_Mounts get mounts => $_getN(104);
  @$pb.TagNumber(105)
  set mounts(ScreenMessage_Extra_Mounts v) {
    setField(105, v);
  }

  @$pb.TagNumber(105)
  $core.bool hasMounts() => $_has(104);
  @$pb.TagNumber(105)
  void clearMounts() => clearField(105);
  @$pb.TagNumber(105)
  ScreenMessage_Extra_Mounts ensureMounts() => $_ensure(104);

  @$pb.TagNumber(106)
  ScreenMessage_Extra_DefendLabel get defendLabel => $_getN(105);
  @$pb.TagNumber(106)
  set defendLabel(ScreenMessage_Extra_DefendLabel v) {
    setField(106, v);
  }

  @$pb.TagNumber(106)
  $core.bool hasDefendLabel() => $_has(105);
  @$pb.TagNumber(106)
  void clearDefendLabel() => clearField(106);
  @$pb.TagNumber(106)
  ScreenMessage_Extra_DefendLabel ensureDefendLabel() => $_ensure(105);

  @$pb.TagNumber(107)
  $core.String get liveLabelBubble => $_getSZ(106);
  @$pb.TagNumber(107)
  set liveLabelBubble($core.String v) {
    $_setString(106, v);
  }

  @$pb.TagNumber(107)
  $core.bool hasLiveLabelBubble() => $_has(106);
  @$pb.TagNumber(107)
  void clearLiveLabelBubble() => clearField(107);

  @$pb.TagNumber(108)
  $core.List<$core.String> get highLightContent => $_getList(107);

  @$pb.TagNumber(109)
  $core.int get fromPubRid => $_getIZ(108);
  @$pb.TagNumber(109)
  set fromPubRid($core.int v) {
    $_setUnsignedInt32(108, v);
  }

  @$pb.TagNumber(109)
  $core.bool hasFromPubRid() => $_has(108);
  @$pb.TagNumber(109)
  void clearFromPubRid() => clearField(109);

  @$pb.TagNumber(110)
  $core.List<ScreenMessage_Extra_Tags> get tags => $_getList(109);

  @$pb.TagNumber(111)
  $core.String get portraitUri => $_getSZ(110);
  @$pb.TagNumber(111)
  set portraitUri($core.String v) {
    $_setString(110, v);
  }

  @$pb.TagNumber(111)
  $core.bool hasPortraitUri() => $_has(110);
  @$pb.TagNumber(111)
  void clearPortraitUri() => clearField(111);

  @$pb.TagNumber(112)
  $core.String get tailLight => $_getSZ(111);
  @$pb.TagNumber(112)
  set tailLight($core.String v) {
    $_setString(111, v);
  }

  @$pb.TagNumber(112)
  $core.bool hasTailLight() => $_has(111);
  @$pb.TagNumber(112)
  void clearTailLight() => clearField(112);

  @$pb.TagNumber(113)
  $core.bool get isShowTitle => $_getBF(112);
  @$pb.TagNumber(113)
  set isShowTitle($core.bool v) {
    $_setBool(112, v);
  }

  @$pb.TagNumber(113)
  $core.bool hasIsShowTitle() => $_has(112);
  @$pb.TagNumber(113)
  void clearIsShowTitle() => clearField(113);

  @$pb.TagNumber(114)
  $core.List<$core.int> get uids => $_getList(113);

  @$pb.TagNumber(115)
  $core.bool get sign => $_getBF(114);
  @$pb.TagNumber(115)
  set sign($core.bool v) {
    $_setBool(114, v);
  }

  @$pb.TagNumber(115)
  $core.bool hasSign() => $_has(114);
  @$pb.TagNumber(115)
  void clearSign() => clearField(115);

  @$pb.TagNumber(116)
  $core.String get vedio => $_getSZ(115);
  @$pb.TagNumber(116)
  set vedio($core.String v) {
    $_setString(115, v);
  }

  @$pb.TagNumber(116)
  $core.bool hasVedio() => $_has(115);
  @$pb.TagNumber(116)
  void clearVedio() => clearField(116);

  @$pb.TagNumber(117)
  $core.String get knightName => $_getSZ(116);
  @$pb.TagNumber(117)
  set knightName($core.String v) {
    $_setString(116, v);
  }

  @$pb.TagNumber(117)
  $core.bool hasKnightName() => $_has(116);
  @$pb.TagNumber(117)
  void clearKnightName() => clearField(117);

  @$pb.TagNumber(118)
  $core.String get newSubType => $_getSZ(117);
  @$pb.TagNumber(118)
  set newSubType($core.String v) {
    $_setString(117, v);
  }

  @$pb.TagNumber(118)
  $core.bool hasNewSubType() => $_has(117);
  @$pb.TagNumber(118)
  void clearNewSubType() => clearField(118);

  @$pb.TagNumber(119)
  $core.String get to => $_getSZ(118);
  @$pb.TagNumber(119)
  set to($core.String v) {
    $_setString(118, v);
  }

  @$pb.TagNumber(119)
  $core.bool hasTo() => $_has(118);
  @$pb.TagNumber(119)
  void clearTo() => clearField(119);

  @$pb.TagNumber(120)
  $core.String get purpose => $_getSZ(119);
  @$pb.TagNumber(120)
  set purpose($core.String v) {
    $_setString(119, v);
  }

  @$pb.TagNumber(120)
  $core.bool hasPurpose() => $_has(119);
  @$pb.TagNumber(120)
  void clearPurpose() => clearField(120);

  @$pb.TagNumber(121)
  $core.String get backgroundNew => $_getSZ(120);
  @$pb.TagNumber(121)
  set backgroundNew($core.String v) {
    $_setString(120, v);
  }

  @$pb.TagNumber(121)
  $core.bool hasBackgroundNew() => $_has(120);
  @$pb.TagNumber(121)
  void clearBackgroundNew() => clearField(121);

  @$pb.TagNumber(122)
  $core.int get onceHitNum => $_getIZ(121);
  @$pb.TagNumber(122)
  set onceHitNum($core.int v) {
    $_setUnsignedInt32(121, v);
  }

  @$pb.TagNumber(122)
  $core.bool hasOnceHitNum() => $_has(121);
  @$pb.TagNumber(122)
  void clearOnceHitNum() => clearField(122);

  @$pb.TagNumber(123)
  $core.List<$core.String> get roomTags => $_getList(122);

  @$pb.TagNumber(124)
  $core.int get toUid => $_getIZ(123);
  @$pb.TagNumber(124)
  set toUid($core.int v) {
    $_setUnsignedInt32(123, v);
  }

  @$pb.TagNumber(124)
  $core.bool hasToUid() => $_has(123);
  @$pb.TagNumber(124)
  void clearToUid() => clearField(124);

  @$pb.TagNumber(125)
  $core.String get from => $_getSZ(124);
  @$pb.TagNumber(125)
  set from($core.String v) {
    $_setString(124, v);
  }

  @$pb.TagNumber(125)
  $core.bool hasFrom() => $_has(124);
  @$pb.TagNumber(125)
  void clearFrom() => clearField(125);

  @$pb.TagNumber(126)
  $core.int get money => $_getIZ(125);
  @$pb.TagNumber(126)
  set money($core.int v) {
    $_setUnsignedInt32(125, v);
  }

  @$pb.TagNumber(126)
  $core.bool hasMoney() => $_has(125);
  @$pb.TagNumber(126)
  void clearMoney() => clearField(126);

  @$pb.TagNumber(127)
  $core.int get pid => $_getIZ(126);
  @$pb.TagNumber(127)
  set pid($core.int v) {
    $_setUnsignedInt32(126, v);
  }

  @$pb.TagNumber(127)
  $core.bool hasPid() => $_has(126);
  @$pb.TagNumber(127)
  void clearPid() => clearField(127);

  @$pb.TagNumber(128)
  ScreenMessage_Extra_At get at => $_getN(127);
  @$pb.TagNumber(128)
  set at(ScreenMessage_Extra_At v) {
    setField(128, v);
  }

  @$pb.TagNumber(128)
  $core.bool hasAt() => $_has(127);
  @$pb.TagNumber(128)
  void clearAt() => clearField(128);
  @$pb.TagNumber(128)
  ScreenMessage_Extra_At ensureAt() => $_ensure(127);

  @$pb.TagNumber(129)
  $core.int get liveUid => $_getIZ(128);
  @$pb.TagNumber(129)
  set liveUid($core.int v) {
    $_setUnsignedInt32(128, v);
  }

  @$pb.TagNumber(129)
  $core.bool hasLiveUid() => $_has(128);
  @$pb.TagNumber(129)
  void clearLiveUid() => clearField(129);

  @$pb.TagNumber(130)
  $core.int get masterUid => $_getIZ(129);
  @$pb.TagNumber(130)
  set masterUid($core.int v) {
    $_setUnsignedInt32(129, v);
  }

  @$pb.TagNumber(130)
  $core.bool hasMasterUid() => $_has(129);
  @$pb.TagNumber(130)
  void clearMasterUid() => clearField(130);

  @$pb.TagNumber(131)
  $core.String get msg => $_getSZ(130);
  @$pb.TagNumber(131)
  set msg($core.String v) {
    $_setString(130, v);
  }

  @$pb.TagNumber(131)
  $core.bool hasMsg() => $_has(130);
  @$pb.TagNumber(131)
  void clearMsg() => clearField(131);

  @$pb.TagNumber(132)
  $core.String get knightTargetName => $_getSZ(131);
  @$pb.TagNumber(132)
  set knightTargetName($core.String v) {
    $_setString(131, v);
  }

  @$pb.TagNumber(132)
  $core.bool hasKnightTargetName() => $_has(131);
  @$pb.TagNumber(132)
  void clearKnightTargetName() => clearField(132);

  @$pb.TagNumber(133)
  $core.String get op => $_getSZ(132);
  @$pb.TagNumber(133)
  set op($core.String v) {
    $_setString(132, v);
  }

  @$pb.TagNumber(133)
  $core.bool hasOp() => $_has(132);
  @$pb.TagNumber(133)
  void clearOp() => clearField(133);

  @$pb.TagNumber(134)
  ScreenMessage_Extra_Data get data => $_getN(133);
  @$pb.TagNumber(134)
  set data(ScreenMessage_Extra_Data v) {
    setField(134, v);
  }

  @$pb.TagNumber(134)
  $core.bool hasData() => $_has(133);
  @$pb.TagNumber(134)
  void clearData() => clearField(134);
  @$pb.TagNumber(134)
  ScreenMessage_Extra_Data ensureData() => $_ensure(133);

  @$pb.TagNumber(135)
  $core.String get acuteIcon => $_getSZ(134);
  @$pb.TagNumber(135)
  set acuteIcon($core.String v) {
    $_setString(134, v);
  }

  @$pb.TagNumber(135)
  $core.bool hasAcuteIcon() => $_has(134);
  @$pb.TagNumber(135)
  void clearAcuteIcon() => clearField(135);

  @$pb.TagNumber(136)
  $core.int get propId => $_getIZ(135);
  @$pb.TagNumber(136)
  set propId($core.int v) {
    $_setUnsignedInt32(135, v);
  }

  @$pb.TagNumber(136)
  $core.bool hasPropId() => $_has(135);
  @$pb.TagNumber(136)
  void clearPropId() => clearField(136);

  @$pb.TagNumber(137)
  $core.String get color => $_getSZ(136);
  @$pb.TagNumber(137)
  set color($core.String v) {
    $_setString(136, v);
  }

  @$pb.TagNumber(137)
  $core.bool hasColor() => $_has(136);
  @$pb.TagNumber(137)
  void clearColor() => clearField(137);

  @$pb.TagNumber(138)
  $core.String get roomName => $_getSZ(137);
  @$pb.TagNumber(138)
  set roomName($core.String v) {
    $_setString(137, v);
  }

  @$pb.TagNumber(138)
  $core.bool hasRoomName() => $_has(137);
  @$pb.TagNumber(138)
  void clearRoomName() => clearField(138);

  @$pb.TagNumber(139)
  $core.String get showName => $_getSZ(138);
  @$pb.TagNumber(139)
  set showName($core.String v) {
    $_setString(138, v);
  }

  @$pb.TagNumber(139)
  $core.bool hasShowName() => $_has(138);
  @$pb.TagNumber(139)
  void clearShowName() => clearField(139);

  @$pb.TagNumber(140)
  $core.List<$core.String> get bg => $_getList(139);

  @$pb.TagNumber(141)
  ScreenMessage_Extra_Decorate get decorate => $_getN(140);
  @$pb.TagNumber(141)
  set decorate(ScreenMessage_Extra_Decorate v) {
    setField(141, v);
  }

  @$pb.TagNumber(141)
  $core.bool hasDecorate() => $_has(140);
  @$pb.TagNumber(141)
  void clearDecorate() => clearField(141);
  @$pb.TagNumber(141)
  ScreenMessage_Extra_Decorate ensureDecorate() => $_ensure(140);

  @$pb.TagNumber(142)
  ScreenMessage_Extra_Artist get artist => $_getN(141);
  @$pb.TagNumber(142)
  set artist(ScreenMessage_Extra_Artist v) {
    setField(142, v);
  }

  @$pb.TagNumber(142)
  $core.bool hasArtist() => $_has(141);
  @$pb.TagNumber(142)
  void clearArtist() => clearField(142);
  @$pb.TagNumber(142)
  ScreenMessage_Extra_Artist ensureArtist() => $_ensure(141);

  @$pb.TagNumber(143)
  $core.int get pkId => $_getIZ(142);
  @$pb.TagNumber(143)
  set pkId($core.int v) {
    $_setUnsignedInt32(142, v);
  }

  @$pb.TagNumber(143)
  $core.bool hasPkId() => $_has(142);
  @$pb.TagNumber(143)
  void clearPkId() => clearField(143);

  @$pb.TagNumber(144)
  $core.int get totalNum => $_getIZ(143);
  @$pb.TagNumber(144)
  set totalNum($core.int v) {
    $_setUnsignedInt32(143, v);
  }

  @$pb.TagNumber(144)
  $core.bool hasTotalNum() => $_has(143);
  @$pb.TagNumber(144)
  void clearTotalNum() => clearField(144);

  @$pb.TagNumber(145)
  $core.int get vrid => $_getIZ(144);
  @$pb.TagNumber(145)
  set vrid($core.int v) {
    $_setUnsignedInt32(144, v);
  }

  @$pb.TagNumber(145)
  $core.bool hasVrid() => $_has(144);
  @$pb.TagNumber(145)
  void clearVrid() => clearField(145);

  @$pb.TagNumber(146)
  $core.String get username => $_getSZ(145);
  @$pb.TagNumber(146)
  set username($core.String v) {
    $_setString(145, v);
  }

  @$pb.TagNumber(146)
  $core.bool hasUsername() => $_has(145);
  @$pb.TagNumber(146)
  void clearUsername() => clearField(146);

  @$pb.TagNumber(147)
  $core.String get srv => $_getSZ(146);
  @$pb.TagNumber(147)
  set srv($core.String v) {
    $_setString(146, v);
  }

  @$pb.TagNumber(147)
  $core.bool hasSrv() => $_has(146);
  @$pb.TagNumber(147)
  void clearSrv() => clearField(147);

  @$pb.TagNumber(148)
  $core.int get currentNum => $_getIZ(147);
  @$pb.TagNumber(148)
  set currentNum($core.int v) {
    $_setUnsignedInt32(147, v);
  }

  @$pb.TagNumber(148)
  $core.bool hasCurrentNum() => $_has(147);
  @$pb.TagNumber(148)
  void clearCurrentNum() => clearField(148);

  @$pb.TagNumber(149)
  $core.String get gameName => $_getSZ(148);
  @$pb.TagNumber(149)
  set gameName($core.String v) {
    $_setString(148, v);
  }

  @$pb.TagNumber(149)
  $core.bool hasGameName() => $_has(148);
  @$pb.TagNumber(149)
  void clearGameName() => clearField(149);

  @$pb.TagNumber(150)
  $core.int get feeType => $_getIZ(149);
  @$pb.TagNumber(150)
  set feeType($core.int v) {
    $_setUnsignedInt32(149, v);
  }

  @$pb.TagNumber(150)
  $core.bool hasFeeType() => $_has(149);
  @$pb.TagNumber(150)
  void clearFeeType() => clearField(150);

  @$pb.TagNumber(151)
  $core.String get tag => $_getSZ(150);
  @$pb.TagNumber(151)
  set tag($core.String v) {
    $_setString(150, v);
  }

  @$pb.TagNumber(151)
  $core.bool hasTag() => $_has(150);
  @$pb.TagNumber(151)
  void clearTag() => clearField(151);

  @$pb.TagNumber(152)
  $core.int get ftype => $_getIZ(151);
  @$pb.TagNumber(152)
  set ftype($core.int v) {
    $_setUnsignedInt32(151, v);
  }

  @$pb.TagNumber(152)
  $core.bool hasFtype() => $_has(151);
  @$pb.TagNumber(152)
  void clearFtype() => clearField(152);

  @$pb.TagNumber(153)
  $core.int get fvalue => $_getIZ(152);
  @$pb.TagNumber(153)
  set fvalue($core.int v) {
    $_setUnsignedInt32(152, v);
  }

  @$pb.TagNumber(153)
  $core.bool hasFvalue() => $_has(152);
  @$pb.TagNumber(153)
  void clearFvalue() => clearField(153);

  @$pb.TagNumber(154)
  $core.String get voiceUrl => $_getSZ(153);
  @$pb.TagNumber(154)
  set voiceUrl($core.String v) {
    $_setString(153, v);
  }

  @$pb.TagNumber(154)
  $core.bool hasVoiceUrl() => $_has(153);
  @$pb.TagNumber(154)
  void clearVoiceUrl() => clearField(154);

  @$pb.TagNumber(155)
  $core.int get gloryLevel => $_getIZ(154);
  @$pb.TagNumber(155)
  set gloryLevel($core.int v) {
    $_setSignedInt32(154, v);
  }

  @$pb.TagNumber(155)
  $core.bool hasGloryLevel() => $_has(154);
  @$pb.TagNumber(155)
  void clearGloryLevel() => clearField(155);

  @$pb.TagNumber(156)
  $core.bool get isNormalGlory => $_getBF(155);
  @$pb.TagNumber(156)
  set isNormalGlory($core.bool v) {
    $_setBool(155, v);
  }

  @$pb.TagNumber(156)
  $core.bool hasIsNormalGlory() => $_has(155);
  @$pb.TagNumber(156)
  void clearIsNormalGlory() => clearField(156);

  @$pb.TagNumber(157)
  $core.String get gsMsgAction => $_getSZ(156);
  @$pb.TagNumber(157)
  set gsMsgAction($core.String v) {
    $_setString(156, v);
  }

  @$pb.TagNumber(157)
  $core.bool hasGsMsgAction() => $_has(156);
  @$pb.TagNumber(157)
  void clearGsMsgAction() => clearField(157);

  @$pb.TagNumber(158)
  ScreenMessage_Extra_Viability get viability => $_getN(157);
  @$pb.TagNumber(158)
  set viability(ScreenMessage_Extra_Viability v) {
    setField(158, v);
  }

  @$pb.TagNumber(158)
  $core.bool hasViability() => $_has(157);
  @$pb.TagNumber(158)
  void clearViability() => clearField(158);
  @$pb.TagNumber(158)
  ScreenMessage_Extra_Viability ensureViability() => $_ensure(157);

  @$pb.TagNumber(159)
  $core.int get fromOutstandingBox => $_getIZ(158);
  @$pb.TagNumber(159)
  set fromOutstandingBox($core.int v) {
    $_setUnsignedInt32(158, v);
  }

  @$pb.TagNumber(159)
  $core.bool hasFromOutstandingBox() => $_has(158);
  @$pb.TagNumber(159)
  void clearFromOutstandingBox() => clearField(159);

  @$pb.TagNumber(160)
  ScreenMessage_Extra_OutstandingBox get outstandingBox => $_getN(159);
  @$pb.TagNumber(160)
  set outstandingBox(ScreenMessage_Extra_OutstandingBox v) {
    setField(160, v);
  }

  @$pb.TagNumber(160)
  $core.bool hasOutstandingBox() => $_has(159);
  @$pb.TagNumber(160)
  void clearOutstandingBox() => clearField(160);
  @$pb.TagNumber(160)
  ScreenMessage_Extra_OutstandingBox ensureOutstandingBox() => $_ensure(159);

  @$pb.TagNumber(161)
  ScreenMessage_Extra_GiftFirework get giftFirework => $_getN(160);
  @$pb.TagNumber(161)
  set giftFirework(ScreenMessage_Extra_GiftFirework v) {
    setField(161, v);
  }

  @$pb.TagNumber(161)
  $core.bool hasGiftFirework() => $_has(160);
  @$pb.TagNumber(161)
  void clearGiftFirework() => clearField(161);
  @$pb.TagNumber(161)
  ScreenMessage_Extra_GiftFirework ensureGiftFirework() => $_ensure(160);

  @$pb.TagNumber(162)
  ScreenMessage_ScreenMessageRoomBirthdayGift get birthdayRoomGift =>
      $_getN(161);
  @$pb.TagNumber(162)
  set birthdayRoomGift(ScreenMessage_ScreenMessageRoomBirthdayGift v) {
    setField(162, v);
  }

  @$pb.TagNumber(162)
  $core.bool hasBirthdayRoomGift() => $_has(161);
  @$pb.TagNumber(162)
  void clearBirthdayRoomGift() => clearField(162);
  @$pb.TagNumber(162)
  ScreenMessage_ScreenMessageRoomBirthdayGift ensureBirthdayRoomGift() =>
      $_ensure(161);

  @$pb.TagNumber(167)
  $core.String get achieveWearIcon => $_getSZ(162);
  @$pb.TagNumber(167)
  set achieveWearIcon($core.String v) {
    $_setString(162, v);
  }

  @$pb.TagNumber(167)
  $core.bool hasAchieveWearIcon() => $_has(162);
  @$pb.TagNumber(167)
  void clearAchieveWearIcon() => clearField(167);

  @$pb.TagNumber(168)
  ScreenMessage_Extra_RedPacketV2 get redPacketV2 => $_getN(163);
  @$pb.TagNumber(168)
  set redPacketV2(ScreenMessage_Extra_RedPacketV2 v) {
    setField(168, v);
  }

  @$pb.TagNumber(168)
  $core.bool hasRedPacketV2() => $_has(163);
  @$pb.TagNumber(168)
  void clearRedPacketV2() => clearField(168);
  @$pb.TagNumber(168)
  ScreenMessage_Extra_RedPacketV2 ensureRedPacketV2() => $_ensure(163);

  @$pb.TagNumber(201)
  $core.List<ScreenMessage_Extra_WarpUserBubbleTail> get bubbleTail =>
      $_getList(164);

  @$pb.TagNumber(202)
  $core.String get ktv => $_getSZ(165);
  @$pb.TagNumber(202)
  set ktv($core.String v) {
    $_setString(165, v);
  }

  @$pb.TagNumber(202)
  $core.bool hasKtv() => $_has(165);
  @$pb.TagNumber(202)
  void clearKtv() => clearField(202);
}

class ScreenMessage_User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.User',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'portraitUri',
        protoName: 'portraitUri')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popularity_level',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'background_new')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bubble_front_color')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message_background')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color_name')
    ..hasRequiredFields = false;

  ScreenMessage_User._() : super();
  factory ScreenMessage_User({
    $core.String? portraitUri,
    $core.int? popularityLevel,
    $core.String? frame,
    $core.String? backgroundNew,
    $core.String? name,
    $core.int? id,
    $core.String? icon,
    $core.String? bubbleFrontColor,
    $core.int? sex,
    $core.String? messageBackground,
    $core.String? colorName,
  }) {
    final _result = create();
    if (portraitUri != null) {
      _result.portraitUri = portraitUri;
    }
    if (popularityLevel != null) {
      _result.popularityLevel = popularityLevel;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (backgroundNew != null) {
      _result.backgroundNew = backgroundNew;
    }
    if (name != null) {
      _result.name = name;
    }
    if (id != null) {
      _result.id = id;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (bubbleFrontColor != null) {
      _result.bubbleFrontColor = bubbleFrontColor;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (messageBackground != null) {
      _result.messageBackground = messageBackground;
    }
    if (colorName != null) {
      _result.colorName = colorName;
    }
    return _result;
  }
  factory ScreenMessage_User.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_User.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_User clone() => ScreenMessage_User()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_User copyWith(void Function(ScreenMessage_User) updates) =>
      super.copyWith((message) => updates(message as ScreenMessage_User))
          as ScreenMessage_User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_User create() => ScreenMessage_User._();
  ScreenMessage_User createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_User> createRepeated() =>
      $pb.PbList<ScreenMessage_User>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_User getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage_User>(create);
  static ScreenMessage_User? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get portraitUri => $_getSZ(0);
  @$pb.TagNumber(1)
  set portraitUri($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPortraitUri() => $_has(0);
  @$pb.TagNumber(1)
  void clearPortraitUri() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get popularityLevel => $_getIZ(1);
  @$pb.TagNumber(2)
  set popularityLevel($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPopularityLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearPopularityLevel() => clearField(2);

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
  $core.String get backgroundNew => $_getSZ(3);
  @$pb.TagNumber(4)
  set backgroundNew($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBackgroundNew() => $_has(3);
  @$pb.TagNumber(4)
  void clearBackgroundNew() => clearField(4);

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
  $core.int get id => $_getIZ(5);
  @$pb.TagNumber(6)
  set id($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasId() => $_has(5);
  @$pb.TagNumber(6)
  void clearId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get icon => $_getSZ(6);
  @$pb.TagNumber(7)
  set icon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearIcon() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get bubbleFrontColor => $_getSZ(7);
  @$pb.TagNumber(8)
  set bubbleFrontColor($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasBubbleFrontColor() => $_has(7);
  @$pb.TagNumber(8)
  void clearBubbleFrontColor() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get sex => $_getIZ(8);
  @$pb.TagNumber(9)
  set sex($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasSex() => $_has(8);
  @$pb.TagNumber(9)
  void clearSex() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get messageBackground => $_getSZ(9);
  @$pb.TagNumber(10)
  set messageBackground($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasMessageBackground() => $_has(9);
  @$pb.TagNumber(10)
  void clearMessageBackground() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get colorName => $_getSZ(10);
  @$pb.TagNumber(11)
  set colorName($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasColorName() => $_has(10);
  @$pb.TagNumber(11)
  void clearColorName() => clearField(11);
}

class ScreenMessage_ScreenMessageRoomBirthdayGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.ScreenMessageRoomBirthdayGift',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'from',
        $pb.PbFieldType.OU3)
    ..pc<ScreenMessage_ScreenMessageRoomBirthdayUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'to',
        $pb.PbFieldType.PM,
        subBuilder: ScreenMessage_ScreenMessageRoomBirthdayUser.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'word')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sentence')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ScreenMessage_ScreenMessageRoomBirthdayGift._() : super();
  factory ScreenMessage_ScreenMessageRoomBirthdayGift({
    $core.int? from,
    $core.Iterable<ScreenMessage_ScreenMessageRoomBirthdayUser>? to,
    $core.String? word,
    $core.String? sentence,
    $core.int? duration,
  }) {
    final _result = create();
    if (from != null) {
      _result.from = from;
    }
    if (to != null) {
      _result.to.addAll(to);
    }
    if (word != null) {
      _result.word = word;
    }
    if (sentence != null) {
      _result.sentence = sentence;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    return _result;
  }
  factory ScreenMessage_ScreenMessageRoomBirthdayGift.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_ScreenMessageRoomBirthdayGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_ScreenMessageRoomBirthdayGift clone() =>
      ScreenMessage_ScreenMessageRoomBirthdayGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_ScreenMessageRoomBirthdayGift copyWith(
          void Function(ScreenMessage_ScreenMessageRoomBirthdayGift) updates) =>
      super.copyWith((message) =>
              updates(message as ScreenMessage_ScreenMessageRoomBirthdayGift))
          as ScreenMessage_ScreenMessageRoomBirthdayGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_ScreenMessageRoomBirthdayGift create() =>
      ScreenMessage_ScreenMessageRoomBirthdayGift._();
  ScreenMessage_ScreenMessageRoomBirthdayGift createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_ScreenMessageRoomBirthdayGift>
      createRepeated() =>
          $pb.PbList<ScreenMessage_ScreenMessageRoomBirthdayGift>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_ScreenMessageRoomBirthdayGift getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ScreenMessage_ScreenMessageRoomBirthdayGift>(create);
  static ScreenMessage_ScreenMessageRoomBirthdayGift? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get from => $_getIZ(0);
  @$pb.TagNumber(1)
  set from($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<ScreenMessage_ScreenMessageRoomBirthdayUser> get to =>
      $_getList(1);

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
  $core.String get sentence => $_getSZ(3);
  @$pb.TagNumber(4)
  set sentence($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSentence() => $_has(3);
  @$pb.TagNumber(4)
  void clearSentence() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get duration => $_getIZ(4);
  @$pb.TagNumber(5)
  set duration($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDuration() => $_has(4);
  @$pb.TagNumber(5)
  void clearDuration() => clearField(5);
}

class ScreenMessage_ScreenMessageRoomBirthdayUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage.ScreenMessageRoomBirthdayUser',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
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
    ..hasRequiredFields = false;

  ScreenMessage_ScreenMessageRoomBirthdayUser._() : super();
  factory ScreenMessage_ScreenMessageRoomBirthdayUser({
    $core.int? uid,
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
  factory ScreenMessage_ScreenMessageRoomBirthdayUser.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage_ScreenMessageRoomBirthdayUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage_ScreenMessageRoomBirthdayUser clone() =>
      ScreenMessage_ScreenMessageRoomBirthdayUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage_ScreenMessageRoomBirthdayUser copyWith(
          void Function(ScreenMessage_ScreenMessageRoomBirthdayUser) updates) =>
      super.copyWith((message) =>
              updates(message as ScreenMessage_ScreenMessageRoomBirthdayUser))
          as ScreenMessage_ScreenMessageRoomBirthdayUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_ScreenMessageRoomBirthdayUser create() =>
      ScreenMessage_ScreenMessageRoomBirthdayUser._();
  ScreenMessage_ScreenMessageRoomBirthdayUser createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage_ScreenMessageRoomBirthdayUser>
      createRepeated() =>
          $pb.PbList<ScreenMessage_ScreenMessageRoomBirthdayUser>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage_ScreenMessageRoomBirthdayUser getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ScreenMessage_ScreenMessageRoomBirthdayUser>(create);
  static ScreenMessage_ScreenMessageRoomBirthdayUser? _defaultInstance;

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
}

class ScreenMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ScreenMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'system.screen.message'),
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
            : 'data')
    ..aOM<ScreenMessage_Extra>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extra',
        subBuilder: ScreenMessage_Extra.create)
    ..aOM<ScreenMessage_User>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: ScreenMessage_User.create)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aInt64(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'messageId',
        protoName: 'messageId')
    ..hasRequiredFields = false;

  ScreenMessage._() : super();
  factory ScreenMessage({
    $core.String? name,
    $core.String? data,
    ScreenMessage_Extra? extra,
    ScreenMessage_User? user,
    $core.String? content,
    $core.int? rid,
    $core.int? uid,
    $fixnum.Int64? messageId,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (data != null) {
      _result.data = data;
    }
    if (extra != null) {
      _result.extra = extra;
    }
    if (user != null) {
      _result.user = user;
    }
    if (content != null) {
      _result.content = content;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (messageId != null) {
      _result.messageId = messageId;
    }
    return _result;
  }
  factory ScreenMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ScreenMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ScreenMessage clone() => ScreenMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ScreenMessage copyWith(void Function(ScreenMessage) updates) =>
      super.copyWith((message) => updates(message as ScreenMessage))
          as ScreenMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenMessage create() => ScreenMessage._();
  ScreenMessage createEmptyInstance() => create();
  static $pb.PbList<ScreenMessage> createRepeated() =>
      $pb.PbList<ScreenMessage>();
  @$core.pragma('dart2js:noInline')
  static ScreenMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenMessage>(create);
  static ScreenMessage? _defaultInstance;

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
  $core.String get data => $_getSZ(1);
  @$pb.TagNumber(2)
  set data($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);

  @$pb.TagNumber(3)
  ScreenMessage_Extra get extra => $_getN(2);
  @$pb.TagNumber(3)
  set extra(ScreenMessage_Extra v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasExtra() => $_has(2);
  @$pb.TagNumber(3)
  void clearExtra() => clearField(3);
  @$pb.TagNumber(3)
  ScreenMessage_Extra ensureExtra() => $_ensure(2);

  @$pb.TagNumber(4)
  ScreenMessage_User get user => $_getN(3);
  @$pb.TagNumber(4)
  set user(ScreenMessage_User v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUser() => $_has(3);
  @$pb.TagNumber(4)
  void clearUser() => clearField(4);
  @$pb.TagNumber(4)
  ScreenMessage_User ensureUser() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get content => $_getSZ(4);
  @$pb.TagNumber(5)
  set content($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasContent() => $_has(4);
  @$pb.TagNumber(5)
  void clearContent() => clearField(5);

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
  $core.int get uid => $_getIZ(6);
  @$pb.TagNumber(7)
  set uid($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUid() => $_has(6);
  @$pb.TagNumber(7)
  void clearUid() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get messageId => $_getI64(7);
  @$pb.TagNumber(8)
  set messageId($fixnum.Int64 v) {
    $_setInt64(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasMessageId() => $_has(7);
  @$pb.TagNumber(8)
  void clearMessageId() => clearField(8);
}
