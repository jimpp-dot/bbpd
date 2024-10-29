///
//  Generated code. Do not modify.
//  source: party.uncle.refresh.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PartyUncleRefresh_Mics extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyUncleRefresh.Mics',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.uncle.refresh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_bomb',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PartyUncleRefresh_Mics._() : super();
  factory PartyUncleRefresh_Mics({
    $core.int? isBomb,
    $core.String? score,
    $core.int? uid,
  }) {
    final _result = create();
    if (isBomb != null) {
      _result.isBomb = isBomb;
    }
    if (score != null) {
      _result.score = score;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory PartyUncleRefresh_Mics.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyUncleRefresh_Mics.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyUncleRefresh_Mics clone() =>
      PartyUncleRefresh_Mics()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyUncleRefresh_Mics copyWith(
          void Function(PartyUncleRefresh_Mics) updates) =>
      super.copyWith((message) => updates(message as PartyUncleRefresh_Mics))
          as PartyUncleRefresh_Mics; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyUncleRefresh_Mics create() => PartyUncleRefresh_Mics._();
  PartyUncleRefresh_Mics createEmptyInstance() => create();
  static $pb.PbList<PartyUncleRefresh_Mics> createRepeated() =>
      $pb.PbList<PartyUncleRefresh_Mics>();
  @$core.pragma('dart2js:noInline')
  static PartyUncleRefresh_Mics getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyUncleRefresh_Mics>(create);
  static PartyUncleRefresh_Mics? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get isBomb => $_getIZ(0);
  @$pb.TagNumber(1)
  set isBomb($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIsBomb() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsBomb() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get score => $_getSZ(1);
  @$pb.TagNumber(2)
  set score($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearScore() => clearField(2);

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

class PartyUncleRefresh_Punish extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyUncleRefresh.Punish',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.uncle.refresh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'paper_count',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'system_changename_id')
    ..p<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'system_ids',
        $pb.PbFieldType.PU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'system_voice_id')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PartyUncleRefresh_Punish._() : super();
  factory PartyUncleRefresh_Punish({
    $core.int? paperCount,
    $core.String? systemChangenameId,
    $core.Iterable<$core.int>? systemIds,
    $core.String? systemVoiceId,
    $core.int? uid,
  }) {
    final _result = create();
    if (paperCount != null) {
      _result.paperCount = paperCount;
    }
    if (systemChangenameId != null) {
      _result.systemChangenameId = systemChangenameId;
    }
    if (systemIds != null) {
      _result.systemIds.addAll(systemIds);
    }
    if (systemVoiceId != null) {
      _result.systemVoiceId = systemVoiceId;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory PartyUncleRefresh_Punish.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyUncleRefresh_Punish.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyUncleRefresh_Punish clone() =>
      PartyUncleRefresh_Punish()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyUncleRefresh_Punish copyWith(
          void Function(PartyUncleRefresh_Punish) updates) =>
      super.copyWith((message) => updates(message as PartyUncleRefresh_Punish))
          as PartyUncleRefresh_Punish; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyUncleRefresh_Punish create() => PartyUncleRefresh_Punish._();
  PartyUncleRefresh_Punish createEmptyInstance() => create();
  static $pb.PbList<PartyUncleRefresh_Punish> createRepeated() =>
      $pb.PbList<PartyUncleRefresh_Punish>();
  @$core.pragma('dart2js:noInline')
  static PartyUncleRefresh_Punish getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyUncleRefresh_Punish>(create);
  static PartyUncleRefresh_Punish? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get paperCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set paperCount($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPaperCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaperCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get systemChangenameId => $_getSZ(1);
  @$pb.TagNumber(2)
  set systemChangenameId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSystemChangenameId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSystemChangenameId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get systemIds => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get systemVoiceId => $_getSZ(3);
  @$pb.TagNumber(4)
  set systemVoiceId($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSystemVoiceId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSystemVoiceId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get uid => $_getIZ(4);
  @$pb.TagNumber(5)
  set uid($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearUid() => clearField(5);
}

class PartyUncleRefresh_Punlist extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyUncleRefresh.Punlist',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.uncle.refresh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..hasRequiredFields = false;

  PartyUncleRefresh_Punlist._() : super();
  factory PartyUncleRefresh_Punlist({
    $core.String? content,
    $core.int? id,
    $core.String? type,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    if (id != null) {
      _result.id = id;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory PartyUncleRefresh_Punlist.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyUncleRefresh_Punlist.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyUncleRefresh_Punlist clone() =>
      PartyUncleRefresh_Punlist()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyUncleRefresh_Punlist copyWith(
          void Function(PartyUncleRefresh_Punlist) updates) =>
      super.copyWith((message) => updates(message as PartyUncleRefresh_Punlist))
          as PartyUncleRefresh_Punlist; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyUncleRefresh_Punlist create() => PartyUncleRefresh_Punlist._();
  PartyUncleRefresh_Punlist createEmptyInstance() => create();
  static $pb.PbList<PartyUncleRefresh_Punlist> createRepeated() =>
      $pb.PbList<PartyUncleRefresh_Punlist>();
  @$core.pragma('dart2js:noInline')
  static PartyUncleRefresh_Punlist getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyUncleRefresh_Punlist>(create);
  static PartyUncleRefresh_Punlist? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

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

class PartyUncleRefresh_Info extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyUncleRefresh.Info',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.uncle.refresh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bomb_icon')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bomb_num',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'column',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'row',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PartyUncleRefresh_Info._() : super();
  factory PartyUncleRefresh_Info({
    $core.String? bombIcon,
    $core.int? bombNum,
    $core.int? column,
    $core.String? desc,
    $core.String? icon,
    $core.int? row,
  }) {
    final _result = create();
    if (bombIcon != null) {
      _result.bombIcon = bombIcon;
    }
    if (bombNum != null) {
      _result.bombNum = bombNum;
    }
    if (column != null) {
      _result.column = column;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (row != null) {
      _result.row = row;
    }
    return _result;
  }
  factory PartyUncleRefresh_Info.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyUncleRefresh_Info.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyUncleRefresh_Info clone() =>
      PartyUncleRefresh_Info()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyUncleRefresh_Info copyWith(
          void Function(PartyUncleRefresh_Info) updates) =>
      super.copyWith((message) => updates(message as PartyUncleRefresh_Info))
          as PartyUncleRefresh_Info; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyUncleRefresh_Info create() => PartyUncleRefresh_Info._();
  PartyUncleRefresh_Info createEmptyInstance() => create();
  static $pb.PbList<PartyUncleRefresh_Info> createRepeated() =>
      $pb.PbList<PartyUncleRefresh_Info>();
  @$core.pragma('dart2js:noInline')
  static PartyUncleRefresh_Info getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyUncleRefresh_Info>(create);
  static PartyUncleRefresh_Info? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bombIcon => $_getSZ(0);
  @$pb.TagNumber(1)
  set bombIcon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBombIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearBombIcon() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get bombNum => $_getIZ(1);
  @$pb.TagNumber(2)
  set bombNum($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBombNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearBombNum() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get column => $_getIZ(2);
  @$pb.TagNumber(3)
  set column($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasColumn() => $_has(2);
  @$pb.TagNumber(3)
  void clearColumn() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get desc => $_getSZ(3);
  @$pb.TagNumber(4)
  set desc($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearDesc() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get row => $_getIZ(5);
  @$pb.TagNumber(6)
  set row($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRow() => $_has(5);
  @$pb.TagNumber(6)
  void clearRow() => clearField(6);
}

class PartyUncleRefresh_List extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyUncleRefresh.List',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.uncle.refresh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PartyUncleRefresh_List._() : super();
  factory PartyUncleRefresh_List({
    $core.int? id,
    $core.int? state,
    $core.int? uid,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (state != null) {
      _result.state = state;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory PartyUncleRefresh_List.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyUncleRefresh_List.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyUncleRefresh_List clone() =>
      PartyUncleRefresh_List()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyUncleRefresh_List copyWith(
          void Function(PartyUncleRefresh_List) updates) =>
      super.copyWith((message) => updates(message as PartyUncleRefresh_List))
          as PartyUncleRefresh_List; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyUncleRefresh_List create() => PartyUncleRefresh_List._();
  PartyUncleRefresh_List createEmptyInstance() => create();
  static $pb.PbList<PartyUncleRefresh_List> createRepeated() =>
      $pb.PbList<PartyUncleRefresh_List>();
  @$core.pragma('dart2js:noInline')
  static PartyUncleRefresh_List getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyUncleRefresh_List>(create);
  static PartyUncleRefresh_List? _defaultInstance;

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
  $core.int get state => $_getIZ(1);
  @$pb.TagNumber(2)
  set state($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);

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

class PartyUncleRefresh_User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyUncleRefresh.User',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.uncle.refresh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'current',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PartyUncleRefresh_User._() : super();
  factory PartyUncleRefresh_User({
    $core.int? current,
    $core.String? icon,
    $core.int? uid,
  }) {
    final _result = create();
    if (current != null) {
      _result.current = current;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory PartyUncleRefresh_User.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyUncleRefresh_User.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyUncleRefresh_User clone() =>
      PartyUncleRefresh_User()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyUncleRefresh_User copyWith(
          void Function(PartyUncleRefresh_User) updates) =>
      super.copyWith((message) => updates(message as PartyUncleRefresh_User))
          as PartyUncleRefresh_User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyUncleRefresh_User create() => PartyUncleRefresh_User._();
  PartyUncleRefresh_User createEmptyInstance() => create();
  static $pb.PbList<PartyUncleRefresh_User> createRepeated() =>
      $pb.PbList<PartyUncleRefresh_User>();
  @$core.pragma('dart2js:noInline')
  static PartyUncleRefresh_User getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyUncleRefresh_User>(create);
  static PartyUncleRefresh_User? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get current => $_getIZ(0);
  @$pb.TagNumber(1)
  set current($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCurrent() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrent() => clearField(1);

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

class PartyUncleRefresh_Uncle extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyUncleRefresh.Uncle',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.uncle.refresh'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'click_num',
        $pb.PbFieldType.OU3)
    ..aOM<PartyUncleRefresh_Info>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'info',
        subBuilder: PartyUncleRefresh_Info.create)
    ..pc<PartyUncleRefresh_List>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: PartyUncleRefresh_List.create)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..pc<PartyUncleRefresh_User>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        $pb.PbFieldType.PM,
        subBuilder: PartyUncleRefresh_User.create)
    ..hasRequiredFields = false;

  PartyUncleRefresh_Uncle._() : super();
  factory PartyUncleRefresh_Uncle({
    $core.int? clickNum,
    PartyUncleRefresh_Info? info,
    $core.Iterable<PartyUncleRefresh_List>? list,
    $core.String? state,
    $core.Iterable<PartyUncleRefresh_User>? user,
  }) {
    final _result = create();
    if (clickNum != null) {
      _result.clickNum = clickNum;
    }
    if (info != null) {
      _result.info = info;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (state != null) {
      _result.state = state;
    }
    if (user != null) {
      _result.user.addAll(user);
    }
    return _result;
  }
  factory PartyUncleRefresh_Uncle.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyUncleRefresh_Uncle.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyUncleRefresh_Uncle clone() =>
      PartyUncleRefresh_Uncle()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyUncleRefresh_Uncle copyWith(
          void Function(PartyUncleRefresh_Uncle) updates) =>
      super.copyWith((message) => updates(message as PartyUncleRefresh_Uncle))
          as PartyUncleRefresh_Uncle; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyUncleRefresh_Uncle create() => PartyUncleRefresh_Uncle._();
  PartyUncleRefresh_Uncle createEmptyInstance() => create();
  static $pb.PbList<PartyUncleRefresh_Uncle> createRepeated() =>
      $pb.PbList<PartyUncleRefresh_Uncle>();
  @$core.pragma('dart2js:noInline')
  static PartyUncleRefresh_Uncle getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyUncleRefresh_Uncle>(create);
  static PartyUncleRefresh_Uncle? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get clickNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set clickNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasClickNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearClickNum() => clearField(1);

  @$pb.TagNumber(2)
  PartyUncleRefresh_Info get info => $_getN(1);
  @$pb.TagNumber(2)
  set info(PartyUncleRefresh_Info v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearInfo() => clearField(2);
  @$pb.TagNumber(2)
  PartyUncleRefresh_Info ensureInfo() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<PartyUncleRefresh_List> get list => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get state => $_getSZ(3);
  @$pb.TagNumber(4)
  set state($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<PartyUncleRefresh_User> get user => $_getList(4);
}

class PartyUncleRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyUncleRefresh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.uncle.refresh'),
      createEmptyInstance: create)
    ..pc<PartyUncleRefresh_Mics>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mics',
        $pb.PbFieldType.PM,
        subBuilder: PartyUncleRefresh_Mics.create)
    ..pc<PartyUncleRefresh_Punish>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'punish',
        $pb.PbFieldType.PM,
        subBuilder: PartyUncleRefresh_Punish.create)
    ..pc<PartyUncleRefresh_Punlist>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'punlist',
        $pb.PbFieldType.PM,
        subBuilder: PartyUncleRefresh_Punlist.create)
    ..aOM<PartyUncleRefresh_Uncle>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uncle',
        subBuilder: PartyUncleRefresh_Uncle.create)
    ..hasRequiredFields = false;

  PartyUncleRefresh._() : super();
  factory PartyUncleRefresh({
    $core.Iterable<PartyUncleRefresh_Mics>? mics,
    $core.Iterable<PartyUncleRefresh_Punish>? punish,
    $core.Iterable<PartyUncleRefresh_Punlist>? punlist,
    PartyUncleRefresh_Uncle? uncle,
  }) {
    final _result = create();
    if (mics != null) {
      _result.mics.addAll(mics);
    }
    if (punish != null) {
      _result.punish.addAll(punish);
    }
    if (punlist != null) {
      _result.punlist.addAll(punlist);
    }
    if (uncle != null) {
      _result.uncle = uncle;
    }
    return _result;
  }
  factory PartyUncleRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyUncleRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyUncleRefresh clone() => PartyUncleRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyUncleRefresh copyWith(void Function(PartyUncleRefresh) updates) =>
      super.copyWith((message) => updates(message as PartyUncleRefresh))
          as PartyUncleRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyUncleRefresh create() => PartyUncleRefresh._();
  PartyUncleRefresh createEmptyInstance() => create();
  static $pb.PbList<PartyUncleRefresh> createRepeated() =>
      $pb.PbList<PartyUncleRefresh>();
  @$core.pragma('dart2js:noInline')
  static PartyUncleRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyUncleRefresh>(create);
  static PartyUncleRefresh? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PartyUncleRefresh_Mics> get mics => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<PartyUncleRefresh_Punish> get punish => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<PartyUncleRefresh_Punlist> get punlist => $_getList(2);

  @$pb.TagNumber(4)
  PartyUncleRefresh_Uncle get uncle => $_getN(3);
  @$pb.TagNumber(4)
  set uncle(PartyUncleRefresh_Uncle v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUncle() => $_has(3);
  @$pb.TagNumber(4)
  void clearUncle() => clearField(4);
  @$pb.TagNumber(4)
  PartyUncleRefresh_Uncle ensureUncle() => $_ensure(3);
}
