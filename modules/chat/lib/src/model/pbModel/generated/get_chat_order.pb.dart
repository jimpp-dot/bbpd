///
//  Generated code. Do not modify.
//  source: get_chat_order.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RespGetChatOrder extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespGetChatOrder',
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
            : 'message')
    ..aOM<RespGetChatOrderData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RespGetChatOrderData.create)
    ..hasRequiredFields = false;

  RespGetChatOrder._() : super();
  factory RespGetChatOrder({
    $core.bool? success,
    $core.String? message,
    RespGetChatOrderData? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory RespGetChatOrder.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespGetChatOrder.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespGetChatOrder clone() => RespGetChatOrder()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespGetChatOrder copyWith(void Function(RespGetChatOrder) updates) =>
      super.copyWith((message) => updates(message as RespGetChatOrder))
          as RespGetChatOrder; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespGetChatOrder create() => RespGetChatOrder._();
  RespGetChatOrder createEmptyInstance() => create();
  static $pb.PbList<RespGetChatOrder> createRepeated() =>
      $pb.PbList<RespGetChatOrder>();
  @$core.pragma('dart2js:noInline')
  static RespGetChatOrder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespGetChatOrder>(create);
  static RespGetChatOrder? _defaultInstance;

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
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  RespGetChatOrderData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RespGetChatOrderData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RespGetChatOrderData ensureData() => $_ensure(2);
}

class RespGetChatOrderData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RespGetChatOrderData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..aOM<ChatData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ChatData.create)
    ..hasRequiredFields = false;

  RespGetChatOrderData._() : super();
  factory RespGetChatOrderData({
    $core.int? status,
    $core.String? state,
    ChatData? data,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (state != null) {
      _result.state = state;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory RespGetChatOrderData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RespGetChatOrderData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RespGetChatOrderData clone() =>
      RespGetChatOrderData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RespGetChatOrderData copyWith(void Function(RespGetChatOrderData) updates) =>
      super.copyWith((message) => updates(message as RespGetChatOrderData))
          as RespGetChatOrderData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RespGetChatOrderData create() => RespGetChatOrderData._();
  RespGetChatOrderData createEmptyInstance() => create();
  static $pb.PbList<RespGetChatOrderData> createRepeated() =>
      $pb.PbList<RespGetChatOrderData>();
  @$core.pragma('dart2js:noInline')
  static RespGetChatOrderData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RespGetChatOrderData>(create);
  static RespGetChatOrderData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get state => $_getSZ(1);
  @$pb.TagNumber(2)
  set state($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);

  @$pb.TagNumber(3)
  ChatData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ChatData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ChatData ensureData() => $_ensure(2);
}

class ChatData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ChatData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godsr')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'iscomplete',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ispay',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vote',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'beginTime',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'to',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cancelTime',
        $pb.PbFieldType.OU3)
    ..aOM<SkillInfo>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'skill',
        subBuilder: SkillInfo.create)
    ..hasRequiredFields = false;

  ChatData._() : super();
  factory ChatData({
    $core.bool? godsr,
    $core.int? iscomplete,
    $core.int? ispay,
    $core.int? vote,
    $core.int? id,
    $core.int? beginTime,
    $core.int? num,
    $core.int? to,
    $core.int? version,
    $core.int? cancelTime,
    SkillInfo? skill,
  }) {
    final _result = create();
    if (godsr != null) {
      _result.godsr = godsr;
    }
    if (iscomplete != null) {
      _result.iscomplete = iscomplete;
    }
    if (ispay != null) {
      _result.ispay = ispay;
    }
    if (vote != null) {
      _result.vote = vote;
    }
    if (id != null) {
      _result.id = id;
    }
    if (beginTime != null) {
      _result.beginTime = beginTime;
    }
    if (num != null) {
      _result.num = num;
    }
    if (to != null) {
      _result.to = to;
    }
    if (version != null) {
      _result.version = version;
    }
    if (cancelTime != null) {
      _result.cancelTime = cancelTime;
    }
    if (skill != null) {
      _result.skill = skill;
    }
    return _result;
  }
  factory ChatData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ChatData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ChatData clone() => ChatData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ChatData copyWith(void Function(ChatData) updates) =>
      super.copyWith((message) => updates(message as ChatData))
          as ChatData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChatData create() => ChatData._();
  ChatData createEmptyInstance() => create();
  static $pb.PbList<ChatData> createRepeated() => $pb.PbList<ChatData>();
  @$core.pragma('dart2js:noInline')
  static ChatData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatData>(create);
  static ChatData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get godsr => $_getBF(0);
  @$pb.TagNumber(1)
  set godsr($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGodsr() => $_has(0);
  @$pb.TagNumber(1)
  void clearGodsr() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get iscomplete => $_getIZ(1);
  @$pb.TagNumber(2)
  set iscomplete($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIscomplete() => $_has(1);
  @$pb.TagNumber(2)
  void clearIscomplete() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get ispay => $_getIZ(2);
  @$pb.TagNumber(3)
  set ispay($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIspay() => $_has(2);
  @$pb.TagNumber(3)
  void clearIspay() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get vote => $_getIZ(3);
  @$pb.TagNumber(4)
  set vote($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasVote() => $_has(3);
  @$pb.TagNumber(4)
  void clearVote() => clearField(4);

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
  $core.int get beginTime => $_getIZ(5);
  @$pb.TagNumber(6)
  set beginTime($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasBeginTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearBeginTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get num => $_getIZ(6);
  @$pb.TagNumber(7)
  set num($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasNum() => $_has(6);
  @$pb.TagNumber(7)
  void clearNum() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get to => $_getIZ(7);
  @$pb.TagNumber(8)
  set to($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTo() => $_has(7);
  @$pb.TagNumber(8)
  void clearTo() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get version => $_getIZ(8);
  @$pb.TagNumber(9)
  set version($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasVersion() => $_has(8);
  @$pb.TagNumber(9)
  void clearVersion() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get cancelTime => $_getIZ(9);
  @$pb.TagNumber(10)
  set cancelTime($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasCancelTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearCancelTime() => clearField(10);

  @$pb.TagNumber(11)
  SkillInfo get skill => $_getN(10);
  @$pb.TagNumber(11)
  set skill(SkillInfo v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasSkill() => $_has(10);
  @$pb.TagNumber(11)
  void clearSkill() => clearField(11);
  @$pb.TagNumber(11)
  SkillInfo ensureSkill() => $_ensure(10);
}

class SkillInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SkillInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..hasRequiredFields = false;

  SkillInfo._() : super();
  factory SkillInfo({
    $core.String? icon,
    $core.String? name,
    $core.String? type,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory SkillInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SkillInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SkillInfo clone() => SkillInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SkillInfo copyWith(void Function(SkillInfo) updates) =>
      super.copyWith((message) => updates(message as SkillInfo))
          as SkillInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SkillInfo create() => SkillInfo._();
  SkillInfo createEmptyInstance() => create();
  static $pb.PbList<SkillInfo> createRepeated() => $pb.PbList<SkillInfo>();
  @$core.pragma('dart2js:noInline')
  static SkillInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SkillInfo>(create);
  static SkillInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get icon => $_getSZ(0);
  @$pb.TagNumber(1)
  set icon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearIcon() => clearField(1);

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
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);
}
