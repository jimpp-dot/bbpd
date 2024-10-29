///
//  Generated code. Do not modify.
//  source: banban_home.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'banner_center.pb.dart' as $0;

class GameItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GameItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GameItem._() : super();
  factory GameItem({
    $core.String? name,
    $core.String? icon,
    $core.int? cid,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    return _result;
  }
  factory GameItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GameItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GameItem clone() => GameItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GameItem copyWith(void Function(GameItem) updates) =>
      super.copyWith((message) => updates(message as GameItem))
          as GameItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameItem create() => GameItem._();
  GameItem createEmptyInstance() => create();
  static $pb.PbList<GameItem> createRepeated() => $pb.PbList<GameItem>();
  @$core.pragma('dart2js:noInline')
  static GameItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameItem>(create);
  static GameItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

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
  $core.int get cid => $_getIZ(2);
  @$pb.TagNumber(3)
  set cid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCid() => $_has(2);
  @$pb.TagNumber(3)
  void clearCid() => clearField(3);
}

class FilterSubTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FilterSubTab',
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
    ..hasRequiredFields = false;

  FilterSubTab._() : super();
  factory FilterSubTab({
    $core.String? tab,
    $core.String? type,
    $core.String? filter,
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
    return _result;
  }
  factory FilterSubTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FilterSubTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FilterSubTab clone() => FilterSubTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FilterSubTab copyWith(void Function(FilterSubTab) updates) =>
      super.copyWith((message) => updates(message as FilterSubTab))
          as FilterSubTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FilterSubTab create() => FilterSubTab._();
  FilterSubTab createEmptyInstance() => create();
  static $pb.PbList<FilterSubTab> createRepeated() =>
      $pb.PbList<FilterSubTab>();
  @$core.pragma('dart2js:noInline')
  static FilterSubTab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FilterSubTab>(create);
  static FilterSubTab? _defaultInstance;

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
}

class SubTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SubTab',
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
    ..pc<GameItem>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gameList',
        $pb.PbFieldType.PM,
        subBuilder: GameItem.create)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weight',
        $pb.PbFieldType.OU3)
    ..aOB(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showFilter')
    ..pc<FilterSubTab>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'filterSubList',
        $pb.PbFieldType.PM,
        subBuilder: FilterSubTab.create)
    ..hasRequiredFields = false;

  SubTab._() : super();
  factory SubTab({
    $core.String? tab,
    $core.String? type,
    $core.String? filter,
    $core.int? default_4,
    $core.Iterable<GameItem>? gameList,
    $core.String? icon,
    $core.bool? show,
    $core.int? weight,
    $core.bool? showFilter,
    $core.Iterable<FilterSubTab>? filterSubList,
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
    if (gameList != null) {
      _result.gameList.addAll(gameList);
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (show != null) {
      _result.show = show;
    }
    if (weight != null) {
      _result.weight = weight;
    }
    if (showFilter != null) {
      _result.showFilter = showFilter;
    }
    if (filterSubList != null) {
      _result.filterSubList.addAll(filterSubList);
    }
    return _result;
  }
  factory SubTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SubTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SubTab clone() => SubTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SubTab copyWith(void Function(SubTab) updates) =>
      super.copyWith((message) => updates(message as SubTab))
          as SubTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubTab create() => SubTab._();
  SubTab createEmptyInstance() => create();
  static $pb.PbList<SubTab> createRepeated() => $pb.PbList<SubTab>();
  @$core.pragma('dart2js:noInline')
  static SubTab getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubTab>(create);
  static SubTab? _defaultInstance;

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

  @$pb.TagNumber(5)
  $core.List<GameItem> get gameList => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get icon => $_getSZ(5);
  @$pb.TagNumber(6)
  set icon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get show => $_getBF(6);
  @$pb.TagNumber(7)
  set show($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasShow() => $_has(6);
  @$pb.TagNumber(7)
  void clearShow() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get weight => $_getIZ(7);
  @$pb.TagNumber(8)
  set weight($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasWeight() => $_has(7);
  @$pb.TagNumber(8)
  void clearWeight() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get showFilter => $_getBF(8);
  @$pb.TagNumber(9)
  set showFilter($core.bool v) {
    $_setBool(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasShowFilter() => $_has(8);
  @$pb.TagNumber(9)
  void clearShowFilter() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<FilterSubTab> get filterSubList => $_getList(9);
}

class Rank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Rank',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleted')
    ..hasRequiredFields = false;

  Rank._() : super();
  factory Rank({
    $core.String? uid,
    $core.String? icon,
    $core.String? deleted,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (deleted != null) {
      _result.deleted = deleted;
    }
    return _result;
  }
  factory Rank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Rank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Rank clone() => Rank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Rank copyWith(void Function(Rank) updates) =>
      super.copyWith((message) => updates(message as Rank))
          as Rank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Rank create() => Rank._();
  Rank createEmptyInstance() => create();
  static $pb.PbList<Rank> createRepeated() => $pb.PbList<Rank>();
  @$core.pragma('dart2js:noInline')
  static Rank getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Rank>(create);
  static Rank? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

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
  $core.String get deleted => $_getSZ(2);
  @$pb.TagNumber(3)
  set deleted($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDeleted() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeleted() => clearField(3);
}

class Tab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Tab',
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
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabId',
        $pb.PbFieldType.OU3)
    ..pc<SubTab>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subTab',
        $pb.PbFieldType.PM,
        subBuilder: SubTab.create)
    ..pPS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'queen')
    ..pc<Rank>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ranker',
        $pb.PbFieldType.PM,
        subBuilder: Rank.create)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'style',
        $pb.PbFieldType.OU3)
    ..aOB(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vertical')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bannerChannel')
    ..hasRequiredFields = false;

  Tab._() : super();
  factory Tab({
    $core.String? tab,
    $core.String? type,
    $core.String? filter,
    $core.int? default_4,
    $core.int? tabId,
    $core.Iterable<SubTab>? subTab,
    $core.Iterable<$core.String>? queen,
    $core.Iterable<Rank>? ranker,
    $core.int? style,
    $core.bool? vertical,
    $core.String? bannerChannel,
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
    if (tabId != null) {
      _result.tabId = tabId;
    }
    if (subTab != null) {
      _result.subTab.addAll(subTab);
    }
    if (queen != null) {
      _result.queen.addAll(queen);
    }
    if (ranker != null) {
      _result.ranker.addAll(ranker);
    }
    if (style != null) {
      _result.style = style;
    }
    if (vertical != null) {
      _result.vertical = vertical;
    }
    if (bannerChannel != null) {
      _result.bannerChannel = bannerChannel;
    }
    return _result;
  }
  factory Tab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Tab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Tab clone() => Tab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Tab copyWith(void Function(Tab) updates) =>
      super.copyWith((message) => updates(message as Tab))
          as Tab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Tab create() => Tab._();
  Tab createEmptyInstance() => create();
  static $pb.PbList<Tab> createRepeated() => $pb.PbList<Tab>();
  @$core.pragma('dart2js:noInline')
  static Tab getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tab>(create);
  static Tab? _defaultInstance;

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

  @$pb.TagNumber(5)
  $core.int get tabId => $_getIZ(4);
  @$pb.TagNumber(5)
  set tabId($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTabId() => $_has(4);
  @$pb.TagNumber(5)
  void clearTabId() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<SubTab> get subTab => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$core.String> get queen => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<Rank> get ranker => $_getList(7);

  @$pb.TagNumber(9)
  $core.int get style => $_getIZ(8);
  @$pb.TagNumber(9)
  set style($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasStyle() => $_has(8);
  @$pb.TagNumber(9)
  void clearStyle() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get vertical => $_getBF(9);
  @$pb.TagNumber(10)
  set vertical($core.bool v) {
    $_setBool(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasVertical() => $_has(9);
  @$pb.TagNumber(10)
  void clearVertical() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get bannerChannel => $_getSZ(10);
  @$pb.TagNumber(11)
  set bannerChannel($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasBannerChannel() => $_has(10);
  @$pb.TagNumber(11)
  void clearBannerChannel() => clearField(11);
}

class TabBarData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TabBarData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unclickedIcon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'clickedIcon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'copyWriting')
    ..hasRequiredFields = false;

  TabBarData._() : super();
  factory TabBarData({
    $core.String? unclickedIcon,
    $core.String? clickedIcon,
    $core.String? copyWriting,
  }) {
    final _result = create();
    if (unclickedIcon != null) {
      _result.unclickedIcon = unclickedIcon;
    }
    if (clickedIcon != null) {
      _result.clickedIcon = clickedIcon;
    }
    if (copyWriting != null) {
      _result.copyWriting = copyWriting;
    }
    return _result;
  }
  factory TabBarData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TabBarData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TabBarData clone() => TabBarData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TabBarData copyWith(void Function(TabBarData) updates) =>
      super.copyWith((message) => updates(message as TabBarData))
          as TabBarData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TabBarData create() => TabBarData._();
  TabBarData createEmptyInstance() => create();
  static $pb.PbList<TabBarData> createRepeated() => $pb.PbList<TabBarData>();
  @$core.pragma('dart2js:noInline')
  static TabBarData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TabBarData>(create);
  static TabBarData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get unclickedIcon => $_getSZ(0);
  @$pb.TagNumber(1)
  set unclickedIcon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUnclickedIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnclickedIcon() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get clickedIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set clickedIcon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasClickedIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearClickedIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get copyWriting => $_getSZ(2);
  @$pb.TagNumber(3)
  set copyWriting($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCopyWriting() => $_has(2);
  @$pb.TagNumber(3)
  void clearCopyWriting() => clearField(3);
}

class HomeTabExtend extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeTabExtend',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hideQuickJoin')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hideMyParty')
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showQualityUser')
    ..hasRequiredFields = false;

  HomeTabExtend._() : super();
  factory HomeTabExtend({
    $core.bool? hideQuickJoin,
    $core.bool? hideMyParty,
    $core.bool? showQualityUser,
  }) {
    final _result = create();
    if (hideQuickJoin != null) {
      _result.hideQuickJoin = hideQuickJoin;
    }
    if (hideMyParty != null) {
      _result.hideMyParty = hideMyParty;
    }
    if (showQualityUser != null) {
      _result.showQualityUser = showQualityUser;
    }
    return _result;
  }
  factory HomeTabExtend.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeTabExtend.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeTabExtend clone() => HomeTabExtend()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeTabExtend copyWith(void Function(HomeTabExtend) updates) =>
      super.copyWith((message) => updates(message as HomeTabExtend))
          as HomeTabExtend; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeTabExtend create() => HomeTabExtend._();
  HomeTabExtend createEmptyInstance() => create();
  static $pb.PbList<HomeTabExtend> createRepeated() =>
      $pb.PbList<HomeTabExtend>();
  @$core.pragma('dart2js:noInline')
  static HomeTabExtend getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeTabExtend>(create);
  static HomeTabExtend? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get hideQuickJoin => $_getBF(0);
  @$pb.TagNumber(1)
  set hideQuickJoin($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHideQuickJoin() => $_has(0);
  @$pb.TagNumber(1)
  void clearHideQuickJoin() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get hideMyParty => $_getBF(1);
  @$pb.TagNumber(2)
  set hideMyParty($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHideMyParty() => $_has(1);
  @$pb.TagNumber(2)
  void clearHideMyParty() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get showQualityUser => $_getBF(2);
  @$pb.TagNumber(3)
  set showQualityUser($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasShowQualityUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearShowQualityUser() => clearField(3);
}

class HomeTabData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeTabData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<Tab>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tab',
        $pb.PbFieldType.PM,
        subBuilder: Tab.create)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showRank')
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ok')
    ..aOM<HomeTabExtend>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extend',
        subBuilder: HomeTabExtend.create)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showNew')
    ..pc<TabBarData>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bars',
        $pb.PbFieldType.PM,
        subBuilder: TabBarData.create)
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isSleeplessPlanetAndroidVerify',
        protoName: 'isSleeplessPlanetAndroidVerify')
    ..aOM<ActBarData>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'actBars',
        subBuilder: ActBarData.create)
    ..aOM<TabRookieCheckInInfo>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rookieCheckin',
        subBuilder: TabRookieCheckInInfo.create)
    ..hasRequiredFields = false;

  HomeTabData._() : super();
  factory HomeTabData({
    $core.Iterable<Tab>? tab,
    $core.bool? showRank,
    $core.bool? ok,
    HomeTabExtend? extend,
    $core.bool? showNew,
    $core.Iterable<TabBarData>? bars,
    $core.bool? isSleeplessPlanetAndroidVerify,
    ActBarData? actBars,
    TabRookieCheckInInfo? rookieCheckin,
  }) {
    final _result = create();
    if (tab != null) {
      _result.tab.addAll(tab);
    }
    if (showRank != null) {
      _result.showRank = showRank;
    }
    if (ok != null) {
      _result.ok = ok;
    }
    if (extend != null) {
      _result.extend = extend;
    }
    if (showNew != null) {
      _result.showNew = showNew;
    }
    if (bars != null) {
      _result.bars.addAll(bars);
    }
    if (isSleeplessPlanetAndroidVerify != null) {
      _result.isSleeplessPlanetAndroidVerify = isSleeplessPlanetAndroidVerify;
    }
    if (actBars != null) {
      _result.actBars = actBars;
    }
    if (rookieCheckin != null) {
      _result.rookieCheckin = rookieCheckin;
    }
    return _result;
  }
  factory HomeTabData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeTabData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeTabData clone() => HomeTabData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeTabData copyWith(void Function(HomeTabData) updates) =>
      super.copyWith((message) => updates(message as HomeTabData))
          as HomeTabData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeTabData create() => HomeTabData._();
  HomeTabData createEmptyInstance() => create();
  static $pb.PbList<HomeTabData> createRepeated() => $pb.PbList<HomeTabData>();
  @$core.pragma('dart2js:noInline')
  static HomeTabData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeTabData>(create);
  static HomeTabData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Tab> get tab => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get showRank => $_getBF(1);
  @$pb.TagNumber(2)
  set showRank($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasShowRank() => $_has(1);
  @$pb.TagNumber(2)
  void clearShowRank() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get ok => $_getBF(2);
  @$pb.TagNumber(3)
  set ok($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOk() => $_has(2);
  @$pb.TagNumber(3)
  void clearOk() => clearField(3);

  @$pb.TagNumber(4)
  HomeTabExtend get extend => $_getN(3);
  @$pb.TagNumber(4)
  set extend(HomeTabExtend v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasExtend() => $_has(3);
  @$pb.TagNumber(4)
  void clearExtend() => clearField(4);
  @$pb.TagNumber(4)
  HomeTabExtend ensureExtend() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.bool get showNew => $_getBF(4);
  @$pb.TagNumber(5)
  set showNew($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasShowNew() => $_has(4);
  @$pb.TagNumber(5)
  void clearShowNew() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<TabBarData> get bars => $_getList(5);

  @$pb.TagNumber(7)
  $core.bool get isSleeplessPlanetAndroidVerify => $_getBF(6);
  @$pb.TagNumber(7)
  set isSleeplessPlanetAndroidVerify($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIsSleeplessPlanetAndroidVerify() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsSleeplessPlanetAndroidVerify() => clearField(7);

  @$pb.TagNumber(8)
  ActBarData get actBars => $_getN(7);
  @$pb.TagNumber(8)
  set actBars(ActBarData v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasActBars() => $_has(7);
  @$pb.TagNumber(8)
  void clearActBars() => clearField(8);
  @$pb.TagNumber(8)
  ActBarData ensureActBars() => $_ensure(7);

  @$pb.TagNumber(9)
  TabRookieCheckInInfo get rookieCheckin => $_getN(8);
  @$pb.TagNumber(9)
  set rookieCheckin(TabRookieCheckInInfo v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasRookieCheckin() => $_has(8);
  @$pb.TagNumber(9)
  void clearRookieCheckin() => clearField(9);
  @$pb.TagNumber(9)
  TabRookieCheckInInfo ensureRookieCheckin() => $_ensure(8);
}

class TabRookieCheckInInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TabRookieCheckInInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isShowEntrance')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'checkInUrl')
    ..hasRequiredFields = false;

  TabRookieCheckInInfo._() : super();
  factory TabRookieCheckInInfo({
    $core.bool? isShowEntrance,
    $core.String? checkInUrl,
  }) {
    final _result = create();
    if (isShowEntrance != null) {
      _result.isShowEntrance = isShowEntrance;
    }
    if (checkInUrl != null) {
      _result.checkInUrl = checkInUrl;
    }
    return _result;
  }
  factory TabRookieCheckInInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TabRookieCheckInInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TabRookieCheckInInfo clone() =>
      TabRookieCheckInInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TabRookieCheckInInfo copyWith(void Function(TabRookieCheckInInfo) updates) =>
      super.copyWith((message) => updates(message as TabRookieCheckInInfo))
          as TabRookieCheckInInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TabRookieCheckInInfo create() => TabRookieCheckInInfo._();
  TabRookieCheckInInfo createEmptyInstance() => create();
  static $pb.PbList<TabRookieCheckInInfo> createRepeated() =>
      $pb.PbList<TabRookieCheckInInfo>();
  @$core.pragma('dart2js:noInline')
  static TabRookieCheckInInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TabRookieCheckInInfo>(create);
  static TabRookieCheckInInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isShowEntrance => $_getBF(0);
  @$pb.TagNumber(1)
  set isShowEntrance($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIsShowEntrance() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsShowEntrance() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get checkInUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set checkInUrl($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCheckInUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearCheckInUrl() => clearField(2);
}

class ResHomeTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHomeTab',
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
    ..aOM<HomeTabData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HomeTabData.create)
    ..hasRequiredFields = false;

  ResHomeTab._() : super();
  factory ResHomeTab({
    $core.bool? success,
    $core.String? msg,
    HomeTabData? data,
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
  factory ResHomeTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHomeTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHomeTab clone() => ResHomeTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHomeTab copyWith(void Function(ResHomeTab) updates) =>
      super.copyWith((message) => updates(message as ResHomeTab))
          as ResHomeTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHomeTab create() => ResHomeTab._();
  ResHomeTab createEmptyInstance() => create();
  static $pb.PbList<ResHomeTab> createRepeated() => $pb.PbList<ResHomeTab>();
  @$core.pragma('dart2js:noInline')
  static ResHomeTab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHomeTab>(create);
  static ResHomeTab? _defaultInstance;

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
  HomeTabData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HomeTabData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HomeTabData ensureData() => $_ensure(2);
}

class RoomTypeItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomTypeItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomType')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeIcon')
    ..pPS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeBg')
    ..hasRequiredFields = false;

  RoomTypeItem._() : super();
  factory RoomTypeItem({
    $core.String? roomType,
    $core.String? show,
    $core.String? label,
    $core.String? typeIcon,
    $core.Iterable<$core.String>? typeBg,
  }) {
    final _result = create();
    if (roomType != null) {
      _result.roomType = roomType;
    }
    if (show != null) {
      _result.show = show;
    }
    if (label != null) {
      _result.label = label;
    }
    if (typeIcon != null) {
      _result.typeIcon = typeIcon;
    }
    if (typeBg != null) {
      _result.typeBg.addAll(typeBg);
    }
    return _result;
  }
  factory RoomTypeItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomTypeItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomTypeItem clone() => RoomTypeItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomTypeItem copyWith(void Function(RoomTypeItem) updates) =>
      super.copyWith((message) => updates(message as RoomTypeItem))
          as RoomTypeItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomTypeItem create() => RoomTypeItem._();
  RoomTypeItem createEmptyInstance() => create();
  static $pb.PbList<RoomTypeItem> createRepeated() =>
      $pb.PbList<RoomTypeItem>();
  @$core.pragma('dart2js:noInline')
  static RoomTypeItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomTypeItem>(create);
  static RoomTypeItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roomType => $_getSZ(0);
  @$pb.TagNumber(1)
  set roomType($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRoomType() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get show => $_getSZ(1);
  @$pb.TagNumber(2)
  set show($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasShow() => $_has(1);
  @$pb.TagNumber(2)
  void clearShow() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get label => $_getSZ(2);
  @$pb.TagNumber(3)
  set label($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLabel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLabel() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get typeIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set typeIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTypeIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearTypeIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get typeBg => $_getList(4);
}

class PartyItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'display')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'partyType')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'homeIcon')
    ..pc<RoomTypeItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomTypeGroup',
        $pb.PbFieldType.PM,
        subBuilder: RoomTypeItem.create)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagIcon')
    ..pPS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeBg')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeIcon')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'playingNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'indexIcon')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'indexIconHeight',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'indexIconWidth',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PartyItem._() : super();
  factory PartyItem({
    $core.String? display,
    $core.String? partyType,
    $core.String? homeIcon,
    $core.Iterable<RoomTypeItem>? roomTypeGroup,
    $core.String? tagIcon,
    $core.Iterable<$core.String>? typeBg,
    $core.String? typeIcon,
    $core.int? playingNum,
    $core.String? indexIcon,
    $core.int? indexIconHeight,
    $core.int? indexIconWidth,
  }) {
    final _result = create();
    if (display != null) {
      _result.display = display;
    }
    if (partyType != null) {
      _result.partyType = partyType;
    }
    if (homeIcon != null) {
      _result.homeIcon = homeIcon;
    }
    if (roomTypeGroup != null) {
      _result.roomTypeGroup.addAll(roomTypeGroup);
    }
    if (tagIcon != null) {
      _result.tagIcon = tagIcon;
    }
    if (typeBg != null) {
      _result.typeBg.addAll(typeBg);
    }
    if (typeIcon != null) {
      _result.typeIcon = typeIcon;
    }
    if (playingNum != null) {
      _result.playingNum = playingNum;
    }
    if (indexIcon != null) {
      _result.indexIcon = indexIcon;
    }
    if (indexIconHeight != null) {
      _result.indexIconHeight = indexIconHeight;
    }
    if (indexIconWidth != null) {
      _result.indexIconWidth = indexIconWidth;
    }
    return _result;
  }
  factory PartyItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyItem clone() => PartyItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyItem copyWith(void Function(PartyItem) updates) =>
      super.copyWith((message) => updates(message as PartyItem))
          as PartyItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyItem create() => PartyItem._();
  PartyItem createEmptyInstance() => create();
  static $pb.PbList<PartyItem> createRepeated() => $pb.PbList<PartyItem>();
  @$core.pragma('dart2js:noInline')
  static PartyItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PartyItem>(create);
  static PartyItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get display => $_getSZ(0);
  @$pb.TagNumber(1)
  set display($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDisplay() => $_has(0);
  @$pb.TagNumber(1)
  void clearDisplay() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get partyType => $_getSZ(1);
  @$pb.TagNumber(2)
  set partyType($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPartyType() => $_has(1);
  @$pb.TagNumber(2)
  void clearPartyType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get homeIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set homeIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHomeIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearHomeIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<RoomTypeItem> get roomTypeGroup => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get tagIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set tagIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTagIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearTagIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get typeBg => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get typeIcon => $_getSZ(6);
  @$pb.TagNumber(7)
  set typeIcon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTypeIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearTypeIcon() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get playingNum => $_getIZ(7);
  @$pb.TagNumber(8)
  set playingNum($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPlayingNum() => $_has(7);
  @$pb.TagNumber(8)
  void clearPlayingNum() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get indexIcon => $_getSZ(8);
  @$pb.TagNumber(9)
  set indexIcon($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasIndexIcon() => $_has(8);
  @$pb.TagNumber(9)
  void clearIndexIcon() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get indexIconHeight => $_getIZ(9);
  @$pb.TagNumber(10)
  set indexIconHeight($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasIndexIconHeight() => $_has(9);
  @$pb.TagNumber(10)
  void clearIndexIconHeight() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get indexIconWidth => $_getIZ(10);
  @$pb.TagNumber(11)
  set indexIconWidth($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasIndexIconWidth() => $_has(10);
  @$pb.TagNumber(11)
  void clearIndexIconWidth() => clearField(11);
}

class FriendTypeName extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FriendTypeName',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..pPS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bg')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'acuteIcon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagColor')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagIcon')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeIcon')
    ..pPS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeBg')
    ..hasRequiredFields = false;

  FriendTypeName._() : super();
  factory FriendTypeName({
    $core.String? show,
    $core.String? label,
    $core.Iterable<$core.String>? bg,
    $core.String? acuteIcon,
    $core.String? tagColor,
    $core.String? tagIcon,
    $core.String? typeIcon,
    $core.Iterable<$core.String>? typeBg,
  }) {
    final _result = create();
    if (show != null) {
      _result.show = show;
    }
    if (label != null) {
      _result.label = label;
    }
    if (bg != null) {
      _result.bg.addAll(bg);
    }
    if (acuteIcon != null) {
      _result.acuteIcon = acuteIcon;
    }
    if (tagColor != null) {
      _result.tagColor = tagColor;
    }
    if (tagIcon != null) {
      _result.tagIcon = tagIcon;
    }
    if (typeIcon != null) {
      _result.typeIcon = typeIcon;
    }
    if (typeBg != null) {
      _result.typeBg.addAll(typeBg);
    }
    return _result;
  }
  factory FriendTypeName.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FriendTypeName.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FriendTypeName clone() => FriendTypeName()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FriendTypeName copyWith(void Function(FriendTypeName) updates) =>
      super.copyWith((message) => updates(message as FriendTypeName))
          as FriendTypeName; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FriendTypeName create() => FriendTypeName._();
  FriendTypeName createEmptyInstance() => create();
  static $pb.PbList<FriendTypeName> createRepeated() =>
      $pb.PbList<FriendTypeName>();
  @$core.pragma('dart2js:noInline')
  static FriendTypeName getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FriendTypeName>(create);
  static FriendTypeName? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get show => $_getSZ(0);
  @$pb.TagNumber(1)
  set show($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShow() => $_has(0);
  @$pb.TagNumber(1)
  void clearShow() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get label => $_getSZ(1);
  @$pb.TagNumber(2)
  set label($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLabel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLabel() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get bg => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get acuteIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set acuteIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAcuteIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearAcuteIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get tagColor => $_getSZ(4);
  @$pb.TagNumber(5)
  set tagColor($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTagColor() => $_has(4);
  @$pb.TagNumber(5)
  void clearTagColor() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get tagIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set tagIcon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTagIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearTagIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get typeIcon => $_getSZ(6);
  @$pb.TagNumber(7)
  set typeIcon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTypeIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearTypeIcon() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.String> get typeBg => $_getList(7);
}

class FriendListItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FriendListItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uname')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uuid')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineStatus',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDateline',
        $pb.PbFieldType.OU3)
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDatelineDiff')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'friendShip')
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'partyStyle',
        $pb.PbFieldType.OU3)
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'followDesc')
    ..aOM<FriendTypeName>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeName',
        subBuilder: FriendTypeName.create)
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'property')
    ..aOB(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isBiz')
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sortIndex',
        $pb.PbFieldType.OU3)
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ticketMark')
    ..hasRequiredFields = false;

  FriendListItem._() : super();
  factory FriendListItem({
    $core.int? uid,
    $core.int? rid,
    $core.String? icon,
    $core.String? uname,
    $core.String? uuid,
    $core.int? sex,
    $core.String? name,
    $core.int? onlineNum,
    $core.int? onlineStatus,
    $core.int? onlineDateline,
    $core.String? onlineDatelineDiff,
    $core.String? friendShip,
    $core.int? partyStyle,
    $core.String? followDesc,
    FriendTypeName? typeName,
    $core.String? property,
    $core.bool? isBiz,
    $core.int? sortIndex,
    $core.String? ticketMark,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (uname != null) {
      _result.uname = uname;
    }
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (name != null) {
      _result.name = name;
    }
    if (onlineNum != null) {
      _result.onlineNum = onlineNum;
    }
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (onlineDateline != null) {
      _result.onlineDateline = onlineDateline;
    }
    if (onlineDatelineDiff != null) {
      _result.onlineDatelineDiff = onlineDatelineDiff;
    }
    if (friendShip != null) {
      _result.friendShip = friendShip;
    }
    if (partyStyle != null) {
      _result.partyStyle = partyStyle;
    }
    if (followDesc != null) {
      _result.followDesc = followDesc;
    }
    if (typeName != null) {
      _result.typeName = typeName;
    }
    if (property != null) {
      _result.property = property;
    }
    if (isBiz != null) {
      _result.isBiz = isBiz;
    }
    if (sortIndex != null) {
      _result.sortIndex = sortIndex;
    }
    if (ticketMark != null) {
      _result.ticketMark = ticketMark;
    }
    return _result;
  }
  factory FriendListItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FriendListItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FriendListItem clone() => FriendListItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FriendListItem copyWith(void Function(FriendListItem) updates) =>
      super.copyWith((message) => updates(message as FriendListItem))
          as FriendListItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FriendListItem create() => FriendListItem._();
  FriendListItem createEmptyInstance() => create();
  static $pb.PbList<FriendListItem> createRepeated() =>
      $pb.PbList<FriendListItem>();
  @$core.pragma('dart2js:noInline')
  static FriendListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FriendListItem>(create);
  static FriendListItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rid => $_getIZ(1);
  @$pb.TagNumber(2)
  set rid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRid() => clearField(2);

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
  $core.String get uname => $_getSZ(3);
  @$pb.TagNumber(4)
  set uname($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUname() => $_has(3);
  @$pb.TagNumber(4)
  void clearUname() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get uuid => $_getSZ(4);
  @$pb.TagNumber(5)
  set uuid($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUuid() => $_has(4);
  @$pb.TagNumber(5)
  void clearUuid() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get sex => $_getIZ(5);
  @$pb.TagNumber(6)
  set sex($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSex() => $_has(5);
  @$pb.TagNumber(6)
  void clearSex() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get name => $_getSZ(6);
  @$pb.TagNumber(7)
  set name($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasName() => $_has(6);
  @$pb.TagNumber(7)
  void clearName() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get onlineNum => $_getIZ(7);
  @$pb.TagNumber(8)
  set onlineNum($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasOnlineNum() => $_has(7);
  @$pb.TagNumber(8)
  void clearOnlineNum() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get onlineStatus => $_getIZ(8);
  @$pb.TagNumber(9)
  set onlineStatus($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasOnlineStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearOnlineStatus() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get onlineDateline => $_getIZ(9);
  @$pb.TagNumber(10)
  set onlineDateline($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasOnlineDateline() => $_has(9);
  @$pb.TagNumber(10)
  void clearOnlineDateline() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get onlineDatelineDiff => $_getSZ(10);
  @$pb.TagNumber(11)
  set onlineDatelineDiff($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasOnlineDatelineDiff() => $_has(10);
  @$pb.TagNumber(11)
  void clearOnlineDatelineDiff() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get friendShip => $_getSZ(11);
  @$pb.TagNumber(12)
  set friendShip($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasFriendShip() => $_has(11);
  @$pb.TagNumber(12)
  void clearFriendShip() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get partyStyle => $_getIZ(12);
  @$pb.TagNumber(13)
  set partyStyle($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasPartyStyle() => $_has(12);
  @$pb.TagNumber(13)
  void clearPartyStyle() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get followDesc => $_getSZ(13);
  @$pb.TagNumber(14)
  set followDesc($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasFollowDesc() => $_has(13);
  @$pb.TagNumber(14)
  void clearFollowDesc() => clearField(14);

  @$pb.TagNumber(15)
  FriendTypeName get typeName => $_getN(14);
  @$pb.TagNumber(15)
  set typeName(FriendTypeName v) {
    setField(15, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasTypeName() => $_has(14);
  @$pb.TagNumber(15)
  void clearTypeName() => clearField(15);
  @$pb.TagNumber(15)
  FriendTypeName ensureTypeName() => $_ensure(14);

  @$pb.TagNumber(16)
  $core.String get property => $_getSZ(15);
  @$pb.TagNumber(16)
  set property($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasProperty() => $_has(15);
  @$pb.TagNumber(16)
  void clearProperty() => clearField(16);

  @$pb.TagNumber(17)
  $core.bool get isBiz => $_getBF(16);
  @$pb.TagNumber(17)
  set isBiz($core.bool v) {
    $_setBool(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasIsBiz() => $_has(16);
  @$pb.TagNumber(17)
  void clearIsBiz() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get sortIndex => $_getIZ(17);
  @$pb.TagNumber(18)
  set sortIndex($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasSortIndex() => $_has(17);
  @$pb.TagNumber(18)
  void clearSortIndex() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get ticketMark => $_getSZ(18);
  @$pb.TagNumber(19)
  set ticketMark($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasTicketMark() => $_has(18);
  @$pb.TagNumber(19)
  void clearTicketMark() => clearField(19);
}

class RecentListItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RecentListItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineStatus',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDateline',
        $pb.PbFieldType.OU3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDatelineDiff')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'friendShip')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sortIndex',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RecentListItem._() : super();
  factory RecentListItem({
    $core.int? uid,
    $core.int? rid,
    $core.String? icon,
    $core.String? name,
    $core.int? onlineNum,
    $core.int? onlineStatus,
    $core.int? onlineDateline,
    $core.String? onlineDatelineDiff,
    $core.String? friendShip,
    $core.int? sortIndex,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (onlineNum != null) {
      _result.onlineNum = onlineNum;
    }
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (onlineDateline != null) {
      _result.onlineDateline = onlineDateline;
    }
    if (onlineDatelineDiff != null) {
      _result.onlineDatelineDiff = onlineDatelineDiff;
    }
    if (friendShip != null) {
      _result.friendShip = friendShip;
    }
    if (sortIndex != null) {
      _result.sortIndex = sortIndex;
    }
    return _result;
  }
  factory RecentListItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RecentListItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RecentListItem clone() => RecentListItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RecentListItem copyWith(void Function(RecentListItem) updates) =>
      super.copyWith((message) => updates(message as RecentListItem))
          as RecentListItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RecentListItem create() => RecentListItem._();
  RecentListItem createEmptyInstance() => create();
  static $pb.PbList<RecentListItem> createRepeated() =>
      $pb.PbList<RecentListItem>();
  @$core.pragma('dart2js:noInline')
  static RecentListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RecentListItem>(create);
  static RecentListItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rid => $_getIZ(1);
  @$pb.TagNumber(2)
  set rid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRid() => clearField(2);

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
  $core.int get onlineNum => $_getIZ(4);
  @$pb.TagNumber(5)
  set onlineNum($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOnlineNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnlineNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get onlineStatus => $_getIZ(5);
  @$pb.TagNumber(6)
  set onlineStatus($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasOnlineStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearOnlineStatus() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get onlineDateline => $_getIZ(6);
  @$pb.TagNumber(7)
  set onlineDateline($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasOnlineDateline() => $_has(6);
  @$pb.TagNumber(7)
  void clearOnlineDateline() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get onlineDatelineDiff => $_getSZ(7);
  @$pb.TagNumber(8)
  set onlineDatelineDiff($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasOnlineDatelineDiff() => $_has(7);
  @$pb.TagNumber(8)
  void clearOnlineDatelineDiff() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get friendShip => $_getSZ(8);
  @$pb.TagNumber(9)
  set friendShip($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasFriendShip() => $_has(8);
  @$pb.TagNumber(9)
  void clearFriendShip() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get sortIndex => $_getIZ(9);
  @$pb.TagNumber(10)
  set sortIndex($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasSortIndex() => $_has(9);
  @$pb.TagNumber(10)
  void clearSortIndex() => clearField(10);
}

class RoomListItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomListItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'property')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numBoy',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numGirl',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'real',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'patternStyle',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomBorder')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uname')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hourRank',
        $pb.PbFieldType.OU3)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'labelType')
    ..pPS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'micIcons')
    ..aOM<FriendTypeName>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeName',
        subBuilder: FriendTypeName.create)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomFactoryType')
    ..aOS(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'settlementChannel')
    ..aOB(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isBiz')
    ..aOS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'reasonForUser')
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'paier',
        $pb.PbFieldType.OU3)
    ..aOB(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isGame')
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'types')
    ..aOS(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bossIcon')
    ..aOS(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'operationLabel')
    ..aOS(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'operationBg')
    ..a<$core.int>(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'recruitDesc')
    ..a<$core.int>(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..aOS(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveCoverIcon')
    ..aOS(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveTagIcon')
    ..aOS(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftFrame')
    ..pPS(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagIcon')
    ..a<$core.int>(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hot',
        $pb.PbFieldType.OU3)
    ..aOM<$0.BaseBannerItem>(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'banner',
        subBuilder: $0.BaseBannerItem.create)
    ..aOS(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ticketMark')
    ..aOS(
        38,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topRightIcon')
    ..aOS(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomBannerBg')
    ..aOS(
        40,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fixTagUrl1',
        protoName: 'fix_tag_url_1')
    ..aOS(
        41,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fixTagUrl2',
        protoName: 'fix_tag_url_2')
    ..aOS(
        42,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fixFrameUrl1',
        protoName: 'fix_frame_url_1')
    ..aOS(
        43,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fixFrameUrl2',
        protoName: 'fix_frame_url_2')
    ..aOB(
        44,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fixHideHot')
    ..a<$core.int>(
        45,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fixSort1',
        $pb.PbFieldType.OU3,
        protoName: 'fix_sort_1')
    ..a<$core.int>(
        46,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fixSort2',
        $pb.PbFieldType.OU3,
        protoName: 'fix_sort_2')
    ..a<$core.int>(
        47,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fixPosition',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        48,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prettyRid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomListItem._() : super();
  factory RoomListItem({
    $core.int? rid,
    $core.String? name,
    $core.String? property,
    $core.String? icon,
    $core.int? numBoy,
    $core.int? numGirl,
    $core.int? real,
    $core.int? patternStyle,
    $core.String? roomBorder,
    $core.String? uname,
    $core.int? hourRank,
    $core.String? labelType,
    $core.Iterable<$core.String>? micIcons,
    FriendTypeName? typeName,
    $core.int? uid,
    $core.String? roomFactoryType,
    $core.String? settlementChannel,
    $core.bool? isBiz,
    $core.String? reasonForUser,
    $core.int? sex,
    $core.int? paier,
    $core.bool? isGame,
    $core.String? types,
    $core.String? type,
    $core.String? bossIcon,
    $core.String? operationLabel,
    $core.String? operationBg,
    $core.int? onlineNum,
    $core.String? recruitDesc,
    $core.int? score,
    $core.String? liveCoverIcon,
    $core.String? liveTagIcon,
    $core.String? leftFrame,
    $core.Iterable<$core.String>? tagIcon,
    $core.int? hot,
    $0.BaseBannerItem? banner,
    $core.String? ticketMark,
    $core.String? topRightIcon,
    $core.String? roomBannerBg,
    $core.String? fixTagUrl1,
    $core.String? fixTagUrl2,
    $core.String? fixFrameUrl1,
    $core.String? fixFrameUrl2,
    $core.bool? fixHideHot,
    $core.int? fixSort1,
    $core.int? fixSort2,
    $core.int? fixPosition,
    $core.int? prettyRid,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (property != null) {
      _result.property = property;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (numBoy != null) {
      _result.numBoy = numBoy;
    }
    if (numGirl != null) {
      _result.numGirl = numGirl;
    }
    if (real != null) {
      _result.real = real;
    }
    if (patternStyle != null) {
      _result.patternStyle = patternStyle;
    }
    if (roomBorder != null) {
      _result.roomBorder = roomBorder;
    }
    if (uname != null) {
      _result.uname = uname;
    }
    if (hourRank != null) {
      _result.hourRank = hourRank;
    }
    if (labelType != null) {
      _result.labelType = labelType;
    }
    if (micIcons != null) {
      _result.micIcons.addAll(micIcons);
    }
    if (typeName != null) {
      _result.typeName = typeName;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (roomFactoryType != null) {
      _result.roomFactoryType = roomFactoryType;
    }
    if (settlementChannel != null) {
      _result.settlementChannel = settlementChannel;
    }
    if (isBiz != null) {
      _result.isBiz = isBiz;
    }
    if (reasonForUser != null) {
      _result.reasonForUser = reasonForUser;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (paier != null) {
      _result.paier = paier;
    }
    if (isGame != null) {
      _result.isGame = isGame;
    }
    if (types != null) {
      _result.types = types;
    }
    if (type != null) {
      _result.type = type;
    }
    if (bossIcon != null) {
      _result.bossIcon = bossIcon;
    }
    if (operationLabel != null) {
      _result.operationLabel = operationLabel;
    }
    if (operationBg != null) {
      _result.operationBg = operationBg;
    }
    if (onlineNum != null) {
      _result.onlineNum = onlineNum;
    }
    if (recruitDesc != null) {
      _result.recruitDesc = recruitDesc;
    }
    if (score != null) {
      _result.score = score;
    }
    if (liveCoverIcon != null) {
      _result.liveCoverIcon = liveCoverIcon;
    }
    if (liveTagIcon != null) {
      _result.liveTagIcon = liveTagIcon;
    }
    if (leftFrame != null) {
      _result.leftFrame = leftFrame;
    }
    if (tagIcon != null) {
      _result.tagIcon.addAll(tagIcon);
    }
    if (hot != null) {
      _result.hot = hot;
    }
    if (banner != null) {
      _result.banner = banner;
    }
    if (ticketMark != null) {
      _result.ticketMark = ticketMark;
    }
    if (topRightIcon != null) {
      _result.topRightIcon = topRightIcon;
    }
    if (roomBannerBg != null) {
      _result.roomBannerBg = roomBannerBg;
    }
    if (fixTagUrl1 != null) {
      _result.fixTagUrl1 = fixTagUrl1;
    }
    if (fixTagUrl2 != null) {
      _result.fixTagUrl2 = fixTagUrl2;
    }
    if (fixFrameUrl1 != null) {
      _result.fixFrameUrl1 = fixFrameUrl1;
    }
    if (fixFrameUrl2 != null) {
      _result.fixFrameUrl2 = fixFrameUrl2;
    }
    if (fixHideHot != null) {
      _result.fixHideHot = fixHideHot;
    }
    if (fixSort1 != null) {
      _result.fixSort1 = fixSort1;
    }
    if (fixSort2 != null) {
      _result.fixSort2 = fixSort2;
    }
    if (fixPosition != null) {
      _result.fixPosition = fixPosition;
    }
    if (prettyRid != null) {
      _result.prettyRid = prettyRid;
    }
    return _result;
  }
  factory RoomListItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomListItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomListItem clone() => RoomListItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomListItem copyWith(void Function(RoomListItem) updates) =>
      super.copyWith((message) => updates(message as RoomListItem))
          as RoomListItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomListItem create() => RoomListItem._();
  RoomListItem createEmptyInstance() => create();
  static $pb.PbList<RoomListItem> createRepeated() =>
      $pb.PbList<RoomListItem>();
  @$core.pragma('dart2js:noInline')
  static RoomListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomListItem>(create);
  static RoomListItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

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
  $core.String get property => $_getSZ(2);
  @$pb.TagNumber(3)
  set property($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasProperty() => $_has(2);
  @$pb.TagNumber(3)
  void clearProperty() => clearField(3);

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
  $core.int get numBoy => $_getIZ(4);
  @$pb.TagNumber(5)
  set numBoy($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNumBoy() => $_has(4);
  @$pb.TagNumber(5)
  void clearNumBoy() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get numGirl => $_getIZ(5);
  @$pb.TagNumber(6)
  set numGirl($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasNumGirl() => $_has(5);
  @$pb.TagNumber(6)
  void clearNumGirl() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get real => $_getIZ(6);
  @$pb.TagNumber(7)
  set real($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasReal() => $_has(6);
  @$pb.TagNumber(7)
  void clearReal() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get patternStyle => $_getIZ(7);
  @$pb.TagNumber(8)
  set patternStyle($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPatternStyle() => $_has(7);
  @$pb.TagNumber(8)
  void clearPatternStyle() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get roomBorder => $_getSZ(8);
  @$pb.TagNumber(9)
  set roomBorder($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasRoomBorder() => $_has(8);
  @$pb.TagNumber(9)
  void clearRoomBorder() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get uname => $_getSZ(9);
  @$pb.TagNumber(10)
  set uname($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasUname() => $_has(9);
  @$pb.TagNumber(10)
  void clearUname() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get hourRank => $_getIZ(10);
  @$pb.TagNumber(11)
  set hourRank($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasHourRank() => $_has(10);
  @$pb.TagNumber(11)
  void clearHourRank() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get labelType => $_getSZ(11);
  @$pb.TagNumber(12)
  set labelType($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasLabelType() => $_has(11);
  @$pb.TagNumber(12)
  void clearLabelType() => clearField(12);

  @$pb.TagNumber(13)
  $core.List<$core.String> get micIcons => $_getList(12);

  @$pb.TagNumber(14)
  FriendTypeName get typeName => $_getN(13);
  @$pb.TagNumber(14)
  set typeName(FriendTypeName v) {
    setField(14, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasTypeName() => $_has(13);
  @$pb.TagNumber(14)
  void clearTypeName() => clearField(14);
  @$pb.TagNumber(14)
  FriendTypeName ensureTypeName() => $_ensure(13);

  @$pb.TagNumber(15)
  $core.int get uid => $_getIZ(14);
  @$pb.TagNumber(15)
  set uid($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasUid() => $_has(14);
  @$pb.TagNumber(15)
  void clearUid() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get roomFactoryType => $_getSZ(15);
  @$pb.TagNumber(16)
  set roomFactoryType($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasRoomFactoryType() => $_has(15);
  @$pb.TagNumber(16)
  void clearRoomFactoryType() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get settlementChannel => $_getSZ(16);
  @$pb.TagNumber(17)
  set settlementChannel($core.String v) {
    $_setString(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasSettlementChannel() => $_has(16);
  @$pb.TagNumber(17)
  void clearSettlementChannel() => clearField(17);

  @$pb.TagNumber(18)
  $core.bool get isBiz => $_getBF(17);
  @$pb.TagNumber(18)
  set isBiz($core.bool v) {
    $_setBool(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasIsBiz() => $_has(17);
  @$pb.TagNumber(18)
  void clearIsBiz() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get reasonForUser => $_getSZ(18);
  @$pb.TagNumber(19)
  set reasonForUser($core.String v) {
    $_setString(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasReasonForUser() => $_has(18);
  @$pb.TagNumber(19)
  void clearReasonForUser() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get sex => $_getIZ(19);
  @$pb.TagNumber(20)
  set sex($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasSex() => $_has(19);
  @$pb.TagNumber(20)
  void clearSex() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get paier => $_getIZ(20);
  @$pb.TagNumber(21)
  set paier($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasPaier() => $_has(20);
  @$pb.TagNumber(21)
  void clearPaier() => clearField(21);

  @$pb.TagNumber(22)
  $core.bool get isGame => $_getBF(21);
  @$pb.TagNumber(22)
  set isGame($core.bool v) {
    $_setBool(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasIsGame() => $_has(21);
  @$pb.TagNumber(22)
  void clearIsGame() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get types => $_getSZ(22);
  @$pb.TagNumber(23)
  set types($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasTypes() => $_has(22);
  @$pb.TagNumber(23)
  void clearTypes() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get type => $_getSZ(23);
  @$pb.TagNumber(24)
  set type($core.String v) {
    $_setString(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasType() => $_has(23);
  @$pb.TagNumber(24)
  void clearType() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get bossIcon => $_getSZ(24);
  @$pb.TagNumber(25)
  set bossIcon($core.String v) {
    $_setString(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasBossIcon() => $_has(24);
  @$pb.TagNumber(25)
  void clearBossIcon() => clearField(25);

  @$pb.TagNumber(26)
  $core.String get operationLabel => $_getSZ(25);
  @$pb.TagNumber(26)
  set operationLabel($core.String v) {
    $_setString(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasOperationLabel() => $_has(25);
  @$pb.TagNumber(26)
  void clearOperationLabel() => clearField(26);

  @$pb.TagNumber(27)
  $core.String get operationBg => $_getSZ(26);
  @$pb.TagNumber(27)
  set operationBg($core.String v) {
    $_setString(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasOperationBg() => $_has(26);
  @$pb.TagNumber(27)
  void clearOperationBg() => clearField(27);

  @$pb.TagNumber(28)
  $core.int get onlineNum => $_getIZ(27);
  @$pb.TagNumber(28)
  set onlineNum($core.int v) {
    $_setUnsignedInt32(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasOnlineNum() => $_has(27);
  @$pb.TagNumber(28)
  void clearOnlineNum() => clearField(28);

  @$pb.TagNumber(29)
  $core.String get recruitDesc => $_getSZ(28);
  @$pb.TagNumber(29)
  set recruitDesc($core.String v) {
    $_setString(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasRecruitDesc() => $_has(28);
  @$pb.TagNumber(29)
  void clearRecruitDesc() => clearField(29);

  @$pb.TagNumber(30)
  $core.int get score => $_getIZ(29);
  @$pb.TagNumber(30)
  set score($core.int v) {
    $_setUnsignedInt32(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasScore() => $_has(29);
  @$pb.TagNumber(30)
  void clearScore() => clearField(30);

  @$pb.TagNumber(31)
  $core.String get liveCoverIcon => $_getSZ(30);
  @$pb.TagNumber(31)
  set liveCoverIcon($core.String v) {
    $_setString(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasLiveCoverIcon() => $_has(30);
  @$pb.TagNumber(31)
  void clearLiveCoverIcon() => clearField(31);

  @$pb.TagNumber(32)
  $core.String get liveTagIcon => $_getSZ(31);
  @$pb.TagNumber(32)
  set liveTagIcon($core.String v) {
    $_setString(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasLiveTagIcon() => $_has(31);
  @$pb.TagNumber(32)
  void clearLiveTagIcon() => clearField(32);

  @$pb.TagNumber(33)
  $core.String get leftFrame => $_getSZ(32);
  @$pb.TagNumber(33)
  set leftFrame($core.String v) {
    $_setString(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasLeftFrame() => $_has(32);
  @$pb.TagNumber(33)
  void clearLeftFrame() => clearField(33);

  @$pb.TagNumber(34)
  $core.List<$core.String> get tagIcon => $_getList(33);

  @$pb.TagNumber(35)
  $core.int get hot => $_getIZ(34);
  @$pb.TagNumber(35)
  set hot($core.int v) {
    $_setUnsignedInt32(34, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasHot() => $_has(34);
  @$pb.TagNumber(35)
  void clearHot() => clearField(35);

  @$pb.TagNumber(36)
  $0.BaseBannerItem get banner => $_getN(35);
  @$pb.TagNumber(36)
  set banner($0.BaseBannerItem v) {
    setField(36, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasBanner() => $_has(35);
  @$pb.TagNumber(36)
  void clearBanner() => clearField(36);
  @$pb.TagNumber(36)
  $0.BaseBannerItem ensureBanner() => $_ensure(35);

  @$pb.TagNumber(37)
  $core.String get ticketMark => $_getSZ(36);
  @$pb.TagNumber(37)
  set ticketMark($core.String v) {
    $_setString(36, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasTicketMark() => $_has(36);
  @$pb.TagNumber(37)
  void clearTicketMark() => clearField(37);

  @$pb.TagNumber(38)
  $core.String get topRightIcon => $_getSZ(37);
  @$pb.TagNumber(38)
  set topRightIcon($core.String v) {
    $_setString(37, v);
  }

  @$pb.TagNumber(38)
  $core.bool hasTopRightIcon() => $_has(37);
  @$pb.TagNumber(38)
  void clearTopRightIcon() => clearField(38);

  @$pb.TagNumber(39)
  $core.String get roomBannerBg => $_getSZ(38);
  @$pb.TagNumber(39)
  set roomBannerBg($core.String v) {
    $_setString(38, v);
  }

  @$pb.TagNumber(39)
  $core.bool hasRoomBannerBg() => $_has(38);
  @$pb.TagNumber(39)
  void clearRoomBannerBg() => clearField(39);

  @$pb.TagNumber(40)
  $core.String get fixTagUrl1 => $_getSZ(39);
  @$pb.TagNumber(40)
  set fixTagUrl1($core.String v) {
    $_setString(39, v);
  }

  @$pb.TagNumber(40)
  $core.bool hasFixTagUrl1() => $_has(39);
  @$pb.TagNumber(40)
  void clearFixTagUrl1() => clearField(40);

  @$pb.TagNumber(41)
  $core.String get fixTagUrl2 => $_getSZ(40);
  @$pb.TagNumber(41)
  set fixTagUrl2($core.String v) {
    $_setString(40, v);
  }

  @$pb.TagNumber(41)
  $core.bool hasFixTagUrl2() => $_has(40);
  @$pb.TagNumber(41)
  void clearFixTagUrl2() => clearField(41);

  @$pb.TagNumber(42)
  $core.String get fixFrameUrl1 => $_getSZ(41);
  @$pb.TagNumber(42)
  set fixFrameUrl1($core.String v) {
    $_setString(41, v);
  }

  @$pb.TagNumber(42)
  $core.bool hasFixFrameUrl1() => $_has(41);
  @$pb.TagNumber(42)
  void clearFixFrameUrl1() => clearField(42);

  @$pb.TagNumber(43)
  $core.String get fixFrameUrl2 => $_getSZ(42);
  @$pb.TagNumber(43)
  set fixFrameUrl2($core.String v) {
    $_setString(42, v);
  }

  @$pb.TagNumber(43)
  $core.bool hasFixFrameUrl2() => $_has(42);
  @$pb.TagNumber(43)
  void clearFixFrameUrl2() => clearField(43);

  @$pb.TagNumber(44)
  $core.bool get fixHideHot => $_getBF(43);
  @$pb.TagNumber(44)
  set fixHideHot($core.bool v) {
    $_setBool(43, v);
  }

  @$pb.TagNumber(44)
  $core.bool hasFixHideHot() => $_has(43);
  @$pb.TagNumber(44)
  void clearFixHideHot() => clearField(44);

  @$pb.TagNumber(45)
  $core.int get fixSort1 => $_getIZ(44);
  @$pb.TagNumber(45)
  set fixSort1($core.int v) {
    $_setUnsignedInt32(44, v);
  }

  @$pb.TagNumber(45)
  $core.bool hasFixSort1() => $_has(44);
  @$pb.TagNumber(45)
  void clearFixSort1() => clearField(45);

  @$pb.TagNumber(46)
  $core.int get fixSort2 => $_getIZ(45);
  @$pb.TagNumber(46)
  set fixSort2($core.int v) {
    $_setUnsignedInt32(45, v);
  }

  @$pb.TagNumber(46)
  $core.bool hasFixSort2() => $_has(45);
  @$pb.TagNumber(46)
  void clearFixSort2() => clearField(46);

  @$pb.TagNumber(47)
  $core.int get fixPosition => $_getIZ(46);
  @$pb.TagNumber(47)
  set fixPosition($core.int v) {
    $_setUnsignedInt32(46, v);
  }

  @$pb.TagNumber(47)
  $core.bool hasFixPosition() => $_has(46);
  @$pb.TagNumber(47)
  void clearFixPosition() => clearField(47);

  @$pb.TagNumber(48)
  $core.int get prettyRid => $_getIZ(47);
  @$pb.TagNumber(48)
  set prettyRid($core.int v) {
    $_setUnsignedInt32(47, v);
  }

  @$pb.TagNumber(48)
  $core.bool hasPrettyRid() => $_has(47);
  @$pb.TagNumber(48)
  void clearPrettyRid() => clearField(48);
}

class HomeTabFriendData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeTabFriendData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<PartyItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'partyList',
        $pb.PbFieldType.PM,
        subBuilder: PartyItem.create)
    ..pc<FriendListItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'friendList',
        $pb.PbFieldType.PM,
        subBuilder: FriendListItem.create)
    ..pc<RecentListItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'recentList',
        $pb.PbFieldType.PM,
        subBuilder: RecentListItem.create)
    ..pc<RoomListItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomBannerList',
        $pb.PbFieldType.PM,
        subBuilder: RoomListItem.create)
    ..pc<RoomListItem>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'historyList',
        $pb.PbFieldType.PM,
        subBuilder: RoomListItem.create)
    ..hasRequiredFields = false;

  HomeTabFriendData._() : super();
  factory HomeTabFriendData({
    $core.Iterable<PartyItem>? partyList,
    $core.Iterable<FriendListItem>? friendList,
    $core.Iterable<RecentListItem>? recentList,
    $core.Iterable<RoomListItem>? roomBannerList,
    $core.Iterable<RoomListItem>? historyList,
  }) {
    final _result = create();
    if (partyList != null) {
      _result.partyList.addAll(partyList);
    }
    if (friendList != null) {
      _result.friendList.addAll(friendList);
    }
    if (recentList != null) {
      _result.recentList.addAll(recentList);
    }
    if (roomBannerList != null) {
      _result.roomBannerList.addAll(roomBannerList);
    }
    if (historyList != null) {
      _result.historyList.addAll(historyList);
    }
    return _result;
  }
  factory HomeTabFriendData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeTabFriendData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeTabFriendData clone() => HomeTabFriendData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeTabFriendData copyWith(void Function(HomeTabFriendData) updates) =>
      super.copyWith((message) => updates(message as HomeTabFriendData))
          as HomeTabFriendData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeTabFriendData create() => HomeTabFriendData._();
  HomeTabFriendData createEmptyInstance() => create();
  static $pb.PbList<HomeTabFriendData> createRepeated() =>
      $pb.PbList<HomeTabFriendData>();
  @$core.pragma('dart2js:noInline')
  static HomeTabFriendData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeTabFriendData>(create);
  static HomeTabFriendData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PartyItem> get partyList => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<FriendListItem> get friendList => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<RecentListItem> get recentList => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<RoomListItem> get roomBannerList => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<RoomListItem> get historyList => $_getList(4);
}

class ResHomeTabFriend extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHomeTabFriend',
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
    ..aOM<HomeTabFriendData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HomeTabFriendData.create)
    ..hasRequiredFields = false;

  ResHomeTabFriend._() : super();
  factory ResHomeTabFriend({
    $core.bool? success,
    $core.String? msg,
    HomeTabFriendData? data,
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
  factory ResHomeTabFriend.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHomeTabFriend.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHomeTabFriend clone() => ResHomeTabFriend()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHomeTabFriend copyWith(void Function(ResHomeTabFriend) updates) =>
      super.copyWith((message) => updates(message as ResHomeTabFriend))
          as ResHomeTabFriend; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHomeTabFriend create() => ResHomeTabFriend._();
  ResHomeTabFriend createEmptyInstance() => create();
  static $pb.PbList<ResHomeTabFriend> createRepeated() =>
      $pb.PbList<ResHomeTabFriend>();
  @$core.pragma('dart2js:noInline')
  static ResHomeTabFriend getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHomeTabFriend>(create);
  static ResHomeTabFriend? _defaultInstance;

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
  HomeTabFriendData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HomeTabFriendData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HomeTabFriendData ensureData() => $_ensure(2);
}

class HomeTabCollectData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeTabCollectData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<FriendListItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'friendList',
        $pb.PbFieldType.PM,
        subBuilder: FriendListItem.create)
    ..pc<RoomListItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomList',
        $pb.PbFieldType.PM,
        subBuilder: RoomListItem.create)
    ..pc<RoomListItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'meList',
        $pb.PbFieldType.PM,
        subBuilder: RoomListItem.create)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasCollect')
    ..hasRequiredFields = false;

  HomeTabCollectData._() : super();
  factory HomeTabCollectData({
    $core.Iterable<FriendListItem>? friendList,
    $core.Iterable<RoomListItem>? roomList,
    $core.Iterable<RoomListItem>? meList,
    $core.bool? hasCollect,
  }) {
    final _result = create();
    if (friendList != null) {
      _result.friendList.addAll(friendList);
    }
    if (roomList != null) {
      _result.roomList.addAll(roomList);
    }
    if (meList != null) {
      _result.meList.addAll(meList);
    }
    if (hasCollect != null) {
      _result.hasCollect = hasCollect;
    }
    return _result;
  }
  factory HomeTabCollectData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeTabCollectData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeTabCollectData clone() => HomeTabCollectData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeTabCollectData copyWith(void Function(HomeTabCollectData) updates) =>
      super.copyWith((message) => updates(message as HomeTabCollectData))
          as HomeTabCollectData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeTabCollectData create() => HomeTabCollectData._();
  HomeTabCollectData createEmptyInstance() => create();
  static $pb.PbList<HomeTabCollectData> createRepeated() =>
      $pb.PbList<HomeTabCollectData>();
  @$core.pragma('dart2js:noInline')
  static HomeTabCollectData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeTabCollectData>(create);
  static HomeTabCollectData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<FriendListItem> get friendList => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<RoomListItem> get roomList => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<RoomListItem> get meList => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get hasCollect => $_getBF(3);
  @$pb.TagNumber(4)
  set hasCollect($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasHasCollect() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasCollect() => clearField(4);
}

class ResHomeTabCollect extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHomeTabCollect',
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
    ..aOM<HomeTabCollectData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HomeTabCollectData.create)
    ..hasRequiredFields = false;

  ResHomeTabCollect._() : super();
  factory ResHomeTabCollect({
    $core.bool? success,
    $core.String? msg,
    HomeTabCollectData? data,
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
  factory ResHomeTabCollect.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHomeTabCollect.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHomeTabCollect clone() => ResHomeTabCollect()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHomeTabCollect copyWith(void Function(ResHomeTabCollect) updates) =>
      super.copyWith((message) => updates(message as ResHomeTabCollect))
          as ResHomeTabCollect; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHomeTabCollect create() => ResHomeTabCollect._();
  ResHomeTabCollect createEmptyInstance() => create();
  static $pb.PbList<ResHomeTabCollect> createRepeated() =>
      $pb.PbList<ResHomeTabCollect>();
  @$core.pragma('dart2js:noInline')
  static ResHomeTabCollect getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHomeTabCollect>(create);
  static ResHomeTabCollect? _defaultInstance;

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
  HomeTabCollectData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HomeTabCollectData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HomeTabCollectData ensureData() => $_ensure(2);
}

class HomeForYouData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeForYouData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<RoomListItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomList',
        $pb.PbFieldType.PM,
        subBuilder: RoomListItem.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  HomeForYouData._() : super();
  factory HomeForYouData({
    $core.Iterable<RoomListItem>? roomList,
    $core.int? more,
  }) {
    final _result = create();
    if (roomList != null) {
      _result.roomList.addAll(roomList);
    }
    if (more != null) {
      _result.more = more;
    }
    return _result;
  }
  factory HomeForYouData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeForYouData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeForYouData clone() => HomeForYouData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeForYouData copyWith(void Function(HomeForYouData) updates) =>
      super.copyWith((message) => updates(message as HomeForYouData))
          as HomeForYouData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeForYouData create() => HomeForYouData._();
  HomeForYouData createEmptyInstance() => create();
  static $pb.PbList<HomeForYouData> createRepeated() =>
      $pb.PbList<HomeForYouData>();
  @$core.pragma('dart2js:noInline')
  static HomeForYouData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeForYouData>(create);
  static HomeForYouData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RoomListItem> get roomList => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get more => $_getIZ(1);
  @$pb.TagNumber(2)
  set more($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearMore() => clearField(2);
}

class ResHomeForYou extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHomeForYou',
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
    ..aOM<HomeForYouData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HomeForYouData.create)
    ..hasRequiredFields = false;

  ResHomeForYou._() : super();
  factory ResHomeForYou({
    $core.bool? success,
    $core.String? msg,
    HomeForYouData? data,
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
  factory ResHomeForYou.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHomeForYou.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHomeForYou clone() => ResHomeForYou()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHomeForYou copyWith(void Function(ResHomeForYou) updates) =>
      super.copyWith((message) => updates(message as ResHomeForYou))
          as ResHomeForYou; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHomeForYou create() => ResHomeForYou._();
  ResHomeForYou createEmptyInstance() => create();
  static $pb.PbList<ResHomeForYou> createRepeated() =>
      $pb.PbList<ResHomeForYou>();
  @$core.pragma('dart2js:noInline')
  static ResHomeForYou getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHomeForYou>(create);
  static ResHomeForYou? _defaultInstance;

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
  HomeForYouData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HomeForYouData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HomeForYouData ensureData() => $_ensure(2);
}

class WaveProgressBody extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WaveProgressBody',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..m<$core.int, $core.double>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'progress',
        entryClassName: 'WaveProgressBody.ProgressEntry',
        keyFieldType: $pb.PbFieldType.OU3,
        valueFieldType: $pb.PbFieldType.OF,
        packageName: const $pb.PackageName('pb'))
    ..hasRequiredFields = false;

  WaveProgressBody._() : super();
  factory WaveProgressBody({
    $core.Map<$core.int, $core.double>? progress,
  }) {
    final _result = create();
    if (progress != null) {
      _result.progress.addAll(progress);
    }
    return _result;
  }
  factory WaveProgressBody.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WaveProgressBody.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WaveProgressBody clone() => WaveProgressBody()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WaveProgressBody copyWith(void Function(WaveProgressBody) updates) =>
      super.copyWith((message) => updates(message as WaveProgressBody))
          as WaveProgressBody; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WaveProgressBody create() => WaveProgressBody._();
  WaveProgressBody createEmptyInstance() => create();
  static $pb.PbList<WaveProgressBody> createRepeated() =>
      $pb.PbList<WaveProgressBody>();
  @$core.pragma('dart2js:noInline')
  static WaveProgressBody getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WaveProgressBody>(create);
  static WaveProgressBody? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.int, $core.double> get progress => $_getMap(0);
}

class ApiWaveProgressResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiWaveProgressResponse',
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
    ..aOM<WaveProgressBody>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: WaveProgressBody.create)
    ..hasRequiredFields = false;

  ApiWaveProgressResponse._() : super();
  factory ApiWaveProgressResponse({
    $core.bool? success,
    $core.String? message,
    WaveProgressBody? data,
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
  factory ApiWaveProgressResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiWaveProgressResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiWaveProgressResponse clone() =>
      ApiWaveProgressResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiWaveProgressResponse copyWith(
          void Function(ApiWaveProgressResponse) updates) =>
      super.copyWith((message) => updates(message as ApiWaveProgressResponse))
          as ApiWaveProgressResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiWaveProgressResponse create() => ApiWaveProgressResponse._();
  ApiWaveProgressResponse createEmptyInstance() => create();
  static $pb.PbList<ApiWaveProgressResponse> createRepeated() =>
      $pb.PbList<ApiWaveProgressResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiWaveProgressResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiWaveProgressResponse>(create);
  static ApiWaveProgressResponse? _defaultInstance;

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
  WaveProgressBody get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(WaveProgressBody v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  WaveProgressBody ensureData() => $_ensure(2);
}

class ResHomeQuickTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHomeQuickTab',
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
    ..aOM<HomeQuickTabData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HomeQuickTabData.create)
    ..hasRequiredFields = false;

  ResHomeQuickTab._() : super();
  factory ResHomeQuickTab({
    $core.bool? success,
    $core.String? msg,
    HomeQuickTabData? data,
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
  factory ResHomeQuickTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHomeQuickTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHomeQuickTab clone() => ResHomeQuickTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHomeQuickTab copyWith(void Function(ResHomeQuickTab) updates) =>
      super.copyWith((message) => updates(message as ResHomeQuickTab))
          as ResHomeQuickTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHomeQuickTab create() => ResHomeQuickTab._();
  ResHomeQuickTab createEmptyInstance() => create();
  static $pb.PbList<ResHomeQuickTab> createRepeated() =>
      $pb.PbList<ResHomeQuickTab>();
  @$core.pragma('dart2js:noInline')
  static ResHomeQuickTab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHomeQuickTab>(create);
  static ResHomeQuickTab? _defaultInstance;

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
  HomeQuickTabData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HomeQuickTabData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HomeQuickTabData ensureData() => $_ensure(2);
}

class HomeQuickTabData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeQuickTabData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<HomeQuickTab>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabs',
        $pb.PbFieldType.PM,
        subBuilder: HomeQuickTab.create)
    ..hasRequiredFields = false;

  HomeQuickTabData._() : super();
  factory HomeQuickTabData({
    $core.Iterable<HomeQuickTab>? tabs,
  }) {
    final _result = create();
    if (tabs != null) {
      _result.tabs.addAll(tabs);
    }
    return _result;
  }
  factory HomeQuickTabData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeQuickTabData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeQuickTabData clone() => HomeQuickTabData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeQuickTabData copyWith(void Function(HomeQuickTabData) updates) =>
      super.copyWith((message) => updates(message as HomeQuickTabData))
          as HomeQuickTabData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeQuickTabData create() => HomeQuickTabData._();
  HomeQuickTabData createEmptyInstance() => create();
  static $pb.PbList<HomeQuickTabData> createRepeated() =>
      $pb.PbList<HomeQuickTabData>();
  @$core.pragma('dart2js:noInline')
  static HomeQuickTabData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeQuickTabData>(create);
  static HomeQuickTabData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<HomeQuickTab> get tabs => $_getList(0);
}

class HomeQuickTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeQuickTab',
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
            : 'image')
    ..hasRequiredFields = false;

  HomeQuickTab._() : super();
  factory HomeQuickTab({
    $core.String? key,
    $core.String? name,
    $core.String? image,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (name != null) {
      _result.name = name;
    }
    if (image != null) {
      _result.image = image;
    }
    return _result;
  }
  factory HomeQuickTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeQuickTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeQuickTab clone() => HomeQuickTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeQuickTab copyWith(void Function(HomeQuickTab) updates) =>
      super.copyWith((message) => updates(message as HomeQuickTab))
          as HomeQuickTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeQuickTab create() => HomeQuickTab._();
  HomeQuickTab createEmptyInstance() => create();
  static $pb.PbList<HomeQuickTab> createRepeated() =>
      $pb.PbList<HomeQuickTab>();
  @$core.pragma('dart2js:noInline')
  static HomeQuickTab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeQuickTab>(create);
  static HomeQuickTab? _defaultInstance;

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
  $core.String get image => $_getSZ(2);
  @$pb.TagNumber(3)
  set image($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);
}

class GuessFavoriteRoomListRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessFavoriteRoomListRes',
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
    ..aOM<GuessFavoriteRoomListData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GuessFavoriteRoomListData.create)
    ..hasRequiredFields = false;

  GuessFavoriteRoomListRes._() : super();
  factory GuessFavoriteRoomListRes({
    $core.bool? success,
    $core.String? msg,
    GuessFavoriteRoomListData? data,
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
  factory GuessFavoriteRoomListRes.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessFavoriteRoomListRes.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessFavoriteRoomListRes clone() =>
      GuessFavoriteRoomListRes()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessFavoriteRoomListRes copyWith(
          void Function(GuessFavoriteRoomListRes) updates) =>
      super.copyWith((message) => updates(message as GuessFavoriteRoomListRes))
          as GuessFavoriteRoomListRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessFavoriteRoomListRes create() => GuessFavoriteRoomListRes._();
  GuessFavoriteRoomListRes createEmptyInstance() => create();
  static $pb.PbList<GuessFavoriteRoomListRes> createRepeated() =>
      $pb.PbList<GuessFavoriteRoomListRes>();
  @$core.pragma('dart2js:noInline')
  static GuessFavoriteRoomListRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessFavoriteRoomListRes>(create);
  static GuessFavoriteRoomListRes? _defaultInstance;

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
  GuessFavoriteRoomListData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GuessFavoriteRoomListData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GuessFavoriteRoomListData ensureData() => $_ensure(2);
}

class GuessFavoriteRoomListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessFavoriteRoomListData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<GuessFavoriteRoom>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'items',
        $pb.PbFieldType.PM,
        subBuilder: GuessFavoriteRoom.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showIndex',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  GuessFavoriteRoomListData._() : super();
  factory GuessFavoriteRoomListData({
    $core.Iterable<GuessFavoriteRoom>? items,
    $core.int? showIndex,
  }) {
    final _result = create();
    if (items != null) {
      _result.items.addAll(items);
    }
    if (showIndex != null) {
      _result.showIndex = showIndex;
    }
    return _result;
  }
  factory GuessFavoriteRoomListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessFavoriteRoomListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessFavoriteRoomListData clone() =>
      GuessFavoriteRoomListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessFavoriteRoomListData copyWith(
          void Function(GuessFavoriteRoomListData) updates) =>
      super.copyWith((message) => updates(message as GuessFavoriteRoomListData))
          as GuessFavoriteRoomListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessFavoriteRoomListData create() => GuessFavoriteRoomListData._();
  GuessFavoriteRoomListData createEmptyInstance() => create();
  static $pb.PbList<GuessFavoriteRoomListData> createRepeated() =>
      $pb.PbList<GuessFavoriteRoomListData>();
  @$core.pragma('dart2js:noInline')
  static GuessFavoriteRoomListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessFavoriteRoomListData>(create);
  static GuessFavoriteRoomListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GuessFavoriteRoom> get items => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get showIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set showIndex($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasShowIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearShowIndex() => clearField(2);
}

class GuessFavoriteRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessFavoriteRoom',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audio')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audioIcon')
    ..hasRequiredFields = false;

  GuessFavoriteRoom._() : super();
  factory GuessFavoriteRoom({
    $core.int? uid,
    $core.int? rid,
    $core.String? name,
    $core.String? icon,
    $core.String? audio,
    $core.int? duration,
    $core.String? audioIcon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (audio != null) {
      _result.audio = audio;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (audioIcon != null) {
      _result.audioIcon = audioIcon;
    }
    return _result;
  }
  factory GuessFavoriteRoom.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessFavoriteRoom.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessFavoriteRoom clone() => GuessFavoriteRoom()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessFavoriteRoom copyWith(void Function(GuessFavoriteRoom) updates) =>
      super.copyWith((message) => updates(message as GuessFavoriteRoom))
          as GuessFavoriteRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessFavoriteRoom create() => GuessFavoriteRoom._();
  GuessFavoriteRoom createEmptyInstance() => create();
  static $pb.PbList<GuessFavoriteRoom> createRepeated() =>
      $pb.PbList<GuessFavoriteRoom>();
  @$core.pragma('dart2js:noInline')
  static GuessFavoriteRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessFavoriteRoom>(create);
  static GuessFavoriteRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rid => $_getIZ(1);
  @$pb.TagNumber(2)
  set rid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRid() => $_has(1);
  @$pb.TagNumber(2)
  void clearRid() => clearField(2);

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
  $core.String get audio => $_getSZ(4);
  @$pb.TagNumber(5)
  set audio($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAudio() => $_has(4);
  @$pb.TagNumber(5)
  void clearAudio() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get duration => $_getIZ(5);
  @$pb.TagNumber(6)
  set duration($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearDuration() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get audioIcon => $_getSZ(6);
  @$pb.TagNumber(7)
  set audioIcon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasAudioIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearAudioIcon() => clearField(7);
}

class GuessFavoriteInRoomRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GuessFavoriteInRoomRes',
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
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GuessFavoriteInRoomRes._() : super();
  factory GuessFavoriteInRoomRes({
    $core.bool? success,
    $core.String? msg,
    $core.int? data,
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
  factory GuessFavoriteInRoomRes.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GuessFavoriteInRoomRes.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GuessFavoriteInRoomRes clone() =>
      GuessFavoriteInRoomRes()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GuessFavoriteInRoomRes copyWith(
          void Function(GuessFavoriteInRoomRes) updates) =>
      super.copyWith((message) => updates(message as GuessFavoriteInRoomRes))
          as GuessFavoriteInRoomRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GuessFavoriteInRoomRes create() => GuessFavoriteInRoomRes._();
  GuessFavoriteInRoomRes createEmptyInstance() => create();
  static $pb.PbList<GuessFavoriteInRoomRes> createRepeated() =>
      $pb.PbList<GuessFavoriteInRoomRes>();
  @$core.pragma('dart2js:noInline')
  static GuessFavoriteInRoomRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GuessFavoriteInRoomRes>(create);
  static GuessFavoriteInRoomRes? _defaultInstance;

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
  $core.int get data => $_getIZ(2);
  @$pb.TagNumber(3)
  set data($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
}

class HomeTabHotData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeTabHotData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<PartyItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'partyList',
        $pb.PbFieldType.PM,
        subBuilder: PartyItem.create)
    ..pc<RoomListItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomBannerList',
        $pb.PbFieldType.PM,
        subBuilder: RoomListItem.create)
    ..aOM<AwakeFrontPageRsp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awakeFrontPage',
        subBuilder: AwakeFrontPageRsp_Data.create)
    ..hasRequiredFields = false;

  HomeTabHotData._() : super();
  factory HomeTabHotData({
    $core.Iterable<PartyItem>? partyList,
    $core.Iterable<RoomListItem>? roomBannerList,
    AwakeFrontPageRsp_Data? awakeFrontPage,
  }) {
    final _result = create();
    if (partyList != null) {
      _result.partyList.addAll(partyList);
    }
    if (roomBannerList != null) {
      _result.roomBannerList.addAll(roomBannerList);
    }
    if (awakeFrontPage != null) {
      _result.awakeFrontPage = awakeFrontPage;
    }
    return _result;
  }
  factory HomeTabHotData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeTabHotData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeTabHotData clone() => HomeTabHotData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeTabHotData copyWith(void Function(HomeTabHotData) updates) =>
      super.copyWith((message) => updates(message as HomeTabHotData))
          as HomeTabHotData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeTabHotData create() => HomeTabHotData._();
  HomeTabHotData createEmptyInstance() => create();
  static $pb.PbList<HomeTabHotData> createRepeated() =>
      $pb.PbList<HomeTabHotData>();
  @$core.pragma('dart2js:noInline')
  static HomeTabHotData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeTabHotData>(create);
  static HomeTabHotData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PartyItem> get partyList => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<RoomListItem> get roomBannerList => $_getList(1);

  @$pb.TagNumber(3)
  AwakeFrontPageRsp_Data get awakeFrontPage => $_getN(2);
  @$pb.TagNumber(3)
  set awakeFrontPage(AwakeFrontPageRsp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAwakeFrontPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearAwakeFrontPage() => clearField(3);
  @$pb.TagNumber(3)
  AwakeFrontPageRsp_Data ensureAwakeFrontPage() => $_ensure(2);
}

class ResHomeTabHot extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHomeTabHot',
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
    ..aOM<HomeTabHotData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HomeTabHotData.create)
    ..hasRequiredFields = false;

  ResHomeTabHot._() : super();
  factory ResHomeTabHot({
    $core.bool? success,
    $core.String? msg,
    HomeTabHotData? data,
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
  factory ResHomeTabHot.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHomeTabHot.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHomeTabHot clone() => ResHomeTabHot()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHomeTabHot copyWith(void Function(ResHomeTabHot) updates) =>
      super.copyWith((message) => updates(message as ResHomeTabHot))
          as ResHomeTabHot; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHomeTabHot create() => ResHomeTabHot._();
  ResHomeTabHot createEmptyInstance() => create();
  static $pb.PbList<ResHomeTabHot> createRepeated() =>
      $pb.PbList<ResHomeTabHot>();
  @$core.pragma('dart2js:noInline')
  static ResHomeTabHot getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHomeTabHot>(create);
  static ResHomeTabHot? _defaultInstance;

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
  HomeTabHotData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HomeTabHotData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HomeTabHotData ensureData() => $_ensure(2);
}

class HomeTabFollowData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'HomeTabFollowData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<FriendListItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'friendList',
        $pb.PbFieldType.PM,
        subBuilder: FriendListItem.create)
    ..pc<RecentListItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'recentList',
        $pb.PbFieldType.PM,
        subBuilder: RecentListItem.create)
    ..pc<RoomListItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'historyList',
        $pb.PbFieldType.PM,
        subBuilder: RoomListItem.create)
    ..hasRequiredFields = false;

  HomeTabFollowData._() : super();
  factory HomeTabFollowData({
    $core.Iterable<FriendListItem>? friendList,
    $core.Iterable<RecentListItem>? recentList,
    $core.Iterable<RoomListItem>? historyList,
  }) {
    final _result = create();
    if (friendList != null) {
      _result.friendList.addAll(friendList);
    }
    if (recentList != null) {
      _result.recentList.addAll(recentList);
    }
    if (historyList != null) {
      _result.historyList.addAll(historyList);
    }
    return _result;
  }
  factory HomeTabFollowData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HomeTabFollowData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HomeTabFollowData clone() => HomeTabFollowData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HomeTabFollowData copyWith(void Function(HomeTabFollowData) updates) =>
      super.copyWith((message) => updates(message as HomeTabFollowData))
          as HomeTabFollowData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomeTabFollowData create() => HomeTabFollowData._();
  HomeTabFollowData createEmptyInstance() => create();
  static $pb.PbList<HomeTabFollowData> createRepeated() =>
      $pb.PbList<HomeTabFollowData>();
  @$core.pragma('dart2js:noInline')
  static HomeTabFollowData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HomeTabFollowData>(create);
  static HomeTabFollowData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<FriendListItem> get friendList => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<RecentListItem> get recentList => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<RoomListItem> get historyList => $_getList(2);
}

class ResHomeTabFollow extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResHomeTabFollow',
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
    ..aOM<HomeTabFollowData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: HomeTabFollowData.create)
    ..hasRequiredFields = false;

  ResHomeTabFollow._() : super();
  factory ResHomeTabFollow({
    $core.bool? success,
    $core.String? msg,
    HomeTabFollowData? data,
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
  factory ResHomeTabFollow.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResHomeTabFollow.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResHomeTabFollow clone() => ResHomeTabFollow()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResHomeTabFollow copyWith(void Function(ResHomeTabFollow) updates) =>
      super.copyWith((message) => updates(message as ResHomeTabFollow))
          as ResHomeTabFollow; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResHomeTabFollow create() => ResHomeTabFollow._();
  ResHomeTabFollow createEmptyInstance() => create();
  static $pb.PbList<ResHomeTabFollow> createRepeated() =>
      $pb.PbList<ResHomeTabFollow>();
  @$core.pragma('dart2js:noInline')
  static ResHomeTabFollow getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResHomeTabFollow>(create);
  static ResHomeTabFollow? _defaultInstance;

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
  HomeTabFollowData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(HomeTabFollowData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  HomeTabFollowData ensureData() => $_ensure(2);
}

class ResTopRoomList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResTopRoomList',
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
    ..aOM<TopRoomListData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: TopRoomListData.create)
    ..hasRequiredFields = false;

  ResTopRoomList._() : super();
  factory ResTopRoomList({
    $core.bool? success,
    $core.String? msg,
    TopRoomListData? data,
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
  factory ResTopRoomList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResTopRoomList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResTopRoomList clone() => ResTopRoomList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResTopRoomList copyWith(void Function(ResTopRoomList) updates) =>
      super.copyWith((message) => updates(message as ResTopRoomList))
          as ResTopRoomList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResTopRoomList create() => ResTopRoomList._();
  ResTopRoomList createEmptyInstance() => create();
  static $pb.PbList<ResTopRoomList> createRepeated() =>
      $pb.PbList<ResTopRoomList>();
  @$core.pragma('dart2js:noInline')
  static ResTopRoomList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResTopRoomList>(create);
  static ResTopRoomList? _defaultInstance;

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
  TopRoomListData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(TopRoomListData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  TopRoomListData ensureData() => $_ensure(2);
}

class TopRoomListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TopRoomListData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tile')
    ..pc<TopRoomItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: TopRoomItem.create)
    ..hasRequiredFields = false;

  TopRoomListData._() : super();
  factory TopRoomListData({
    $core.String? tile,
    $core.Iterable<TopRoomItem>? list,
  }) {
    final _result = create();
    if (tile != null) {
      _result.tile = tile;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory TopRoomListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TopRoomListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TopRoomListData clone() => TopRoomListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TopRoomListData copyWith(void Function(TopRoomListData) updates) =>
      super.copyWith((message) => updates(message as TopRoomListData))
          as TopRoomListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopRoomListData create() => TopRoomListData._();
  TopRoomListData createEmptyInstance() => create();
  static $pb.PbList<TopRoomListData> createRepeated() =>
      $pb.PbList<TopRoomListData>();
  @$core.pragma('dart2js:noInline')
  static TopRoomListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TopRoomListData>(create);
  static TopRoomListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tile => $_getSZ(0);
  @$pb.TagNumber(1)
  set tile($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTile() => $_has(0);
  @$pb.TagNumber(1)
  void clearTile() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<TopRoomItem> get list => $_getList(1);
}

class TopRoomItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TopRoomItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frameUrl')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomIcon')
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'activeIcon')
    ..hasRequiredFields = false;

  TopRoomItem._() : super();
  factory TopRoomItem({
    $core.int? rid,
    $core.String? frameUrl,
    $core.String? name,
    $core.String? roomIcon,
    $core.bool? activeIcon,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (frameUrl != null) {
      _result.frameUrl = frameUrl;
    }
    if (name != null) {
      _result.name = name;
    }
    if (roomIcon != null) {
      _result.roomIcon = roomIcon;
    }
    if (activeIcon != null) {
      _result.activeIcon = activeIcon;
    }
    return _result;
  }
  factory TopRoomItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TopRoomItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TopRoomItem clone() => TopRoomItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TopRoomItem copyWith(void Function(TopRoomItem) updates) =>
      super.copyWith((message) => updates(message as TopRoomItem))
          as TopRoomItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopRoomItem create() => TopRoomItem._();
  TopRoomItem createEmptyInstance() => create();
  static $pb.PbList<TopRoomItem> createRepeated() => $pb.PbList<TopRoomItem>();
  @$core.pragma('dart2js:noInline')
  static TopRoomItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TopRoomItem>(create);
  static TopRoomItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get frameUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set frameUrl($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFrameUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrameUrl() => clearField(2);

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
  $core.String get roomIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set roomIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRoomIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get activeIcon => $_getBF(4);
  @$pb.TagNumber(5)
  set activeIcon($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasActiveIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearActiveIcon() => clearField(5);
}

class ResTopRoomJump extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResTopRoomJump',
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
    ..aOM<TopRoomJumpData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: TopRoomJumpData.create)
    ..hasRequiredFields = false;

  ResTopRoomJump._() : super();
  factory ResTopRoomJump({
    $core.bool? success,
    $core.String? msg,
    TopRoomJumpData? data,
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
  factory ResTopRoomJump.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResTopRoomJump.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResTopRoomJump clone() => ResTopRoomJump()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResTopRoomJump copyWith(void Function(ResTopRoomJump) updates) =>
      super.copyWith((message) => updates(message as ResTopRoomJump))
          as ResTopRoomJump; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResTopRoomJump create() => ResTopRoomJump._();
  ResTopRoomJump createEmptyInstance() => create();
  static $pb.PbList<ResTopRoomJump> createRepeated() =>
      $pb.PbList<ResTopRoomJump>();
  @$core.pragma('dart2js:noInline')
  static ResTopRoomJump getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResTopRoomJump>(create);
  static ResTopRoomJump? _defaultInstance;

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
  TopRoomJumpData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(TopRoomJumpData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  TopRoomJumpData ensureData() => $_ensure(2);
}

class TopRoomJumpData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TopRoomJumpData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inRoom')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  TopRoomJumpData._() : super();
  factory TopRoomJumpData({
    $core.bool? inRoom,
    $core.int? jumpId,
  }) {
    final _result = create();
    if (inRoom != null) {
      _result.inRoom = inRoom;
    }
    if (jumpId != null) {
      _result.jumpId = jumpId;
    }
    return _result;
  }
  factory TopRoomJumpData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TopRoomJumpData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TopRoomJumpData clone() => TopRoomJumpData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TopRoomJumpData copyWith(void Function(TopRoomJumpData) updates) =>
      super.copyWith((message) => updates(message as TopRoomJumpData))
          as TopRoomJumpData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopRoomJumpData create() => TopRoomJumpData._();
  TopRoomJumpData createEmptyInstance() => create();
  static $pb.PbList<TopRoomJumpData> createRepeated() =>
      $pb.PbList<TopRoomJumpData>();
  @$core.pragma('dart2js:noInline')
  static TopRoomJumpData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TopRoomJumpData>(create);
  static TopRoomJumpData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get inRoom => $_getBF(0);
  @$pb.TagNumber(1)
  set inRoom($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasInRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearInRoom() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get jumpId => $_getIZ(1);
  @$pb.TagNumber(2)
  set jumpId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasJumpId() => $_has(1);
  @$pb.TagNumber(2)
  void clearJumpId() => clearField(2);
}

class ActSubBarsData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ActSubBarsData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unclickedIcon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'darkColor')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'clickedIcon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lightColor')
    ..hasRequiredFields = false;

  ActSubBarsData._() : super();
  factory ActSubBarsData({
    $core.String? unclickedIcon,
    $core.String? darkColor,
    $core.String? clickedIcon,
    $core.String? lightColor,
  }) {
    final _result = create();
    if (unclickedIcon != null) {
      _result.unclickedIcon = unclickedIcon;
    }
    if (darkColor != null) {
      _result.darkColor = darkColor;
    }
    if (clickedIcon != null) {
      _result.clickedIcon = clickedIcon;
    }
    if (lightColor != null) {
      _result.lightColor = lightColor;
    }
    return _result;
  }
  factory ActSubBarsData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ActSubBarsData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ActSubBarsData clone() => ActSubBarsData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ActSubBarsData copyWith(void Function(ActSubBarsData) updates) =>
      super.copyWith((message) => updates(message as ActSubBarsData))
          as ActSubBarsData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ActSubBarsData create() => ActSubBarsData._();
  ActSubBarsData createEmptyInstance() => create();
  static $pb.PbList<ActSubBarsData> createRepeated() =>
      $pb.PbList<ActSubBarsData>();
  @$core.pragma('dart2js:noInline')
  static ActSubBarsData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActSubBarsData>(create);
  static ActSubBarsData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get unclickedIcon => $_getSZ(0);
  @$pb.TagNumber(1)
  set unclickedIcon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUnclickedIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnclickedIcon() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get darkColor => $_getSZ(1);
  @$pb.TagNumber(2)
  set darkColor($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDarkColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearDarkColor() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get clickedIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set clickedIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasClickedIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearClickedIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get lightColor => $_getSZ(3);
  @$pb.TagNumber(4)
  set lightColor($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLightColor() => $_has(3);
  @$pb.TagNumber(4)
  void clearLightColor() => clearField(4);
}

class ActMiddleBarsData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ActMiddleBarsData',
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
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'darkColor')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lightColor')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpUrl')
    ..hasRequiredFields = false;

  ActMiddleBarsData._() : super();
  factory ActMiddleBarsData({
    $core.String? icon,
    $core.String? content,
    $core.String? darkColor,
    $core.String? lightColor,
    $core.String? jumpUrl,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (content != null) {
      _result.content = content;
    }
    if (darkColor != null) {
      _result.darkColor = darkColor;
    }
    if (lightColor != null) {
      _result.lightColor = lightColor;
    }
    if (jumpUrl != null) {
      _result.jumpUrl = jumpUrl;
    }
    return _result;
  }
  factory ActMiddleBarsData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ActMiddleBarsData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ActMiddleBarsData clone() => ActMiddleBarsData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ActMiddleBarsData copyWith(void Function(ActMiddleBarsData) updates) =>
      super.copyWith((message) => updates(message as ActMiddleBarsData))
          as ActMiddleBarsData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ActMiddleBarsData create() => ActMiddleBarsData._();
  ActMiddleBarsData createEmptyInstance() => create();
  static $pb.PbList<ActMiddleBarsData> createRepeated() =>
      $pb.PbList<ActMiddleBarsData>();
  @$core.pragma('dart2js:noInline')
  static ActMiddleBarsData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActMiddleBarsData>(create);
  static ActMiddleBarsData? _defaultInstance;

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
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get darkColor => $_getSZ(2);
  @$pb.TagNumber(3)
  set darkColor($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDarkColor() => $_has(2);
  @$pb.TagNumber(3)
  void clearDarkColor() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get lightColor => $_getSZ(3);
  @$pb.TagNumber(4)
  set lightColor($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLightColor() => $_has(3);
  @$pb.TagNumber(4)
  void clearLightColor() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get jumpUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set jumpUrl($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasJumpUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearJumpUrl() => clearField(5);
}

class ActBarData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ActBarData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ActSubBarsData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subBars',
        $pb.PbFieldType.PM,
        subBuilder: ActSubBarsData.create)
    ..aOM<ActMiddleBarsData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'middleBar',
        subBuilder: ActMiddleBarsData.create)
    ..aInt64(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endTime')
    ..hasRequiredFields = false;

  ActBarData._() : super();
  factory ActBarData({
    $core.Iterable<ActSubBarsData>? subBars,
    ActMiddleBarsData? middleBar,
    $fixnum.Int64? endTime,
  }) {
    final _result = create();
    if (subBars != null) {
      _result.subBars.addAll(subBars);
    }
    if (middleBar != null) {
      _result.middleBar = middleBar;
    }
    if (endTime != null) {
      _result.endTime = endTime;
    }
    return _result;
  }
  factory ActBarData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ActBarData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ActBarData clone() => ActBarData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ActBarData copyWith(void Function(ActBarData) updates) =>
      super.copyWith((message) => updates(message as ActBarData))
          as ActBarData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ActBarData create() => ActBarData._();
  ActBarData createEmptyInstance() => create();
  static $pb.PbList<ActBarData> createRepeated() => $pb.PbList<ActBarData>();
  @$core.pragma('dart2js:noInline')
  static ActBarData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ActBarData>(create);
  static ActBarData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ActSubBarsData> get subBars => $_getList(0);

  @$pb.TagNumber(2)
  ActMiddleBarsData get middleBar => $_getN(1);
  @$pb.TagNumber(2)
  set middleBar(ActMiddleBarsData v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMiddleBar() => $_has(1);
  @$pb.TagNumber(2)
  void clearMiddleBar() => clearField(2);
  @$pb.TagNumber(2)
  ActMiddleBarsData ensureMiddleBar() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get endTime => $_getI64(2);
  @$pb.TagNumber(3)
  set endTime($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEndTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndTime() => clearField(3);
}

class AwakeFrontPageRsp_Data_Item extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AwakeFrontPageRsp.Data.Item',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
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
            : 'gid',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftName')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AwakeFrontPageRsp_Data_Item._() : super();
  factory AwakeFrontPageRsp_Data_Item({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? rid,
    $core.int? gid,
    $core.String? giftName,
    $core.int? id,
    $core.int? time,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (gid != null) {
      _result.gid = gid;
    }
    if (giftName != null) {
      _result.giftName = giftName;
    }
    if (id != null) {
      _result.id = id;
    }
    if (time != null) {
      _result.time = time;
    }
    return _result;
  }
  factory AwakeFrontPageRsp_Data_Item.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AwakeFrontPageRsp_Data_Item.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AwakeFrontPageRsp_Data_Item clone() =>
      AwakeFrontPageRsp_Data_Item()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AwakeFrontPageRsp_Data_Item copyWith(
          void Function(AwakeFrontPageRsp_Data_Item) updates) =>
      super.copyWith(
              (message) => updates(message as AwakeFrontPageRsp_Data_Item))
          as AwakeFrontPageRsp_Data_Item; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AwakeFrontPageRsp_Data_Item create() =>
      AwakeFrontPageRsp_Data_Item._();
  AwakeFrontPageRsp_Data_Item createEmptyInstance() => create();
  static $pb.PbList<AwakeFrontPageRsp_Data_Item> createRepeated() =>
      $pb.PbList<AwakeFrontPageRsp_Data_Item>();
  @$core.pragma('dart2js:noInline')
  static AwakeFrontPageRsp_Data_Item getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AwakeFrontPageRsp_Data_Item>(create);
  static AwakeFrontPageRsp_Data_Item? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

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
  $core.int get gid => $_getIZ(4);
  @$pb.TagNumber(5)
  set gid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGid() => $_has(4);
  @$pb.TagNumber(5)
  void clearGid() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get giftName => $_getSZ(5);
  @$pb.TagNumber(6)
  set giftName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGiftName() => $_has(5);
  @$pb.TagNumber(6)
  void clearGiftName() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get id => $_getIZ(6);
  @$pb.TagNumber(7)
  set id($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasId() => $_has(6);
  @$pb.TagNumber(7)
  void clearId() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get time => $_getIZ(7);
  @$pb.TagNumber(8)
  set time($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearTime() => clearField(8);
}

class AwakeFrontPageRsp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AwakeFrontPageRsp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<AwakeFrontPageRsp_Data_Item>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: AwakeFrontPageRsp_Data_Item.create)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasMore')
    ..hasRequiredFields = false;

  AwakeFrontPageRsp_Data._() : super();
  factory AwakeFrontPageRsp_Data({
    $core.Iterable<AwakeFrontPageRsp_Data_Item>? list,
    $core.bool? hasMore,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    return _result;
  }
  factory AwakeFrontPageRsp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AwakeFrontPageRsp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AwakeFrontPageRsp_Data clone() =>
      AwakeFrontPageRsp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AwakeFrontPageRsp_Data copyWith(
          void Function(AwakeFrontPageRsp_Data) updates) =>
      super.copyWith((message) => updates(message as AwakeFrontPageRsp_Data))
          as AwakeFrontPageRsp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AwakeFrontPageRsp_Data create() => AwakeFrontPageRsp_Data._();
  AwakeFrontPageRsp_Data createEmptyInstance() => create();
  static $pb.PbList<AwakeFrontPageRsp_Data> createRepeated() =>
      $pb.PbList<AwakeFrontPageRsp_Data>();
  @$core.pragma('dart2js:noInline')
  static AwakeFrontPageRsp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AwakeFrontPageRsp_Data>(create);
  static AwakeFrontPageRsp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AwakeFrontPageRsp_Data_Item> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get hasMore => $_getBF(1);
  @$pb.TagNumber(2)
  set hasMore($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHasMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearHasMore() => clearField(2);
}

class AwakeFrontPageRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AwakeFrontPageRsp',
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
    ..aOM<AwakeFrontPageRsp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AwakeFrontPageRsp_Data.create)
    ..hasRequiredFields = false;

  AwakeFrontPageRsp._() : super();
  factory AwakeFrontPageRsp({
    $core.bool? success,
    $core.String? msg,
    AwakeFrontPageRsp_Data? data,
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
  factory AwakeFrontPageRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AwakeFrontPageRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AwakeFrontPageRsp clone() => AwakeFrontPageRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AwakeFrontPageRsp copyWith(void Function(AwakeFrontPageRsp) updates) =>
      super.copyWith((message) => updates(message as AwakeFrontPageRsp))
          as AwakeFrontPageRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AwakeFrontPageRsp create() => AwakeFrontPageRsp._();
  AwakeFrontPageRsp createEmptyInstance() => create();
  static $pb.PbList<AwakeFrontPageRsp> createRepeated() =>
      $pb.PbList<AwakeFrontPageRsp>();
  @$core.pragma('dart2js:noInline')
  static AwakeFrontPageRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AwakeFrontPageRsp>(create);
  static AwakeFrontPageRsp? _defaultInstance;

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
  AwakeFrontPageRsp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AwakeFrontPageRsp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AwakeFrontPageRsp_Data ensureData() => $_ensure(2);
}
