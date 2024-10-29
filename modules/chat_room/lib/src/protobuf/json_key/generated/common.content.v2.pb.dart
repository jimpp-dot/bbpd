///
//  Generated code. Do not modify.
//  source: common.content.v2.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CommonContentV2_Extra_Gift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CommonContentV2.Extra.Gift',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'common.content.v2'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'flyingTime',
        $pb.PbFieldType.OU3,
        protoName: 'flyingTime')
    ..a<$core.double>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fromUid',
        $pb.PbFieldType.OD,
        protoName: 'fromUid')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.OU3,
        protoName: 'giftId')
    ..a<$core.double>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toUid',
        $pb.PbFieldType.OD,
        protoName: 'toUid')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..hasRequiredFields = false;

  CommonContentV2_Extra_Gift._() : super();
  factory CommonContentV2_Extra_Gift({
    $core.int? flyingTime,
    $core.double? fromUid,
    $core.int? giftId,
    $core.double? toUid,
    $core.String? url,
  }) {
    final _result = create();
    if (flyingTime != null) {
      _result.flyingTime = flyingTime;
    }
    if (fromUid != null) {
      _result.fromUid = fromUid;
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (toUid != null) {
      _result.toUid = toUid;
    }
    if (url != null) {
      _result.url = url;
    }
    return _result;
  }
  factory CommonContentV2_Extra_Gift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommonContentV2_Extra_Gift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommonContentV2_Extra_Gift clone() =>
      CommonContentV2_Extra_Gift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommonContentV2_Extra_Gift copyWith(
          void Function(CommonContentV2_Extra_Gift) updates) =>
      super.copyWith(
              (message) => updates(message as CommonContentV2_Extra_Gift))
          as CommonContentV2_Extra_Gift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommonContentV2_Extra_Gift create() => CommonContentV2_Extra_Gift._();
  CommonContentV2_Extra_Gift createEmptyInstance() => create();
  static $pb.PbList<CommonContentV2_Extra_Gift> createRepeated() =>
      $pb.PbList<CommonContentV2_Extra_Gift>();
  @$core.pragma('dart2js:noInline')
  static CommonContentV2_Extra_Gift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonContentV2_Extra_Gift>(create);
  static CommonContentV2_Extra_Gift? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get flyingTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set flyingTime($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFlyingTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearFlyingTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get fromUid => $_getN(1);
  @$pb.TagNumber(2)
  set fromUid($core.double v) {
    $_setDouble(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFromUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearFromUid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get giftId => $_getIZ(2);
  @$pb.TagNumber(3)
  set giftId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGiftId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftId() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get toUid => $_getN(3);
  @$pb.TagNumber(4)
  set toUid($core.double v) {
    $_setDouble(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasToUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearToUid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get url => $_getSZ(4);
  @$pb.TagNumber(5)
  set url($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearUrl() => clearField(5);
}

class CommonContentV2_Extra extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CommonContentV2.Extra',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'common.content.v2'),
      createEmptyInstance: create)
    ..aOM<CommonContentV2_Extra_Gift>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift',
        subBuilder: CommonContentV2_Extra_Gift.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uuid')
    ..hasRequiredFields = false;

  CommonContentV2_Extra._() : super();
  factory CommonContentV2_Extra({
    CommonContentV2_Extra_Gift? gift,
    $core.String? type,
    $core.String? uuid,
  }) {
    final _result = create();
    if (gift != null) {
      _result.gift = gift;
    }
    if (type != null) {
      _result.type = type;
    }
    if (uuid != null) {
      _result.uuid = uuid;
    }
    return _result;
  }
  factory CommonContentV2_Extra.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommonContentV2_Extra.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommonContentV2_Extra clone() =>
      CommonContentV2_Extra()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommonContentV2_Extra copyWith(
          void Function(CommonContentV2_Extra) updates) =>
      super.copyWith((message) => updates(message as CommonContentV2_Extra))
          as CommonContentV2_Extra; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommonContentV2_Extra create() => CommonContentV2_Extra._();
  CommonContentV2_Extra createEmptyInstance() => create();
  static $pb.PbList<CommonContentV2_Extra> createRepeated() =>
      $pb.PbList<CommonContentV2_Extra>();
  @$core.pragma('dart2js:noInline')
  static CommonContentV2_Extra getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonContentV2_Extra>(create);
  static CommonContentV2_Extra? _defaultInstance;

  @$pb.TagNumber(1)
  CommonContentV2_Extra_Gift get gift => $_getN(0);
  @$pb.TagNumber(1)
  set gift(CommonContentV2_Extra_Gift v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGift() => $_has(0);
  @$pb.TagNumber(1)
  void clearGift() => clearField(1);
  @$pb.TagNumber(1)
  CommonContentV2_Extra_Gift ensureGift() => $_ensure(0);

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
  $core.String get uuid => $_getSZ(2);
  @$pb.TagNumber(3)
  set uuid($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUuid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUuid() => clearField(3);
}

class CommonContentV2_User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CommonContentV2.User',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'common.content.v2'),
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
            : 'portraitUri',
        protoName: 'portraitUri')
    ..hasRequiredFields = false;

  CommonContentV2_User._() : super();
  factory CommonContentV2_User({
    $core.String? id,
    $core.String? name,
    $core.String? portraitUri,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (portraitUri != null) {
      _result.portraitUri = portraitUri;
    }
    return _result;
  }
  factory CommonContentV2_User.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommonContentV2_User.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommonContentV2_User clone() =>
      CommonContentV2_User()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommonContentV2_User copyWith(void Function(CommonContentV2_User) updates) =>
      super.copyWith((message) => updates(message as CommonContentV2_User))
          as CommonContentV2_User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommonContentV2_User create() => CommonContentV2_User._();
  CommonContentV2_User createEmptyInstance() => create();
  static $pb.PbList<CommonContentV2_User> createRepeated() =>
      $pb.PbList<CommonContentV2_User>();
  @$core.pragma('dart2js:noInline')
  static CommonContentV2_User getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonContentV2_User>(create);
  static CommonContentV2_User? _defaultInstance;

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
  $core.String get portraitUri => $_getSZ(2);
  @$pb.TagNumber(3)
  set portraitUri($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPortraitUri() => $_has(2);
  @$pb.TagNumber(3)
  void clearPortraitUri() => clearField(3);
}

class CommonContentV2 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CommonContentV2',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'common.content.v2'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..aOM<CommonContentV2_Extra>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extra',
        subBuilder: CommonContentV2_Extra.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOM<CommonContentV2_User>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: CommonContentV2_User.create)
    ..hasRequiredFields = false;

  CommonContentV2._() : super();
  factory CommonContentV2({
    $core.String? content,
    CommonContentV2_Extra? extra,
    $core.String? name,
    CommonContentV2_User? user,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (extra != null) {
      _result.extra = extra;
    }
    if (name != null) {
      _result.name = name;
    }
    if (user != null) {
      _result.user = user;
    }
    return _result;
  }
  factory CommonContentV2.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommonContentV2.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommonContentV2 clone() => CommonContentV2()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommonContentV2 copyWith(void Function(CommonContentV2) updates) =>
      super.copyWith((message) => updates(message as CommonContentV2))
          as CommonContentV2; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommonContentV2 create() => CommonContentV2._();
  CommonContentV2 createEmptyInstance() => create();
  static $pb.PbList<CommonContentV2> createRepeated() =>
      $pb.PbList<CommonContentV2>();
  @$core.pragma('dart2js:noInline')
  static CommonContentV2 getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonContentV2>(create);
  static CommonContentV2? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);

  @$pb.TagNumber(2)
  CommonContentV2_Extra get extra => $_getN(1);
  @$pb.TagNumber(2)
  set extra(CommonContentV2_Extra v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasExtra() => $_has(1);
  @$pb.TagNumber(2)
  void clearExtra() => clearField(2);
  @$pb.TagNumber(2)
  CommonContentV2_Extra ensureExtra() => $_ensure(1);

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
  CommonContentV2_User get user => $_getN(3);
  @$pb.TagNumber(4)
  set user(CommonContentV2_User v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUser() => $_has(3);
  @$pb.TagNumber(4)
  void clearUser() => clearField(4);
  @$pb.TagNumber(4)
  CommonContentV2_User ensureUser() => $_ensure(3);
}
