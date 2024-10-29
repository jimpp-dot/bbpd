///
//  Generated code. Do not modify.
//  source: hisong_popup.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResHisongPopup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHisongPopup',
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
    ..aOM<HisongPopupRoom>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HisongPopupRoom.create)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isNew')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popType')
    ..aOM<HisongPopupText>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'text',
        subBuilder: HisongPopupText.create)
    ..hasRequiredFields = false;

  ResHisongPopup._() : super();
  factory ResHisongPopup({
    $core.bool? success,
    $core.String? msg,
    HisongPopupRoom? data,
    $core.bool? isNew,
    $core.String? popType,
    HisongPopupText? text,
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
    if (isNew != null) {
      _result.isNew = isNew;
    }
    if (popType != null) {
      _result.popType = popType;
    }
    if (text != null) {
      _result.text = text;
    }
    return _result;
  }
  factory ResHisongPopup.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHisongPopup.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHisongPopup clone() => ResHisongPopup()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHisongPopup copyWith(void Function(ResHisongPopup) updates) =>
      super.copyWith((message) => updates(message as ResHisongPopup))
          as ResHisongPopup; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHisongPopup create() => ResHisongPopup._();
  ResHisongPopup createEmptyInstance() => create();
  static $pb.PbList<ResHisongPopup> createRepeated() =>
      $pb.PbList<ResHisongPopup>();
  @$core.pragma('dart2js:noInline')
  static ResHisongPopup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHisongPopup>(create);
  static ResHisongPopup? _defaultInstance;

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
  HisongPopupRoom get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HisongPopupRoom v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HisongPopupRoom ensureData() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.bool get isNew => $_getBF(3);
  @$pb.TagNumber(4)
  set isNew($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIsNew() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsNew() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get popType => $_getSZ(4);
  @$pb.TagNumber(5)
  set popType($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPopType() => $_has(4);
  @$pb.TagNumber(5)
  void clearPopType() => clearField(5);

  @$pb.TagNumber(6)
  HisongPopupText get text => $_getN(5);
  @$pb.TagNumber(6)
  set text(HisongPopupText v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasText() => $_has(5);
  @$pb.TagNumber(6)
  void clearText() => clearField(6);
  @$pb.TagNumber(6)
  HisongPopupText ensureText() => $_ensure(5);
}

class HisongPopupText extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HisongPopupText',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cancel')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ok')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..hasRequiredFields = false;

  HisongPopupText._() : super();
  factory HisongPopupText({
    $core.String? cancel,
    $core.String? ok,
    $core.String? content,
  }) {
    final _result = create();
    if (cancel != null) {
      _result.cancel = cancel;
    }
    if (ok != null) {
      _result.ok = ok;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory HisongPopupText.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HisongPopupText.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HisongPopupText clone() => HisongPopupText()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HisongPopupText copyWith(void Function(HisongPopupText) updates) =>
      super.copyWith((message) => updates(message as HisongPopupText))
          as HisongPopupText; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HisongPopupText create() => HisongPopupText._();
  HisongPopupText createEmptyInstance() => create();
  static $pb.PbList<HisongPopupText> createRepeated() =>
      $pb.PbList<HisongPopupText>();
  @$core.pragma('dart2js:noInline')
  static HisongPopupText getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HisongPopupText>(create);
  static HisongPopupText? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cancel => $_getSZ(0);
  @$pb.TagNumber(1)
  set cancel($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCancel() => $_has(0);
  @$pb.TagNumber(1)
  void clearCancel() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get ok => $_getSZ(1);
  @$pb.TagNumber(2)
  set ok($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOk() => $_has(1);
  @$pb.TagNumber(2)
  void clearOk() => clearField(2);

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
}

class HisongPopupRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HisongPopupRoom',
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
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
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
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'distanceShow')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'channelType')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomFactoryType')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'alertText')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerClubId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HisongPopupRoom._() : super();
  factory HisongPopupRoom({
    $core.int? uid,
    $core.int? rid,
    $core.int? age,
    $core.String? name,
    $core.String? icon,
    $core.String? distanceShow,
    $core.String? channelType,
    $core.String? roomFactoryType,
    $core.String? alertText,
    $core.int? sex,
    $core.int? singerClubId,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (age != null) {
      _result.age = age;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (distanceShow != null) {
      _result.distanceShow = distanceShow;
    }
    if (channelType != null) {
      _result.channelType = channelType;
    }
    if (roomFactoryType != null) {
      _result.roomFactoryType = roomFactoryType;
    }
    if (alertText != null) {
      _result.alertText = alertText;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (singerClubId != null) {
      _result.singerClubId = singerClubId;
    }
    return _result;
  }
  factory HisongPopupRoom.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HisongPopupRoom.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HisongPopupRoom clone() => HisongPopupRoom()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HisongPopupRoom copyWith(void Function(HisongPopupRoom) updates) =>
      super.copyWith((message) => updates(message as HisongPopupRoom))
          as HisongPopupRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HisongPopupRoom create() => HisongPopupRoom._();
  HisongPopupRoom createEmptyInstance() => create();
  static $pb.PbList<HisongPopupRoom> createRepeated() =>
      $pb.PbList<HisongPopupRoom>();
  @$core.pragma('dart2js:noInline')
  static HisongPopupRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HisongPopupRoom>(create);
  static HisongPopupRoom? _defaultInstance;

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
  $core.int get age => $_getIZ(2);
  @$pb.TagNumber(3)
  set age($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAge() => $_has(2);
  @$pb.TagNumber(3)
  void clearAge() => clearField(3);

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
  $core.String get distanceShow => $_getSZ(5);
  @$pb.TagNumber(6)
  set distanceShow($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDistanceShow() => $_has(5);
  @$pb.TagNumber(6)
  void clearDistanceShow() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get channelType => $_getSZ(6);
  @$pb.TagNumber(7)
  set channelType($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasChannelType() => $_has(6);
  @$pb.TagNumber(7)
  void clearChannelType() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get roomFactoryType => $_getSZ(7);
  @$pb.TagNumber(8)
  set roomFactoryType($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasRoomFactoryType() => $_has(7);
  @$pb.TagNumber(8)
  void clearRoomFactoryType() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get alertText => $_getSZ(8);
  @$pb.TagNumber(9)
  set alertText($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasAlertText() => $_has(8);
  @$pb.TagNumber(9)
  void clearAlertText() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get sex => $_getIZ(9);
  @$pb.TagNumber(10)
  set sex($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasSex() => $_has(9);
  @$pb.TagNumber(10)
  void clearSex() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get singerClubId => $_getIZ(10);
  @$pb.TagNumber(11)
  set singerClubId($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasSingerClubId() => $_has(10);
  @$pb.TagNumber(11)
  void clearSingerClubId() => clearField(11);
}
