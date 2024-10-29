///
//  Generated code. Do not modify.
//  source: sign_board.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ListBoardRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ListBoardRsp',
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
    ..aOM<SignData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: SignData.create)
    ..hasRequiredFields = false;

  ListBoardRsp._() : super();
  factory ListBoardRsp({
    $core.bool? success,
    $core.String? msg,
    SignData? data,
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
  factory ListBoardRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListBoardRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListBoardRsp clone() => ListBoardRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListBoardRsp copyWith(void Function(ListBoardRsp) updates) =>
      super.copyWith((message) => updates(message as ListBoardRsp))
          as ListBoardRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListBoardRsp create() => ListBoardRsp._();
  ListBoardRsp createEmptyInstance() => create();
  static $pb.PbList<ListBoardRsp> createRepeated() =>
      $pb.PbList<ListBoardRsp>();
  @$core.pragma('dart2js:noInline')
  static ListBoardRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListBoardRsp>(create);
  static ListBoardRsp? _defaultInstance;

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
  SignData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(SignData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  SignData ensureData() => $_ensure(2);
}

class SignData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SignData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'signed')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'weekDay',
        protoName: 'weekDay')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popTimes',
        $pb.PbFieldType.OU3,
        protoName: 'popTimes')
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'canSignWithoutMobile',
        protoName: 'canSignWithoutMobile')
    ..pc<SignBoard>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'board',
        $pb.PbFieldType.PM,
        subBuilder: SignBoard.create)
    ..hasRequiredFields = false;

  SignData._() : super();
  factory SignData({
    $core.bool? signed,
    $core.String? weekDay,
    $core.int? total,
    $core.int? popTimes,
    $core.bool? canSignWithoutMobile,
    $core.Iterable<SignBoard>? board,
  }) {
    final _result = create();
    if (signed != null) {
      _result.signed = signed;
    }
    if (weekDay != null) {
      _result.weekDay = weekDay;
    }
    if (total != null) {
      _result.total = total;
    }
    if (popTimes != null) {
      _result.popTimes = popTimes;
    }
    if (canSignWithoutMobile != null) {
      _result.canSignWithoutMobile = canSignWithoutMobile;
    }
    if (board != null) {
      _result.board.addAll(board);
    }
    return _result;
  }
  factory SignData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SignData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SignData clone() => SignData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SignData copyWith(void Function(SignData) updates) =>
      super.copyWith((message) => updates(message as SignData))
          as SignData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignData create() => SignData._();
  SignData createEmptyInstance() => create();
  static $pb.PbList<SignData> createRepeated() => $pb.PbList<SignData>();
  @$core.pragma('dart2js:noInline')
  static SignData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignData>(create);
  static SignData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get signed => $_getBF(0);
  @$pb.TagNumber(1)
  set signed($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSigned() => $_has(0);
  @$pb.TagNumber(1)
  void clearSigned() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get weekDay => $_getSZ(1);
  @$pb.TagNumber(2)
  set weekDay($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasWeekDay() => $_has(1);
  @$pb.TagNumber(2)
  void clearWeekDay() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get total => $_getIZ(2);
  @$pb.TagNumber(3)
  set total($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTotal() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotal() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get popTimes => $_getIZ(3);
  @$pb.TagNumber(4)
  set popTimes($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPopTimes() => $_has(3);
  @$pb.TagNumber(4)
  void clearPopTimes() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get canSignWithoutMobile => $_getBF(4);
  @$pb.TagNumber(5)
  set canSignWithoutMobile($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCanSignWithoutMobile() => $_has(4);
  @$pb.TagNumber(5)
  void clearCanSignWithoutMobile() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<SignBoard> get board => $_getList(5);
}

class SignBoard extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SignBoard',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'signType',
        $pb.PbFieldType.OU3,
        protoName: 'signType')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'missionType',
        $pb.PbFieldType.OU3,
        protoName: 'missionType')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'missionId',
        $pb.PbFieldType.OU3,
        protoName: 'missionId')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardType',
        protoName: 'awardType')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardIcon',
        protoName: 'awardIcon')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardNumCoin',
        $pb.PbFieldType.O3,
        protoName: 'awardNumCoin')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardIconCoin',
        protoName: 'awardIconCoin')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isSign',
        $pb.PbFieldType.O3,
        protoName: 'isSign')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awardNum',
        $pb.PbFieldType.O3,
        protoName: 'awardNum')
    ..hasRequiredFields = false;

  SignBoard._() : super();
  factory SignBoard({
    $core.int? signType,
    $core.int? missionType,
    $core.int? missionId,
    $core.String? awardType,
    $core.String? awardIcon,
    $core.int? awardNumCoin,
    $core.String? awardIconCoin,
    $core.int? isSign,
    $core.String? icon,
    $core.int? awardNum,
  }) {
    final _result = create();
    if (signType != null) {
      _result.signType = signType;
    }
    if (missionType != null) {
      _result.missionType = missionType;
    }
    if (missionId != null) {
      _result.missionId = missionId;
    }
    if (awardType != null) {
      _result.awardType = awardType;
    }
    if (awardIcon != null) {
      _result.awardIcon = awardIcon;
    }
    if (awardNumCoin != null) {
      _result.awardNumCoin = awardNumCoin;
    }
    if (awardIconCoin != null) {
      _result.awardIconCoin = awardIconCoin;
    }
    if (isSign != null) {
      _result.isSign = isSign;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (awardNum != null) {
      _result.awardNum = awardNum;
    }
    return _result;
  }
  factory SignBoard.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SignBoard.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SignBoard clone() => SignBoard()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SignBoard copyWith(void Function(SignBoard) updates) =>
      super.copyWith((message) => updates(message as SignBoard))
          as SignBoard; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignBoard create() => SignBoard._();
  SignBoard createEmptyInstance() => create();
  static $pb.PbList<SignBoard> createRepeated() => $pb.PbList<SignBoard>();
  @$core.pragma('dart2js:noInline')
  static SignBoard getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignBoard>(create);
  static SignBoard? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get signType => $_getIZ(0);
  @$pb.TagNumber(1)
  set signType($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSignType() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get missionType => $_getIZ(1);
  @$pb.TagNumber(2)
  set missionType($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMissionType() => $_has(1);
  @$pb.TagNumber(2)
  void clearMissionType() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get missionId => $_getIZ(2);
  @$pb.TagNumber(3)
  set missionId($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMissionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearMissionId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get awardType => $_getSZ(3);
  @$pb.TagNumber(4)
  set awardType($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAwardType() => $_has(3);
  @$pb.TagNumber(4)
  void clearAwardType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get awardIcon => $_getSZ(4);
  @$pb.TagNumber(5)
  set awardIcon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAwardIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearAwardIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get awardNumCoin => $_getIZ(5);
  @$pb.TagNumber(6)
  set awardNumCoin($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAwardNumCoin() => $_has(5);
  @$pb.TagNumber(6)
  void clearAwardNumCoin() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get awardIconCoin => $_getSZ(6);
  @$pb.TagNumber(7)
  set awardIconCoin($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasAwardIconCoin() => $_has(6);
  @$pb.TagNumber(7)
  void clearAwardIconCoin() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get isSign => $_getIZ(7);
  @$pb.TagNumber(8)
  set isSign($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasIsSign() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsSign() => clearField(8);

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
  $core.int get awardNum => $_getIZ(9);
  @$pb.TagNumber(10)
  set awardNum($core.int v) {
    $_setSignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasAwardNum() => $_has(9);
  @$pb.TagNumber(10)
  void clearAwardNum() => clearField(10);
}
