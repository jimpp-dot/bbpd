///
//  Generated code. Do not modify.
//  source: ka_touch.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResKaTouchList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResKaTouchList',
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
    ..aOM<KaTouchListData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: KaTouchListData.create)
    ..hasRequiredFields = false;

  ResKaTouchList._() : super();
  factory ResKaTouchList({
    $core.bool? success,
    $core.String? msg,
    KaTouchListData? data,
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
  factory ResKaTouchList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResKaTouchList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResKaTouchList clone() => ResKaTouchList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResKaTouchList copyWith(void Function(ResKaTouchList) updates) =>
      super.copyWith((message) => updates(message as ResKaTouchList))
          as ResKaTouchList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResKaTouchList create() => ResKaTouchList._();
  ResKaTouchList createEmptyInstance() => create();
  static $pb.PbList<ResKaTouchList> createRepeated() =>
      $pb.PbList<ResKaTouchList>();
  @$core.pragma('dart2js:noInline')
  static ResKaTouchList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResKaTouchList>(create);
  static ResKaTouchList? _defaultInstance;

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
  KaTouchListData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(KaTouchListData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  KaTouchListData ensureData() => $_ensure(2);
}

class KaTouchListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KaTouchListData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<KaTouchTab>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tabList',
        $pb.PbFieldType.PM,
        subBuilder: KaTouchTab.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentTab',
        $pb.PbFieldType.OU3)
    ..pc<KaTouchPoolUser>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: KaTouchPoolUser.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'emptyText')
    ..hasRequiredFields = false;

  KaTouchListData._() : super();
  factory KaTouchListData({
    $core.Iterable<KaTouchTab>? tabList,
    $core.int? currentTab,
    $core.Iterable<KaTouchPoolUser>? list,
    $core.String? emptyText,
  }) {
    final _result = create();
    if (tabList != null) {
      _result.tabList.addAll(tabList);
    }
    if (currentTab != null) {
      _result.currentTab = currentTab;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (emptyText != null) {
      _result.emptyText = emptyText;
    }
    return _result;
  }
  factory KaTouchListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KaTouchListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KaTouchListData clone() => KaTouchListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KaTouchListData copyWith(void Function(KaTouchListData) updates) =>
      super.copyWith((message) => updates(message as KaTouchListData))
          as KaTouchListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KaTouchListData create() => KaTouchListData._();
  KaTouchListData createEmptyInstance() => create();
  static $pb.PbList<KaTouchListData> createRepeated() =>
      $pb.PbList<KaTouchListData>();
  @$core.pragma('dart2js:noInline')
  static KaTouchListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KaTouchListData>(create);
  static KaTouchListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<KaTouchTab> get tabList => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get currentTab => $_getIZ(1);
  @$pb.TagNumber(2)
  set currentTab($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCurrentTab() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentTab() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<KaTouchPoolUser> get list => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get emptyText => $_getSZ(3);
  @$pb.TagNumber(4)
  set emptyText($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasEmptyText() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmptyText() => clearField(4);
}

class KaTouchTab extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KaTouchTab',
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
    ..hasRequiredFields = false;

  KaTouchTab._() : super();
  factory KaTouchTab({
    $core.int? id,
    $core.String? name,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory KaTouchTab.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KaTouchTab.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KaTouchTab clone() => KaTouchTab()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KaTouchTab copyWith(void Function(KaTouchTab) updates) =>
      super.copyWith((message) => updates(message as KaTouchTab))
          as KaTouchTab; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KaTouchTab create() => KaTouchTab._();
  KaTouchTab createEmptyInstance() => create();
  static $pb.PbList<KaTouchTab> createRepeated() => $pb.PbList<KaTouchTab>();
  @$core.pragma('dart2js:noInline')
  static KaTouchTab getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KaTouchTab>(create);
  static KaTouchTab? _defaultInstance;

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
}

class KaTouchPoolUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KaTouchPoolUser',
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
            : 'avatar')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineStatus',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasReplied',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poolId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'contentId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  KaTouchPoolUser._() : super();
  factory KaTouchPoolUser({
    $core.int? uid,
    $core.String? name,
    $core.String? avatar,
    $core.int? sex,
    $core.int? onlineStatus,
    $core.int? hasReplied,
    $core.int? poolId,
    $core.int? contentId,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (avatar != null) {
      _result.avatar = avatar;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (hasReplied != null) {
      _result.hasReplied = hasReplied;
    }
    if (poolId != null) {
      _result.poolId = poolId;
    }
    if (contentId != null) {
      _result.contentId = contentId;
    }
    return _result;
  }
  factory KaTouchPoolUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KaTouchPoolUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KaTouchPoolUser clone() => KaTouchPoolUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KaTouchPoolUser copyWith(void Function(KaTouchPoolUser) updates) =>
      super.copyWith((message) => updates(message as KaTouchPoolUser))
          as KaTouchPoolUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KaTouchPoolUser create() => KaTouchPoolUser._();
  KaTouchPoolUser createEmptyInstance() => create();
  static $pb.PbList<KaTouchPoolUser> createRepeated() =>
      $pb.PbList<KaTouchPoolUser>();
  @$core.pragma('dart2js:noInline')
  static KaTouchPoolUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KaTouchPoolUser>(create);
  static KaTouchPoolUser? _defaultInstance;

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
  $core.String get avatar => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatar($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAvatar() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatar() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get sex => $_getIZ(3);
  @$pb.TagNumber(4)
  set sex($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get onlineStatus => $_getIZ(4);
  @$pb.TagNumber(5)
  set onlineStatus($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOnlineStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnlineStatus() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get hasReplied => $_getIZ(5);
  @$pb.TagNumber(6)
  set hasReplied($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasHasReplied() => $_has(5);
  @$pb.TagNumber(6)
  void clearHasReplied() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get poolId => $_getIZ(6);
  @$pb.TagNumber(7)
  set poolId($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPoolId() => $_has(6);
  @$pb.TagNumber(7)
  void clearPoolId() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get contentId => $_getIZ(7);
  @$pb.TagNumber(8)
  set contentId($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasContentId() => $_has(7);
  @$pb.TagNumber(8)
  void clearContentId() => clearField(8);
}

class ResKaTouchStatHistory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResKaTouchStatHistory',
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
    ..aOM<KaTouchStatHistoryData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: KaTouchStatHistoryData.create)
    ..hasRequiredFields = false;

  ResKaTouchStatHistory._() : super();
  factory ResKaTouchStatHistory({
    $core.bool? success,
    $core.String? msg,
    KaTouchStatHistoryData? data,
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
  factory ResKaTouchStatHistory.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResKaTouchStatHistory.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResKaTouchStatHistory clone() =>
      ResKaTouchStatHistory()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResKaTouchStatHistory copyWith(
          void Function(ResKaTouchStatHistory) updates) =>
      super.copyWith((message) => updates(message as ResKaTouchStatHistory))
          as ResKaTouchStatHistory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResKaTouchStatHistory create() => ResKaTouchStatHistory._();
  ResKaTouchStatHistory createEmptyInstance() => create();
  static $pb.PbList<ResKaTouchStatHistory> createRepeated() =>
      $pb.PbList<ResKaTouchStatHistory>();
  @$core.pragma('dart2js:noInline')
  static ResKaTouchStatHistory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResKaTouchStatHistory>(create);
  static ResKaTouchStatHistory? _defaultInstance;

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
  KaTouchStatHistoryData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(KaTouchStatHistoryData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  KaTouchStatHistoryData ensureData() => $_ensure(2);
}

class KaTouchStatHistoryData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KaTouchStatHistoryData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<KaTouchStatModule>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: KaTouchStatModule.create)
    ..hasRequiredFields = false;

  KaTouchStatHistoryData._() : super();
  factory KaTouchStatHistoryData({
    $core.Iterable<KaTouchStatModule>? list,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    return _result;
  }
  factory KaTouchStatHistoryData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KaTouchStatHistoryData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KaTouchStatHistoryData clone() =>
      KaTouchStatHistoryData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KaTouchStatHistoryData copyWith(
          void Function(KaTouchStatHistoryData) updates) =>
      super.copyWith((message) => updates(message as KaTouchStatHistoryData))
          as KaTouchStatHistoryData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KaTouchStatHistoryData create() => KaTouchStatHistoryData._();
  KaTouchStatHistoryData createEmptyInstance() => create();
  static $pb.PbList<KaTouchStatHistoryData> createRepeated() =>
      $pb.PbList<KaTouchStatHistoryData>();
  @$core.pragma('dart2js:noInline')
  static KaTouchStatHistoryData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KaTouchStatHistoryData>(create);
  static KaTouchStatHistoryData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<KaTouchStatModule> get list => $_getList(0);
}

class KaTouchStatModule extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KaTouchStatModule',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'idx',
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
            : 'sendCount')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'replyPercent')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'replyCount')
    ..hasRequiredFields = false;

  KaTouchStatModule._() : super();
  factory KaTouchStatModule({
    $core.int? idx,
    $core.String? name,
    $core.String? sendCount,
    $core.String? replyPercent,
    $core.String? replyCount,
  }) {
    final _result = create();
    if (idx != null) {
      _result.idx = idx;
    }
    if (name != null) {
      _result.name = name;
    }
    if (sendCount != null) {
      _result.sendCount = sendCount;
    }
    if (replyPercent != null) {
      _result.replyPercent = replyPercent;
    }
    if (replyCount != null) {
      _result.replyCount = replyCount;
    }
    return _result;
  }
  factory KaTouchStatModule.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KaTouchStatModule.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KaTouchStatModule clone() => KaTouchStatModule()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KaTouchStatModule copyWith(void Function(KaTouchStatModule) updates) =>
      super.copyWith((message) => updates(message as KaTouchStatModule))
          as KaTouchStatModule; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KaTouchStatModule create() => KaTouchStatModule._();
  KaTouchStatModule createEmptyInstance() => create();
  static $pb.PbList<KaTouchStatModule> createRepeated() =>
      $pb.PbList<KaTouchStatModule>();
  @$core.pragma('dart2js:noInline')
  static KaTouchStatModule getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KaTouchStatModule>(create);
  static KaTouchStatModule? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get idx => $_getIZ(0);
  @$pb.TagNumber(1)
  set idx($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIdx() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdx() => clearField(1);

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
  $core.String get sendCount => $_getSZ(2);
  @$pb.TagNumber(3)
  set sendCount($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSendCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearSendCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get replyPercent => $_getSZ(3);
  @$pb.TagNumber(4)
  set replyPercent($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasReplyPercent() => $_has(3);
  @$pb.TagNumber(4)
  void clearReplyPercent() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get replyCount => $_getSZ(4);
  @$pb.TagNumber(5)
  set replyCount($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasReplyCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearReplyCount() => clearField(5);
}

class ResKaTouchStatDaily extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResKaTouchStatDaily',
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
    ..aOM<KaTouchStatDailyData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: KaTouchStatDailyData.create)
    ..hasRequiredFields = false;

  ResKaTouchStatDaily._() : super();
  factory ResKaTouchStatDaily({
    $core.bool? success,
    $core.String? msg,
    KaTouchStatDailyData? data,
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
  factory ResKaTouchStatDaily.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResKaTouchStatDaily.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResKaTouchStatDaily clone() => ResKaTouchStatDaily()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResKaTouchStatDaily copyWith(void Function(ResKaTouchStatDaily) updates) =>
      super.copyWith((message) => updates(message as ResKaTouchStatDaily))
          as ResKaTouchStatDaily; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResKaTouchStatDaily create() => ResKaTouchStatDaily._();
  ResKaTouchStatDaily createEmptyInstance() => create();
  static $pb.PbList<ResKaTouchStatDaily> createRepeated() =>
      $pb.PbList<ResKaTouchStatDaily>();
  @$core.pragma('dart2js:noInline')
  static ResKaTouchStatDaily getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResKaTouchStatDaily>(create);
  static ResKaTouchStatDaily? _defaultInstance;

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
  KaTouchStatDailyData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(KaTouchStatDailyData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  KaTouchStatDailyData ensureData() => $_ensure(2);
}

class KaTouchStatDailyData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KaTouchStatDailyData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<KaTouchPoolUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: KaTouchPoolUser.create)
    ..m<$core.int, $core.String>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'contentMap',
        entryClassName: 'KaTouchStatDailyData.ContentMapEntry',
        keyFieldType: $pb.PbFieldType.OU3,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('pb'))
    ..m<$core.int, $core.String>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poolMap',
        entryClassName: 'KaTouchStatDailyData.PoolMapEntry',
        keyFieldType: $pb.PbFieldType.OU3,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('pb'))
    ..hasRequiredFields = false;

  KaTouchStatDailyData._() : super();
  factory KaTouchStatDailyData({
    $core.Iterable<KaTouchPoolUser>? list,
    $core.Map<$core.int, $core.String>? contentMap,
    $core.Map<$core.int, $core.String>? poolMap,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (contentMap != null) {
      _result.contentMap.addAll(contentMap);
    }
    if (poolMap != null) {
      _result.poolMap.addAll(poolMap);
    }
    return _result;
  }
  factory KaTouchStatDailyData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KaTouchStatDailyData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KaTouchStatDailyData clone() =>
      KaTouchStatDailyData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KaTouchStatDailyData copyWith(void Function(KaTouchStatDailyData) updates) =>
      super.copyWith((message) => updates(message as KaTouchStatDailyData))
          as KaTouchStatDailyData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KaTouchStatDailyData create() => KaTouchStatDailyData._();
  KaTouchStatDailyData createEmptyInstance() => create();
  static $pb.PbList<KaTouchStatDailyData> createRepeated() =>
      $pb.PbList<KaTouchStatDailyData>();
  @$core.pragma('dart2js:noInline')
  static KaTouchStatDailyData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KaTouchStatDailyData>(create);
  static KaTouchStatDailyData? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<KaTouchPoolUser> get list => $_getList(0);

  @$pb.TagNumber(3)
  $core.Map<$core.int, $core.String> get contentMap => $_getMap(1);

  @$pb.TagNumber(4)
  $core.Map<$core.int, $core.String> get poolMap => $_getMap(2);
}
