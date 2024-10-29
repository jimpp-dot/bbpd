///
//  Generated code. Do not modify.
//  source: account_frame.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AccountHeader extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccountHeader',
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
            : 'cid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveOnly',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveLabel')
    ..hasRequiredFields = false;

  AccountHeader._() : super();
  factory AccountHeader({
    $core.int? uid,
    $core.int? cid,
    $core.int? liveOnly,
    $core.String? liveLabel,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (liveOnly != null) {
      _result.liveOnly = liveOnly;
    }
    if (liveLabel != null) {
      _result.liveLabel = liveLabel;
    }
    return _result;
  }
  factory AccountHeader.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccountHeader.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccountHeader clone() => AccountHeader()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccountHeader copyWith(void Function(AccountHeader) updates) =>
      super.copyWith((message) => updates(message as AccountHeader))
          as AccountHeader; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountHeader create() => AccountHeader._();
  AccountHeader createEmptyInstance() => create();
  static $pb.PbList<AccountHeader> createRepeated() =>
      $pb.PbList<AccountHeader>();
  @$core.pragma('dart2js:noInline')
  static AccountHeader getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccountHeader>(create);
  static AccountHeader? _defaultInstance;

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
  $core.int get cid => $_getIZ(1);
  @$pb.TagNumber(2)
  set cid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get liveOnly => $_getIZ(2);
  @$pb.TagNumber(3)
  set liveOnly($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLiveOnly() => $_has(2);
  @$pb.TagNumber(3)
  void clearLiveOnly() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get liveLabel => $_getSZ(3);
  @$pb.TagNumber(4)
  set liveLabel($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLiveLabel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLiveLabel() => clearField(4);
}

class ResAccountFrame extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAccountFrame',
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
    ..m<$core.String, $core.String>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        entryClassName: 'ResAccountFrame.DataEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('pb'))
    ..pc<AccountHeader>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'headers',
        $pb.PbFieldType.PM,
        subBuilder: AccountHeader.create)
    ..hasRequiredFields = false;

  ResAccountFrame._() : super();
  factory ResAccountFrame({
    $core.bool? success,
    $core.String? msg,
    $core.Map<$core.String, $core.String>? data,
    $core.Iterable<AccountHeader>? headers,
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
    if (headers != null) {
      _result.headers.addAll(headers);
    }
    return _result;
  }
  factory ResAccountFrame.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAccountFrame.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAccountFrame clone() => ResAccountFrame()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAccountFrame copyWith(void Function(ResAccountFrame) updates) =>
      super.copyWith((message) => updates(message as ResAccountFrame))
          as ResAccountFrame; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAccountFrame create() => ResAccountFrame._();
  ResAccountFrame createEmptyInstance() => create();
  static $pb.PbList<ResAccountFrame> createRepeated() =>
      $pb.PbList<ResAccountFrame>();
  @$core.pragma('dart2js:noInline')
  static ResAccountFrame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAccountFrame>(create);
  static ResAccountFrame? _defaultInstance;

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
  $core.Map<$core.String, $core.String> get data => $_getMap(2);

  @$pb.TagNumber(4)
  $core.List<AccountHeader> get headers => $_getList(3);
}

class TransferShowData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TransferShowData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showTransfer')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showNlFriendRecommend')
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showRoomData')
    ..hasRequiredFields = false;

  TransferShowData._() : super();
  factory TransferShowData({
    $core.bool? showTransfer,
    $core.bool? showNlFriendRecommend,
    $core.bool? showRoomData,
  }) {
    final _result = create();
    if (showTransfer != null) {
      _result.showTransfer = showTransfer;
    }
    if (showNlFriendRecommend != null) {
      _result.showNlFriendRecommend = showNlFriendRecommend;
    }
    if (showRoomData != null) {
      _result.showRoomData = showRoomData;
    }
    return _result;
  }
  factory TransferShowData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TransferShowData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TransferShowData clone() => TransferShowData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TransferShowData copyWith(void Function(TransferShowData) updates) =>
      super.copyWith((message) => updates(message as TransferShowData))
          as TransferShowData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransferShowData create() => TransferShowData._();
  TransferShowData createEmptyInstance() => create();
  static $pb.PbList<TransferShowData> createRepeated() =>
      $pb.PbList<TransferShowData>();
  @$core.pragma('dart2js:noInline')
  static TransferShowData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TransferShowData>(create);
  static TransferShowData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get showTransfer => $_getBF(0);
  @$pb.TagNumber(1)
  set showTransfer($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShowTransfer() => $_has(0);
  @$pb.TagNumber(1)
  void clearShowTransfer() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get showNlFriendRecommend => $_getBF(1);
  @$pb.TagNumber(2)
  set showNlFriendRecommend($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasShowNlFriendRecommend() => $_has(1);
  @$pb.TagNumber(2)
  void clearShowNlFriendRecommend() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get showRoomData => $_getBF(2);
  @$pb.TagNumber(3)
  set showRoomData($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasShowRoomData() => $_has(2);
  @$pb.TagNumber(3)
  void clearShowRoomData() => clearField(3);
}

class ResTransferShow extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResTransferShow',
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
    ..aOM<TransferShowData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: TransferShowData.create)
    ..hasRequiredFields = false;

  ResTransferShow._() : super();
  factory ResTransferShow({
    $core.bool? success,
    $core.String? msg,
    TransferShowData? data,
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
  factory ResTransferShow.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResTransferShow.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResTransferShow clone() => ResTransferShow()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResTransferShow copyWith(void Function(ResTransferShow) updates) =>
      super.copyWith((message) => updates(message as ResTransferShow))
          as ResTransferShow; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResTransferShow create() => ResTransferShow._();
  ResTransferShow createEmptyInstance() => create();
  static $pb.PbList<ResTransferShow> createRepeated() =>
      $pb.PbList<ResTransferShow>();
  @$core.pragma('dart2js:noInline')
  static ResTransferShow getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResTransferShow>(create);
  static ResTransferShow? _defaultInstance;

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
  TransferShowData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(TransferShowData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  TransferShowData ensureData() => $_ensure(2);
}
