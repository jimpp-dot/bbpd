///
//  Generated code. Do not modify.
//  source: rpc_room_frame.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class RPCReqCreate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RPCReqCreate',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'appId',
        $pb.PbFieldType.OU3,
        protoName: 'appId')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'property')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'factoryType',
        protoName: 'factoryType')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bicon')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'closeBox',
        $pb.PbFieldType.OU3,
        protoName: 'closeBox')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weight',
        $pb.PbFieldType.OU3)
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prefix')
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'settleChannel',
        protoName: 'settleChannel')
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleted',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nine',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'paier',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'reception',
        $pb.PbFieldType.OU3)
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'password')
    ..a<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagId',
        $pb.PbFieldType.OU3,
        protoName: 'tagId')
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subType',
        protoName: 'subType')
    ..a<$core.int>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rtcType',
        $pb.PbFieldType.OU3,
        protoName: 'rtcType')
    ..a<$core.int>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'puzzleId',
        $pb.PbFieldType.OU3,
        protoName: 'puzzleId')
    ..aOS(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unityVersion',
        protoName: 'unityVersion')
    ..a<$core.int>(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mystery',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isTwo',
        $pb.PbFieldType.OU3,
        protoName: 'isTwo')
    ..a<$core.int>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isVisit',
        $pb.PbFieldType.OU3,
        protoName: 'isVisit')
    ..a<$core.int>(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isMatch',
        $pb.PbFieldType.OU3,
        protoName: 'isMatch')
    ..a<$core.int>(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'posNum',
        $pb.PbFieldType.OU3,
        protoName: 'posNum')
    ..a<$core.int>(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jVersion',
        $pb.PbFieldType.OU3,
        protoName: 'jVersion')
    ..a<$core.int>(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pubHomeRid',
        $pb.PbFieldType.OU3,
        protoName: 'pubHomeRid')
    ..a<$core.int>(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pubHomeUid',
        $pb.PbFieldType.OU3,
        protoName: 'pubHomeUid')
    ..a<$core.int>(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pubHomeVer',
        $pb.PbFieldType.OU3,
        protoName: 'pubHomeVer')
    ..a<$core.int>(
        38,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pubMenuId',
        $pb.PbFieldType.OU3,
        protoName: 'pubMenuId')
    ..a<$core.int>(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'withFriend',
        $pb.PbFieldType.O3,
        protoName: 'withFriend')
    ..aOS(
        40,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'platform')
    ..a<$core.int>(
        41,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlyNew',
        $pb.PbFieldType.O3,
        protoName: 'onlyNew')
    ..a<$core.int>(
        42,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftWish',
        $pb.PbFieldType.OU3,
        protoName: 'giftWish')
    ..aOS(
        43,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'puzzleChannel',
        protoName: 'puzzleChannel')
    ..aOS(
        44,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'language')
    ..a<$core.int>(
        45,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extendVersion',
        $pb.PbFieldType.OU3,
        protoName: 'extendVersion')
    ..a<$core.int>(
        46,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'apraId',
        $pb.PbFieldType.OU3,
        protoName: 'apraId')
    ..aOS(
        47,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'personalTag',
        protoName: 'personalTag')
    ..aOS(
        48,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'interestTag',
        protoName: 'interestTag')
    ..aOS(
        49,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomArea',
        protoName: 'roomArea')
    ..a<$core.int>(
        50,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isCreateRtcType',
        $pb.PbFieldType.OU3,
        protoName: 'isCreateRtcType')
    ..aOS(
        51,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'package')
    ..hasRequiredFields = false;

  RPCReqCreate._() : super();
  factory RPCReqCreate({
    $core.int? rid,
    $core.int? uid,
    $core.int? appId,
    $core.String? property,
    $core.String? type,
    $core.String? factoryType,
    $core.String? name,
    $core.int? sex,
    $core.String? icon,
    $core.String? bicon,
    $core.int? closeBox,
    $core.String? description,
    $core.int? weight,
    $core.String? prefix,
    $core.String? settleChannel,
    $core.int? state,
    $core.int? deleted,
    $core.int? nine,
    $core.int? paier,
    $core.int? reception,
    $core.String? password,
    $core.int? tagId,
    $core.String? subType,
    $core.int? rtcType,
    $core.int? cid,
    $core.int? puzzleId,
    $core.String? unityVersion,
    $core.int? mystery,
    $core.int? jid,
    $core.int? isTwo,
    $core.int? isVisit,
    $core.int? isMatch,
    $core.int? posNum,
    $core.int? jVersion,
    $core.int? pubHomeRid,
    $core.int? pubHomeUid,
    $core.int? pubHomeVer,
    $core.int? pubMenuId,
    $core.int? withFriend,
    $core.String? platform,
    $core.int? onlyNew,
    $core.int? giftWish,
    $core.String? puzzleChannel,
    $core.String? language,
    $core.int? extendVersion,
    $core.int? apraId,
    $core.String? personalTag,
    $core.String? interestTag,
    $core.String? roomArea,
    $core.int? isCreateRtcType,
    $core.String? package,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (appId != null) {
      _result.appId = appId;
    }
    if (property != null) {
      _result.property = property;
    }
    if (type != null) {
      _result.type = type;
    }
    if (factoryType != null) {
      _result.factoryType = factoryType;
    }
    if (name != null) {
      _result.name = name;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (bicon != null) {
      _result.bicon = bicon;
    }
    if (closeBox != null) {
      _result.closeBox = closeBox;
    }
    if (description != null) {
      _result.description = description;
    }
    if (weight != null) {
      _result.weight = weight;
    }
    if (prefix != null) {
      _result.prefix = prefix;
    }
    if (settleChannel != null) {
      _result.settleChannel = settleChannel;
    }
    if (state != null) {
      _result.state = state;
    }
    if (deleted != null) {
      _result.deleted = deleted;
    }
    if (nine != null) {
      _result.nine = nine;
    }
    if (paier != null) {
      _result.paier = paier;
    }
    if (reception != null) {
      _result.reception = reception;
    }
    if (password != null) {
      _result.password = password;
    }
    if (tagId != null) {
      _result.tagId = tagId;
    }
    if (subType != null) {
      _result.subType = subType;
    }
    if (rtcType != null) {
      _result.rtcType = rtcType;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (puzzleId != null) {
      _result.puzzleId = puzzleId;
    }
    if (unityVersion != null) {
      _result.unityVersion = unityVersion;
    }
    if (mystery != null) {
      _result.mystery = mystery;
    }
    if (jid != null) {
      _result.jid = jid;
    }
    if (isTwo != null) {
      _result.isTwo = isTwo;
    }
    if (isVisit != null) {
      _result.isVisit = isVisit;
    }
    if (isMatch != null) {
      _result.isMatch = isMatch;
    }
    if (posNum != null) {
      _result.posNum = posNum;
    }
    if (jVersion != null) {
      _result.jVersion = jVersion;
    }
    if (pubHomeRid != null) {
      _result.pubHomeRid = pubHomeRid;
    }
    if (pubHomeUid != null) {
      _result.pubHomeUid = pubHomeUid;
    }
    if (pubHomeVer != null) {
      _result.pubHomeVer = pubHomeVer;
    }
    if (pubMenuId != null) {
      _result.pubMenuId = pubMenuId;
    }
    if (withFriend != null) {
      _result.withFriend = withFriend;
    }
    if (platform != null) {
      _result.platform = platform;
    }
    if (onlyNew != null) {
      _result.onlyNew = onlyNew;
    }
    if (giftWish != null) {
      _result.giftWish = giftWish;
    }
    if (puzzleChannel != null) {
      _result.puzzleChannel = puzzleChannel;
    }
    if (language != null) {
      _result.language = language;
    }
    if (extendVersion != null) {
      _result.extendVersion = extendVersion;
    }
    if (apraId != null) {
      _result.apraId = apraId;
    }
    if (personalTag != null) {
      _result.personalTag = personalTag;
    }
    if (interestTag != null) {
      _result.interestTag = interestTag;
    }
    if (roomArea != null) {
      _result.roomArea = roomArea;
    }
    if (isCreateRtcType != null) {
      _result.isCreateRtcType = isCreateRtcType;
    }
    if (package != null) {
      _result.package = package;
    }
    return _result;
  }
  factory RPCReqCreate.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RPCReqCreate.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RPCReqCreate clone() => RPCReqCreate()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RPCReqCreate copyWith(void Function(RPCReqCreate) updates) =>
      super.copyWith((message) => updates(message as RPCReqCreate))
          as RPCReqCreate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RPCReqCreate create() => RPCReqCreate._();
  RPCReqCreate createEmptyInstance() => create();
  static $pb.PbList<RPCReqCreate> createRepeated() =>
      $pb.PbList<RPCReqCreate>();
  @$core.pragma('dart2js:noInline')
  static RPCReqCreate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RPCReqCreate>(create);
  static RPCReqCreate? _defaultInstance;

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
  $core.int get appId => $_getIZ(2);
  @$pb.TagNumber(3)
  set appId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAppId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAppId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get property => $_getSZ(3);
  @$pb.TagNumber(4)
  set property($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasProperty() => $_has(3);
  @$pb.TagNumber(4)
  void clearProperty() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get type => $_getSZ(4);
  @$pb.TagNumber(5)
  set type($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get factoryType => $_getSZ(5);
  @$pb.TagNumber(6)
  set factoryType($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasFactoryType() => $_has(5);
  @$pb.TagNumber(6)
  void clearFactoryType() => clearField(6);

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
  $core.int get sex => $_getIZ(7);
  @$pb.TagNumber(8)
  set sex($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSex() => $_has(7);
  @$pb.TagNumber(8)
  void clearSex() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get icon => $_getSZ(8);
  @$pb.TagNumber(9)
  set icon($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasIcon() => $_has(8);
  @$pb.TagNumber(9)
  void clearIcon() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get bicon => $_getSZ(9);
  @$pb.TagNumber(10)
  set bicon($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasBicon() => $_has(9);
  @$pb.TagNumber(10)
  void clearBicon() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get closeBox => $_getIZ(10);
  @$pb.TagNumber(11)
  set closeBox($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasCloseBox() => $_has(10);
  @$pb.TagNumber(11)
  void clearCloseBox() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get description => $_getSZ(11);
  @$pb.TagNumber(12)
  set description($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasDescription() => $_has(11);
  @$pb.TagNumber(12)
  void clearDescription() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get weight => $_getIZ(12);
  @$pb.TagNumber(13)
  set weight($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasWeight() => $_has(12);
  @$pb.TagNumber(13)
  void clearWeight() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get prefix => $_getSZ(13);
  @$pb.TagNumber(14)
  set prefix($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasPrefix() => $_has(13);
  @$pb.TagNumber(14)
  void clearPrefix() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get settleChannel => $_getSZ(14);
  @$pb.TagNumber(15)
  set settleChannel($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasSettleChannel() => $_has(14);
  @$pb.TagNumber(15)
  void clearSettleChannel() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get state => $_getIZ(15);
  @$pb.TagNumber(16)
  set state($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasState() => $_has(15);
  @$pb.TagNumber(16)
  void clearState() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get deleted => $_getIZ(16);
  @$pb.TagNumber(17)
  set deleted($core.int v) {
    $_setSignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasDeleted() => $_has(16);
  @$pb.TagNumber(17)
  void clearDeleted() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get nine => $_getIZ(17);
  @$pb.TagNumber(18)
  set nine($core.int v) {
    $_setSignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasNine() => $_has(17);
  @$pb.TagNumber(18)
  void clearNine() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get paier => $_getIZ(18);
  @$pb.TagNumber(19)
  set paier($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasPaier() => $_has(18);
  @$pb.TagNumber(19)
  void clearPaier() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get reception => $_getIZ(19);
  @$pb.TagNumber(20)
  set reception($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasReception() => $_has(19);
  @$pb.TagNumber(20)
  void clearReception() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get password => $_getSZ(20);
  @$pb.TagNumber(21)
  set password($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasPassword() => $_has(20);
  @$pb.TagNumber(21)
  void clearPassword() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get tagId => $_getIZ(21);
  @$pb.TagNumber(22)
  set tagId($core.int v) {
    $_setUnsignedInt32(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasTagId() => $_has(21);
  @$pb.TagNumber(22)
  void clearTagId() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get subType => $_getSZ(22);
  @$pb.TagNumber(23)
  set subType($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasSubType() => $_has(22);
  @$pb.TagNumber(23)
  void clearSubType() => clearField(23);

  @$pb.TagNumber(24)
  $core.int get rtcType => $_getIZ(23);
  @$pb.TagNumber(24)
  set rtcType($core.int v) {
    $_setUnsignedInt32(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasRtcType() => $_has(23);
  @$pb.TagNumber(24)
  void clearRtcType() => clearField(24);

  @$pb.TagNumber(25)
  $core.int get cid => $_getIZ(24);
  @$pb.TagNumber(25)
  set cid($core.int v) {
    $_setUnsignedInt32(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasCid() => $_has(24);
  @$pb.TagNumber(25)
  void clearCid() => clearField(25);

  @$pb.TagNumber(26)
  $core.int get puzzleId => $_getIZ(25);
  @$pb.TagNumber(26)
  set puzzleId($core.int v) {
    $_setUnsignedInt32(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasPuzzleId() => $_has(25);
  @$pb.TagNumber(26)
  void clearPuzzleId() => clearField(26);

  @$pb.TagNumber(27)
  $core.String get unityVersion => $_getSZ(26);
  @$pb.TagNumber(27)
  set unityVersion($core.String v) {
    $_setString(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasUnityVersion() => $_has(26);
  @$pb.TagNumber(27)
  void clearUnityVersion() => clearField(27);

  @$pb.TagNumber(28)
  $core.int get mystery => $_getIZ(27);
  @$pb.TagNumber(28)
  set mystery($core.int v) {
    $_setUnsignedInt32(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasMystery() => $_has(27);
  @$pb.TagNumber(28)
  void clearMystery() => clearField(28);

  @$pb.TagNumber(29)
  $core.int get jid => $_getIZ(28);
  @$pb.TagNumber(29)
  set jid($core.int v) {
    $_setUnsignedInt32(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasJid() => $_has(28);
  @$pb.TagNumber(29)
  void clearJid() => clearField(29);

  @$pb.TagNumber(30)
  $core.int get isTwo => $_getIZ(29);
  @$pb.TagNumber(30)
  set isTwo($core.int v) {
    $_setUnsignedInt32(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasIsTwo() => $_has(29);
  @$pb.TagNumber(30)
  void clearIsTwo() => clearField(30);

  @$pb.TagNumber(31)
  $core.int get isVisit => $_getIZ(30);
  @$pb.TagNumber(31)
  set isVisit($core.int v) {
    $_setUnsignedInt32(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasIsVisit() => $_has(30);
  @$pb.TagNumber(31)
  void clearIsVisit() => clearField(31);

  @$pb.TagNumber(32)
  $core.int get isMatch => $_getIZ(31);
  @$pb.TagNumber(32)
  set isMatch($core.int v) {
    $_setUnsignedInt32(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasIsMatch() => $_has(31);
  @$pb.TagNumber(32)
  void clearIsMatch() => clearField(32);

  @$pb.TagNumber(33)
  $core.int get posNum => $_getIZ(32);
  @$pb.TagNumber(33)
  set posNum($core.int v) {
    $_setUnsignedInt32(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasPosNum() => $_has(32);
  @$pb.TagNumber(33)
  void clearPosNum() => clearField(33);

  @$pb.TagNumber(34)
  $core.int get jVersion => $_getIZ(33);
  @$pb.TagNumber(34)
  set jVersion($core.int v) {
    $_setUnsignedInt32(33, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasJVersion() => $_has(33);
  @$pb.TagNumber(34)
  void clearJVersion() => clearField(34);

  @$pb.TagNumber(35)
  $core.int get pubHomeRid => $_getIZ(34);
  @$pb.TagNumber(35)
  set pubHomeRid($core.int v) {
    $_setUnsignedInt32(34, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasPubHomeRid() => $_has(34);
  @$pb.TagNumber(35)
  void clearPubHomeRid() => clearField(35);

  @$pb.TagNumber(36)
  $core.int get pubHomeUid => $_getIZ(35);
  @$pb.TagNumber(36)
  set pubHomeUid($core.int v) {
    $_setUnsignedInt32(35, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasPubHomeUid() => $_has(35);
  @$pb.TagNumber(36)
  void clearPubHomeUid() => clearField(36);

  @$pb.TagNumber(37)
  $core.int get pubHomeVer => $_getIZ(36);
  @$pb.TagNumber(37)
  set pubHomeVer($core.int v) {
    $_setUnsignedInt32(36, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasPubHomeVer() => $_has(36);
  @$pb.TagNumber(37)
  void clearPubHomeVer() => clearField(37);

  @$pb.TagNumber(38)
  $core.int get pubMenuId => $_getIZ(37);
  @$pb.TagNumber(38)
  set pubMenuId($core.int v) {
    $_setUnsignedInt32(37, v);
  }

  @$pb.TagNumber(38)
  $core.bool hasPubMenuId() => $_has(37);
  @$pb.TagNumber(38)
  void clearPubMenuId() => clearField(38);

  @$pb.TagNumber(39)
  $core.int get withFriend => $_getIZ(38);
  @$pb.TagNumber(39)
  set withFriend($core.int v) {
    $_setSignedInt32(38, v);
  }

  @$pb.TagNumber(39)
  $core.bool hasWithFriend() => $_has(38);
  @$pb.TagNumber(39)
  void clearWithFriend() => clearField(39);

  @$pb.TagNumber(40)
  $core.String get platform => $_getSZ(39);
  @$pb.TagNumber(40)
  set platform($core.String v) {
    $_setString(39, v);
  }

  @$pb.TagNumber(40)
  $core.bool hasPlatform() => $_has(39);
  @$pb.TagNumber(40)
  void clearPlatform() => clearField(40);

  @$pb.TagNumber(41)
  $core.int get onlyNew => $_getIZ(40);
  @$pb.TagNumber(41)
  set onlyNew($core.int v) {
    $_setSignedInt32(40, v);
  }

  @$pb.TagNumber(41)
  $core.bool hasOnlyNew() => $_has(40);
  @$pb.TagNumber(41)
  void clearOnlyNew() => clearField(41);

  @$pb.TagNumber(42)
  $core.int get giftWish => $_getIZ(41);
  @$pb.TagNumber(42)
  set giftWish($core.int v) {
    $_setUnsignedInt32(41, v);
  }

  @$pb.TagNumber(42)
  $core.bool hasGiftWish() => $_has(41);
  @$pb.TagNumber(42)
  void clearGiftWish() => clearField(42);

  @$pb.TagNumber(43)
  $core.String get puzzleChannel => $_getSZ(42);
  @$pb.TagNumber(43)
  set puzzleChannel($core.String v) {
    $_setString(42, v);
  }

  @$pb.TagNumber(43)
  $core.bool hasPuzzleChannel() => $_has(42);
  @$pb.TagNumber(43)
  void clearPuzzleChannel() => clearField(43);

  @$pb.TagNumber(44)
  $core.String get language => $_getSZ(43);
  @$pb.TagNumber(44)
  set language($core.String v) {
    $_setString(43, v);
  }

  @$pb.TagNumber(44)
  $core.bool hasLanguage() => $_has(43);
  @$pb.TagNumber(44)
  void clearLanguage() => clearField(44);

  @$pb.TagNumber(45)
  $core.int get extendVersion => $_getIZ(44);
  @$pb.TagNumber(45)
  set extendVersion($core.int v) {
    $_setUnsignedInt32(44, v);
  }

  @$pb.TagNumber(45)
  $core.bool hasExtendVersion() => $_has(44);
  @$pb.TagNumber(45)
  void clearExtendVersion() => clearField(45);

  @$pb.TagNumber(46)
  $core.int get apraId => $_getIZ(45);
  @$pb.TagNumber(46)
  set apraId($core.int v) {
    $_setUnsignedInt32(45, v);
  }

  @$pb.TagNumber(46)
  $core.bool hasApraId() => $_has(45);
  @$pb.TagNumber(46)
  void clearApraId() => clearField(46);

  @$pb.TagNumber(47)
  $core.String get personalTag => $_getSZ(46);
  @$pb.TagNumber(47)
  set personalTag($core.String v) {
    $_setString(46, v);
  }

  @$pb.TagNumber(47)
  $core.bool hasPersonalTag() => $_has(46);
  @$pb.TagNumber(47)
  void clearPersonalTag() => clearField(47);

  @$pb.TagNumber(48)
  $core.String get interestTag => $_getSZ(47);
  @$pb.TagNumber(48)
  set interestTag($core.String v) {
    $_setString(47, v);
  }

  @$pb.TagNumber(48)
  $core.bool hasInterestTag() => $_has(47);
  @$pb.TagNumber(48)
  void clearInterestTag() => clearField(48);

  @$pb.TagNumber(49)
  $core.String get roomArea => $_getSZ(48);
  @$pb.TagNumber(49)
  set roomArea($core.String v) {
    $_setString(48, v);
  }

  @$pb.TagNumber(49)
  $core.bool hasRoomArea() => $_has(48);
  @$pb.TagNumber(49)
  void clearRoomArea() => clearField(49);

  @$pb.TagNumber(50)
  $core.int get isCreateRtcType => $_getIZ(49);
  @$pb.TagNumber(50)
  set isCreateRtcType($core.int v) {
    $_setUnsignedInt32(49, v);
  }

  @$pb.TagNumber(50)
  $core.bool hasIsCreateRtcType() => $_has(49);
  @$pb.TagNumber(50)
  void clearIsCreateRtcType() => clearField(50);

  @$pb.TagNumber(51)
  $core.String get package => $_getSZ(50);
  @$pb.TagNumber(51)
  set package($core.String v) {
    $_setString(50, v);
  }

  @$pb.TagNumber(51)
  $core.bool hasPackage() => $_has(50);
  @$pb.TagNumber(51)
  void clearPackage() => clearField(51);
}

class RPCResCreate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RPCResCreate',
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

  RPCResCreate._() : super();
  factory RPCResCreate({
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
  factory RPCResCreate.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RPCResCreate.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RPCResCreate clone() => RPCResCreate()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RPCResCreate copyWith(void Function(RPCResCreate) updates) =>
      super.copyWith((message) => updates(message as RPCResCreate))
          as RPCResCreate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RPCResCreate create() => RPCResCreate._();
  RPCResCreate createEmptyInstance() => create();
  static $pb.PbList<RPCResCreate> createRepeated() =>
      $pb.PbList<RPCResCreate>();
  @$core.pragma('dart2js:noInline')
  static RPCResCreate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RPCResCreate>(create);
  static RPCResCreate? _defaultInstance;

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

class RPCReqEnter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RPCReqEnter',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toUid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RPCReqEnter._() : super();
  factory RPCReqEnter({
    $core.int? toUid,
  }) {
    final _result = create();
    if (toUid != null) {
      _result.toUid = toUid;
    }
    return _result;
  }
  factory RPCReqEnter.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RPCReqEnter.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RPCReqEnter clone() => RPCReqEnter()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RPCReqEnter copyWith(void Function(RPCReqEnter) updates) =>
      super.copyWith((message) => updates(message as RPCReqEnter))
          as RPCReqEnter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RPCReqEnter create() => RPCReqEnter._();
  RPCReqEnter createEmptyInstance() => create();
  static $pb.PbList<RPCReqEnter> createRepeated() => $pb.PbList<RPCReqEnter>();
  @$core.pragma('dart2js:noInline')
  static RPCReqEnter getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RPCReqEnter>(create);
  static RPCReqEnter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get toUid => $_getIZ(0);
  @$pb.TagNumber(1)
  set toUid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasToUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUid() => clearField(1);
}

class RPCReqLeave extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RPCReqLeave',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toUid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RPCReqLeave._() : super();
  factory RPCReqLeave({
    $core.int? toUid,
  }) {
    final _result = create();
    if (toUid != null) {
      _result.toUid = toUid;
    }
    return _result;
  }
  factory RPCReqLeave.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RPCReqLeave.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RPCReqLeave clone() => RPCReqLeave()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RPCReqLeave copyWith(void Function(RPCReqLeave) updates) =>
      super.copyWith((message) => updates(message as RPCReqLeave))
          as RPCReqLeave; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RPCReqLeave create() => RPCReqLeave._();
  RPCReqLeave createEmptyInstance() => create();
  static $pb.PbList<RPCReqLeave> createRepeated() => $pb.PbList<RPCReqLeave>();
  @$core.pragma('dart2js:noInline')
  static RPCReqLeave getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RPCReqLeave>(create);
  static RPCReqLeave? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get toUid => $_getIZ(0);
  @$pb.TagNumber(1)
  set toUid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasToUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUid() => clearField(1);
}

class RPCReqOnMic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RPCReqOnMic',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vrid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RPCReqOnMic._() : super();
  factory RPCReqOnMic({
    $core.int? toUid,
    $core.int? position,
    $core.int? version,
    $core.int? vrid,
  }) {
    final _result = create();
    if (toUid != null) {
      _result.toUid = toUid;
    }
    if (position != null) {
      _result.position = position;
    }
    if (version != null) {
      _result.version = version;
    }
    if (vrid != null) {
      _result.vrid = vrid;
    }
    return _result;
  }
  factory RPCReqOnMic.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RPCReqOnMic.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RPCReqOnMic clone() => RPCReqOnMic()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RPCReqOnMic copyWith(void Function(RPCReqOnMic) updates) =>
      super.copyWith((message) => updates(message as RPCReqOnMic))
          as RPCReqOnMic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RPCReqOnMic create() => RPCReqOnMic._();
  RPCReqOnMic createEmptyInstance() => create();
  static $pb.PbList<RPCReqOnMic> createRepeated() => $pb.PbList<RPCReqOnMic>();
  @$core.pragma('dart2js:noInline')
  static RPCReqOnMic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RPCReqOnMic>(create);
  static RPCReqOnMic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get toUid => $_getIZ(0);
  @$pb.TagNumber(1)
  set toUid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasToUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get position => $_getIZ(1);
  @$pb.TagNumber(2)
  set position($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get version => $_getIZ(2);
  @$pb.TagNumber(3)
  set version($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get vrid => $_getIZ(3);
  @$pb.TagNumber(4)
  set vrid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasVrid() => $_has(3);
  @$pb.TagNumber(4)
  void clearVrid() => clearField(4);
}

class RPCReqOffMic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RPCReqOffMic',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vrid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RPCReqOffMic._() : super();
  factory RPCReqOffMic({
    $core.int? toUid,
    $core.int? vrid,
  }) {
    final _result = create();
    if (toUid != null) {
      _result.toUid = toUid;
    }
    if (vrid != null) {
      _result.vrid = vrid;
    }
    return _result;
  }
  factory RPCReqOffMic.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RPCReqOffMic.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RPCReqOffMic clone() => RPCReqOffMic()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RPCReqOffMic copyWith(void Function(RPCReqOffMic) updates) =>
      super.copyWith((message) => updates(message as RPCReqOffMic))
          as RPCReqOffMic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RPCReqOffMic create() => RPCReqOffMic._();
  RPCReqOffMic createEmptyInstance() => create();
  static $pb.PbList<RPCReqOffMic> createRepeated() =>
      $pb.PbList<RPCReqOffMic>();
  @$core.pragma('dart2js:noInline')
  static RPCReqOffMic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RPCReqOffMic>(create);
  static RPCReqOffMic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get toUid => $_getIZ(0);
  @$pb.TagNumber(1)
  set toUid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasToUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get vrid => $_getIZ(1);
  @$pb.TagNumber(2)
  set vrid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVrid() => $_has(1);
  @$pb.TagNumber(2)
  void clearVrid() => clearField(2);
}

class RPCReqOpMic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RPCReqOpMic',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'op')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RPCReqOpMic._() : super();
  factory RPCReqOpMic({
    $core.int? position,
    $core.String? op,
    $core.int? duration,
  }) {
    final _result = create();
    if (position != null) {
      _result.position = position;
    }
    if (op != null) {
      _result.op = op;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    return _result;
  }
  factory RPCReqOpMic.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RPCReqOpMic.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RPCReqOpMic clone() => RPCReqOpMic()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RPCReqOpMic copyWith(void Function(RPCReqOpMic) updates) =>
      super.copyWith((message) => updates(message as RPCReqOpMic))
          as RPCReqOpMic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RPCReqOpMic create() => RPCReqOpMic._();
  RPCReqOpMic createEmptyInstance() => create();
  static $pb.PbList<RPCReqOpMic> createRepeated() => $pb.PbList<RPCReqOpMic>();
  @$core.pragma('dart2js:noInline')
  static RPCReqOpMic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RPCReqOpMic>(create);
  static RPCReqOpMic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get position => $_getIZ(0);
  @$pb.TagNumber(1)
  set position($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get op => $_getSZ(1);
  @$pb.TagNumber(2)
  set op($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOp() => $_has(1);
  @$pb.TagNumber(2)
  void clearOp() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get duration => $_getIZ(2);
  @$pb.TagNumber(3)
  set duration($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuration() => clearField(3);
}

class RPCReqWaitMic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RPCReqWaitMic',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boss',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RPCReqWaitMic._() : super();
  factory RPCReqWaitMic({
    $core.int? toUid,
    $core.int? position,
    $core.int? version,
    $core.int? boss,
  }) {
    final _result = create();
    if (toUid != null) {
      _result.toUid = toUid;
    }
    if (position != null) {
      _result.position = position;
    }
    if (version != null) {
      _result.version = version;
    }
    if (boss != null) {
      _result.boss = boss;
    }
    return _result;
  }
  factory RPCReqWaitMic.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RPCReqWaitMic.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RPCReqWaitMic clone() => RPCReqWaitMic()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RPCReqWaitMic copyWith(void Function(RPCReqWaitMic) updates) =>
      super.copyWith((message) => updates(message as RPCReqWaitMic))
          as RPCReqWaitMic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RPCReqWaitMic create() => RPCReqWaitMic._();
  RPCReqWaitMic createEmptyInstance() => create();
  static $pb.PbList<RPCReqWaitMic> createRepeated() =>
      $pb.PbList<RPCReqWaitMic>();
  @$core.pragma('dart2js:noInline')
  static RPCReqWaitMic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RPCReqWaitMic>(create);
  static RPCReqWaitMic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get toUid => $_getIZ(0);
  @$pb.TagNumber(1)
  set toUid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasToUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get position => $_getIZ(1);
  @$pb.TagNumber(2)
  set position($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get version => $_getIZ(2);
  @$pb.TagNumber(3)
  set version($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get boss => $_getIZ(3);
  @$pb.TagNumber(4)
  set boss($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBoss() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoss() => clearField(4);
}

class WaitMicPositionTable extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WaitMicPositionTable',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'display',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  WaitMicPositionTable._() : super();
  factory WaitMicPositionTable({
    $core.int? position,
    $core.int? display,
    $core.int? uid,
  }) {
    final _result = create();
    if (position != null) {
      _result.position = position;
    }
    if (display != null) {
      _result.display = display;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory WaitMicPositionTable.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WaitMicPositionTable.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WaitMicPositionTable clone() =>
      WaitMicPositionTable()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WaitMicPositionTable copyWith(void Function(WaitMicPositionTable) updates) =>
      super.copyWith((message) => updates(message as WaitMicPositionTable))
          as WaitMicPositionTable; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WaitMicPositionTable create() => WaitMicPositionTable._();
  WaitMicPositionTable createEmptyInstance() => create();
  static $pb.PbList<WaitMicPositionTable> createRepeated() =>
      $pb.PbList<WaitMicPositionTable>();
  @$core.pragma('dart2js:noInline')
  static WaitMicPositionTable getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WaitMicPositionTable>(create);
  static WaitMicPositionTable? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get position => $_getIZ(0);
  @$pb.TagNumber(1)
  set position($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get display => $_getIZ(1);
  @$pb.TagNumber(2)
  set display($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDisplay() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplay() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get uid => $_getIZ(2);
  @$pb.TagNumber(3)
  set uid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);
}

class WaitMicQueueRank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WaitMicQueueRank',
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
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'birthday',
        $pb.PbFieldType.OU3)
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
            : 'payMoney',
        $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payRoomMoney',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'datelineDiff')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'year',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'applyTime',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  WaitMicQueueRank._() : super();
  factory WaitMicQueueRank({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? sex,
    $core.int? birthday,
    $core.int? version,
    $core.int? payMoney,
    $fixnum.Int64? payRoomMoney,
    $core.int? title,
    $core.String? datelineDiff,
    $core.int? vip,
    $core.int? year,
    $core.int? applyTime,
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
    if (payMoney != null) {
      _result.payMoney = payMoney;
    }
    if (payRoomMoney != null) {
      _result.payRoomMoney = payRoomMoney;
    }
    if (title != null) {
      _result.title = title;
    }
    if (datelineDiff != null) {
      _result.datelineDiff = datelineDiff;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (year != null) {
      _result.year = year;
    }
    if (applyTime != null) {
      _result.applyTime = applyTime;
    }
    return _result;
  }
  factory WaitMicQueueRank.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WaitMicQueueRank.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WaitMicQueueRank clone() => WaitMicQueueRank()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WaitMicQueueRank copyWith(void Function(WaitMicQueueRank) updates) =>
      super.copyWith((message) => updates(message as WaitMicQueueRank))
          as WaitMicQueueRank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WaitMicQueueRank create() => WaitMicQueueRank._();
  WaitMicQueueRank createEmptyInstance() => create();
  static $pb.PbList<WaitMicQueueRank> createRepeated() =>
      $pb.PbList<WaitMicQueueRank>();
  @$core.pragma('dart2js:noInline')
  static WaitMicQueueRank getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WaitMicQueueRank>(create);
  static WaitMicQueueRank? _defaultInstance;

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
  $core.int get birthday => $_getIZ(4);
  @$pb.TagNumber(5)
  set birthday($core.int v) {
    $_setUnsignedInt32(4, v);
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
  $core.int get payMoney => $_getIZ(6);
  @$pb.TagNumber(7)
  set payMoney($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPayMoney() => $_has(6);
  @$pb.TagNumber(7)
  void clearPayMoney() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get payRoomMoney => $_getI64(7);
  @$pb.TagNumber(8)
  set payRoomMoney($fixnum.Int64 v) {
    $_setInt64(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPayRoomMoney() => $_has(7);
  @$pb.TagNumber(8)
  void clearPayRoomMoney() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get title => $_getIZ(8);
  @$pb.TagNumber(9)
  set title($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTitle() => $_has(8);
  @$pb.TagNumber(9)
  void clearTitle() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get datelineDiff => $_getSZ(9);
  @$pb.TagNumber(10)
  set datelineDiff($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasDatelineDiff() => $_has(9);
  @$pb.TagNumber(10)
  void clearDatelineDiff() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get vip => $_getIZ(10);
  @$pb.TagNumber(11)
  set vip($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasVip() => $_has(10);
  @$pb.TagNumber(11)
  void clearVip() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get year => $_getIZ(11);
  @$pb.TagNumber(12)
  set year($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasYear() => $_has(11);
  @$pb.TagNumber(12)
  void clearYear() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get applyTime => $_getIZ(12);
  @$pb.TagNumber(13)
  set applyTime($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasApplyTime() => $_has(12);
  @$pb.TagNumber(13)
  void clearApplyTime() => clearField(13);
}

class RPCResWaitMic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RPCResWaitMic',
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
    ..pc<WaitMicQueueRank>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: WaitMicQueueRank.create)
    ..pc<WaitMicPositionTable>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'positionTable',
        $pb.PbFieldType.PM,
        subBuilder: WaitMicPositionTable.create)
    ..hasRequiredFields = false;

  RPCResWaitMic._() : super();
  factory RPCResWaitMic({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<WaitMicQueueRank>? data,
    $core.Iterable<WaitMicPositionTable>? positionTable,
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
    if (positionTable != null) {
      _result.positionTable.addAll(positionTable);
    }
    return _result;
  }
  factory RPCResWaitMic.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RPCResWaitMic.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RPCResWaitMic clone() => RPCResWaitMic()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RPCResWaitMic copyWith(void Function(RPCResWaitMic) updates) =>
      super.copyWith((message) => updates(message as RPCResWaitMic))
          as RPCResWaitMic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RPCResWaitMic create() => RPCResWaitMic._();
  RPCResWaitMic createEmptyInstance() => create();
  static $pb.PbList<RPCResWaitMic> createRepeated() =>
      $pb.PbList<RPCResWaitMic>();
  @$core.pragma('dart2js:noInline')
  static RPCResWaitMic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RPCResWaitMic>(create);
  static RPCResWaitMic? _defaultInstance;

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
  $core.List<WaitMicQueueRank> get data => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<WaitMicPositionTable> get positionTable => $_getList(3);
}

class RPCReqKickOut extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RPCReqKickOut',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RPCReqKickOut._() : super();
  factory RPCReqKickOut({
    $core.int? toUid,
    $core.int? time,
    $core.int? position,
  }) {
    final _result = create();
    if (toUid != null) {
      _result.toUid = toUid;
    }
    if (time != null) {
      _result.time = time;
    }
    if (position != null) {
      _result.position = position;
    }
    return _result;
  }
  factory RPCReqKickOut.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RPCReqKickOut.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RPCReqKickOut clone() => RPCReqKickOut()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RPCReqKickOut copyWith(void Function(RPCReqKickOut) updates) =>
      super.copyWith((message) => updates(message as RPCReqKickOut))
          as RPCReqKickOut; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RPCReqKickOut create() => RPCReqKickOut._();
  RPCReqKickOut createEmptyInstance() => create();
  static $pb.PbList<RPCReqKickOut> createRepeated() =>
      $pb.PbList<RPCReqKickOut>();
  @$core.pragma('dart2js:noInline')
  static RPCReqKickOut getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RPCReqKickOut>(create);
  static RPCReqKickOut? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get toUid => $_getIZ(0);
  @$pb.TagNumber(1)
  set toUid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasToUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get time => $_getIZ(1);
  @$pb.TagNumber(2)
  set time($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get position => $_getIZ(2);
  @$pb.TagNumber(3)
  set position($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearPosition() => clearField(3);
}

class RPCReqCloseRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RPCReqCloseRoom',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  RPCReqCloseRoom._() : super();
  factory RPCReqCloseRoom() => create();
  factory RPCReqCloseRoom.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RPCReqCloseRoom.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RPCReqCloseRoom clone() => RPCReqCloseRoom()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RPCReqCloseRoom copyWith(void Function(RPCReqCloseRoom) updates) =>
      super.copyWith((message) => updates(message as RPCReqCloseRoom))
          as RPCReqCloseRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RPCReqCloseRoom create() => RPCReqCloseRoom._();
  RPCReqCloseRoom createEmptyInstance() => create();
  static $pb.PbList<RPCReqCloseRoom> createRepeated() =>
      $pb.PbList<RPCReqCloseRoom>();
  @$core.pragma('dart2js:noInline')
  static RPCReqCloseRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RPCReqCloseRoom>(create);
  static RPCReqCloseRoom? _defaultInstance;
}

class RPCReqOffline extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RPCReqOffline',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'toUid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RPCReqOffline._() : super();
  factory RPCReqOffline({
    $core.int? toUid,
  }) {
    final _result = create();
    if (toUid != null) {
      _result.toUid = toUid;
    }
    return _result;
  }
  factory RPCReqOffline.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RPCReqOffline.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RPCReqOffline clone() => RPCReqOffline()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RPCReqOffline copyWith(void Function(RPCReqOffline) updates) =>
      super.copyWith((message) => updates(message as RPCReqOffline))
          as RPCReqOffline; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RPCReqOffline create() => RPCReqOffline._();
  RPCReqOffline createEmptyInstance() => create();
  static $pb.PbList<RPCReqOffline> createRepeated() =>
      $pb.PbList<RPCReqOffline>();
  @$core.pragma('dart2js:noInline')
  static RPCReqOffline getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RPCReqOffline>(create);
  static RPCReqOffline? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get toUid => $_getIZ(0);
  @$pb.TagNumber(1)
  set toUid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasToUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUid() => clearField(1);
}

class RPCResNormal extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RPCResNormal',
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

  RPCResNormal._() : super();
  factory RPCResNormal({
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
  factory RPCResNormal.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RPCResNormal.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RPCResNormal clone() => RPCResNormal()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RPCResNormal copyWith(void Function(RPCResNormal) updates) =>
      super.copyWith((message) => updates(message as RPCResNormal))
          as RPCResNormal; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RPCResNormal create() => RPCResNormal._();
  RPCResNormal createEmptyInstance() => create();
  static $pb.PbList<RPCResNormal> createRepeated() =>
      $pb.PbList<RPCResNormal>();
  @$core.pragma('dart2js:noInline')
  static RPCResNormal getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RPCResNormal>(create);
  static RPCResNormal? _defaultInstance;

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

class RPCReqRoomCmd extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RPCReqRoomCmd',
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
            : 'cmd')
    ..a<$core.List<$core.int>>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  RPCReqRoomCmd._() : super();
  factory RPCReqRoomCmd({
    $core.int? rid,
    $core.int? uid,
    $core.String? cmd,
    $core.List<$core.int>? data,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (cmd != null) {
      _result.cmd = cmd;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory RPCReqRoomCmd.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RPCReqRoomCmd.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RPCReqRoomCmd clone() => RPCReqRoomCmd()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RPCReqRoomCmd copyWith(void Function(RPCReqRoomCmd) updates) =>
      super.copyWith((message) => updates(message as RPCReqRoomCmd))
          as RPCReqRoomCmd; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RPCReqRoomCmd create() => RPCReqRoomCmd._();
  RPCReqRoomCmd createEmptyInstance() => create();
  static $pb.PbList<RPCReqRoomCmd> createRepeated() =>
      $pb.PbList<RPCReqRoomCmd>();
  @$core.pragma('dart2js:noInline')
  static RPCReqRoomCmd getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RPCReqRoomCmd>(create);
  static RPCReqRoomCmd? _defaultInstance;

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
  $core.String get cmd => $_getSZ(2);
  @$pb.TagNumber(3)
  set cmd($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCmd() => $_has(2);
  @$pb.TagNumber(3)
  void clearCmd() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get data => $_getN(3);
  @$pb.TagNumber(4)
  set data($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => clearField(4);
}
