///
//  Generated code. Do not modify.
//  source: intimate_card.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResIntimateCardList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResIntimateCardList',
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
    ..aOM<IntimateCardList>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: IntimateCardList.create)
    ..hasRequiredFields = false;

  ResIntimateCardList._() : super();
  factory ResIntimateCardList({
    $core.bool? success,
    $core.String? msg,
    IntimateCardList? data,
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
  factory ResIntimateCardList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResIntimateCardList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResIntimateCardList clone() => ResIntimateCardList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResIntimateCardList copyWith(void Function(ResIntimateCardList) updates) =>
      super.copyWith((message) => updates(message as ResIntimateCardList))
          as ResIntimateCardList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResIntimateCardList create() => ResIntimateCardList._();
  ResIntimateCardList createEmptyInstance() => create();
  static $pb.PbList<ResIntimateCardList> createRepeated() =>
      $pb.PbList<ResIntimateCardList>();
  @$core.pragma('dart2js:noInline')
  static ResIntimateCardList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResIntimateCardList>(create);
  static ResIntimateCardList? _defaultInstance;

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
  IntimateCardList get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(IntimateCardList v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  IntimateCardList ensureData() => $_ensure(2);
}

class IntimateCardList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'IntimateCardList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sendCount',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'receiveCount',
        $pb.PbFieldType.OU3)
    ..pc<IntimateCardInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: IntimateCardInfo.create)
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cursor',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'docUrl')
    ..hasRequiredFields = false;

  IntimateCardList._() : super();
  factory IntimateCardList({
    $core.int? sendCount,
    $core.int? receiveCount,
    $core.Iterable<IntimateCardInfo>? list,
    $core.bool? more,
    $core.int? cursor,
    $core.String? docUrl,
  }) {
    final _result = create();
    if (sendCount != null) {
      _result.sendCount = sendCount;
    }
    if (receiveCount != null) {
      _result.receiveCount = receiveCount;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (more != null) {
      _result.more = more;
    }
    if (cursor != null) {
      _result.cursor = cursor;
    }
    if (docUrl != null) {
      _result.docUrl = docUrl;
    }
    return _result;
  }
  factory IntimateCardList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory IntimateCardList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  IntimateCardList clone() => IntimateCardList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  IntimateCardList copyWith(void Function(IntimateCardList) updates) =>
      super.copyWith((message) => updates(message as IntimateCardList))
          as IntimateCardList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IntimateCardList create() => IntimateCardList._();
  IntimateCardList createEmptyInstance() => create();
  static $pb.PbList<IntimateCardList> createRepeated() =>
      $pb.PbList<IntimateCardList>();
  @$core.pragma('dart2js:noInline')
  static IntimateCardList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IntimateCardList>(create);
  static IntimateCardList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get sendCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set sendCount($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSendCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearSendCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get receiveCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set receiveCount($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasReceiveCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiveCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<IntimateCardInfo> get list => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get more => $_getBF(3);
  @$pb.TagNumber(4)
  set more($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMore() => $_has(3);
  @$pb.TagNumber(4)
  void clearMore() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get cursor => $_getIZ(4);
  @$pb.TagNumber(5)
  set cursor($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCursor() => $_has(4);
  @$pb.TagNumber(5)
  void clearCursor() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get docUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set docUrl($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDocUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearDocUrl() => clearField(6);
}

class IntimateCardInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'IntimateCardInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cardId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
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
            : 'relation')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cycle',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'totalMoney',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftMoney',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unbindTime',
        $pb.PbFieldType.OU3)
    ..aOB(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isSend')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color')
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'relationId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'addMoney',
        $pb.PbFieldType.OU3)
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fontColor')
    ..hasRequiredFields = false;

  IntimateCardInfo._() : super();
  factory IntimateCardInfo({
    $core.int? cardId,
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? relation,
    $core.int? cycle,
    $core.int? totalMoney,
    $core.int? leftMoney,
    $core.int? status,
    $core.int? unbindTime,
    $core.bool? isSend,
    $core.String? color,
    $core.int? relationId,
    $core.int? addMoney,
    $core.String? fontColor,
  }) {
    final _result = create();
    if (cardId != null) {
      _result.cardId = cardId;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (relation != null) {
      _result.relation = relation;
    }
    if (cycle != null) {
      _result.cycle = cycle;
    }
    if (totalMoney != null) {
      _result.totalMoney = totalMoney;
    }
    if (leftMoney != null) {
      _result.leftMoney = leftMoney;
    }
    if (status != null) {
      _result.status = status;
    }
    if (unbindTime != null) {
      _result.unbindTime = unbindTime;
    }
    if (isSend != null) {
      _result.isSend = isSend;
    }
    if (color != null) {
      _result.color = color;
    }
    if (relationId != null) {
      _result.relationId = relationId;
    }
    if (addMoney != null) {
      _result.addMoney = addMoney;
    }
    if (fontColor != null) {
      _result.fontColor = fontColor;
    }
    return _result;
  }
  factory IntimateCardInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory IntimateCardInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  IntimateCardInfo clone() => IntimateCardInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  IntimateCardInfo copyWith(void Function(IntimateCardInfo) updates) =>
      super.copyWith((message) => updates(message as IntimateCardInfo))
          as IntimateCardInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IntimateCardInfo create() => IntimateCardInfo._();
  IntimateCardInfo createEmptyInstance() => create();
  static $pb.PbList<IntimateCardInfo> createRepeated() =>
      $pb.PbList<IntimateCardInfo>();
  @$core.pragma('dart2js:noInline')
  static IntimateCardInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IntimateCardInfo>(create);
  static IntimateCardInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cardId => $_getIZ(0);
  @$pb.TagNumber(1)
  set cardId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCardId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCardId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get uid => $_getIZ(1);
  @$pb.TagNumber(2)
  set uid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);

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
  $core.String get relation => $_getSZ(4);
  @$pb.TagNumber(5)
  set relation($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRelation() => $_has(4);
  @$pb.TagNumber(5)
  void clearRelation() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get cycle => $_getIZ(5);
  @$pb.TagNumber(6)
  set cycle($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCycle() => $_has(5);
  @$pb.TagNumber(6)
  void clearCycle() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get totalMoney => $_getIZ(6);
  @$pb.TagNumber(7)
  set totalMoney($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTotalMoney() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalMoney() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get leftMoney => $_getIZ(7);
  @$pb.TagNumber(8)
  set leftMoney($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLeftMoney() => $_has(7);
  @$pb.TagNumber(8)
  void clearLeftMoney() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get status => $_getIZ(8);
  @$pb.TagNumber(9)
  set status($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearStatus() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get unbindTime => $_getIZ(9);
  @$pb.TagNumber(10)
  set unbindTime($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasUnbindTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearUnbindTime() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get isSend => $_getBF(10);
  @$pb.TagNumber(11)
  set isSend($core.bool v) {
    $_setBool(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasIsSend() => $_has(10);
  @$pb.TagNumber(11)
  void clearIsSend() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get color => $_getSZ(11);
  @$pb.TagNumber(12)
  set color($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasColor() => $_has(11);
  @$pb.TagNumber(12)
  void clearColor() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get relationId => $_getIZ(12);
  @$pb.TagNumber(13)
  set relationId($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasRelationId() => $_has(12);
  @$pb.TagNumber(13)
  void clearRelationId() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get addMoney => $_getIZ(13);
  @$pb.TagNumber(14)
  set addMoney($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasAddMoney() => $_has(13);
  @$pb.TagNumber(14)
  void clearAddMoney() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get fontColor => $_getSZ(14);
  @$pb.TagNumber(15)
  set fontColor($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasFontColor() => $_has(14);
  @$pb.TagNumber(15)
  void clearFontColor() => clearField(15);
}

class ResIntimateCardDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResIntimateCardDetail',
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
    ..aOM<ResIntimateCardDetailData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ResIntimateCardDetailData.create)
    ..hasRequiredFields = false;

  ResIntimateCardDetail._() : super();
  factory ResIntimateCardDetail({
    $core.bool? success,
    $core.String? msg,
    ResIntimateCardDetailData? data,
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
  factory ResIntimateCardDetail.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResIntimateCardDetail.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResIntimateCardDetail clone() =>
      ResIntimateCardDetail()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResIntimateCardDetail copyWith(
          void Function(ResIntimateCardDetail) updates) =>
      super.copyWith((message) => updates(message as ResIntimateCardDetail))
          as ResIntimateCardDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResIntimateCardDetail create() => ResIntimateCardDetail._();
  ResIntimateCardDetail createEmptyInstance() => create();
  static $pb.PbList<ResIntimateCardDetail> createRepeated() =>
      $pb.PbList<ResIntimateCardDetail>();
  @$core.pragma('dart2js:noInline')
  static ResIntimateCardDetail getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResIntimateCardDetail>(create);
  static ResIntimateCardDetail? _defaultInstance;

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
  ResIntimateCardDetailData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ResIntimateCardDetailData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ResIntimateCardDetailData ensureData() => $_ensure(2);
}

class ResIntimateCardDetailData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResIntimateCardDetailData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<IntimateCardInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'card',
        subBuilder: IntimateCardInfo.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defendValue',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message')
    ..hasRequiredFields = false;

  ResIntimateCardDetailData._() : super();
  factory ResIntimateCardDetailData({
    IntimateCardInfo? card,
    $core.int? defendValue,
    $core.String? message,
  }) {
    final _result = create();
    if (card != null) {
      _result.card = card;
    }
    if (defendValue != null) {
      _result.defendValue = defendValue;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory ResIntimateCardDetailData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResIntimateCardDetailData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResIntimateCardDetailData clone() =>
      ResIntimateCardDetailData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResIntimateCardDetailData copyWith(
          void Function(ResIntimateCardDetailData) updates) =>
      super.copyWith((message) => updates(message as ResIntimateCardDetailData))
          as ResIntimateCardDetailData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResIntimateCardDetailData create() => ResIntimateCardDetailData._();
  ResIntimateCardDetailData createEmptyInstance() => create();
  static $pb.PbList<ResIntimateCardDetailData> createRepeated() =>
      $pb.PbList<ResIntimateCardDetailData>();
  @$core.pragma('dart2js:noInline')
  static ResIntimateCardDetailData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResIntimateCardDetailData>(create);
  static ResIntimateCardDetailData? _defaultInstance;

  @$pb.TagNumber(1)
  IntimateCardInfo get card => $_getN(0);
  @$pb.TagNumber(1)
  set card(IntimateCardInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCard() => $_has(0);
  @$pb.TagNumber(1)
  void clearCard() => clearField(1);
  @$pb.TagNumber(1)
  IntimateCardInfo ensureCard() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get defendValue => $_getIZ(1);
  @$pb.TagNumber(2)
  set defendValue($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDefendValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearDefendValue() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);
}

class ResIntimateCardUnbind extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResIntimateCardUnbind',
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
    ..pc<IntimateCardInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: IntimateCardInfo.create)
    ..hasRequiredFields = false;

  ResIntimateCardUnbind._() : super();
  factory ResIntimateCardUnbind({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<IntimateCardInfo>? data,
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
  factory ResIntimateCardUnbind.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResIntimateCardUnbind.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResIntimateCardUnbind clone() =>
      ResIntimateCardUnbind()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResIntimateCardUnbind copyWith(
          void Function(ResIntimateCardUnbind) updates) =>
      super.copyWith((message) => updates(message as ResIntimateCardUnbind))
          as ResIntimateCardUnbind; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResIntimateCardUnbind create() => ResIntimateCardUnbind._();
  ResIntimateCardUnbind createEmptyInstance() => create();
  static $pb.PbList<ResIntimateCardUnbind> createRepeated() =>
      $pb.PbList<ResIntimateCardUnbind>();
  @$core.pragma('dart2js:noInline')
  static ResIntimateCardUnbind getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResIntimateCardUnbind>(create);
  static ResIntimateCardUnbind? _defaultInstance;

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
  $core.List<IntimateCardInfo> get data => $_getList(2);
}

class ResIntimateCardRelation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResIntimateCardRelation',
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
    ..pc<IntimateCardRelationInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: IntimateCardRelationInfo.create)
    ..hasRequiredFields = false;

  ResIntimateCardRelation._() : super();
  factory ResIntimateCardRelation({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<IntimateCardRelationInfo>? data,
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
  factory ResIntimateCardRelation.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResIntimateCardRelation.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResIntimateCardRelation clone() =>
      ResIntimateCardRelation()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResIntimateCardRelation copyWith(
          void Function(ResIntimateCardRelation) updates) =>
      super.copyWith((message) => updates(message as ResIntimateCardRelation))
          as ResIntimateCardRelation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResIntimateCardRelation create() => ResIntimateCardRelation._();
  ResIntimateCardRelation createEmptyInstance() => create();
  static $pb.PbList<ResIntimateCardRelation> createRepeated() =>
      $pb.PbList<ResIntimateCardRelation>();
  @$core.pragma('dart2js:noInline')
  static ResIntimateCardRelation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResIntimateCardRelation>(create);
  static ResIntimateCardRelation? _defaultInstance;

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
  $core.List<IntimateCardRelationInfo> get data => $_getList(2);
}

class IntimateCardRelationInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'IntimateCardRelationInfo',
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
            : 'desc')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fontColor')
    ..hasRequiredFields = false;

  IntimateCardRelationInfo._() : super();
  factory IntimateCardRelationInfo({
    $core.int? id,
    $core.String? name,
    $core.String? desc,
    $core.String? color,
    $core.String? title,
    $core.String? fontColor,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (color != null) {
      _result.color = color;
    }
    if (title != null) {
      _result.title = title;
    }
    if (fontColor != null) {
      _result.fontColor = fontColor;
    }
    return _result;
  }
  factory IntimateCardRelationInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory IntimateCardRelationInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  IntimateCardRelationInfo clone() =>
      IntimateCardRelationInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  IntimateCardRelationInfo copyWith(
          void Function(IntimateCardRelationInfo) updates) =>
      super.copyWith((message) => updates(message as IntimateCardRelationInfo))
          as IntimateCardRelationInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IntimateCardRelationInfo create() => IntimateCardRelationInfo._();
  IntimateCardRelationInfo createEmptyInstance() => create();
  static $pb.PbList<IntimateCardRelationInfo> createRepeated() =>
      $pb.PbList<IntimateCardRelationInfo>();
  @$core.pragma('dart2js:noInline')
  static IntimateCardRelationInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IntimateCardRelationInfo>(create);
  static IntimateCardRelationInfo? _defaultInstance;

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
  $core.String get desc => $_getSZ(2);
  @$pb.TagNumber(3)
  set desc($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesc() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get color => $_getSZ(3);
  @$pb.TagNumber(4)
  set color($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasColor() => $_has(3);
  @$pb.TagNumber(4)
  void clearColor() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get title => $_getSZ(4);
  @$pb.TagNumber(5)
  set title($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearTitle() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get fontColor => $_getSZ(5);
  @$pb.TagNumber(6)
  set fontColor($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasFontColor() => $_has(5);
  @$pb.TagNumber(6)
  void clearFontColor() => clearField(6);
}

class ResCardRelationUserList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResCardRelationUserList',
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
    ..pc<IntimateCardRelationUserInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: IntimateCardRelationUserInfo.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  ResCardRelationUserList._() : super();
  factory ResCardRelationUserList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<IntimateCardRelationUserInfo>? data,
    $core.String? name,
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
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory ResCardRelationUserList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResCardRelationUserList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResCardRelationUserList clone() =>
      ResCardRelationUserList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResCardRelationUserList copyWith(
          void Function(ResCardRelationUserList) updates) =>
      super.copyWith((message) => updates(message as ResCardRelationUserList))
          as ResCardRelationUserList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResCardRelationUserList create() => ResCardRelationUserList._();
  ResCardRelationUserList createEmptyInstance() => create();
  static $pb.PbList<ResCardRelationUserList> createRepeated() =>
      $pb.PbList<ResCardRelationUserList>();
  @$core.pragma('dart2js:noInline')
  static ResCardRelationUserList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResCardRelationUserList>(create);
  static ResCardRelationUserList? _defaultInstance;

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
  $core.List<IntimateCardRelationUserInfo> get data => $_getList(2);

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
}

class IntimateCardRelationUserInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'IntimateCardRelationUserInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defendValue',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
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
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'relationId',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'relationName')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fontColor')
    ..hasRequiredFields = false;

  IntimateCardRelationUserInfo._() : super();
  factory IntimateCardRelationUserInfo({
    $core.int? defendValue,
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? relationId,
    $core.String? relationName,
    $core.String? fontColor,
  }) {
    final _result = create();
    if (defendValue != null) {
      _result.defendValue = defendValue;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (relationId != null) {
      _result.relationId = relationId;
    }
    if (relationName != null) {
      _result.relationName = relationName;
    }
    if (fontColor != null) {
      _result.fontColor = fontColor;
    }
    return _result;
  }
  factory IntimateCardRelationUserInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory IntimateCardRelationUserInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  IntimateCardRelationUserInfo clone() =>
      IntimateCardRelationUserInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  IntimateCardRelationUserInfo copyWith(
          void Function(IntimateCardRelationUserInfo) updates) =>
      super.copyWith(
              (message) => updates(message as IntimateCardRelationUserInfo))
          as IntimateCardRelationUserInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IntimateCardRelationUserInfo create() =>
      IntimateCardRelationUserInfo._();
  IntimateCardRelationUserInfo createEmptyInstance() => create();
  static $pb.PbList<IntimateCardRelationUserInfo> createRepeated() =>
      $pb.PbList<IntimateCardRelationUserInfo>();
  @$core.pragma('dart2js:noInline')
  static IntimateCardRelationUserInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IntimateCardRelationUserInfo>(create);
  static IntimateCardRelationUserInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get defendValue => $_getIZ(0);
  @$pb.TagNumber(1)
  set defendValue($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDefendValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearDefendValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get uid => $_getIZ(1);
  @$pb.TagNumber(2)
  set uid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);

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
  $core.int get relationId => $_getIZ(4);
  @$pb.TagNumber(5)
  set relationId($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRelationId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRelationId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get relationName => $_getSZ(5);
  @$pb.TagNumber(6)
  set relationName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRelationName() => $_has(5);
  @$pb.TagNumber(6)
  void clearRelationName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get fontColor => $_getSZ(6);
  @$pb.TagNumber(7)
  set fontColor($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasFontColor() => $_has(6);
  @$pb.TagNumber(7)
  void clearFontColor() => clearField(7);
}

class RespIntimateRoomGiftList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespIntimateRoomGiftList',
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
    ..pc<IntimateCardInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: IntimateCardInfo.create)
    ..hasRequiredFields = false;

  RespIntimateRoomGiftList._() : super();
  factory RespIntimateRoomGiftList({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<IntimateCardInfo>? data,
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
  factory RespIntimateRoomGiftList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespIntimateRoomGiftList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespIntimateRoomGiftList clone() =>
      RespIntimateRoomGiftList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespIntimateRoomGiftList copyWith(
          void Function(RespIntimateRoomGiftList) updates) =>
      super.copyWith((message) => updates(message as RespIntimateRoomGiftList))
          as RespIntimateRoomGiftList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespIntimateRoomGiftList create() => RespIntimateRoomGiftList._();
  RespIntimateRoomGiftList createEmptyInstance() => create();
  static $pb.PbList<RespIntimateRoomGiftList> createRepeated() =>
      $pb.PbList<RespIntimateRoomGiftList>();
  @$core.pragma('dart2js:noInline')
  static RespIntimateRoomGiftList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespIntimateRoomGiftList>(create);
  static RespIntimateRoomGiftList? _defaultInstance;

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
  $core.List<IntimateCardInfo> get data => $_getList(2);
}

class ResIntimateCardAuctionRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResIntimateCardAuctionRoom',
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
    ..hasRequiredFields = false;

  ResIntimateCardAuctionRoom._() : super();
  factory ResIntimateCardAuctionRoom({
    $core.bool? success,
    $core.String? msg,
    $core.int? rid,
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
    return _result;
  }
  factory ResIntimateCardAuctionRoom.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResIntimateCardAuctionRoom.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResIntimateCardAuctionRoom clone() =>
      ResIntimateCardAuctionRoom()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResIntimateCardAuctionRoom copyWith(
          void Function(ResIntimateCardAuctionRoom) updates) =>
      super.copyWith(
              (message) => updates(message as ResIntimateCardAuctionRoom))
          as ResIntimateCardAuctionRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResIntimateCardAuctionRoom create() => ResIntimateCardAuctionRoom._();
  ResIntimateCardAuctionRoom createEmptyInstance() => create();
  static $pb.PbList<ResIntimateCardAuctionRoom> createRepeated() =>
      $pb.PbList<ResIntimateCardAuctionRoom>();
  @$core.pragma('dart2js:noInline')
  static ResIntimateCardAuctionRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResIntimateCardAuctionRoom>(create);
  static ResIntimateCardAuctionRoom? _defaultInstance;

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
}
