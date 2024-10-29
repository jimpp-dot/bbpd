///
//  Generated code. Do not modify.
//  source: room.theone.refresh.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomTheoneRefresh_Adore extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomTheoneRefresh.Adore',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.theone.refresh'),
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
            : 'value',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomTheoneRefresh_Adore._() : super();
  factory RoomTheoneRefresh_Adore({
    $core.int? uid,
    $core.int? value,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory RoomTheoneRefresh_Adore.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomTheoneRefresh_Adore.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomTheoneRefresh_Adore clone() =>
      RoomTheoneRefresh_Adore()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomTheoneRefresh_Adore copyWith(
          void Function(RoomTheoneRefresh_Adore) updates) =>
      super.copyWith((message) => updates(message as RoomTheoneRefresh_Adore))
          as RoomTheoneRefresh_Adore; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomTheoneRefresh_Adore create() => RoomTheoneRefresh_Adore._();
  RoomTheoneRefresh_Adore createEmptyInstance() => create();
  static $pb.PbList<RoomTheoneRefresh_Adore> createRepeated() =>
      $pb.PbList<RoomTheoneRefresh_Adore>();
  @$core.pragma('dart2js:noInline')
  static RoomTheoneRefresh_Adore getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomTheoneRefresh_Adore>(create);
  static RoomTheoneRefresh_Adore? _defaultInstance;

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
  $core.int get value => $_getIZ(1);
  @$pb.TagNumber(2)
  set value($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class RoomTheoneRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomTheoneRefresh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.theone.refresh'),
      createEmptyInstance: create)
    ..pc<RoomTheoneRefresh_Adore>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'adore',
        $pb.PbFieldType.PM,
        subBuilder: RoomTheoneRefresh_Adore.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hand_num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'honeymoon',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inflexion',
        $pb.PbFieldType.OU3)
    ..p<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'like',
        $pb.PbFieldType.PU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'like_icon')
    ..p<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'love',
        $pb.PbFieldType.PU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'love_icon')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mys_icon')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mysm_icon')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mystery',
        $pb.PbFieldType.OU3)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'reveal_effect')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stage')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toplight',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomTheoneRefresh._() : super();
  factory RoomTheoneRefresh({
    $core.Iterable<RoomTheoneRefresh_Adore>? adore,
    $core.int? handNum,
    $core.int? honeymoon,
    $core.int? inflexion,
    $core.Iterable<$core.int>? like,
    $core.String? likeIcon,
    $core.Iterable<$core.int>? love,
    $core.String? loveIcon,
    $core.String? mysIcon,
    $core.String? mysmIcon,
    $core.int? mystery,
    $core.String? revealEffect,
    $core.String? stage,
    $core.int? toplight,
  }) {
    final _result = create();
    if (adore != null) {
      _result.adore.addAll(adore);
    }
    if (handNum != null) {
      _result.handNum = handNum;
    }
    if (honeymoon != null) {
      _result.honeymoon = honeymoon;
    }
    if (inflexion != null) {
      _result.inflexion = inflexion;
    }
    if (like != null) {
      _result.like.addAll(like);
    }
    if (likeIcon != null) {
      _result.likeIcon = likeIcon;
    }
    if (love != null) {
      _result.love.addAll(love);
    }
    if (loveIcon != null) {
      _result.loveIcon = loveIcon;
    }
    if (mysIcon != null) {
      _result.mysIcon = mysIcon;
    }
    if (mysmIcon != null) {
      _result.mysmIcon = mysmIcon;
    }
    if (mystery != null) {
      _result.mystery = mystery;
    }
    if (revealEffect != null) {
      _result.revealEffect = revealEffect;
    }
    if (stage != null) {
      _result.stage = stage;
    }
    if (toplight != null) {
      _result.toplight = toplight;
    }
    return _result;
  }
  factory RoomTheoneRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomTheoneRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomTheoneRefresh clone() => RoomTheoneRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomTheoneRefresh copyWith(void Function(RoomTheoneRefresh) updates) =>
      super.copyWith((message) => updates(message as RoomTheoneRefresh))
          as RoomTheoneRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomTheoneRefresh create() => RoomTheoneRefresh._();
  RoomTheoneRefresh createEmptyInstance() => create();
  static $pb.PbList<RoomTheoneRefresh> createRepeated() =>
      $pb.PbList<RoomTheoneRefresh>();
  @$core.pragma('dart2js:noInline')
  static RoomTheoneRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomTheoneRefresh>(create);
  static RoomTheoneRefresh? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RoomTheoneRefresh_Adore> get adore => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get handNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set handNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHandNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearHandNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get honeymoon => $_getIZ(2);
  @$pb.TagNumber(3)
  set honeymoon($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHoneymoon() => $_has(2);
  @$pb.TagNumber(3)
  void clearHoneymoon() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get inflexion => $_getIZ(3);
  @$pb.TagNumber(4)
  set inflexion($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasInflexion() => $_has(3);
  @$pb.TagNumber(4)
  void clearInflexion() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get like => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get likeIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set likeIcon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLikeIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearLikeIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.int> get love => $_getList(6);

  @$pb.TagNumber(8)
  $core.String get loveIcon => $_getSZ(7);
  @$pb.TagNumber(8)
  set loveIcon($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLoveIcon() => $_has(7);
  @$pb.TagNumber(8)
  void clearLoveIcon() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get mysIcon => $_getSZ(8);
  @$pb.TagNumber(9)
  set mysIcon($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasMysIcon() => $_has(8);
  @$pb.TagNumber(9)
  void clearMysIcon() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get mysmIcon => $_getSZ(9);
  @$pb.TagNumber(10)
  set mysmIcon($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasMysmIcon() => $_has(9);
  @$pb.TagNumber(10)
  void clearMysmIcon() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get mystery => $_getIZ(10);
  @$pb.TagNumber(11)
  set mystery($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasMystery() => $_has(10);
  @$pb.TagNumber(11)
  void clearMystery() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get revealEffect => $_getSZ(11);
  @$pb.TagNumber(12)
  set revealEffect($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasRevealEffect() => $_has(11);
  @$pb.TagNumber(12)
  void clearRevealEffect() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get stage => $_getSZ(12);
  @$pb.TagNumber(13)
  set stage($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasStage() => $_has(12);
  @$pb.TagNumber(13)
  void clearStage() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get toplight => $_getIZ(13);
  @$pb.TagNumber(14)
  set toplight($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasToplight() => $_has(13);
  @$pb.TagNumber(14)
  void clearToplight() => clearField(14);
}
