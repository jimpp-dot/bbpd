///
//  Generated code. Do not modify.
//  source: checkin.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class CheckInCardInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CheckInCardInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..p<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'buyNum',
        $pb.PbFieldType.PU3)
    ..hasRequiredFields = false;

  CheckInCardInfo._() : super();
  factory CheckInCardInfo({
    $core.int? price,
    $core.String? icon,
    $core.String? desc,
    $core.Iterable<$core.int>? buyNum,
  }) {
    final _result = create();
    if (price != null) {
      _result.price = price;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (buyNum != null) {
      _result.buyNum.addAll(buyNum);
    }
    return _result;
  }
  factory CheckInCardInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CheckInCardInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CheckInCardInfo clone() => CheckInCardInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CheckInCardInfo copyWith(void Function(CheckInCardInfo) updates) =>
      super.copyWith((message) => updates(message as CheckInCardInfo))
          as CheckInCardInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CheckInCardInfo create() => CheckInCardInfo._();
  CheckInCardInfo createEmptyInstance() => create();
  static $pb.PbList<CheckInCardInfo> createRepeated() =>
      $pb.PbList<CheckInCardInfo>();
  @$core.pragma('dart2js:noInline')
  static CheckInCardInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckInCardInfo>(create);
  static CheckInCardInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get price => $_getIZ(0);
  @$pb.TagNumber(1)
  set price($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrice() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrice() => clearField(1);

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
  $core.List<$core.int> get buyNum => $_getList(3);
}

class CheckInRewardItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CheckInRewardItem',
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
            : 'type')
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
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  CheckInRewardItem._() : super();
  factory CheckInRewardItem({
    $core.int? cid,
    $core.String? type,
    $core.int? num,
    $core.String? name,
    $core.bool? state,
    $core.String? desc,
    $core.String? icon,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (type != null) {
      _result.type = type;
    }
    if (num != null) {
      _result.num = num;
    }
    if (name != null) {
      _result.name = name;
    }
    if (state != null) {
      _result.state = state;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory CheckInRewardItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CheckInRewardItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CheckInRewardItem clone() => CheckInRewardItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CheckInRewardItem copyWith(void Function(CheckInRewardItem) updates) =>
      super.copyWith((message) => updates(message as CheckInRewardItem))
          as CheckInRewardItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CheckInRewardItem create() => CheckInRewardItem._();
  CheckInRewardItem createEmptyInstance() => create();
  static $pb.PbList<CheckInRewardItem> createRepeated() =>
      $pb.PbList<CheckInRewardItem>();
  @$core.pragma('dart2js:noInline')
  static CheckInRewardItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckInRewardItem>(create);
  static CheckInRewardItem? _defaultInstance;

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
  $core.bool get state => $_getBF(4);
  @$pb.TagNumber(5)
  set state($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasState() => $_has(4);
  @$pb.TagNumber(5)
  void clearState() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get desc => $_getSZ(5);
  @$pb.TagNumber(6)
  set desc($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearDesc() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get icon => $_getSZ(6);
  @$pb.TagNumber(7)
  set icon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearIcon() => clearField(7);
}

class CheckInHomeRsp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CheckInHomeRsp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<CheckInRewardItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rewardList',
        $pb.PbFieldType.PM,
        subBuilder: CheckInRewardItem.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'checkInDesc')
    ..aInt64(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'leftSeconds')
    ..aOB(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'checkInToday')
    ..aOM<CheckInCardInfo>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'checkInCard',
        subBuilder: CheckInCardInfo.create)
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isPopup')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'normalUrl')
    ..aOB(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'canNormal')
    ..hasRequiredFields = false;

  CheckInHomeRsp_Data._() : super();
  factory CheckInHomeRsp_Data({
    $core.Iterable<CheckInRewardItem>? rewardList,
    $core.String? checkInDesc,
    $fixnum.Int64? leftSeconds,
    $core.bool? checkInToday,
    CheckInCardInfo? checkInCard,
    $core.bool? isPopup,
    $core.String? normalUrl,
    $core.bool? canNormal,
  }) {
    final _result = create();
    if (rewardList != null) {
      _result.rewardList.addAll(rewardList);
    }
    if (checkInDesc != null) {
      _result.checkInDesc = checkInDesc;
    }
    if (leftSeconds != null) {
      _result.leftSeconds = leftSeconds;
    }
    if (checkInToday != null) {
      _result.checkInToday = checkInToday;
    }
    if (checkInCard != null) {
      _result.checkInCard = checkInCard;
    }
    if (isPopup != null) {
      _result.isPopup = isPopup;
    }
    if (normalUrl != null) {
      _result.normalUrl = normalUrl;
    }
    if (canNormal != null) {
      _result.canNormal = canNormal;
    }
    return _result;
  }
  factory CheckInHomeRsp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CheckInHomeRsp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CheckInHomeRsp_Data clone() => CheckInHomeRsp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CheckInHomeRsp_Data copyWith(void Function(CheckInHomeRsp_Data) updates) =>
      super.copyWith((message) => updates(message as CheckInHomeRsp_Data))
          as CheckInHomeRsp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CheckInHomeRsp_Data create() => CheckInHomeRsp_Data._();
  CheckInHomeRsp_Data createEmptyInstance() => create();
  static $pb.PbList<CheckInHomeRsp_Data> createRepeated() =>
      $pb.PbList<CheckInHomeRsp_Data>();
  @$core.pragma('dart2js:noInline')
  static CheckInHomeRsp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckInHomeRsp_Data>(create);
  static CheckInHomeRsp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<CheckInRewardItem> get rewardList => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get checkInDesc => $_getSZ(1);
  @$pb.TagNumber(2)
  set checkInDesc($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCheckInDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearCheckInDesc() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get leftSeconds => $_getI64(2);
  @$pb.TagNumber(3)
  set leftSeconds($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLeftSeconds() => $_has(2);
  @$pb.TagNumber(3)
  void clearLeftSeconds() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get checkInToday => $_getBF(3);
  @$pb.TagNumber(4)
  set checkInToday($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCheckInToday() => $_has(3);
  @$pb.TagNumber(4)
  void clearCheckInToday() => clearField(4);

  @$pb.TagNumber(5)
  CheckInCardInfo get checkInCard => $_getN(4);
  @$pb.TagNumber(5)
  set checkInCard(CheckInCardInfo v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCheckInCard() => $_has(4);
  @$pb.TagNumber(5)
  void clearCheckInCard() => clearField(5);
  @$pb.TagNumber(5)
  CheckInCardInfo ensureCheckInCard() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.bool get isPopup => $_getBF(5);
  @$pb.TagNumber(6)
  set isPopup($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIsPopup() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsPopup() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get normalUrl => $_getSZ(6);
  @$pb.TagNumber(7)
  set normalUrl($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasNormalUrl() => $_has(6);
  @$pb.TagNumber(7)
  void clearNormalUrl() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get canNormal => $_getBF(7);
  @$pb.TagNumber(8)
  set canNormal($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasCanNormal() => $_has(7);
  @$pb.TagNumber(8)
  void clearCanNormal() => clearField(8);
}

class CheckInHomeRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CheckInHomeRsp',
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
    ..aOM<CheckInHomeRsp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: CheckInHomeRsp_Data.create)
    ..hasRequiredFields = false;

  CheckInHomeRsp._() : super();
  factory CheckInHomeRsp({
    $core.bool? success,
    $core.String? msg,
    CheckInHomeRsp_Data? data,
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
  factory CheckInHomeRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CheckInHomeRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CheckInHomeRsp clone() => CheckInHomeRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CheckInHomeRsp copyWith(void Function(CheckInHomeRsp) updates) =>
      super.copyWith((message) => updates(message as CheckInHomeRsp))
          as CheckInHomeRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CheckInHomeRsp create() => CheckInHomeRsp._();
  CheckInHomeRsp createEmptyInstance() => create();
  static $pb.PbList<CheckInHomeRsp> createRepeated() =>
      $pb.PbList<CheckInHomeRsp>();
  @$core.pragma('dart2js:noInline')
  static CheckInHomeRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckInHomeRsp>(create);
  static CheckInHomeRsp? _defaultInstance;

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
  CheckInHomeRsp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(CheckInHomeRsp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  CheckInHomeRsp_Data ensureData() => $_ensure(2);
}

class CheckInRsp_Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CheckInRsp.Data',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<CheckInRewardItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'reward',
        subBuilder: CheckInRewardItem.create)
    ..hasRequiredFields = false;

  CheckInRsp_Data._() : super();
  factory CheckInRsp_Data({
    CheckInRewardItem? reward,
  }) {
    final _result = create();
    if (reward != null) {
      _result.reward = reward;
    }
    return _result;
  }
  factory CheckInRsp_Data.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CheckInRsp_Data.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CheckInRsp_Data clone() => CheckInRsp_Data()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CheckInRsp_Data copyWith(void Function(CheckInRsp_Data) updates) =>
      super.copyWith((message) => updates(message as CheckInRsp_Data))
          as CheckInRsp_Data; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CheckInRsp_Data create() => CheckInRsp_Data._();
  CheckInRsp_Data createEmptyInstance() => create();
  static $pb.PbList<CheckInRsp_Data> createRepeated() =>
      $pb.PbList<CheckInRsp_Data>();
  @$core.pragma('dart2js:noInline')
  static CheckInRsp_Data getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckInRsp_Data>(create);
  static CheckInRsp_Data? _defaultInstance;

  @$pb.TagNumber(1)
  CheckInRewardItem get reward => $_getN(0);
  @$pb.TagNumber(1)
  set reward(CheckInRewardItem v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasReward() => $_has(0);
  @$pb.TagNumber(1)
  void clearReward() => clearField(1);
  @$pb.TagNumber(1)
  CheckInRewardItem ensureReward() => $_ensure(0);
}

class CheckInRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CheckInRsp',
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
    ..aOM<CheckInRsp_Data>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: CheckInRsp_Data.create)
    ..hasRequiredFields = false;

  CheckInRsp._() : super();
  factory CheckInRsp({
    $core.bool? success,
    $core.String? msg,
    CheckInRsp_Data? data,
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
  factory CheckInRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CheckInRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CheckInRsp clone() => CheckInRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CheckInRsp copyWith(void Function(CheckInRsp) updates) =>
      super.copyWith((message) => updates(message as CheckInRsp))
          as CheckInRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CheckInRsp create() => CheckInRsp._();
  CheckInRsp createEmptyInstance() => create();
  static $pb.PbList<CheckInRsp> createRepeated() => $pb.PbList<CheckInRsp>();
  @$core.pragma('dart2js:noInline')
  static CheckInRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckInRsp>(create);
  static CheckInRsp? _defaultInstance;

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
  CheckInRsp_Data get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(CheckInRsp_Data v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  CheckInRsp_Data ensureData() => $_ensure(2);
}
