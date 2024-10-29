///
//  Generated code. Do not modify.
//  source: listensong.theme.refresh.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ListensongThemeRefresh_Theme extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ListensongThemeRefresh.Theme',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'listensong.theme.refresh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bg_type')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bg_url')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dynamic_icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dynamic_static_icon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dynamic_static_icon_type')
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'enable')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon_type')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'theme')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'thumb')
    ..hasRequiredFields = false;

  ListensongThemeRefresh_Theme._() : super();
  factory ListensongThemeRefresh_Theme({
    $core.String? bgType,
    $core.String? bgUrl,
    $core.String? dynamicIcon,
    $core.String? dynamicStaticIcon,
    $core.String? dynamicStaticIconType,
    $core.bool? enable,
    $core.String? iconType,
    $core.String? name,
    $core.String? theme,
    $core.String? thumb,
  }) {
    final _result = create();
    if (bgType != null) {
      _result.bgType = bgType;
    }
    if (bgUrl != null) {
      _result.bgUrl = bgUrl;
    }
    if (dynamicIcon != null) {
      _result.dynamicIcon = dynamicIcon;
    }
    if (dynamicStaticIcon != null) {
      _result.dynamicStaticIcon = dynamicStaticIcon;
    }
    if (dynamicStaticIconType != null) {
      _result.dynamicStaticIconType = dynamicStaticIconType;
    }
    if (enable != null) {
      _result.enable = enable;
    }
    if (iconType != null) {
      _result.iconType = iconType;
    }
    if (name != null) {
      _result.name = name;
    }
    if (theme != null) {
      _result.theme = theme;
    }
    if (thumb != null) {
      _result.thumb = thumb;
    }
    return _result;
  }
  factory ListensongThemeRefresh_Theme.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListensongThemeRefresh_Theme.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListensongThemeRefresh_Theme clone() =>
      ListensongThemeRefresh_Theme()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListensongThemeRefresh_Theme copyWith(
          void Function(ListensongThemeRefresh_Theme) updates) =>
      super.copyWith(
              (message) => updates(message as ListensongThemeRefresh_Theme))
          as ListensongThemeRefresh_Theme; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListensongThemeRefresh_Theme create() =>
      ListensongThemeRefresh_Theme._();
  ListensongThemeRefresh_Theme createEmptyInstance() => create();
  static $pb.PbList<ListensongThemeRefresh_Theme> createRepeated() =>
      $pb.PbList<ListensongThemeRefresh_Theme>();
  @$core.pragma('dart2js:noInline')
  static ListensongThemeRefresh_Theme getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListensongThemeRefresh_Theme>(create);
  static ListensongThemeRefresh_Theme? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bgType => $_getSZ(0);
  @$pb.TagNumber(1)
  set bgType($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBgType() => $_has(0);
  @$pb.TagNumber(1)
  void clearBgType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get bgUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set bgUrl($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBgUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearBgUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get dynamicIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set dynamicIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDynamicIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearDynamicIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get dynamicStaticIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set dynamicStaticIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDynamicStaticIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearDynamicStaticIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get dynamicStaticIconType => $_getSZ(4);
  @$pb.TagNumber(5)
  set dynamicStaticIconType($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDynamicStaticIconType() => $_has(4);
  @$pb.TagNumber(5)
  void clearDynamicStaticIconType() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get enable => $_getBF(5);
  @$pb.TagNumber(6)
  set enable($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasEnable() => $_has(5);
  @$pb.TagNumber(6)
  void clearEnable() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get iconType => $_getSZ(6);
  @$pb.TagNumber(7)
  set iconType($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIconType() => $_has(6);
  @$pb.TagNumber(7)
  void clearIconType() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get name => $_getSZ(7);
  @$pb.TagNumber(8)
  set name($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasName() => $_has(7);
  @$pb.TagNumber(8)
  void clearName() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get theme => $_getSZ(8);
  @$pb.TagNumber(9)
  set theme($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTheme() => $_has(8);
  @$pb.TagNumber(9)
  void clearTheme() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get thumb => $_getSZ(9);
  @$pb.TagNumber(10)
  set thumb($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasThumb() => $_has(9);
  @$pb.TagNumber(10)
  void clearThumb() => clearField(10);
}

class ListensongThemeRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ListensongThemeRefresh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'listensong.theme.refresh'),
      createEmptyInstance: create)
    ..aOM<ListensongThemeRefresh_Theme>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'theme',
        subBuilder: ListensongThemeRefresh_Theme.create)
    ..hasRequiredFields = false;

  ListensongThemeRefresh._() : super();
  factory ListensongThemeRefresh({
    ListensongThemeRefresh_Theme? theme,
  }) {
    final _result = create();
    if (theme != null) {
      _result.theme = theme;
    }
    return _result;
  }
  factory ListensongThemeRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListensongThemeRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListensongThemeRefresh clone() =>
      ListensongThemeRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListensongThemeRefresh copyWith(
          void Function(ListensongThemeRefresh) updates) =>
      super.copyWith((message) => updates(message as ListensongThemeRefresh))
          as ListensongThemeRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListensongThemeRefresh create() => ListensongThemeRefresh._();
  ListensongThemeRefresh createEmptyInstance() => create();
  static $pb.PbList<ListensongThemeRefresh> createRepeated() =>
      $pb.PbList<ListensongThemeRefresh>();
  @$core.pragma('dart2js:noInline')
  static ListensongThemeRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListensongThemeRefresh>(create);
  static ListensongThemeRefresh? _defaultInstance;

  @$pb.TagNumber(1)
  ListensongThemeRefresh_Theme get theme => $_getN(0);
  @$pb.TagNumber(1)
  set theme(ListensongThemeRefresh_Theme v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTheme() => $_has(0);
  @$pb.TagNumber(1)
  void clearTheme() => clearField(1);
  @$pb.TagNumber(1)
  ListensongThemeRefresh_Theme ensureTheme() => $_ensure(0);
}
