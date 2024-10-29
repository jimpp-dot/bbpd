///
//  Generated code. Do not modify.
//  source: impress_tag.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ShowImpressTagMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShowImpressTagMessage',
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
    ..pc<ShowImpressTagData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'showData',
        $pb.PbFieldType.PM,
        subBuilder: ShowImpressTagData.create)
    ..hasRequiredFields = false;

  ShowImpressTagMessage._() : super();
  factory ShowImpressTagMessage({
    $core.int? rid,
    $core.Iterable<ShowImpressTagData>? showData,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (showData != null) {
      _result.showData.addAll(showData);
    }
    return _result;
  }
  factory ShowImpressTagMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShowImpressTagMessage.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShowImpressTagMessage clone() =>
      ShowImpressTagMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShowImpressTagMessage copyWith(
          void Function(ShowImpressTagMessage) updates) =>
      super.copyWith((message) => updates(message as ShowImpressTagMessage))
          as ShowImpressTagMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShowImpressTagMessage create() => ShowImpressTagMessage._();
  ShowImpressTagMessage createEmptyInstance() => create();
  static $pb.PbList<ShowImpressTagMessage> createRepeated() =>
      $pb.PbList<ShowImpressTagMessage>();
  @$core.pragma('dart2js:noInline')
  static ShowImpressTagMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShowImpressTagMessage>(create);
  static ShowImpressTagMessage? _defaultInstance;

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
  $core.List<ShowImpressTagData> get showData => $_getList(1);
}

class ShowImpressTagData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShowImpressTagData',
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
            : 'tagId',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagIcon')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endTime',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ShowImpressTagData._() : super();
  factory ShowImpressTagData({
    $core.int? uid,
    $core.int? tagId,
    $core.String? tagIcon,
    $core.int? endTime,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (tagId != null) {
      _result.tagId = tagId;
    }
    if (tagIcon != null) {
      _result.tagIcon = tagIcon;
    }
    if (endTime != null) {
      _result.endTime = endTime;
    }
    return _result;
  }
  factory ShowImpressTagData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShowImpressTagData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShowImpressTagData clone() => ShowImpressTagData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShowImpressTagData copyWith(void Function(ShowImpressTagData) updates) =>
      super.copyWith((message) => updates(message as ShowImpressTagData))
          as ShowImpressTagData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShowImpressTagData create() => ShowImpressTagData._();
  ShowImpressTagData createEmptyInstance() => create();
  static $pb.PbList<ShowImpressTagData> createRepeated() =>
      $pb.PbList<ShowImpressTagData>();
  @$core.pragma('dart2js:noInline')
  static ShowImpressTagData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShowImpressTagData>(create);
  static ShowImpressTagData? _defaultInstance;

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
  $core.int get tagId => $_getIZ(1);
  @$pb.TagNumber(2)
  set tagId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTagId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTagId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get tagIcon => $_getSZ(2);
  @$pb.TagNumber(3)
  set tagIcon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTagIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearTagIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get endTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set endTime($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasEndTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndTime() => clearField(4);
}

class ShowImpressTagsReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShowImpressTagsReq',
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
            : 'actionTyp',
        protoName: 'actionTyp')
    ..hasRequiredFields = false;

  ShowImpressTagsReq._() : super();
  factory ShowImpressTagsReq({
    $core.int? rid,
    $core.String? actionTyp,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (actionTyp != null) {
      _result.actionTyp = actionTyp;
    }
    return _result;
  }
  factory ShowImpressTagsReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShowImpressTagsReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShowImpressTagsReq clone() => ShowImpressTagsReq()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShowImpressTagsReq copyWith(void Function(ShowImpressTagsReq) updates) =>
      super.copyWith((message) => updates(message as ShowImpressTagsReq))
          as ShowImpressTagsReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShowImpressTagsReq create() => ShowImpressTagsReq._();
  ShowImpressTagsReq createEmptyInstance() => create();
  static $pb.PbList<ShowImpressTagsReq> createRepeated() =>
      $pb.PbList<ShowImpressTagsReq>();
  @$core.pragma('dart2js:noInline')
  static ShowImpressTagsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShowImpressTagsReq>(create);
  static ShowImpressTagsReq? _defaultInstance;

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
  $core.String get actionTyp => $_getSZ(1);
  @$pb.TagNumber(2)
  set actionTyp($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasActionTyp() => $_has(1);
  @$pb.TagNumber(2)
  void clearActionTyp() => clearField(2);
}

class ShowImpressTagsRsp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ShowImpressTagsRsp',
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

  ShowImpressTagsRsp._() : super();
  factory ShowImpressTagsRsp({
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
  factory ShowImpressTagsRsp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ShowImpressTagsRsp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ShowImpressTagsRsp clone() => ShowImpressTagsRsp()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ShowImpressTagsRsp copyWith(void Function(ShowImpressTagsRsp) updates) =>
      super.copyWith((message) => updates(message as ShowImpressTagsRsp))
          as ShowImpressTagsRsp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShowImpressTagsRsp create() => ShowImpressTagsRsp._();
  ShowImpressTagsRsp createEmptyInstance() => create();
  static $pb.PbList<ShowImpressTagsRsp> createRepeated() =>
      $pb.PbList<ShowImpressTagsRsp>();
  @$core.pragma('dart2js:noInline')
  static ShowImpressTagsRsp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ShowImpressTagsRsp>(create);
  static ShowImpressTagsRsp? _defaultInstance;

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
