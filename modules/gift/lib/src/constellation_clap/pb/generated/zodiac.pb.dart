///
//  Generated code. Do not modify.
//  source: zodiac.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'zodiac.pbenum.dart';

export 'zodiac.pbenum.dart';

class ZodiacUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ZodiacUser',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
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
            : 'inRoom',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'zodiacIcon')
    ..hasRequiredFields = false;

  ZodiacUser._() : super();
  factory ZodiacUser({
    $core.int? uid,
    $core.int? sex,
    $core.String? name,
    $core.String? icon,
    $core.int? inRoom,
    $core.String? zodiacIcon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (inRoom != null) {
      _result.inRoom = inRoom;
    }
    if (zodiacIcon != null) {
      _result.zodiacIcon = zodiacIcon;
    }
    return _result;
  }
  factory ZodiacUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ZodiacUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ZodiacUser clone() => ZodiacUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ZodiacUser copyWith(void Function(ZodiacUser) updates) =>
      super.copyWith((message) => updates(message as ZodiacUser))
          as ZodiacUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ZodiacUser create() => ZodiacUser._();
  ZodiacUser createEmptyInstance() => create();
  static $pb.PbList<ZodiacUser> createRepeated() => $pb.PbList<ZodiacUser>();
  @$core.pragma('dart2js:noInline')
  static ZodiacUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ZodiacUser>(create);
  static ZodiacUser? _defaultInstance;

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
  $core.int get sex => $_getIZ(1);
  @$pb.TagNumber(2)
  set sex($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSex() => $_has(1);
  @$pb.TagNumber(2)
  void clearSex() => clearField(2);

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
  $core.int get inRoom => $_getIZ(4);
  @$pb.TagNumber(5)
  set inRoom($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasInRoom() => $_has(4);
  @$pb.TagNumber(5)
  void clearInRoom() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get zodiacIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set zodiacIcon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasZodiacIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearZodiacIcon() => clearField(6);
}

class Zodiac extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Zodiac',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..e<ZodiacCode>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'code',
        $pb.PbFieldType.OE,
        defaultOrMaker: ZodiacCode.ZodiacCodeUnknown,
        valueOf: ZodiacCode.valueOf,
        enumValues: ZodiacCode.values)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'zodiacName',
        protoName: 'zodiacName')
    ..aOM<ZodiacUser>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'spokesman',
        subBuilder: ZodiacUser.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'marked',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  Zodiac._() : super();
  factory Zodiac({
    ZodiacCode? code,
    $core.String? zodiacName,
    ZodiacUser? spokesman,
    $core.int? marked,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (zodiacName != null) {
      _result.zodiacName = zodiacName;
    }
    if (spokesman != null) {
      _result.spokesman = spokesman;
    }
    if (marked != null) {
      _result.marked = marked;
    }
    return _result;
  }
  factory Zodiac.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Zodiac.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Zodiac clone() => Zodiac()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Zodiac copyWith(void Function(Zodiac) updates) =>
      super.copyWith((message) => updates(message as Zodiac))
          as Zodiac; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Zodiac create() => Zodiac._();
  Zodiac createEmptyInstance() => create();
  static $pb.PbList<Zodiac> createRepeated() => $pb.PbList<Zodiac>();
  @$core.pragma('dart2js:noInline')
  static Zodiac getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Zodiac>(create);
  static Zodiac? _defaultInstance;

  @$pb.TagNumber(1)
  ZodiacCode get code => $_getN(0);
  @$pb.TagNumber(1)
  set code(ZodiacCode v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get zodiacName => $_getSZ(1);
  @$pb.TagNumber(2)
  set zodiacName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasZodiacName() => $_has(1);
  @$pb.TagNumber(2)
  void clearZodiacName() => clearField(2);

  @$pb.TagNumber(3)
  ZodiacUser get spokesman => $_getN(2);
  @$pb.TagNumber(3)
  set spokesman(ZodiacUser v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSpokesman() => $_has(2);
  @$pb.TagNumber(3)
  void clearSpokesman() => clearField(3);
  @$pb.TagNumber(3)
  ZodiacUser ensureSpokesman() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get marked => $_getIZ(3);
  @$pb.TagNumber(4)
  set marked($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMarked() => $_has(3);
  @$pb.TagNumber(4)
  void clearMarked() => clearField(4);
}

class ZodiacPopup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ZodiacPopup',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<Zodiac>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'zodiacs',
        $pb.PbFieldType.PM,
        subBuilder: Zodiac.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topText')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bottomText')
    ..aOM<ZodiacUser>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'me',
        subBuilder: ZodiacUser.create)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toUid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ZodiacPopup._() : super();
  factory ZodiacPopup({
    $core.Iterable<Zodiac>? zodiacs,
    $core.int? price,
    $core.String? topText,
    $core.String? bottomText,
    ZodiacUser? me,
    $core.int? toUid,
  }) {
    final _result = create();
    if (zodiacs != null) {
      _result.zodiacs.addAll(zodiacs);
    }
    if (price != null) {
      _result.price = price;
    }
    if (topText != null) {
      _result.topText = topText;
    }
    if (bottomText != null) {
      _result.bottomText = bottomText;
    }
    if (me != null) {
      _result.me = me;
    }
    if (toUid != null) {
      _result.toUid = toUid;
    }
    return _result;
  }
  factory ZodiacPopup.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ZodiacPopup.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ZodiacPopup clone() => ZodiacPopup()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ZodiacPopup copyWith(void Function(ZodiacPopup) updates) =>
      super.copyWith((message) => updates(message as ZodiacPopup))
          as ZodiacPopup; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ZodiacPopup create() => ZodiacPopup._();
  ZodiacPopup createEmptyInstance() => create();
  static $pb.PbList<ZodiacPopup> createRepeated() => $pb.PbList<ZodiacPopup>();
  @$core.pragma('dart2js:noInline')
  static ZodiacPopup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ZodiacPopup>(create);
  static ZodiacPopup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Zodiac> get zodiacs => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get price => $_getIZ(1);
  @$pb.TagNumber(2)
  set price($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get topText => $_getSZ(2);
  @$pb.TagNumber(3)
  set topText($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTopText() => $_has(2);
  @$pb.TagNumber(3)
  void clearTopText() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get bottomText => $_getSZ(3);
  @$pb.TagNumber(4)
  set bottomText($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBottomText() => $_has(3);
  @$pb.TagNumber(4)
  void clearBottomText() => clearField(4);

  @$pb.TagNumber(5)
  ZodiacUser get me => $_getN(4);
  @$pb.TagNumber(5)
  set me(ZodiacUser v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMe() => $_has(4);
  @$pb.TagNumber(5)
  void clearMe() => clearField(5);
  @$pb.TagNumber(5)
  ZodiacUser ensureMe() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.int get toUid => $_getIZ(5);
  @$pb.TagNumber(6)
  set toUid($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasToUid() => $_has(5);
  @$pb.TagNumber(6)
  void clearToUid() => clearField(6);
}

class ZodiacPopupData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ZodiacPopupData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..aOM<ZodiacPopup>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popup',
        subBuilder: ZodiacPopup.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'delay',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ZodiacPopupData._() : super();
  factory ZodiacPopupData({
    $core.int? state,
    ZodiacPopup? popup,
    $core.int? delay,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    if (popup != null) {
      _result.popup = popup;
    }
    if (delay != null) {
      _result.delay = delay;
    }
    return _result;
  }
  factory ZodiacPopupData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ZodiacPopupData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ZodiacPopupData clone() => ZodiacPopupData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ZodiacPopupData copyWith(void Function(ZodiacPopupData) updates) =>
      super.copyWith((message) => updates(message as ZodiacPopupData))
          as ZodiacPopupData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ZodiacPopupData create() => ZodiacPopupData._();
  ZodiacPopupData createEmptyInstance() => create();
  static $pb.PbList<ZodiacPopupData> createRepeated() =>
      $pb.PbList<ZodiacPopupData>();
  @$core.pragma('dart2js:noInline')
  static ZodiacPopupData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ZodiacPopupData>(create);
  static ZodiacPopupData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get state => $_getIZ(0);
  @$pb.TagNumber(1)
  set state($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);

  @$pb.TagNumber(2)
  ZodiacPopup get popup => $_getN(1);
  @$pb.TagNumber(2)
  set popup(ZodiacPopup v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPopup() => $_has(1);
  @$pb.TagNumber(2)
  void clearPopup() => clearField(2);
  @$pb.TagNumber(2)
  ZodiacPopup ensurePopup() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get delay => $_getIZ(2);
  @$pb.TagNumber(3)
  set delay($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDelay() => $_has(2);
  @$pb.TagNumber(3)
  void clearDelay() => clearField(3);
}

class ZodiacPaiGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ZodiacPaiGift',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
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
            : 'icon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..hasRequiredFields = false;

  ZodiacPaiGift._() : super();
  factory ZodiacPaiGift({
    $core.int? id,
    $core.String? name,
    $core.String? icon,
    $core.int? price,
    $core.String? description,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (price != null) {
      _result.price = price;
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory ZodiacPaiGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ZodiacPaiGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ZodiacPaiGift clone() => ZodiacPaiGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ZodiacPaiGift copyWith(void Function(ZodiacPaiGift) updates) =>
      super.copyWith((message) => updates(message as ZodiacPaiGift))
          as ZodiacPaiGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ZodiacPaiGift create() => ZodiacPaiGift._();
  ZodiacPaiGift createEmptyInstance() => create();
  static $pb.PbList<ZodiacPaiGift> createRepeated() =>
      $pb.PbList<ZodiacPaiGift>();
  @$core.pragma('dart2js:noInline')
  static ZodiacPaiGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ZodiacPaiGift>(create);
  static ZodiacPaiGift? _defaultInstance;

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
  $core.int get price => $_getIZ(3);
  @$pb.TagNumber(4)
  set price($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => clearField(5);
}

class ZodiacPaiMission extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ZodiacPaiMission',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'progress',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewardName')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewardNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewardIcon')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewardType')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jump')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewardPeriod')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ZodiacPaiMission._() : super();
  factory ZodiacPaiMission({
    $core.int? id,
    $core.int? type,
    $core.String? description,
    $core.int? progress,
    $core.String? rewardName,
    $core.int? rewardNum,
    $core.String? rewardIcon,
    $core.String? rewardType,
    $core.int? state,
    $core.String? jump,
    $core.String? rewardPeriod,
    $core.int? total,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (type != null) {
      _result.type = type;
    }
    if (description != null) {
      _result.description = description;
    }
    if (progress != null) {
      _result.progress = progress;
    }
    if (rewardName != null) {
      _result.rewardName = rewardName;
    }
    if (rewardNum != null) {
      _result.rewardNum = rewardNum;
    }
    if (rewardIcon != null) {
      _result.rewardIcon = rewardIcon;
    }
    if (rewardType != null) {
      _result.rewardType = rewardType;
    }
    if (state != null) {
      _result.state = state;
    }
    if (jump != null) {
      _result.jump = jump;
    }
    if (rewardPeriod != null) {
      _result.rewardPeriod = rewardPeriod;
    }
    if (total != null) {
      _result.total = total;
    }
    return _result;
  }
  factory ZodiacPaiMission.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ZodiacPaiMission.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ZodiacPaiMission clone() => ZodiacPaiMission()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ZodiacPaiMission copyWith(void Function(ZodiacPaiMission) updates) =>
      super.copyWith((message) => updates(message as ZodiacPaiMission))
          as ZodiacPaiMission; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ZodiacPaiMission create() => ZodiacPaiMission._();
  ZodiacPaiMission createEmptyInstance() => create();
  static $pb.PbList<ZodiacPaiMission> createRepeated() =>
      $pb.PbList<ZodiacPaiMission>();
  @$core.pragma('dart2js:noInline')
  static ZodiacPaiMission getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ZodiacPaiMission>(create);
  static ZodiacPaiMission? _defaultInstance;

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
  $core.int get type => $_getIZ(1);
  @$pb.TagNumber(2)
  set type($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get progress => $_getIZ(3);
  @$pb.TagNumber(4)
  set progress($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasProgress() => $_has(3);
  @$pb.TagNumber(4)
  void clearProgress() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get rewardName => $_getSZ(4);
  @$pb.TagNumber(5)
  set rewardName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRewardName() => $_has(4);
  @$pb.TagNumber(5)
  void clearRewardName() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get rewardNum => $_getIZ(5);
  @$pb.TagNumber(6)
  set rewardNum($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRewardNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearRewardNum() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get rewardIcon => $_getSZ(6);
  @$pb.TagNumber(7)
  set rewardIcon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRewardIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearRewardIcon() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get rewardType => $_getSZ(7);
  @$pb.TagNumber(8)
  set rewardType($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasRewardType() => $_has(7);
  @$pb.TagNumber(8)
  void clearRewardType() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get state => $_getIZ(8);
  @$pb.TagNumber(9)
  set state($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasState() => $_has(8);
  @$pb.TagNumber(9)
  void clearState() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get jump => $_getSZ(9);
  @$pb.TagNumber(10)
  set jump($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasJump() => $_has(9);
  @$pb.TagNumber(10)
  void clearJump() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get rewardPeriod => $_getSZ(10);
  @$pb.TagNumber(11)
  set rewardPeriod($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasRewardPeriod() => $_has(10);
  @$pb.TagNumber(11)
  void clearRewardPeriod() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get total => $_getIZ(11);
  @$pb.TagNumber(12)
  set total($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasTotal() => $_has(11);
  @$pb.TagNumber(12)
  void clearTotal() => clearField(12);
}

class ZodiacPaiResultData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ZodiacPaiResultData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<ZodiacUser>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'me',
        subBuilder: ZodiacUser.create)
    ..aOM<ZodiacUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'spokesman',
        subBuilder: ZodiacUser.create)
    ..e<ZodiacCode>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'code',
        $pb.PbFieldType.OE,
        defaultOrMaker: ZodiacCode.ZodiacCodeUnknown,
        valueOf: ZodiacCode.valueOf,
        enumValues: ZodiacCode.values)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..aOM<ZodiacPaiGift>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift',
        subBuilder: ZodiacPaiGift.create)
    ..pc<ZodiacPaiMission>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'missions',
        $pb.PbFieldType.PM,
        subBuilder: ZodiacPaiMission.create)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endTime',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ZodiacPaiResultData._() : super();
  factory ZodiacPaiResultData({
    ZodiacUser? me,
    ZodiacUser? spokesman,
    ZodiacCode? code,
    $core.int? score,
    ZodiacPaiGift? gift,
    $core.Iterable<ZodiacPaiMission>? missions,
    $core.int? endTime,
  }) {
    final _result = create();
    if (me != null) {
      _result.me = me;
    }
    if (spokesman != null) {
      _result.spokesman = spokesman;
    }
    if (code != null) {
      _result.code = code;
    }
    if (score != null) {
      _result.score = score;
    }
    if (gift != null) {
      _result.gift = gift;
    }
    if (missions != null) {
      _result.missions.addAll(missions);
    }
    if (endTime != null) {
      _result.endTime = endTime;
    }
    return _result;
  }
  factory ZodiacPaiResultData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ZodiacPaiResultData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ZodiacPaiResultData clone() => ZodiacPaiResultData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ZodiacPaiResultData copyWith(void Function(ZodiacPaiResultData) updates) =>
      super.copyWith((message) => updates(message as ZodiacPaiResultData))
          as ZodiacPaiResultData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ZodiacPaiResultData create() => ZodiacPaiResultData._();
  ZodiacPaiResultData createEmptyInstance() => create();
  static $pb.PbList<ZodiacPaiResultData> createRepeated() =>
      $pb.PbList<ZodiacPaiResultData>();
  @$core.pragma('dart2js:noInline')
  static ZodiacPaiResultData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ZodiacPaiResultData>(create);
  static ZodiacPaiResultData? _defaultInstance;

  @$pb.TagNumber(1)
  ZodiacUser get me => $_getN(0);
  @$pb.TagNumber(1)
  set me(ZodiacUser v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMe() => $_has(0);
  @$pb.TagNumber(1)
  void clearMe() => clearField(1);
  @$pb.TagNumber(1)
  ZodiacUser ensureMe() => $_ensure(0);

  @$pb.TagNumber(2)
  ZodiacUser get spokesman => $_getN(1);
  @$pb.TagNumber(2)
  set spokesman(ZodiacUser v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSpokesman() => $_has(1);
  @$pb.TagNumber(2)
  void clearSpokesman() => clearField(2);
  @$pb.TagNumber(2)
  ZodiacUser ensureSpokesman() => $_ensure(1);

  @$pb.TagNumber(3)
  ZodiacCode get code => $_getN(2);
  @$pb.TagNumber(3)
  set code(ZodiacCode v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearCode() => clearField(3);

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
  ZodiacPaiGift get gift => $_getN(4);
  @$pb.TagNumber(5)
  set gift(ZodiacPaiGift v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGift() => $_has(4);
  @$pb.TagNumber(5)
  void clearGift() => clearField(5);
  @$pb.TagNumber(5)
  ZodiacPaiGift ensureGift() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.List<ZodiacPaiMission> get missions => $_getList(5);

  @$pb.TagNumber(7)
  $core.int get endTime => $_getIZ(6);
  @$pb.TagNumber(7)
  set endTime($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasEndTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearEndTime() => clearField(7);
}

class ApiZodiacPopupResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiZodiacPopupResponse',
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
            : 'message')
    ..aOM<ZodiacPopupData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ZodiacPopupData.create)
    ..hasRequiredFields = false;

  ApiZodiacPopupResponse._() : super();
  factory ApiZodiacPopupResponse({
    $core.bool? success,
    $core.String? message,
    ZodiacPopupData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiZodiacPopupResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiZodiacPopupResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiZodiacPopupResponse clone() =>
      ApiZodiacPopupResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiZodiacPopupResponse copyWith(
          void Function(ApiZodiacPopupResponse) updates) =>
      super.copyWith((message) => updates(message as ApiZodiacPopupResponse))
          as ApiZodiacPopupResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiZodiacPopupResponse create() => ApiZodiacPopupResponse._();
  ApiZodiacPopupResponse createEmptyInstance() => create();
  static $pb.PbList<ApiZodiacPopupResponse> createRepeated() =>
      $pb.PbList<ApiZodiacPopupResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiZodiacPopupResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiZodiacPopupResponse>(create);
  static ApiZodiacPopupResponse? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  ZodiacPopupData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ZodiacPopupData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ZodiacPopupData ensureData() => $_ensure(2);
}

class ApiZodiacPaiResultResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiZodiacPaiResultResponse',
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
            : 'message')
    ..aOM<ZodiacPaiResultData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ZodiacPaiResultData.create)
    ..hasRequiredFields = false;

  ApiZodiacPaiResultResponse._() : super();
  factory ApiZodiacPaiResultResponse({
    $core.bool? success,
    $core.String? message,
    ZodiacPaiResultData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ApiZodiacPaiResultResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiZodiacPaiResultResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiZodiacPaiResultResponse clone() =>
      ApiZodiacPaiResultResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiZodiacPaiResultResponse copyWith(
          void Function(ApiZodiacPaiResultResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ApiZodiacPaiResultResponse))
          as ApiZodiacPaiResultResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiZodiacPaiResultResponse create() => ApiZodiacPaiResultResponse._();
  ApiZodiacPaiResultResponse createEmptyInstance() => create();
  static $pb.PbList<ApiZodiacPaiResultResponse> createRepeated() =>
      $pb.PbList<ApiZodiacPaiResultResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiZodiacPaiResultResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiZodiacPaiResultResponse>(create);
  static ApiZodiacPaiResultResponse? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  ZodiacPaiResultData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ZodiacPaiResultData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ZodiacPaiResultData ensureData() => $_ensure(2);
}
