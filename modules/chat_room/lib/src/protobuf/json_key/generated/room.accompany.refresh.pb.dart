///
//  Generated code. Do not modify.
//  source: room.accompany.refresh.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomAccompanyRefresh_Banner extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomAccompanyRefresh.Banner',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.accompany.refresh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomAccompanyRefresh_Banner._() : super();
  factory RoomAccompanyRefresh_Banner({
    $core.String? icon,
    $core.String? title,
    $core.int? value,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (title != null) {
      _result.title = title;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory RoomAccompanyRefresh_Banner.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomAccompanyRefresh_Banner.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomAccompanyRefresh_Banner clone() =>
      RoomAccompanyRefresh_Banner()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomAccompanyRefresh_Banner copyWith(
          void Function(RoomAccompanyRefresh_Banner) updates) =>
      super.copyWith(
              (message) => updates(message as RoomAccompanyRefresh_Banner))
          as RoomAccompanyRefresh_Banner; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomAccompanyRefresh_Banner create() =>
      RoomAccompanyRefresh_Banner._();
  RoomAccompanyRefresh_Banner createEmptyInstance() => create();
  static $pb.PbList<RoomAccompanyRefresh_Banner> createRepeated() =>
      $pb.PbList<RoomAccompanyRefresh_Banner>();
  @$core.pragma('dart2js:noInline')
  static RoomAccompanyRefresh_Banner getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomAccompanyRefresh_Banner>(create);
  static RoomAccompanyRefresh_Banner? _defaultInstance;

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
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get value => $_getIZ(2);
  @$pb.TagNumber(3)
  set value($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);
}

class RoomAccompanyRefresh_CallList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomAccompanyRefresh.CallList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.accompany.refresh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
    ..hasRequiredFields = false;

  RoomAccompanyRefresh_CallList._() : super();
  factory RoomAccompanyRefresh_CallList({
    $core.String? icon,
    $core.String? uid,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory RoomAccompanyRefresh_CallList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomAccompanyRefresh_CallList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomAccompanyRefresh_CallList clone() =>
      RoomAccompanyRefresh_CallList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomAccompanyRefresh_CallList copyWith(
          void Function(RoomAccompanyRefresh_CallList) updates) =>
      super.copyWith(
              (message) => updates(message as RoomAccompanyRefresh_CallList))
          as RoomAccompanyRefresh_CallList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomAccompanyRefresh_CallList create() =>
      RoomAccompanyRefresh_CallList._();
  RoomAccompanyRefresh_CallList createEmptyInstance() => create();
  static $pb.PbList<RoomAccompanyRefresh_CallList> createRepeated() =>
      $pb.PbList<RoomAccompanyRefresh_CallList>();
  @$core.pragma('dart2js:noInline')
  static RoomAccompanyRefresh_CallList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomAccompanyRefresh_CallList>(create);
  static RoomAccompanyRefresh_CallList? _defaultInstance;

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
  $core.String get uid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uid($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);
}

class RoomAccompanyRefresh_HeartEffect extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomAccompanyRefresh.HeartEffect',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.accompany.refresh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'size',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..hasRequiredFields = false;

  RoomAccompanyRefresh_HeartEffect._() : super();
  factory RoomAccompanyRefresh_HeartEffect({
    $core.int? size,
    $core.String? url,
  }) {
    final _result = create();
    if (size != null) {
      _result.size = size;
    }
    if (url != null) {
      _result.url = url;
    }
    return _result;
  }
  factory RoomAccompanyRefresh_HeartEffect.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomAccompanyRefresh_HeartEffect.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomAccompanyRefresh_HeartEffect clone() =>
      RoomAccompanyRefresh_HeartEffect()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomAccompanyRefresh_HeartEffect copyWith(
          void Function(RoomAccompanyRefresh_HeartEffect) updates) =>
      super.copyWith(
              (message) => updates(message as RoomAccompanyRefresh_HeartEffect))
          as RoomAccompanyRefresh_HeartEffect; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomAccompanyRefresh_HeartEffect create() =>
      RoomAccompanyRefresh_HeartEffect._();
  RoomAccompanyRefresh_HeartEffect createEmptyInstance() => create();
  static $pb.PbList<RoomAccompanyRefresh_HeartEffect> createRepeated() =>
      $pb.PbList<RoomAccompanyRefresh_HeartEffect>();
  @$core.pragma('dart2js:noInline')
  static RoomAccompanyRefresh_HeartEffect getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomAccompanyRefresh_HeartEffect>(
          create);
  static RoomAccompanyRefresh_HeartEffect? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get size => $_getIZ(0);
  @$pb.TagNumber(1)
  set size($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearSize() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);
}

class RoomAccompanyRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomAccompanyRefresh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.accompany.refresh'),
      createEmptyInstance: create)
    ..pc<RoomAccompanyRefresh_Banner>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'banner',
        $pb.PbFieldType.PM,
        subBuilder: RoomAccompanyRefresh_Banner.create)
    ..pc<RoomAccompanyRefresh_CallList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'call_list',
        $pb.PbFieldType.PM,
        subBuilder: RoomAccompanyRefresh_CallList.create)
    ..aOM<RoomAccompanyRefresh_HeartEffect>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'heart_effect',
        subBuilder: RoomAccompanyRefresh_HeartEffect.create)
    ..hasRequiredFields = false;

  RoomAccompanyRefresh._() : super();
  factory RoomAccompanyRefresh({
    $core.Iterable<RoomAccompanyRefresh_Banner>? banner,
    $core.Iterable<RoomAccompanyRefresh_CallList>? callList,
    RoomAccompanyRefresh_HeartEffect? heartEffect,
  }) {
    final _result = create();
    if (banner != null) {
      _result.banner.addAll(banner);
    }
    if (callList != null) {
      _result.callList.addAll(callList);
    }
    if (heartEffect != null) {
      _result.heartEffect = heartEffect;
    }
    return _result;
  }
  factory RoomAccompanyRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomAccompanyRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomAccompanyRefresh clone() =>
      RoomAccompanyRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomAccompanyRefresh copyWith(void Function(RoomAccompanyRefresh) updates) =>
      super.copyWith((message) => updates(message as RoomAccompanyRefresh))
          as RoomAccompanyRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomAccompanyRefresh create() => RoomAccompanyRefresh._();
  RoomAccompanyRefresh createEmptyInstance() => create();
  static $pb.PbList<RoomAccompanyRefresh> createRepeated() =>
      $pb.PbList<RoomAccompanyRefresh>();
  @$core.pragma('dart2js:noInline')
  static RoomAccompanyRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomAccompanyRefresh>(create);
  static RoomAccompanyRefresh? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<RoomAccompanyRefresh_Banner> get banner => $_getList(0);

  @$pb.TagNumber(3)
  $core.List<RoomAccompanyRefresh_CallList> get callList => $_getList(1);

  @$pb.TagNumber(4)
  RoomAccompanyRefresh_HeartEffect get heartEffect => $_getN(2);
  @$pb.TagNumber(4)
  set heartEffect(RoomAccompanyRefresh_HeartEffect v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHeartEffect() => $_has(2);
  @$pb.TagNumber(4)
  void clearHeartEffect() => clearField(4);
  @$pb.TagNumber(4)
  RoomAccompanyRefresh_HeartEffect ensureHeartEffect() => $_ensure(2);
}
