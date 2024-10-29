///
//  Generated code. Do not modify.
//  source: room_bottom_panel.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResRoomPluginPanel_PanelItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPluginPanel.PanelItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'key')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpType')
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inUse')
    ..hasRequiredFields = false;

  ResRoomPluginPanel_PanelItem._() : super();
  factory ResRoomPluginPanel_PanelItem({
    $core.String? key,
    $core.String? name,
    $core.String? icon,
    $core.String? url,
    $core.String? jumpType,
    $core.bool? inUse,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (url != null) {
      _result.url = url;
    }
    if (jumpType != null) {
      _result.jumpType = jumpType;
    }
    if (inUse != null) {
      _result.inUse = inUse;
    }
    return _result;
  }
  factory ResRoomPluginPanel_PanelItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPluginPanel_PanelItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPluginPanel_PanelItem clone() =>
      ResRoomPluginPanel_PanelItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPluginPanel_PanelItem copyWith(
          void Function(ResRoomPluginPanel_PanelItem) updates) =>
      super.copyWith(
              (message) => updates(message as ResRoomPluginPanel_PanelItem))
          as ResRoomPluginPanel_PanelItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPluginPanel_PanelItem create() =>
      ResRoomPluginPanel_PanelItem._();
  ResRoomPluginPanel_PanelItem createEmptyInstance() => create();
  static $pb.PbList<ResRoomPluginPanel_PanelItem> createRepeated() =>
      $pb.PbList<ResRoomPluginPanel_PanelItem>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPluginPanel_PanelItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPluginPanel_PanelItem>(create);
  static ResRoomPluginPanel_PanelItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

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
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get url => $_getSZ(3);
  @$pb.TagNumber(4)
  set url($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get jumpType => $_getSZ(4);
  @$pb.TagNumber(5)
  set jumpType($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasJumpType() => $_has(4);
  @$pb.TagNumber(5)
  void clearJumpType() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get inUse => $_getBF(5);
  @$pb.TagNumber(6)
  set inUse($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasInUse() => $_has(5);
  @$pb.TagNumber(6)
  void clearInUse() => clearField(6);
}

class ResRoomPluginPanel_PanelConf extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPluginPanel.PanelConf',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..pc<ResRoomPluginPanel_PanelItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'itemList',
        $pb.PbFieldType.PM,
        subBuilder: ResRoomPluginPanel_PanelItem.create)
    ..hasRequiredFields = false;

  ResRoomPluginPanel_PanelConf._() : super();
  factory ResRoomPluginPanel_PanelConf({
    $core.String? title,
    $core.Iterable<ResRoomPluginPanel_PanelItem>? itemList,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (itemList != null) {
      _result.itemList.addAll(itemList);
    }
    return _result;
  }
  factory ResRoomPluginPanel_PanelConf.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPluginPanel_PanelConf.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPluginPanel_PanelConf clone() =>
      ResRoomPluginPanel_PanelConf()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPluginPanel_PanelConf copyWith(
          void Function(ResRoomPluginPanel_PanelConf) updates) =>
      super.copyWith(
              (message) => updates(message as ResRoomPluginPanel_PanelConf))
          as ResRoomPluginPanel_PanelConf; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPluginPanel_PanelConf create() =>
      ResRoomPluginPanel_PanelConf._();
  ResRoomPluginPanel_PanelConf createEmptyInstance() => create();
  static $pb.PbList<ResRoomPluginPanel_PanelConf> createRepeated() =>
      $pb.PbList<ResRoomPluginPanel_PanelConf>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPluginPanel_PanelConf getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPluginPanel_PanelConf>(create);
  static ResRoomPluginPanel_PanelConf? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<ResRoomPluginPanel_PanelItem> get itemList => $_getList(1);
}

class ResRoomPluginPanel_BodyRoomPluginPanel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPluginPanel.BodyRoomPluginPanel',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ResRoomPluginPanel_PanelConf>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: ResRoomPluginPanel_PanelConf.create)
    ..hasRequiredFields = false;

  ResRoomPluginPanel_BodyRoomPluginPanel._() : super();
  factory ResRoomPluginPanel_BodyRoomPluginPanel({
    $core.Iterable<ResRoomPluginPanel_PanelConf>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory ResRoomPluginPanel_BodyRoomPluginPanel.fromBuffer(
          $core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPluginPanel_BodyRoomPluginPanel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPluginPanel_BodyRoomPluginPanel clone() =>
      ResRoomPluginPanel_BodyRoomPluginPanel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPluginPanel_BodyRoomPluginPanel copyWith(
          void Function(ResRoomPluginPanel_BodyRoomPluginPanel) updates) =>
      super.copyWith((message) =>
              updates(message as ResRoomPluginPanel_BodyRoomPluginPanel))
          as ResRoomPluginPanel_BodyRoomPluginPanel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPluginPanel_BodyRoomPluginPanel create() =>
      ResRoomPluginPanel_BodyRoomPluginPanel._();
  ResRoomPluginPanel_BodyRoomPluginPanel createEmptyInstance() => create();
  static $pb.PbList<ResRoomPluginPanel_BodyRoomPluginPanel> createRepeated() =>
      $pb.PbList<ResRoomPluginPanel_BodyRoomPluginPanel>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPluginPanel_BodyRoomPluginPanel getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          ResRoomPluginPanel_BodyRoomPluginPanel>(create);
  static ResRoomPluginPanel_BodyRoomPluginPanel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ResRoomPluginPanel_PanelConf> get list => $_getList(0);
}

class ResRoomPluginPanel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomPluginPanel',
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
    ..aOM<ResRoomPluginPanel_BodyRoomPluginPanel>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ResRoomPluginPanel_BodyRoomPluginPanel.create)
    ..hasRequiredFields = false;

  ResRoomPluginPanel._() : super();
  factory ResRoomPluginPanel({
    $core.bool? success,
    $core.String? msg,
    ResRoomPluginPanel_BodyRoomPluginPanel? data,
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
  factory ResRoomPluginPanel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomPluginPanel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomPluginPanel clone() => ResRoomPluginPanel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomPluginPanel copyWith(void Function(ResRoomPluginPanel) updates) =>
      super.copyWith((message) => updates(message as ResRoomPluginPanel))
          as ResRoomPluginPanel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomPluginPanel create() => ResRoomPluginPanel._();
  ResRoomPluginPanel createEmptyInstance() => create();
  static $pb.PbList<ResRoomPluginPanel> createRepeated() =>
      $pb.PbList<ResRoomPluginPanel>();
  @$core.pragma('dart2js:noInline')
  static ResRoomPluginPanel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomPluginPanel>(create);
  static ResRoomPluginPanel? _defaultInstance;

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
  ResRoomPluginPanel_BodyRoomPluginPanel get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ResRoomPluginPanel_BodyRoomPluginPanel v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ResRoomPluginPanel_BodyRoomPluginPanel ensureData() => $_ensure(2);
}
