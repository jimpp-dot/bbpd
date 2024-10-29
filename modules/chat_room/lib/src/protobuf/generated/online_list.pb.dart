///
//  Generated code. Do not modify.
//  source: online_list.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RookieTag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RookieTag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sevenNew',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payLevel',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RookieTag._() : super();
  factory RookieTag({
    $core.int? sevenNew,
    $core.int? payLevel,
  }) {
    final _result = create();
    if (sevenNew != null) {
      _result.sevenNew = sevenNew;
    }
    if (payLevel != null) {
      _result.payLevel = payLevel;
    }
    return _result;
  }
  factory RookieTag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RookieTag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RookieTag clone() => RookieTag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RookieTag copyWith(void Function(RookieTag) updates) =>
      super.copyWith((message) => updates(message as RookieTag))
          as RookieTag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RookieTag create() => RookieTag._();
  RookieTag createEmptyInstance() => create();
  static $pb.PbList<RookieTag> createRepeated() => $pb.PbList<RookieTag>();
  @$core.pragma('dart2js:noInline')
  static RookieTag getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RookieTag>(create);
  static RookieTag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get sevenNew => $_getIZ(0);
  @$pb.TagNumber(1)
  set sevenNew($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSevenNew() => $_has(0);
  @$pb.TagNumber(1)
  void clearSevenNew() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get payLevel => $_getIZ(1);
  @$pb.TagNumber(2)
  set payLevel($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPayLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayLevel() => clearField(2);
}

class ListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ListData',
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
            : 'sex',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'birthday')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mic',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleNew',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'year',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popularityLevel',
        $pb.PbFieldType.OU3)
    ..aOM<RookieTag>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rookie',
        subBuilder: RookieTag.create)
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'newNobile',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ordering',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isNewer',
        $pb.PbFieldType.OU3)
    ..aOB(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showPaidTag')
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'richIcon')
    ..hasRequiredFields = false;

  ListData._() : super();
  factory ListData({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? sex,
    $core.String? birthday,
    $core.int? version,
    $core.int? dateline,
    $core.int? title,
    $core.String? role,
    $core.int? mic,
    $core.int? position,
    $core.int? age,
    $core.int? titleNew,
    $core.int? vip,
    $core.int? year,
    $core.int? onlineTime,
    $core.int? popularityLevel,
    RookieTag? rookie,
    $core.int? newNobile,
    $core.int? ordering,
    $core.int? isNewer,
    $core.bool? showPaidTag,
    $core.String? richIcon,
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
    if (sex != null) {
      _result.sex = sex;
    }
    if (birthday != null) {
      _result.birthday = birthday;
    }
    if (version != null) {
      _result.version = version;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (title != null) {
      _result.title = title;
    }
    if (role != null) {
      _result.role = role;
    }
    if (mic != null) {
      _result.mic = mic;
    }
    if (position != null) {
      _result.position = position;
    }
    if (age != null) {
      _result.age = age;
    }
    if (titleNew != null) {
      _result.titleNew = titleNew;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (year != null) {
      _result.year = year;
    }
    if (onlineTime != null) {
      _result.onlineTime = onlineTime;
    }
    if (popularityLevel != null) {
      _result.popularityLevel = popularityLevel;
    }
    if (rookie != null) {
      _result.rookie = rookie;
    }
    if (newNobile != null) {
      _result.newNobile = newNobile;
    }
    if (ordering != null) {
      _result.ordering = ordering;
    }
    if (isNewer != null) {
      _result.isNewer = isNewer;
    }
    if (showPaidTag != null) {
      _result.showPaidTag = showPaidTag;
    }
    if (richIcon != null) {
      _result.richIcon = richIcon;
    }
    return _result;
  }
  factory ListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListData clone() => ListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListData copyWith(void Function(ListData) updates) =>
      super.copyWith((message) => updates(message as ListData))
          as ListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListData create() => ListData._();
  ListData createEmptyInstance() => create();
  static $pb.PbList<ListData> createRepeated() => $pb.PbList<ListData>();
  @$core.pragma('dart2js:noInline')
  static ListData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListData>(create);
  static ListData? _defaultInstance;

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
  $core.String get birthday => $_getSZ(4);
  @$pb.TagNumber(5)
  set birthday($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBirthday() => $_has(4);
  @$pb.TagNumber(5)
  void clearBirthday() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get version => $_getIZ(5);
  @$pb.TagNumber(6)
  set version($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearVersion() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get dateline => $_getIZ(6);
  @$pb.TagNumber(7)
  set dateline($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDateline() => $_has(6);
  @$pb.TagNumber(7)
  void clearDateline() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get title => $_getIZ(7);
  @$pb.TagNumber(8)
  set title($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTitle() => $_has(7);
  @$pb.TagNumber(8)
  void clearTitle() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get role => $_getSZ(8);
  @$pb.TagNumber(9)
  set role($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasRole() => $_has(8);
  @$pb.TagNumber(9)
  void clearRole() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get mic => $_getIZ(9);
  @$pb.TagNumber(10)
  set mic($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasMic() => $_has(9);
  @$pb.TagNumber(10)
  void clearMic() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get position => $_getIZ(10);
  @$pb.TagNumber(11)
  set position($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasPosition() => $_has(10);
  @$pb.TagNumber(11)
  void clearPosition() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get age => $_getIZ(11);
  @$pb.TagNumber(12)
  set age($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasAge() => $_has(11);
  @$pb.TagNumber(12)
  void clearAge() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get titleNew => $_getIZ(12);
  @$pb.TagNumber(13)
  set titleNew($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasTitleNew() => $_has(12);
  @$pb.TagNumber(13)
  void clearTitleNew() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get vip => $_getIZ(13);
  @$pb.TagNumber(14)
  set vip($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasVip() => $_has(13);
  @$pb.TagNumber(14)
  void clearVip() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get year => $_getIZ(14);
  @$pb.TagNumber(15)
  set year($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasYear() => $_has(14);
  @$pb.TagNumber(15)
  void clearYear() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get onlineTime => $_getIZ(15);
  @$pb.TagNumber(16)
  set onlineTime($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasOnlineTime() => $_has(15);
  @$pb.TagNumber(16)
  void clearOnlineTime() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get popularityLevel => $_getIZ(16);
  @$pb.TagNumber(17)
  set popularityLevel($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasPopularityLevel() => $_has(16);
  @$pb.TagNumber(17)
  void clearPopularityLevel() => clearField(17);

  @$pb.TagNumber(18)
  RookieTag get rookie => $_getN(17);
  @$pb.TagNumber(18)
  set rookie(RookieTag v) {
    setField(18, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasRookie() => $_has(17);
  @$pb.TagNumber(18)
  void clearRookie() => clearField(18);
  @$pb.TagNumber(18)
  RookieTag ensureRookie() => $_ensure(17);

  @$pb.TagNumber(19)
  $core.int get newNobile => $_getIZ(18);
  @$pb.TagNumber(19)
  set newNobile($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasNewNobile() => $_has(18);
  @$pb.TagNumber(19)
  void clearNewNobile() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get ordering => $_getIZ(19);
  @$pb.TagNumber(20)
  set ordering($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasOrdering() => $_has(19);
  @$pb.TagNumber(20)
  void clearOrdering() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get isNewer => $_getIZ(20);
  @$pb.TagNumber(21)
  set isNewer($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasIsNewer() => $_has(20);
  @$pb.TagNumber(21)
  void clearIsNewer() => clearField(21);

  @$pb.TagNumber(22)
  $core.bool get showPaidTag => $_getBF(21);
  @$pb.TagNumber(22)
  set showPaidTag($core.bool v) {
    $_setBool(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasShowPaidTag() => $_has(21);
  @$pb.TagNumber(22)
  void clearShowPaidTag() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get richIcon => $_getSZ(22);
  @$pb.TagNumber(23)
  set richIcon($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasRichIcon() => $_has(22);
  @$pb.TagNumber(23)
  void clearRichIcon() => clearField(23);
}

class OnlineList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'OnlineList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ListData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: ListData.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'online',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  OnlineList._() : super();
  factory OnlineList({
    $core.Iterable<ListData>? list,
    $core.int? online,
    $core.int? version,
  }) {
    final _result = create();
    if (list != null) {
      _result.list.addAll(list);
    }
    if (online != null) {
      _result.online = online;
    }
    if (version != null) {
      _result.version = version;
    }
    return _result;
  }
  factory OnlineList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory OnlineList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  OnlineList clone() => OnlineList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  OnlineList copyWith(void Function(OnlineList) updates) =>
      super.copyWith((message) => updates(message as OnlineList))
          as OnlineList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OnlineList create() => OnlineList._();
  OnlineList createEmptyInstance() => create();
  static $pb.PbList<OnlineList> createRepeated() => $pb.PbList<OnlineList>();
  @$core.pragma('dart2js:noInline')
  static OnlineList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OnlineList>(create);
  static OnlineList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ListData> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get online => $_getIZ(1);
  @$pb.TagNumber(2)
  set online($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOnline() => $_has(1);
  @$pb.TagNumber(2)
  void clearOnline() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get version => $_getIZ(2);
  @$pb.TagNumber(3)
  set version($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => clearField(3);
}

class ResOnlineList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResOnlineList',
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
    ..aOM<OnlineList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: OnlineList.create)
    ..hasRequiredFields = false;

  ResOnlineList._() : super();
  factory ResOnlineList({
    $core.bool? success,
    $core.String? msg,
    OnlineList? data,
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
  factory ResOnlineList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResOnlineList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResOnlineList clone() => ResOnlineList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResOnlineList copyWith(void Function(ResOnlineList) updates) =>
      super.copyWith((message) => updates(message as ResOnlineList))
          as ResOnlineList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResOnlineList create() => ResOnlineList._();
  ResOnlineList createEmptyInstance() => create();
  static $pb.PbList<ResOnlineList> createRepeated() =>
      $pb.PbList<ResOnlineList>();
  @$core.pragma('dart2js:noInline')
  static ResOnlineList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResOnlineList>(create);
  static ResOnlineList? _defaultInstance;

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
  OnlineList get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(OnlineList v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  OnlineList ensureData() => $_ensure(2);
}

class ResDrainageRoomOnlineList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResDrainageRoomOnlineList',
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
    ..aOM<DrainageRoomOnlineData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: DrainageRoomOnlineData.create)
    ..hasRequiredFields = false;

  ResDrainageRoomOnlineList._() : super();
  factory ResDrainageRoomOnlineList({
    $core.bool? success,
    $core.String? msg,
    DrainageRoomOnlineData? data,
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
  factory ResDrainageRoomOnlineList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResDrainageRoomOnlineList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResDrainageRoomOnlineList clone() =>
      ResDrainageRoomOnlineList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResDrainageRoomOnlineList copyWith(
          void Function(ResDrainageRoomOnlineList) updates) =>
      super.copyWith((message) => updates(message as ResDrainageRoomOnlineList))
          as ResDrainageRoomOnlineList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResDrainageRoomOnlineList create() => ResDrainageRoomOnlineList._();
  ResDrainageRoomOnlineList createEmptyInstance() => create();
  static $pb.PbList<ResDrainageRoomOnlineList> createRepeated() =>
      $pb.PbList<ResDrainageRoomOnlineList>();
  @$core.pragma('dart2js:noInline')
  static ResDrainageRoomOnlineList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResDrainageRoomOnlineList>(create);
  static ResDrainageRoomOnlineList? _defaultInstance;

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
  DrainageRoomOnlineData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(DrainageRoomOnlineData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  DrainageRoomOnlineData ensureData() => $_ensure(2);
}

class DrainageRoomOnlineData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'DrainageRoomOnlineData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ListData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'noPermissionList',
        $pb.PbFieldType.PM,
        subBuilder: ListData.create)
    ..pc<ListData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: ListData.create)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'online',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showNoPermission')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  DrainageRoomOnlineData._() : super();
  factory DrainageRoomOnlineData({
    $core.Iterable<ListData>? noPermissionList,
    $core.Iterable<ListData>? list,
    $core.int? online,
    $core.int? version,
    $core.bool? showNoPermission,
    $core.int? giftId,
  }) {
    final _result = create();
    if (noPermissionList != null) {
      _result.noPermissionList.addAll(noPermissionList);
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (online != null) {
      _result.online = online;
    }
    if (version != null) {
      _result.version = version;
    }
    if (showNoPermission != null) {
      _result.showNoPermission = showNoPermission;
    }
    if (giftId != null) {
      _result.giftId = giftId;
    }
    return _result;
  }
  factory DrainageRoomOnlineData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DrainageRoomOnlineData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DrainageRoomOnlineData clone() =>
      DrainageRoomOnlineData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DrainageRoomOnlineData copyWith(
          void Function(DrainageRoomOnlineData) updates) =>
      super.copyWith((message) => updates(message as DrainageRoomOnlineData))
          as DrainageRoomOnlineData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DrainageRoomOnlineData create() => DrainageRoomOnlineData._();
  DrainageRoomOnlineData createEmptyInstance() => create();
  static $pb.PbList<DrainageRoomOnlineData> createRepeated() =>
      $pb.PbList<DrainageRoomOnlineData>();
  @$core.pragma('dart2js:noInline')
  static DrainageRoomOnlineData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DrainageRoomOnlineData>(create);
  static DrainageRoomOnlineData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ListData> get noPermissionList => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<ListData> get list => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get online => $_getIZ(2);
  @$pb.TagNumber(3)
  set online($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOnline() => $_has(2);
  @$pb.TagNumber(3)
  void clearOnline() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get version => $_getIZ(3);
  @$pb.TagNumber(4)
  set version($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearVersion() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get showNoPermission => $_getBF(4);
  @$pb.TagNumber(5)
  set showNoPermission($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasShowNoPermission() => $_has(4);
  @$pb.TagNumber(5)
  void clearShowNoPermission() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get giftId => $_getIZ(5);
  @$pb.TagNumber(6)
  set giftId($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasGiftId() => $_has(5);
  @$pb.TagNumber(6)
  void clearGiftId() => clearField(6);
}
