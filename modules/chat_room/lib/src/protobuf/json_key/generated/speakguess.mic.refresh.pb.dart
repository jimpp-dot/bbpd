///
//  Generated code. Do not modify.
//  source: speakguess.mic.refresh.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SpeakguessMicRefresh_List extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SpeakguessMicRefresh.List',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'speakguess.mic.refresh'),
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
            : 'is_offline',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SpeakguessMicRefresh_List._() : super();
  factory SpeakguessMicRefresh_List({
    $core.String? icon,
    $core.int? isOffline,
    $core.String? name,
    $core.int? position,
    $core.String? role,
    $core.int? score,
    $core.int? uid,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (isOffline != null) {
      _result.isOffline = isOffline;
    }
    if (name != null) {
      _result.name = name;
    }
    if (position != null) {
      _result.position = position;
    }
    if (role != null) {
      _result.role = role;
    }
    if (score != null) {
      _result.score = score;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory SpeakguessMicRefresh_List.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SpeakguessMicRefresh_List.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SpeakguessMicRefresh_List clone() =>
      SpeakguessMicRefresh_List()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SpeakguessMicRefresh_List copyWith(
          void Function(SpeakguessMicRefresh_List) updates) =>
      super.copyWith((message) => updates(message as SpeakguessMicRefresh_List))
          as SpeakguessMicRefresh_List; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SpeakguessMicRefresh_List create() => SpeakguessMicRefresh_List._();
  SpeakguessMicRefresh_List createEmptyInstance() => create();
  static $pb.PbList<SpeakguessMicRefresh_List> createRepeated() =>
      $pb.PbList<SpeakguessMicRefresh_List>();
  @$core.pragma('dart2js:noInline')
  static SpeakguessMicRefresh_List getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpeakguessMicRefresh_List>(create);
  static SpeakguessMicRefresh_List? _defaultInstance;

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
  $core.int get isOffline => $_getIZ(1);
  @$pb.TagNumber(2)
  set isOffline($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIsOffline() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsOffline() => clearField(2);

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
  $core.int get position => $_getIZ(3);
  @$pb.TagNumber(4)
  set position($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPosition() => $_has(3);
  @$pb.TagNumber(4)
  void clearPosition() => clearField(4);

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
  $core.int get score => $_getIZ(5);
  @$pb.TagNumber(6)
  set score($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasScore() => $_has(5);
  @$pb.TagNumber(6)
  void clearScore() => clearField(6);

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
}

class SpeakguessMicRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SpeakguessMicRefresh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'speakguess.mic.refresh'),
      createEmptyInstance: create)
    ..pc<SpeakguessMicRefresh_List>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: SpeakguessMicRefresh_List.create)
    ..hasRequiredFields = false;

  SpeakguessMicRefresh._() : super();
  factory SpeakguessMicRefresh({
    $core.Iterable<SpeakguessMicRefresh_List>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory SpeakguessMicRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SpeakguessMicRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SpeakguessMicRefresh clone() =>
      SpeakguessMicRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SpeakguessMicRefresh copyWith(void Function(SpeakguessMicRefresh) updates) =>
      super.copyWith((message) => updates(message as SpeakguessMicRefresh))
          as SpeakguessMicRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SpeakguessMicRefresh create() => SpeakguessMicRefresh._();
  SpeakguessMicRefresh createEmptyInstance() => create();
  static $pb.PbList<SpeakguessMicRefresh> createRepeated() =>
      $pb.PbList<SpeakguessMicRefresh>();
  @$core.pragma('dart2js:noInline')
  static SpeakguessMicRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SpeakguessMicRefresh>(create);
  static SpeakguessMicRefresh? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SpeakguessMicRefresh_List> get list => $_getList(0);
}
