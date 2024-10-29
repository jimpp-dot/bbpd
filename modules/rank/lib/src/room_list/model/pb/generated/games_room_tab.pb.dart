///
//  Generated code. Do not modify.
//  source: games_room_tab.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RespGamesRoomTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespGamesRoomTab',
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
    ..pc<GamesRoomTabItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: GamesRoomTabItem.create)
    ..hasRequiredFields = false;

  RespGamesRoomTab._() : super();
  factory RespGamesRoomTab({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<GamesRoomTabItem>? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory RespGamesRoomTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespGamesRoomTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespGamesRoomTab clone() => RespGamesRoomTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespGamesRoomTab copyWith(void Function(RespGamesRoomTab) updates) =>
      super.copyWith((message) => updates(message as RespGamesRoomTab))
          as RespGamesRoomTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespGamesRoomTab create() => RespGamesRoomTab._();
  RespGamesRoomTab createEmptyInstance() => create();
  static $pb.PbList<RespGamesRoomTab> createRepeated() =>
      $pb.PbList<RespGamesRoomTab>();
  @$core.pragma('dart2js:noInline')
  static RespGamesRoomTab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespGamesRoomTab>(create);
  static RespGamesRoomTab? _defaultInstance;

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
  $core.List<GamesRoomTabItem> get data => $_getList(2);
}

class GamesRoomTabItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GamesRoomTabItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tab')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'filter')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'default',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GamesRoomTabItem._() : super();
  factory GamesRoomTabItem({
    $core.String? tab,
    $core.String? type,
    $core.String? filter,
    $core.int? default_4,
  }) {
    final _result = create();
    if (tab != null) {
      _result.tab = tab;
    }
    if (type != null) {
      _result.type = type;
    }
    if (filter != null) {
      _result.filter = filter;
    }
    if (default_4 != null) {
      _result.default_4 = default_4;
    }
    return _result;
  }
  factory GamesRoomTabItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GamesRoomTabItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GamesRoomTabItem clone() => GamesRoomTabItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GamesRoomTabItem copyWith(void Function(GamesRoomTabItem) updates) =>
      super.copyWith((message) => updates(message as GamesRoomTabItem))
          as GamesRoomTabItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GamesRoomTabItem create() => GamesRoomTabItem._();
  GamesRoomTabItem createEmptyInstance() => create();
  static $pb.PbList<GamesRoomTabItem> createRepeated() =>
      $pb.PbList<GamesRoomTabItem>();
  @$core.pragma('dart2js:noInline')
  static GamesRoomTabItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GamesRoomTabItem>(create);
  static GamesRoomTabItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tab => $_getSZ(0);
  @$pb.TagNumber(1)
  set tab($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTab() => $_has(0);
  @$pb.TagNumber(1)
  void clearTab() => clearField(1);

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
  $core.String get filter => $_getSZ(2);
  @$pb.TagNumber(3)
  set filter($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFilter() => $_has(2);
  @$pb.TagNumber(3)
  void clearFilter() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get default_4 => $_getIZ(3);
  @$pb.TagNumber(4)
  set default_4($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDefault_4() => $_has(3);
  @$pb.TagNumber(4)
  void clearDefault_4() => clearField(4);
}
