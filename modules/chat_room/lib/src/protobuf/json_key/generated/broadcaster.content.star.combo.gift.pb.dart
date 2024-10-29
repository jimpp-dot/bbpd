///
//  Generated code. Do not modify.
//  source: broadcaster.content.star.combo.gift.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BroadcasterContentStarComboGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'BroadcasterContentStarComboGift',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'broadcaster.content.star.combo.gift'),
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
            : 'vip_level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hit_num',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift_icon')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'combo_id')
    ..hasRequiredFields = false;

  BroadcasterContentStarComboGift._() : super();
  factory BroadcasterContentStarComboGift({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? vipLevel,
    $core.int? hitNum,
    $core.String? message,
    $core.String? giftIcon,
    $core.String? comboId,
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
    if (vipLevel != null) {
      _result.vipLevel = vipLevel;
    }
    if (hitNum != null) {
      _result.hitNum = hitNum;
    }
    if (message != null) {
      _result.message = message;
    }
    if (giftIcon != null) {
      _result.giftIcon = giftIcon;
    }
    if (comboId != null) {
      _result.comboId = comboId;
    }
    return _result;
  }
  factory BroadcasterContentStarComboGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BroadcasterContentStarComboGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BroadcasterContentStarComboGift clone() =>
      BroadcasterContentStarComboGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BroadcasterContentStarComboGift copyWith(
          void Function(BroadcasterContentStarComboGift) updates) =>
      super.copyWith(
              (message) => updates(message as BroadcasterContentStarComboGift))
          as BroadcasterContentStarComboGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BroadcasterContentStarComboGift create() =>
      BroadcasterContentStarComboGift._();
  BroadcasterContentStarComboGift createEmptyInstance() => create();
  static $pb.PbList<BroadcasterContentStarComboGift> createRepeated() =>
      $pb.PbList<BroadcasterContentStarComboGift>();
  @$core.pragma('dart2js:noInline')
  static BroadcasterContentStarComboGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BroadcasterContentStarComboGift>(
          create);
  static BroadcasterContentStarComboGift? _defaultInstance;

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
  $core.int get vipLevel => $_getIZ(3);
  @$pb.TagNumber(4)
  set vipLevel($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasVipLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearVipLevel() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get hitNum => $_getIZ(4);
  @$pb.TagNumber(5)
  set hitNum($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHitNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearHitNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get message => $_getSZ(5);
  @$pb.TagNumber(6)
  set message($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMessage() => $_has(5);
  @$pb.TagNumber(6)
  void clearMessage() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get giftIcon => $_getSZ(6);
  @$pb.TagNumber(7)
  set giftIcon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGiftIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearGiftIcon() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get comboId => $_getSZ(7);
  @$pb.TagNumber(8)
  set comboId($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasComboId() => $_has(7);
  @$pb.TagNumber(8)
  void clearComboId() => clearField(8);
}
