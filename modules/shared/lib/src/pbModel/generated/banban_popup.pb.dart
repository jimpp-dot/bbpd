///
//  Generated code. Do not modify.
//  source: banban_popup.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResPopupRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResPopupRoom',
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
    ..aOM<PopupRoom>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: PopupRoom.create)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_new')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pop_type')
    ..aOM<PopupText>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'text',
        subBuilder: PopupText.create)
    ..hasRequiredFields = false;

  ResPopupRoom._() : super();
  factory ResPopupRoom({
    $core.bool? success,
    $core.String? msg,
    PopupRoom? data,
    $core.bool? isNew,
    $core.String? popType,
    PopupText? text,
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
  factory ResPopupRoom.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResPopupRoom.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResPopupRoom clone() => ResPopupRoom()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResPopupRoom copyWith(void Function(ResPopupRoom) updates) =>
      super.copyWith((message) => updates(message as ResPopupRoom))
          as ResPopupRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResPopupRoom create() => ResPopupRoom._();
  ResPopupRoom createEmptyInstance() => create();
  static $pb.PbList<ResPopupRoom> createRepeated() =>
      $pb.PbList<ResPopupRoom>();
  @$core.pragma('dart2js:noInline')
  static ResPopupRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResPopupRoom>(create);
  static ResPopupRoom? _defaultInstance;

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
  PopupRoom get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(PopupRoom v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  PopupRoom ensureData() => $_ensure(2);

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
  PopupText get text => $_getN(5);
  @$pb.TagNumber(6)
  set text(PopupText v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasText() => $_has(5);
  @$pb.TagNumber(6)
  void clearText() => clearField(6);
  @$pb.TagNumber(6)
  PopupText ensureText() => $_ensure(5);
}

class PopupText extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PopupText',
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

  PopupText._() : super();
  factory PopupText({
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
  factory PopupText.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PopupText.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PopupText clone() => PopupText()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PopupText copyWith(void Function(PopupText) updates) =>
      super.copyWith((message) => updates(message as PopupText))
          as PopupText; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PopupText create() => PopupText._();
  PopupText createEmptyInstance() => create();
  static $pb.PbList<PopupText> createRepeated() => $pb.PbList<PopupText>();
  @$core.pragma('dart2js:noInline')
  static PopupText getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PopupText>(create);
  static PopupText? _defaultInstance;

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

class PopupRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PopupRoom',
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
            : 'distance_show')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'channel_type')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room_factory_type')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'alert_text')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PopupRoom._() : super();
  factory PopupRoom({
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
    return _result;
  }
  factory PopupRoom.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PopupRoom.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PopupRoom clone() => PopupRoom()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PopupRoom copyWith(void Function(PopupRoom) updates) =>
      super.copyWith((message) => updates(message as PopupRoom))
          as PopupRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PopupRoom create() => PopupRoom._();
  PopupRoom createEmptyInstance() => create();
  static $pb.PbList<PopupRoom> createRepeated() => $pb.PbList<PopupRoom>();
  @$core.pragma('dart2js:noInline')
  static PopupRoom getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PopupRoom>(create);
  static PopupRoom? _defaultInstance;

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
}

class ResHomePopUpAuth extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHomePopUpAuth',
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
    ..aOM<HomePopUpAuth>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HomePopUpAuth.create)
    ..hasRequiredFields = false;

  ResHomePopUpAuth._() : super();
  factory ResHomePopUpAuth({
    $core.bool? success,
    $core.String? msg,
    HomePopUpAuth? data,
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
  factory ResHomePopUpAuth.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHomePopUpAuth.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHomePopUpAuth clone() => ResHomePopUpAuth()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHomePopUpAuth copyWith(void Function(ResHomePopUpAuth) updates) =>
      super.copyWith((message) => updates(message as ResHomePopUpAuth))
          as ResHomePopUpAuth; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHomePopUpAuth create() => ResHomePopUpAuth._();
  ResHomePopUpAuth createEmptyInstance() => create();
  static $pb.PbList<ResHomePopUpAuth> createRepeated() =>
      $pb.PbList<ResHomePopUpAuth>();
  @$core.pragma('dart2js:noInline')
  static ResHomePopUpAuth getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHomePopUpAuth>(create);
  static ResHomePopUpAuth? _defaultInstance;

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
  HomePopUpAuth get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HomePopUpAuth v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HomePopUpAuth ensureData() => $_ensure(2);
}

class HomePopUpAuth extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomePopUpAuth',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'firstTips')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'secondTips')
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'supportCancel')
    ..hasRequiredFields = false;

  HomePopUpAuth._() : super();
  factory HomePopUpAuth({
    $core.bool? show,
    $core.String? firstTips,
    $core.String? secondTips,
    $core.bool? supportCancel,
  }) {
    final _result = create();
    if (show != null) {
      _result.show = show;
    }
    if (firstTips != null) {
      _result.firstTips = firstTips;
    }
    if (secondTips != null) {
      _result.secondTips = secondTips;
    }
    if (supportCancel != null) {
      _result.supportCancel = supportCancel;
    }
    return _result;
  }
  factory HomePopUpAuth.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomePopUpAuth.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomePopUpAuth clone() => HomePopUpAuth()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomePopUpAuth copyWith(void Function(HomePopUpAuth) updates) =>
      super.copyWith((message) => updates(message as HomePopUpAuth))
          as HomePopUpAuth; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomePopUpAuth create() => HomePopUpAuth._();
  HomePopUpAuth createEmptyInstance() => create();
  static $pb.PbList<HomePopUpAuth> createRepeated() =>
      $pb.PbList<HomePopUpAuth>();
  @$core.pragma('dart2js:noInline')
  static HomePopUpAuth getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomePopUpAuth>(create);
  static HomePopUpAuth? _defaultInstance;

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
  $core.String get firstTips => $_getSZ(1);
  @$pb.TagNumber(2)
  set firstTips($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFirstTips() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirstTips() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get secondTips => $_getSZ(2);
  @$pb.TagNumber(3)
  set secondTips($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSecondTips() => $_has(2);
  @$pb.TagNumber(3)
  void clearSecondTips() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get supportCancel => $_getBF(3);
  @$pb.TagNumber(4)
  set supportCancel($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSupportCancel() => $_has(3);
  @$pb.TagNumber(4)
  void clearSupportCancel() => clearField(4);
}
