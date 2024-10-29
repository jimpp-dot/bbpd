///
//  Generated code. Do not modify.
//  source: wedding.combo.gift.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class WeddingComboGift_GiftList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WeddingComboGift.GiftList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'wedding.combo.gift'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'h',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'index',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'w',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  WeddingComboGift_GiftList._() : super();
  factory WeddingComboGift_GiftList({
    $core.int? h,
    $core.int? index,
    $core.int? position,
    $core.int? w,
  }) {
    final _result = create();
    if (h != null) {
      _result.h = h;
    }
    if (index != null) {
      _result.index = index;
    }
    if (position != null) {
      _result.position = position;
    }
    if (w != null) {
      _result.w = w;
    }
    return _result;
  }
  factory WeddingComboGift_GiftList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WeddingComboGift_GiftList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WeddingComboGift_GiftList clone() =>
      WeddingComboGift_GiftList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WeddingComboGift_GiftList copyWith(
          void Function(WeddingComboGift_GiftList) updates) =>
      super.copyWith((message) => updates(message as WeddingComboGift_GiftList))
          as WeddingComboGift_GiftList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WeddingComboGift_GiftList create() => WeddingComboGift_GiftList._();
  WeddingComboGift_GiftList createEmptyInstance() => create();
  static $pb.PbList<WeddingComboGift_GiftList> createRepeated() =>
      $pb.PbList<WeddingComboGift_GiftList>();
  @$core.pragma('dart2js:noInline')
  static WeddingComboGift_GiftList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WeddingComboGift_GiftList>(create);
  static WeddingComboGift_GiftList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get h => $_getIZ(0);
  @$pb.TagNumber(1)
  set h($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasH() => $_has(0);
  @$pb.TagNumber(1)
  void clearH() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get index => $_getIZ(1);
  @$pb.TagNumber(2)
  set index($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndex() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get position => $_getIZ(2);
  @$pb.TagNumber(3)
  set position($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearPosition() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get w => $_getIZ(3);
  @$pb.TagNumber(4)
  set w($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasW() => $_has(3);
  @$pb.TagNumber(4)
  void clearW() => clearField(4);
}

class WeddingComboGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WeddingComboGift',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'wedding.combo.gift'),
      createEmptyInstance: create)
    ..pc<WeddingComboGift_GiftList>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift_list',
        $pb.PbFieldType.PM,
        subBuilder: WeddingComboGift_GiftList.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..hasRequiredFields = false;

  WeddingComboGift._() : super();
  factory WeddingComboGift({
    $core.Iterable<WeddingComboGift_GiftList>? giftList,
    $core.String? type,
  }) {
    final _result = create();
    if (giftList != null) {
      _result.giftList.addAll(giftList);
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory WeddingComboGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WeddingComboGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WeddingComboGift clone() => WeddingComboGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WeddingComboGift copyWith(void Function(WeddingComboGift) updates) =>
      super.copyWith((message) => updates(message as WeddingComboGift))
          as WeddingComboGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WeddingComboGift create() => WeddingComboGift._();
  WeddingComboGift createEmptyInstance() => create();
  static $pb.PbList<WeddingComboGift> createRepeated() =>
      $pb.PbList<WeddingComboGift>();
  @$core.pragma('dart2js:noInline')
  static WeddingComboGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WeddingComboGift>(create);
  static WeddingComboGift? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<WeddingComboGift_GiftList> get giftList => $_getList(0);

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
}
