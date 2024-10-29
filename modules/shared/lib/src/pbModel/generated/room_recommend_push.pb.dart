///
//  Generated code. Do not modify.
//  source: room_recommend_push.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResHomeRecommendEnterRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHomeRecommendEnterRoom',
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
    ..aOM<HomeRecommendEnterRoom>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HomeRecommendEnterRoom.create)
    ..hasRequiredFields = false;

  ResHomeRecommendEnterRoom._() : super();
  factory ResHomeRecommendEnterRoom({
    $core.bool? success,
    $core.String? msg,
    HomeRecommendEnterRoom? data,
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
  factory ResHomeRecommendEnterRoom.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHomeRecommendEnterRoom.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHomeRecommendEnterRoom clone() =>
      ResHomeRecommendEnterRoom()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHomeRecommendEnterRoom copyWith(
          void Function(ResHomeRecommendEnterRoom) updates) =>
      super.copyWith((message) => updates(message as ResHomeRecommendEnterRoom))
          as ResHomeRecommendEnterRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHomeRecommendEnterRoom create() => ResHomeRecommendEnterRoom._();
  ResHomeRecommendEnterRoom createEmptyInstance() => create();
  static $pb.PbList<ResHomeRecommendEnterRoom> createRepeated() =>
      $pb.PbList<ResHomeRecommendEnterRoom>();
  @$core.pragma('dart2js:noInline')
  static ResHomeRecommendEnterRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHomeRecommendEnterRoom>(create);
  static ResHomeRecommendEnterRoom? _defaultInstance;

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
  HomeRecommendEnterRoom get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HomeRecommendEnterRoom v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HomeRecommendEnterRoom ensureData() => $_ensure(2);
}

class HomeRecommendEnterRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeRecommendEnterRoom',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
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
            : 'rid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time',
        $pb.PbFieldType.O3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.O3)
    ..pPS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'avatarList')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomTagIcon')
    ..pPS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeBg')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomFactoryType')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagColor')
    ..hasRequiredFields = false;

  HomeRecommendEnterRoom._() : super();
  factory HomeRecommendEnterRoom({
    $core.String? icon,
    $core.int? uid,
    $core.String? title,
    $core.int? rid,
    $core.int? time,
    $core.String? name,
    $core.int? num,
    $core.Iterable<$core.String>? avatarList,
    $core.String? roomTagIcon,
    $core.Iterable<$core.String>? typeBg,
    $core.String? roomFactoryType,
    $core.String? tagColor,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (title != null) {
      _result.title = title;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (time != null) {
      _result.time = time;
    }
    if (name != null) {
      _result.name = name;
    }
    if (num != null) {
      _result.num = num;
    }
    if (avatarList != null) {
      _result.avatarList.addAll(avatarList);
    }
    if (roomTagIcon != null) {
      _result.roomTagIcon = roomTagIcon;
    }
    if (typeBg != null) {
      _result.typeBg.addAll(typeBg);
    }
    if (roomFactoryType != null) {
      _result.roomFactoryType = roomFactoryType;
    }
    if (tagColor != null) {
      _result.tagColor = tagColor;
    }
    return _result;
  }
  factory HomeRecommendEnterRoom.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeRecommendEnterRoom.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeRecommendEnterRoom clone() =>
      HomeRecommendEnterRoom()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeRecommendEnterRoom copyWith(
          void Function(HomeRecommendEnterRoom) updates) =>
      super.copyWith((message) => updates(message as HomeRecommendEnterRoom))
          as HomeRecommendEnterRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeRecommendEnterRoom create() => HomeRecommendEnterRoom._();
  HomeRecommendEnterRoom createEmptyInstance() => create();
  static $pb.PbList<HomeRecommendEnterRoom> createRepeated() =>
      $pb.PbList<HomeRecommendEnterRoom>();
  @$core.pragma('dart2js:noInline')
  static HomeRecommendEnterRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeRecommendEnterRoom>(create);
  static HomeRecommendEnterRoom? _defaultInstance;

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
  $core.int get rid => $_getIZ(3);
  @$pb.TagNumber(4)
  set rid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRid() => $_has(3);
  @$pb.TagNumber(4)
  void clearRid() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get time => $_getIZ(4);
  @$pb.TagNumber(5)
  set time($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearTime() => clearField(5);

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

  @$pb.TagNumber(7)
  $core.int get num => $_getIZ(6);
  @$pb.TagNumber(7)
  set num($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasNum() => $_has(6);
  @$pb.TagNumber(7)
  void clearNum() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.String> get avatarList => $_getList(7);

  @$pb.TagNumber(9)
  $core.String get roomTagIcon => $_getSZ(8);
  @$pb.TagNumber(9)
  set roomTagIcon($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasRoomTagIcon() => $_has(8);
  @$pb.TagNumber(9)
  void clearRoomTagIcon() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.String> get typeBg => $_getList(9);

  @$pb.TagNumber(11)
  $core.String get roomFactoryType => $_getSZ(10);
  @$pb.TagNumber(11)
  set roomFactoryType($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasRoomFactoryType() => $_has(10);
  @$pb.TagNumber(11)
  void clearRoomFactoryType() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get tagColor => $_getSZ(11);
  @$pb.TagNumber(12)
  set tagColor($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasTagColor() => $_has(11);
  @$pb.TagNumber(12)
  void clearTagColor() => clearField(12);
}
