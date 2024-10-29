///
//  Generated code. Do not modify.
//  source: mount.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MountDebrisItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MountDebrisItem',
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
            : 'img')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'exchangeNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ownNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MountDebrisItem._() : super();
  factory MountDebrisItem({
    $core.int? id,
    $core.String? name,
    $core.String? img,
    $core.int? exchangeNum,
    $core.int? ownNum,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (img != null) {
      _result.img = img;
    }
    if (exchangeNum != null) {
      _result.exchangeNum = exchangeNum;
    }
    if (ownNum != null) {
      _result.ownNum = ownNum;
    }
    return _result;
  }
  factory MountDebrisItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MountDebrisItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MountDebrisItem clone() => MountDebrisItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MountDebrisItem copyWith(void Function(MountDebrisItem) updates) =>
      super.copyWith((message) => updates(message as MountDebrisItem))
          as MountDebrisItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MountDebrisItem create() => MountDebrisItem._();
  MountDebrisItem createEmptyInstance() => create();
  static $pb.PbList<MountDebrisItem> createRepeated() =>
      $pb.PbList<MountDebrisItem>();
  @$core.pragma('dart2js:noInline')
  static MountDebrisItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MountDebrisItem>(create);
  static MountDebrisItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setUnsignedInt32(0, v);
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
  $core.String get img => $_getSZ(2);
  @$pb.TagNumber(3)
  set img($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImg() => $_has(2);
  @$pb.TagNumber(3)
  void clearImg() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get exchangeNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set exchangeNum($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasExchangeNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearExchangeNum() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get ownNum => $_getIZ(4);
  @$pb.TagNumber(5)
  set ownNum($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOwnNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearOwnNum() => clearField(5);
}

class MountMainPageItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MountMainPageItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unlock')
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inUse')
    ..aOM<MountDebrisItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'debrisItem',
        subBuilder: MountDebrisItem.create)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'myUnlock')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'myDebrisNum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MountMainPageItem._() : super();
  factory MountMainPageItem({
    $core.int? cid,
    $core.bool? unlock,
    $core.bool? inUse,
    MountDebrisItem? debrisItem,
    $core.bool? myUnlock,
    $core.int? myDebrisNum,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (unlock != null) {
      _result.unlock = unlock;
    }
    if (inUse != null) {
      _result.inUse = inUse;
    }
    if (debrisItem != null) {
      _result.debrisItem = debrisItem;
    }
    if (myUnlock != null) {
      _result.myUnlock = myUnlock;
    }
    if (myDebrisNum != null) {
      _result.myDebrisNum = myDebrisNum;
    }
    return _result;
  }
  factory MountMainPageItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MountMainPageItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MountMainPageItem clone() => MountMainPageItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MountMainPageItem copyWith(void Function(MountMainPageItem) updates) =>
      super.copyWith((message) => updates(message as MountMainPageItem))
          as MountMainPageItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MountMainPageItem create() => MountMainPageItem._();
  MountMainPageItem createEmptyInstance() => create();
  static $pb.PbList<MountMainPageItem> createRepeated() =>
      $pb.PbList<MountMainPageItem>();
  @$core.pragma('dart2js:noInline')
  static MountMainPageItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MountMainPageItem>(create);
  static MountMainPageItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cid => $_getIZ(0);
  @$pb.TagNumber(1)
  set cid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get unlock => $_getBF(1);
  @$pb.TagNumber(2)
  set unlock($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUnlock() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnlock() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get inUse => $_getBF(2);
  @$pb.TagNumber(3)
  set inUse($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasInUse() => $_has(2);
  @$pb.TagNumber(3)
  void clearInUse() => clearField(3);

  @$pb.TagNumber(4)
  MountDebrisItem get debrisItem => $_getN(3);
  @$pb.TagNumber(4)
  set debrisItem(MountDebrisItem v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDebrisItem() => $_has(3);
  @$pb.TagNumber(4)
  void clearDebrisItem() => clearField(4);
  @$pb.TagNumber(4)
  MountDebrisItem ensureDebrisItem() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.bool get myUnlock => $_getBF(4);
  @$pb.TagNumber(5)
  set myUnlock($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasMyUnlock() => $_has(4);
  @$pb.TagNumber(5)
  void clearMyUnlock() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get myDebrisNum => $_getIZ(5);
  @$pb.TagNumber(6)
  set myDebrisNum($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMyDebrisNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearMyDebrisNum() => clearField(6);
}

class MountMainPage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MountMainPage',
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
    ..pc<MountMainPageItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'items',
        $pb.PbFieldType.PM,
        subBuilder: MountMainPageItem.create)
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inDuration')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endTime')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serialId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MountMainPage._() : super();
  factory MountMainPage({
    $core.String? title,
    $core.Iterable<MountMainPageItem>? items,
    $core.bool? inDuration,
    $core.String? endTime,
    $core.int? serialId,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (items != null) {
      _result.items.addAll(items);
    }
    if (inDuration != null) {
      _result.inDuration = inDuration;
    }
    if (endTime != null) {
      _result.endTime = endTime;
    }
    if (serialId != null) {
      _result.serialId = serialId;
    }
    return _result;
  }
  factory MountMainPage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MountMainPage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MountMainPage clone() => MountMainPage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MountMainPage copyWith(void Function(MountMainPage) updates) =>
      super.copyWith((message) => updates(message as MountMainPage))
          as MountMainPage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MountMainPage create() => MountMainPage._();
  MountMainPage createEmptyInstance() => create();
  static $pb.PbList<MountMainPage> createRepeated() =>
      $pb.PbList<MountMainPage>();
  @$core.pragma('dart2js:noInline')
  static MountMainPage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MountMainPage>(create);
  static MountMainPage? _defaultInstance;

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
  $core.List<MountMainPageItem> get items => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get inDuration => $_getBF(2);
  @$pb.TagNumber(3)
  set inDuration($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasInDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearInDuration() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get endTime => $_getSZ(3);
  @$pb.TagNumber(4)
  set endTime($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasEndTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get serialId => $_getIZ(4);
  @$pb.TagNumber(5)
  set serialId($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSerialId() => $_has(4);
  @$pb.TagNumber(5)
  void clearSerialId() => clearField(5);
}

class ResMountMainPage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMountMainPage',
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
    ..aOM<MountMain>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: MountMain.create)
    ..hasRequiredFields = false;

  ResMountMainPage._() : super();
  factory ResMountMainPage({
    $core.bool? success,
    $core.String? msg,
    MountMain? data,
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
  factory ResMountMainPage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMountMainPage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMountMainPage clone() => ResMountMainPage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMountMainPage copyWith(void Function(ResMountMainPage) updates) =>
      super.copyWith((message) => updates(message as ResMountMainPage))
          as ResMountMainPage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMountMainPage create() => ResMountMainPage._();
  ResMountMainPage createEmptyInstance() => create();
  static $pb.PbList<ResMountMainPage> createRepeated() =>
      $pb.PbList<ResMountMainPage>();
  @$core.pragma('dart2js:noInline')
  static ResMountMainPage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMountMainPage>(create);
  static ResMountMainPage? _defaultInstance;

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
  MountMain get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(MountMain v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  MountMain ensureData() => $_ensure(2);
}

class MountMain extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MountMain',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<MountDebrisBagTab>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabList',
        $pb.PbFieldType.PM,
        subBuilder: MountDebrisBagTab.create)
    ..aOM<MountMainPage>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'detail',
        subBuilder: MountMainPage.create)
    ..hasRequiredFields = false;

  MountMain._() : super();
  factory MountMain({
    $core.Iterable<MountDebrisBagTab>? tabList,
    MountMainPage? detail,
  }) {
    final _result = create();
    if (tabList != null) {
      _result.tabList.addAll(tabList);
    }
    if (detail != null) {
      _result.detail = detail;
    }
    return _result;
  }
  factory MountMain.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MountMain.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MountMain clone() => MountMain()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MountMain copyWith(void Function(MountMain) updates) =>
      super.copyWith((message) => updates(message as MountMain))
          as MountMain; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MountMain create() => MountMain._();
  MountMain createEmptyInstance() => create();
  static $pb.PbList<MountMain> createRepeated() => $pb.PbList<MountMain>();
  @$core.pragma('dart2js:noInline')
  static MountMain getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MountMain>(create);
  static MountMain? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MountDebrisBagTab> get tabList => $_getList(0);

  @$pb.TagNumber(2)
  MountMainPage get detail => $_getN(1);
  @$pb.TagNumber(2)
  set detail(MountMainPage v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDetail() => $_has(1);
  @$pb.TagNumber(2)
  void clearDetail() => clearField(2);
  @$pb.TagNumber(2)
  MountMainPage ensureDetail() => $_ensure(1);
}

class ResMountDebrisBag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMountDebrisBag',
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
    ..aOM<MountDebrisBag>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: MountDebrisBag.create)
    ..hasRequiredFields = false;

  ResMountDebrisBag._() : super();
  factory ResMountDebrisBag({
    $core.bool? success,
    $core.String? msg,
    MountDebrisBag? data,
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
  factory ResMountDebrisBag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMountDebrisBag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMountDebrisBag clone() => ResMountDebrisBag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMountDebrisBag copyWith(void Function(ResMountDebrisBag) updates) =>
      super.copyWith((message) => updates(message as ResMountDebrisBag))
          as ResMountDebrisBag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMountDebrisBag create() => ResMountDebrisBag._();
  ResMountDebrisBag createEmptyInstance() => create();
  static $pb.PbList<ResMountDebrisBag> createRepeated() =>
      $pb.PbList<ResMountDebrisBag>();
  @$core.pragma('dart2js:noInline')
  static ResMountDebrisBag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMountDebrisBag>(create);
  static ResMountDebrisBag? _defaultInstance;

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
  MountDebrisBag get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(MountDebrisBag v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  MountDebrisBag ensureData() => $_ensure(2);
}

class MountDebrisBag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MountDebrisBag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<MountDebrisBagTab>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabList',
        $pb.PbFieldType.PM,
        subBuilder: MountDebrisBagTab.create)
    ..pc<MountDebrisBagItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'debrisList',
        $pb.PbFieldType.PM,
        subBuilder: MountDebrisBagItem.create)
    ..hasRequiredFields = false;

  MountDebrisBag._() : super();
  factory MountDebrisBag({
    $core.Iterable<MountDebrisBagTab>? tabList,
    $core.Iterable<MountDebrisBagItem>? debrisList,
  }) {
    final _result = create();
    if (tabList != null) {
      _result.tabList.addAll(tabList);
    }
    if (debrisList != null) {
      _result.debrisList.addAll(debrisList);
    }
    return _result;
  }
  factory MountDebrisBag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MountDebrisBag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MountDebrisBag clone() => MountDebrisBag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MountDebrisBag copyWith(void Function(MountDebrisBag) updates) =>
      super.copyWith((message) => updates(message as MountDebrisBag))
          as MountDebrisBag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MountDebrisBag create() => MountDebrisBag._();
  MountDebrisBag createEmptyInstance() => create();
  static $pb.PbList<MountDebrisBag> createRepeated() =>
      $pb.PbList<MountDebrisBag>();
  @$core.pragma('dart2js:noInline')
  static MountDebrisBag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MountDebrisBag>(create);
  static MountDebrisBag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MountDebrisBagTab> get tabList => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<MountDebrisBagItem> get debrisList => $_getList(1);
}

class MountDebrisBagTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MountDebrisBagTab',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serialId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  MountDebrisBagTab._() : super();
  factory MountDebrisBagTab({
    $core.int? serialId,
    $core.String? name,
  }) {
    final _result = create();
    if (serialId != null) {
      _result.serialId = serialId;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory MountDebrisBagTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MountDebrisBagTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MountDebrisBagTab clone() => MountDebrisBagTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MountDebrisBagTab copyWith(void Function(MountDebrisBagTab) updates) =>
      super.copyWith((message) => updates(message as MountDebrisBagTab))
          as MountDebrisBagTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MountDebrisBagTab create() => MountDebrisBagTab._();
  MountDebrisBagTab createEmptyInstance() => create();
  static $pb.PbList<MountDebrisBagTab> createRepeated() =>
      $pb.PbList<MountDebrisBagTab>();
  @$core.pragma('dart2js:noInline')
  static MountDebrisBagTab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MountDebrisBagTab>(create);
  static MountDebrisBagTab? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get serialId => $_getIZ(0);
  @$pb.TagNumber(1)
  set serialId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSerialId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSerialId() => clearField(1);

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
}

class MountDebrisBagItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MountDebrisBagItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'img')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mountName')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'exchangeNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'exchangeMountNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mountImg')
    ..hasRequiredFields = false;

  MountDebrisBagItem._() : super();
  factory MountDebrisBagItem({
    $core.int? cid,
    $core.String? img,
    $core.int? num,
    $core.String? name,
    $core.int? id,
    $core.String? mountName,
    $core.int? exchangeNum,
    $core.int? exchangeMountNum,
    $core.String? mountImg,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (img != null) {
      _result.img = img;
    }
    if (num != null) {
      _result.num = num;
    }
    if (name != null) {
      _result.name = name;
    }
    if (id != null) {
      _result.id = id;
    }
    if (mountName != null) {
      _result.mountName = mountName;
    }
    if (exchangeNum != null) {
      _result.exchangeNum = exchangeNum;
    }
    if (exchangeMountNum != null) {
      _result.exchangeMountNum = exchangeMountNum;
    }
    if (mountImg != null) {
      _result.mountImg = mountImg;
    }
    return _result;
  }
  factory MountDebrisBagItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MountDebrisBagItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MountDebrisBagItem clone() => MountDebrisBagItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MountDebrisBagItem copyWith(void Function(MountDebrisBagItem) updates) =>
      super.copyWith((message) => updates(message as MountDebrisBagItem))
          as MountDebrisBagItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MountDebrisBagItem create() => MountDebrisBagItem._();
  MountDebrisBagItem createEmptyInstance() => create();
  static $pb.PbList<MountDebrisBagItem> createRepeated() =>
      $pb.PbList<MountDebrisBagItem>();
  @$core.pragma('dart2js:noInline')
  static MountDebrisBagItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MountDebrisBagItem>(create);
  static MountDebrisBagItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cid => $_getIZ(0);
  @$pb.TagNumber(1)
  set cid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get img => $_getSZ(1);
  @$pb.TagNumber(2)
  set img($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasImg() => $_has(1);
  @$pb.TagNumber(2)
  void clearImg() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get num => $_getIZ(2);
  @$pb.TagNumber(3)
  set num($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearNum() => clearField(3);

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
  $core.int get id => $_getIZ(4);
  @$pb.TagNumber(5)
  set id($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasId() => $_has(4);
  @$pb.TagNumber(5)
  void clearId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get mountName => $_getSZ(5);
  @$pb.TagNumber(6)
  set mountName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMountName() => $_has(5);
  @$pb.TagNumber(6)
  void clearMountName() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get exchangeNum => $_getIZ(6);
  @$pb.TagNumber(7)
  set exchangeNum($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasExchangeNum() => $_has(6);
  @$pb.TagNumber(7)
  void clearExchangeNum() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get exchangeMountNum => $_getIZ(7);
  @$pb.TagNumber(8)
  set exchangeMountNum($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasExchangeMountNum() => $_has(7);
  @$pb.TagNumber(8)
  void clearExchangeMountNum() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get mountImg => $_getSZ(8);
  @$pb.TagNumber(9)
  set mountImg($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasMountImg() => $_has(8);
  @$pb.TagNumber(9)
  void clearMountImg() => clearField(9);
}

class ResMountExchange extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMountExchange',
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
    ..hasRequiredFields = false;

  ResMountExchange._() : super();
  factory ResMountExchange({
    $core.bool? success,
    $core.String? msg,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory ResMountExchange.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMountExchange.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMountExchange clone() => ResMountExchange()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMountExchange copyWith(void Function(ResMountExchange) updates) =>
      super.copyWith((message) => updates(message as ResMountExchange))
          as ResMountExchange; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMountExchange create() => ResMountExchange._();
  ResMountExchange createEmptyInstance() => create();
  static $pb.PbList<ResMountExchange> createRepeated() =>
      $pb.PbList<ResMountExchange>();
  @$core.pragma('dart2js:noInline')
  static ResMountExchange getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMountExchange>(create);
  static ResMountExchange? _defaultInstance;

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
}

class ResMountSerialTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMountSerialTab',
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
    ..pc<MountDebrisBagTab>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: MountDebrisBagTab.create)
    ..hasRequiredFields = false;

  ResMountSerialTab._() : super();
  factory ResMountSerialTab({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<MountDebrisBagTab>? data,
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
  factory ResMountSerialTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMountSerialTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMountSerialTab clone() => ResMountSerialTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMountSerialTab copyWith(void Function(ResMountSerialTab) updates) =>
      super.copyWith((message) => updates(message as ResMountSerialTab))
          as ResMountSerialTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMountSerialTab create() => ResMountSerialTab._();
  ResMountSerialTab createEmptyInstance() => create();
  static $pb.PbList<ResMountSerialTab> createRepeated() =>
      $pb.PbList<ResMountSerialTab>();
  @$core.pragma('dart2js:noInline')
  static ResMountSerialTab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMountSerialTab>(create);
  static ResMountSerialTab? _defaultInstance;

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
  $core.List<MountDebrisBagTab> get data => $_getList(2);
}

class ResMountSerialRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMountSerialRank',
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
    ..aOM<MountSerialRank>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: MountSerialRank.create)
    ..hasRequiredFields = false;

  ResMountSerialRank._() : super();
  factory ResMountSerialRank({
    $core.bool? success,
    $core.String? msg,
    MountSerialRank? data,
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
  factory ResMountSerialRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMountSerialRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMountSerialRank clone() => ResMountSerialRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMountSerialRank copyWith(void Function(ResMountSerialRank) updates) =>
      super.copyWith((message) => updates(message as ResMountSerialRank))
          as ResMountSerialRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMountSerialRank create() => ResMountSerialRank._();
  ResMountSerialRank createEmptyInstance() => create();
  static $pb.PbList<ResMountSerialRank> createRepeated() =>
      $pb.PbList<ResMountSerialRank>();
  @$core.pragma('dart2js:noInline')
  static ResMountSerialRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMountSerialRank>(create);
  static ResMountSerialRank? _defaultInstance;

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
  MountSerialRank get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(MountSerialRank v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  MountSerialRank ensureData() => $_ensure(2);
}

class MountSerialRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MountSerialRank',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<MountSerialRankItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'me',
        subBuilder: MountSerialRankItem.create)
    ..pc<MountSerialRankItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: MountSerialRankItem.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'advancedDebrisName')
    ..hasRequiredFields = false;

  MountSerialRank._() : super();
  factory MountSerialRank({
    MountSerialRankItem? me,
    $core.Iterable<MountSerialRankItem>? list,
    $core.String? advancedDebrisName,
  }) {
    final _result = create();
    if (me != null) {
      _result.me = me;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (advancedDebrisName != null) {
      _result.advancedDebrisName = advancedDebrisName;
    }
    return _result;
  }
  factory MountSerialRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MountSerialRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MountSerialRank clone() => MountSerialRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MountSerialRank copyWith(void Function(MountSerialRank) updates) =>
      super.copyWith((message) => updates(message as MountSerialRank))
          as MountSerialRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MountSerialRank create() => MountSerialRank._();
  MountSerialRank createEmptyInstance() => create();
  static $pb.PbList<MountSerialRank> createRepeated() =>
      $pb.PbList<MountSerialRank>();
  @$core.pragma('dart2js:noInline')
  static MountSerialRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MountSerialRank>(create);
  static MountSerialRank? _defaultInstance;

  @$pb.TagNumber(1)
  MountSerialRankItem get me => $_getN(0);
  @$pb.TagNumber(1)
  set me(MountSerialRankItem v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMe() => $_has(0);
  @$pb.TagNumber(1)
  void clearMe() => clearField(1);
  @$pb.TagNumber(1)
  MountSerialRankItem ensureMe() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<MountSerialRankItem> get list => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get advancedDebrisName => $_getSZ(2);
  @$pb.TagNumber(3)
  set advancedDebrisName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAdvancedDebrisName() => $_has(2);
  @$pb.TagNumber(3)
  void clearAdvancedDebrisName() => clearField(3);
}

class MountSerialRankItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MountSerialRankItem',
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
            : 'mountNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'debrisNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'otherNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MountSerialRankItem._() : super();
  factory MountSerialRankItem({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? mountNum,
    $core.int? debrisNum,
    $core.int? otherNum,
    $core.int? rank,
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
    if (mountNum != null) {
      _result.mountNum = mountNum;
    }
    if (debrisNum != null) {
      _result.debrisNum = debrisNum;
    }
    if (otherNum != null) {
      _result.otherNum = otherNum;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    return _result;
  }
  factory MountSerialRankItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MountSerialRankItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MountSerialRankItem clone() => MountSerialRankItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MountSerialRankItem copyWith(void Function(MountSerialRankItem) updates) =>
      super.copyWith((message) => updates(message as MountSerialRankItem))
          as MountSerialRankItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MountSerialRankItem create() => MountSerialRankItem._();
  MountSerialRankItem createEmptyInstance() => create();
  static $pb.PbList<MountSerialRankItem> createRepeated() =>
      $pb.PbList<MountSerialRankItem>();
  @$core.pragma('dart2js:noInline')
  static MountSerialRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MountSerialRankItem>(create);
  static MountSerialRankItem? _defaultInstance;

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
  $core.int get mountNum => $_getIZ(3);
  @$pb.TagNumber(4)
  set mountNum($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMountNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearMountNum() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get debrisNum => $_getIZ(4);
  @$pb.TagNumber(5)
  set debrisNum($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDebrisNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearDebrisNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get otherNum => $_getIZ(5);
  @$pb.TagNumber(6)
  set otherNum($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasOtherNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearOtherNum() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get rank => $_getIZ(6);
  @$pb.TagNumber(7)
  set rank($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRank() => $_has(6);
  @$pb.TagNumber(7)
  void clearRank() => clearField(7);
}

class ResMountSerialJumpRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMountSerialJumpRoom',
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
    ..aOM<MountSerialJumpRoom>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: MountSerialJumpRoom.create)
    ..hasRequiredFields = false;

  ResMountSerialJumpRoom._() : super();
  factory ResMountSerialJumpRoom({
    $core.bool? success,
    $core.String? msg,
    MountSerialJumpRoom? data,
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
  factory ResMountSerialJumpRoom.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMountSerialJumpRoom.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMountSerialJumpRoom clone() =>
      ResMountSerialJumpRoom()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMountSerialJumpRoom copyWith(
          void Function(ResMountSerialJumpRoom) updates) =>
      super.copyWith((message) => updates(message as ResMountSerialJumpRoom))
          as ResMountSerialJumpRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMountSerialJumpRoom create() => ResMountSerialJumpRoom._();
  ResMountSerialJumpRoom createEmptyInstance() => create();
  static $pb.PbList<ResMountSerialJumpRoom> createRepeated() =>
      $pb.PbList<ResMountSerialJumpRoom>();
  @$core.pragma('dart2js:noInline')
  static ResMountSerialJumpRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMountSerialJumpRoom>(create);
  static ResMountSerialJumpRoom? _defaultInstance;

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
  MountSerialJumpRoom get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(MountSerialJumpRoom v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  MountSerialJumpRoom ensureData() => $_ensure(2);
}

class MountSerialJumpRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MountSerialJumpRoom',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpUrl')
    ..hasRequiredFields = false;

  MountSerialJumpRoom._() : super();
  factory MountSerialJumpRoom({
    $core.String? jumpUrl,
  }) {
    final _result = create();
    if (jumpUrl != null) {
      _result.jumpUrl = jumpUrl;
    }
    return _result;
  }
  factory MountSerialJumpRoom.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MountSerialJumpRoom.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MountSerialJumpRoom clone() => MountSerialJumpRoom()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MountSerialJumpRoom copyWith(void Function(MountSerialJumpRoom) updates) =>
      super.copyWith((message) => updates(message as MountSerialJumpRoom))
          as MountSerialJumpRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MountSerialJumpRoom create() => MountSerialJumpRoom._();
  MountSerialJumpRoom createEmptyInstance() => create();
  static $pb.PbList<MountSerialJumpRoom> createRepeated() =>
      $pb.PbList<MountSerialJumpRoom>();
  @$core.pragma('dart2js:noInline')
  static MountSerialJumpRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MountSerialJumpRoom>(create);
  static MountSerialJumpRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get jumpUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set jumpUrl($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasJumpUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearJumpUrl() => clearField(1);
}
