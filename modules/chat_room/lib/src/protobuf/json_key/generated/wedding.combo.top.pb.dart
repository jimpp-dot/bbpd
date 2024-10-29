///
//  Generated code. Do not modify.
//  source: wedding.combo.top.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class WeddingComboTop_List extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WeddingComboTop.List',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'wedding.combo.top'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hit_num',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip_level',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  WeddingComboTop_List._() : super();
  factory WeddingComboTop_List({
    $core.int? hitNum,
    $core.String? icon,
    $core.String? message,
    $core.String? name,
    $core.int? uid,
    $core.int? vipLevel,
  }) {
    final _result = create();
    if (hitNum != null) {
      _result.hitNum = hitNum;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (message != null) {
      _result.message = message;
    }
    if (name != null) {
      _result.name = name;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (vipLevel != null) {
      _result.vipLevel = vipLevel;
    }
    return _result;
  }
  factory WeddingComboTop_List.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WeddingComboTop_List.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WeddingComboTop_List clone() =>
      WeddingComboTop_List()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WeddingComboTop_List copyWith(void Function(WeddingComboTop_List) updates) =>
      super.copyWith((message) => updates(message as WeddingComboTop_List))
          as WeddingComboTop_List; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WeddingComboTop_List create() => WeddingComboTop_List._();
  WeddingComboTop_List createEmptyInstance() => create();
  static $pb.PbList<WeddingComboTop_List> createRepeated() =>
      $pb.PbList<WeddingComboTop_List>();
  @$core.pragma('dart2js:noInline')
  static WeddingComboTop_List getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WeddingComboTop_List>(create);
  static WeddingComboTop_List? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get hitNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set hitNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHitNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearHitNum() => clearField(1);

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
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

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
  $core.int get uid => $_getIZ(4);
  @$pb.TagNumber(5)
  set uid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearUid() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get vipLevel => $_getIZ(5);
  @$pb.TagNumber(6)
  set vipLevel($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasVipLevel() => $_has(5);
  @$pb.TagNumber(6)
  void clearVipLevel() => clearField(6);
}

class WeddingComboTop extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WeddingComboTop',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'wedding.combo.top'),
      createEmptyInstance: create)
    ..pc<WeddingComboTop_List>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: WeddingComboTop_List.create)
    ..hasRequiredFields = false;

  WeddingComboTop._() : super();
  factory WeddingComboTop({
    $core.Iterable<WeddingComboTop_List>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory WeddingComboTop.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WeddingComboTop.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WeddingComboTop clone() => WeddingComboTop()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WeddingComboTop copyWith(void Function(WeddingComboTop) updates) =>
      super.copyWith((message) => updates(message as WeddingComboTop))
          as WeddingComboTop; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WeddingComboTop create() => WeddingComboTop._();
  WeddingComboTop createEmptyInstance() => create();
  static $pb.PbList<WeddingComboTop> createRepeated() =>
      $pb.PbList<WeddingComboTop>();
  @$core.pragma('dart2js:noInline')
  static WeddingComboTop getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WeddingComboTop>(create);
  static WeddingComboTop? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<WeddingComboTop_List> get list => $_getList(0);
}
