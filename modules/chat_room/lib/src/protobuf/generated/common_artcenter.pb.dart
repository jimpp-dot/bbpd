///
//  Generated code. Do not modify.
//  source: common_artcenter.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ArtListItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ArtListItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'artId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'centerRid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'contentRid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'contentUid',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'contentUidName')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'contentUidIcon')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'contentDesc')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'startTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inRid',
        $pb.PbFieldType.OU3)
    ..aOB(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onLive')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'contentUidSign')
    ..aOB(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isFollow')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'inRoomTip')
    ..hasRequiredFields = false;

  ArtListItem._() : super();
  factory ArtListItem({
    $core.int? artId,
    $core.int? centerRid,
    $core.int? contentRid,
    $core.int? contentUid,
    $core.String? contentUidName,
    $core.String? contentUidIcon,
    $core.String? contentDesc,
    $core.int? startTime,
    $core.int? endTime,
    $core.int? inRid,
    $core.bool? onLive,
    $core.String? contentUidSign,
    $core.bool? isFollow,
    $core.String? inRoomTip,
  }) {
    final _result = create();
    if (artId != null) {
      _result.artId = artId;
    }
    if (centerRid != null) {
      _result.centerRid = centerRid;
    }
    if (contentRid != null) {
      _result.contentRid = contentRid;
    }
    if (contentUid != null) {
      _result.contentUid = contentUid;
    }
    if (contentUidName != null) {
      _result.contentUidName = contentUidName;
    }
    if (contentUidIcon != null) {
      _result.contentUidIcon = contentUidIcon;
    }
    if (contentDesc != null) {
      _result.contentDesc = contentDesc;
    }
    if (startTime != null) {
      _result.startTime = startTime;
    }
    if (endTime != null) {
      _result.endTime = endTime;
    }
    if (inRid != null) {
      _result.inRid = inRid;
    }
    if (onLive != null) {
      _result.onLive = onLive;
    }
    if (contentUidSign != null) {
      _result.contentUidSign = contentUidSign;
    }
    if (isFollow != null) {
      _result.isFollow = isFollow;
    }
    if (inRoomTip != null) {
      _result.inRoomTip = inRoomTip;
    }
    return _result;
  }
  factory ArtListItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ArtListItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ArtListItem clone() => ArtListItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ArtListItem copyWith(void Function(ArtListItem) updates) =>
      super.copyWith((message) => updates(message as ArtListItem))
          as ArtListItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ArtListItem create() => ArtListItem._();
  ArtListItem createEmptyInstance() => create();
  static $pb.PbList<ArtListItem> createRepeated() => $pb.PbList<ArtListItem>();
  @$core.pragma('dart2js:noInline')
  static ArtListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArtListItem>(create);
  static ArtListItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get artId => $_getIZ(0);
  @$pb.TagNumber(1)
  set artId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasArtId() => $_has(0);
  @$pb.TagNumber(1)
  void clearArtId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get centerRid => $_getIZ(1);
  @$pb.TagNumber(2)
  set centerRid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCenterRid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCenterRid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get contentRid => $_getIZ(2);
  @$pb.TagNumber(3)
  set contentRid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasContentRid() => $_has(2);
  @$pb.TagNumber(3)
  void clearContentRid() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get contentUid => $_getIZ(3);
  @$pb.TagNumber(4)
  set contentUid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasContentUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearContentUid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get contentUidName => $_getSZ(4);
  @$pb.TagNumber(5)
  set contentUidName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasContentUidName() => $_has(4);
  @$pb.TagNumber(5)
  void clearContentUidName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get contentUidIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set contentUidIcon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasContentUidIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearContentUidIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get contentDesc => $_getSZ(6);
  @$pb.TagNumber(7)
  set contentDesc($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasContentDesc() => $_has(6);
  @$pb.TagNumber(7)
  void clearContentDesc() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get startTime => $_getIZ(7);
  @$pb.TagNumber(8)
  set startTime($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasStartTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearStartTime() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get endTime => $_getIZ(8);
  @$pb.TagNumber(9)
  set endTime($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasEndTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearEndTime() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get inRid => $_getIZ(9);
  @$pb.TagNumber(10)
  set inRid($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasInRid() => $_has(9);
  @$pb.TagNumber(10)
  void clearInRid() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get onLive => $_getBF(10);
  @$pb.TagNumber(11)
  set onLive($core.bool v) {
    $_setBool(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasOnLive() => $_has(10);
  @$pb.TagNumber(11)
  void clearOnLive() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get contentUidSign => $_getSZ(11);
  @$pb.TagNumber(12)
  set contentUidSign($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasContentUidSign() => $_has(11);
  @$pb.TagNumber(12)
  void clearContentUidSign() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get isFollow => $_getBF(12);
  @$pb.TagNumber(13)
  set isFollow($core.bool v) {
    $_setBool(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasIsFollow() => $_has(12);
  @$pb.TagNumber(13)
  void clearIsFollow() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get inRoomTip => $_getSZ(13);
  @$pb.TagNumber(14)
  set inRoomTip($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasInRoomTip() => $_has(13);
  @$pb.TagNumber(14)
  void clearInRoomTip() => clearField(14);
}

class ResArtList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResArtList',
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
            : 'dateTime',
        $pb.PbFieldType.OU3)
    ..pc<ArtListItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: ArtListItem.create)
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'canCopy')
    ..hasRequiredFields = false;

  ResArtList._() : super();
  factory ResArtList({
    $core.bool? success,
    $core.String? msg,
    $core.int? dateTime,
    $core.Iterable<ArtListItem>? list,
    $core.bool? canCopy,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (dateTime != null) {
      _result.dateTime = dateTime;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (canCopy != null) {
      _result.canCopy = canCopy;
    }
    return _result;
  }
  factory ResArtList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResArtList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResArtList clone() => ResArtList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResArtList copyWith(void Function(ResArtList) updates) =>
      super.copyWith((message) => updates(message as ResArtList))
          as ResArtList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResArtList create() => ResArtList._();
  ResArtList createEmptyInstance() => create();
  static $pb.PbList<ResArtList> createRepeated() => $pb.PbList<ResArtList>();
  @$core.pragma('dart2js:noInline')
  static ResArtList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResArtList>(create);
  static ResArtList? _defaultInstance;

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
  $core.int get dateTime => $_getIZ(2);
  @$pb.TagNumber(3)
  set dateTime($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDateTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearDateTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<ArtListItem> get list => $_getList(3);

  @$pb.TagNumber(5)
  $core.bool get canCopy => $_getBF(4);
  @$pb.TagNumber(5)
  set canCopy($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCanCopy() => $_has(4);
  @$pb.TagNumber(5)
  void clearCanCopy() => clearField(5);
}

class ResArtRoomSearch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResArtRoomSearch',
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
            : 'rid',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomTitle')
    ..hasRequiredFields = false;

  ResArtRoomSearch._() : super();
  factory ResArtRoomSearch({
    $core.bool? success,
    $core.String? msg,
    $core.int? rid,
    $core.String? icon,
    $core.String? roomTitle,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (roomTitle != null) {
      _result.roomTitle = roomTitle;
    }
    return _result;
  }
  factory ResArtRoomSearch.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResArtRoomSearch.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResArtRoomSearch clone() => ResArtRoomSearch()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResArtRoomSearch copyWith(void Function(ResArtRoomSearch) updates) =>
      super.copyWith((message) => updates(message as ResArtRoomSearch))
          as ResArtRoomSearch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResArtRoomSearch create() => ResArtRoomSearch._();
  ResArtRoomSearch createEmptyInstance() => create();
  static $pb.PbList<ResArtRoomSearch> createRepeated() =>
      $pb.PbList<ResArtRoomSearch>();
  @$core.pragma('dart2js:noInline')
  static ResArtRoomSearch getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResArtRoomSearch>(create);
  static ResArtRoomSearch? _defaultInstance;

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
  $core.int get rid => $_getIZ(2);
  @$pb.TagNumber(3)
  set rid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRid() => $_has(2);
  @$pb.TagNumber(3)
  void clearRid() => clearField(3);

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
  $core.String get roomTitle => $_getSZ(4);
  @$pb.TagNumber(5)
  set roomTitle($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRoomTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomTitle() => clearField(5);
}
