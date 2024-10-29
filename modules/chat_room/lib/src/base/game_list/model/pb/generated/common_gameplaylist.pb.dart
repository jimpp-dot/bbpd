///
//  Generated code. Do not modify.
//  source: common_gameplaylist.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GamePlayItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GamePlayItem',
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
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hot',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showStatus',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  GamePlayItem._() : super();
  factory GamePlayItem({
    $core.int? id,
    $core.String? title,
    $core.String? content,
    $core.String? icon,
    $core.int? hot,
    $core.int? showStatus,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (content != null) {
      _result.content = content;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (hot != null) {
      _result.hot = hot;
    }
    if (showStatus != null) {
      _result.showStatus = showStatus;
    }
    return _result;
  }
  factory GamePlayItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GamePlayItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GamePlayItem clone() => GamePlayItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GamePlayItem copyWith(void Function(GamePlayItem) updates) =>
      super.copyWith((message) => updates(message as GamePlayItem))
          as GamePlayItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GamePlayItem create() => GamePlayItem._();
  GamePlayItem createEmptyInstance() => create();
  static $pb.PbList<GamePlayItem> createRepeated() =>
      $pb.PbList<GamePlayItem>();
  @$core.pragma('dart2js:noInline')
  static GamePlayItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GamePlayItem>(create);
  static GamePlayItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

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
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);

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
  $core.int get hot => $_getIZ(4);
  @$pb.TagNumber(5)
  set hot($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHot() => $_has(4);
  @$pb.TagNumber(5)
  void clearHot() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get showStatus => $_getIZ(5);
  @$pb.TagNumber(6)
  set showStatus($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasShowStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearShowStatus() => clearField(6);
}

class GamePlayListMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GamePlayListMessage',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxPlayItem',
        $pb.PbFieldType.O3,
        protoName: 'maxPlayItem')
    ..pc<GamePlayItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: GamePlayItem.create)
    ..hasRequiredFields = false;

  GamePlayListMessage._() : super();
  factory GamePlayListMessage({
    $core.int? maxPlayItem,
    $core.Iterable<GamePlayItem>? list,
  }) {
    final _result = create();
    if (maxPlayItem != null) {
      _result.maxPlayItem = maxPlayItem;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory GamePlayListMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GamePlayListMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GamePlayListMessage clone() => GamePlayListMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GamePlayListMessage copyWith(void Function(GamePlayListMessage) updates) =>
      super.copyWith((message) => updates(message as GamePlayListMessage))
          as GamePlayListMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GamePlayListMessage create() => GamePlayListMessage._();
  GamePlayListMessage createEmptyInstance() => create();
  static $pb.PbList<GamePlayListMessage> createRepeated() =>
      $pb.PbList<GamePlayListMessage>();
  @$core.pragma('dart2js:noInline')
  static GamePlayListMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GamePlayListMessage>(create);
  static GamePlayListMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get maxPlayItem => $_getIZ(0);
  @$pb.TagNumber(1)
  set maxPlayItem($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMaxPlayItem() => $_has(0);
  @$pb.TagNumber(1)
  void clearMaxPlayItem() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<GamePlayItem> get list => $_getList(1);
}

class RespGamePlayListAll extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespGamePlayListAll',
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
    ..aOM<GamePlayListMessage>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GamePlayListMessage.create)
    ..hasRequiredFields = false;

  RespGamePlayListAll._() : super();
  factory RespGamePlayListAll({
    $core.bool? success,
    $core.String? message,
    GamePlayListMessage? data,
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
  factory RespGamePlayListAll.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespGamePlayListAll.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespGamePlayListAll clone() => RespGamePlayListAll()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespGamePlayListAll copyWith(void Function(RespGamePlayListAll) updates) =>
      super.copyWith((message) => updates(message as RespGamePlayListAll))
          as RespGamePlayListAll; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespGamePlayListAll create() => RespGamePlayListAll._();
  RespGamePlayListAll createEmptyInstance() => create();
  static $pb.PbList<RespGamePlayListAll> createRepeated() =>
      $pb.PbList<RespGamePlayListAll>();
  @$core.pragma('dart2js:noInline')
  static RespGamePlayListAll getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespGamePlayListAll>(create);
  static RespGamePlayListAll? _defaultInstance;

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
  GamePlayListMessage get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GamePlayListMessage v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GamePlayListMessage ensureData() => $_ensure(2);
}
