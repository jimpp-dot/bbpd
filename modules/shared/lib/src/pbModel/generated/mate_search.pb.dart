///
//  Generated code. Do not modify.
//  source: mate_search.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class ResMateSearchJoint extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResMateSearchJoint',
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
    ..pc<MateSearchJointItem>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        $pb.PbFieldType.PM,
        subBuilder: MateSearchJointItem.create)
    ..hasRequiredFields = false;

  ResMateSearchJoint._() : super();
  factory ResMateSearchJoint({
    $core.bool? success,
    $core.String? msg,
    $core.Iterable<MateSearchJointItem>? data,
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
  factory ResMateSearchJoint.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResMateSearchJoint.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResMateSearchJoint clone() => ResMateSearchJoint()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResMateSearchJoint copyWith(void Function(ResMateSearchJoint) updates) =>
      super.copyWith((message) => updates(message as ResMateSearchJoint))
          as ResMateSearchJoint; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResMateSearchJoint create() => ResMateSearchJoint._();
  ResMateSearchJoint createEmptyInstance() => create();
  static $pb.PbList<ResMateSearchJoint> createRepeated() =>
      $pb.PbList<ResMateSearchJoint>();
  @$core.pragma('dart2js:noInline')
  static ResMateSearchJoint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResMateSearchJoint>(create);
  static ResMateSearchJoint? _defaultInstance;

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
  $core.List<MateSearchJointItem> get data => $_getList(2);
}

class MateSearchJointItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateSearchJointItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.O3)
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
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOM<MateSearchJointUserItem>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user',
        subBuilder: MateSearchJointUserItem.create)
    ..aOM<MateSearchJointFleetItem>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fleet',
        subBuilder: MateSearchJointFleetItem.create)
    ..aOM<MateSearchJointEggItem>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'egg',
        subBuilder: MateSearchJointEggItem.create)
    ..aOM<MateSearchJointBagItem>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bag',
        subBuilder: MateSearchJointBagItem.create)
    ..aOM<MateSearchJointGroupItem>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'group',
        subBuilder: MateSearchJointGroupItem.create)
    ..aOM<MateSearchJointRoomItem>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room',
        subBuilder: MateSearchJointRoomItem.create)
    ..aOM<MateSearchJointUnionItem>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'union',
        subBuilder: MateSearchJointUnionItem.create)
    ..aOM<MateSearchJointTourItem>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tour',
        subBuilder: MateSearchJointTourItem.create)
    ..hasRequiredFields = false;

  MateSearchJointItem._() : super();
  factory MateSearchJointItem({
    $core.int? type,
    $core.int? id,
    $core.String? name,
    $core.String? icon,
    MateSearchJointUserItem? user,
    MateSearchJointFleetItem? fleet,
    MateSearchJointEggItem? egg,
    MateSearchJointBagItem? bag,
    MateSearchJointGroupItem? group,
    MateSearchJointRoomItem? room,
    MateSearchJointUnionItem? union,
    MateSearchJointTourItem? tour,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (user != null) {
      _result.user = user;
    }
    if (fleet != null) {
      _result.fleet = fleet;
    }
    if (egg != null) {
      _result.egg = egg;
    }
    if (bag != null) {
      _result.bag = bag;
    }
    if (group != null) {
      _result.group = group;
    }
    if (room != null) {
      _result.room = room;
    }
    if (union != null) {
      _result.union = union;
    }
    if (tour != null) {
      _result.tour = tour;
    }
    return _result;
  }
  factory MateSearchJointItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateSearchJointItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateSearchJointItem clone() => MateSearchJointItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateSearchJointItem copyWith(void Function(MateSearchJointItem) updates) =>
      super.copyWith((message) => updates(message as MateSearchJointItem))
          as MateSearchJointItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateSearchJointItem create() => MateSearchJointItem._();
  MateSearchJointItem createEmptyInstance() => create();
  static $pb.PbList<MateSearchJointItem> createRepeated() =>
      $pb.PbList<MateSearchJointItem>();
  @$core.pragma('dart2js:noInline')
  static MateSearchJointItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateSearchJointItem>(create);
  static MateSearchJointItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

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
  MateSearchJointUserItem get user => $_getN(4);
  @$pb.TagNumber(5)
  set user(MateSearchJointUserItem v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUser() => $_has(4);
  @$pb.TagNumber(5)
  void clearUser() => clearField(5);
  @$pb.TagNumber(5)
  MateSearchJointUserItem ensureUser() => $_ensure(4);

  @$pb.TagNumber(6)
  MateSearchJointFleetItem get fleet => $_getN(5);
  @$pb.TagNumber(6)
  set fleet(MateSearchJointFleetItem v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasFleet() => $_has(5);
  @$pb.TagNumber(6)
  void clearFleet() => clearField(6);
  @$pb.TagNumber(6)
  MateSearchJointFleetItem ensureFleet() => $_ensure(5);

  @$pb.TagNumber(7)
  MateSearchJointEggItem get egg => $_getN(6);
  @$pb.TagNumber(7)
  set egg(MateSearchJointEggItem v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasEgg() => $_has(6);
  @$pb.TagNumber(7)
  void clearEgg() => clearField(7);
  @$pb.TagNumber(7)
  MateSearchJointEggItem ensureEgg() => $_ensure(6);

  @$pb.TagNumber(8)
  MateSearchJointBagItem get bag => $_getN(7);
  @$pb.TagNumber(8)
  set bag(MateSearchJointBagItem v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasBag() => $_has(7);
  @$pb.TagNumber(8)
  void clearBag() => clearField(8);
  @$pb.TagNumber(8)
  MateSearchJointBagItem ensureBag() => $_ensure(7);

  @$pb.TagNumber(9)
  MateSearchJointGroupItem get group => $_getN(8);
  @$pb.TagNumber(9)
  set group(MateSearchJointGroupItem v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasGroup() => $_has(8);
  @$pb.TagNumber(9)
  void clearGroup() => clearField(9);
  @$pb.TagNumber(9)
  MateSearchJointGroupItem ensureGroup() => $_ensure(8);

  @$pb.TagNumber(10)
  MateSearchJointRoomItem get room => $_getN(9);
  @$pb.TagNumber(10)
  set room(MateSearchJointRoomItem v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasRoom() => $_has(9);
  @$pb.TagNumber(10)
  void clearRoom() => clearField(10);
  @$pb.TagNumber(10)
  MateSearchJointRoomItem ensureRoom() => $_ensure(9);

  @$pb.TagNumber(11)
  MateSearchJointUnionItem get union => $_getN(10);
  @$pb.TagNumber(11)
  set union(MateSearchJointUnionItem v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasUnion() => $_has(10);
  @$pb.TagNumber(11)
  void clearUnion() => clearField(11);
  @$pb.TagNumber(11)
  MateSearchJointUnionItem ensureUnion() => $_ensure(10);

  @$pb.TagNumber(12)
  MateSearchJointTourItem get tour => $_getN(11);
  @$pb.TagNumber(12)
  set tour(MateSearchJointTourItem v) {
    setField(12, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasTour() => $_has(11);
  @$pb.TagNumber(12)
  void clearTour() => clearField(12);
  @$pb.TagNumber(12)
  MateSearchJointTourItem ensureTour() => $_ensure(11);
}

class MateSearchJointUserItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateSearchJointUserItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'follow',
        $pb.PbFieldType.O3)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isHot')
    ..a<$fixnum.Int64>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'encounterTagId',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prettyId')
    ..hasRequiredFields = false;

  MateSearchJointUserItem._() : super();
  factory MateSearchJointUserItem({
    $core.int? follow,
    $core.bool? isHot,
    $fixnum.Int64? encounterTagId,
    $core.String? prettyId,
  }) {
    final _result = create();
    if (follow != null) {
      _result.follow = follow;
    }
    if (isHot != null) {
      _result.isHot = isHot;
    }
    if (encounterTagId != null) {
      _result.encounterTagId = encounterTagId;
    }
    if (prettyId != null) {
      _result.prettyId = prettyId;
    }
    return _result;
  }
  factory MateSearchJointUserItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateSearchJointUserItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateSearchJointUserItem clone() =>
      MateSearchJointUserItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateSearchJointUserItem copyWith(
          void Function(MateSearchJointUserItem) updates) =>
      super.copyWith((message) => updates(message as MateSearchJointUserItem))
          as MateSearchJointUserItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateSearchJointUserItem create() => MateSearchJointUserItem._();
  MateSearchJointUserItem createEmptyInstance() => create();
  static $pb.PbList<MateSearchJointUserItem> createRepeated() =>
      $pb.PbList<MateSearchJointUserItem>();
  @$core.pragma('dart2js:noInline')
  static MateSearchJointUserItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateSearchJointUserItem>(create);
  static MateSearchJointUserItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get follow => $_getIZ(0);
  @$pb.TagNumber(1)
  set follow($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFollow() => $_has(0);
  @$pb.TagNumber(1)
  void clearFollow() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isHot => $_getBF(1);
  @$pb.TagNumber(2)
  set isHot($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIsHot() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsHot() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get encounterTagId => $_getI64(2);
  @$pb.TagNumber(3)
  set encounterTagId($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEncounterTagId() => $_has(2);
  @$pb.TagNumber(3)
  void clearEncounterTagId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get prettyId => $_getSZ(3);
  @$pb.TagNumber(4)
  set prettyId($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPrettyId() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrettyId() => clearField(4);
}

class MateSearchJointFleetItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateSearchJointFleetItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prefix')
    ..hasRequiredFields = false;

  MateSearchJointFleetItem._() : super();
  factory MateSearchJointFleetItem({
    $core.String? state,
    $core.String? prefix,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    if (prefix != null) {
      _result.prefix = prefix;
    }
    return _result;
  }
  factory MateSearchJointFleetItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateSearchJointFleetItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateSearchJointFleetItem clone() =>
      MateSearchJointFleetItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateSearchJointFleetItem copyWith(
          void Function(MateSearchJointFleetItem) updates) =>
      super.copyWith((message) => updates(message as MateSearchJointFleetItem))
          as MateSearchJointFleetItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateSearchJointFleetItem create() => MateSearchJointFleetItem._();
  MateSearchJointFleetItem createEmptyInstance() => create();
  static $pb.PbList<MateSearchJointFleetItem> createRepeated() =>
      $pb.PbList<MateSearchJointFleetItem>();
  @$core.pragma('dart2js:noInline')
  static MateSearchJointFleetItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateSearchJointFleetItem>(create);
  static MateSearchJointFleetItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get state => $_getSZ(0);
  @$pb.TagNumber(1)
  set state($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get prefix => $_getSZ(1);
  @$pb.TagNumber(2)
  set prefix($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPrefix() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrefix() => clearField(2);
}

class MateSearchJointEggItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateSearchJointEggItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sourcePath')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sourceText')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sourceUserName')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sourceUid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sourceSex',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cardText')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cardButtonText')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'objectIcon')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'objectId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cardDisplayType',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'redirectType',
        $pb.PbFieldType.O3)
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subType')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jumpUrl')
    ..hasRequiredFields = false;

  MateSearchJointEggItem._() : super();
  factory MateSearchJointEggItem({
    $core.String? sourcePath,
    $core.String? sourceText,
    $core.String? sourceUserName,
    $core.int? sourceUid,
    $core.int? sourceSex,
    $core.String? cardText,
    $core.String? cardButtonText,
    $core.String? objectIcon,
    $core.int? objectId,
    $core.int? cardDisplayType,
    $core.int? redirectType,
    $core.String? subType,
    $core.String? jumpUrl,
  }) {
    final _result = create();
    if (sourcePath != null) {
      _result.sourcePath = sourcePath;
    }
    if (sourceText != null) {
      _result.sourceText = sourceText;
    }
    if (sourceUserName != null) {
      _result.sourceUserName = sourceUserName;
    }
    if (sourceUid != null) {
      _result.sourceUid = sourceUid;
    }
    if (sourceSex != null) {
      _result.sourceSex = sourceSex;
    }
    if (cardText != null) {
      _result.cardText = cardText;
    }
    if (cardButtonText != null) {
      _result.cardButtonText = cardButtonText;
    }
    if (objectIcon != null) {
      _result.objectIcon = objectIcon;
    }
    if (objectId != null) {
      _result.objectId = objectId;
    }
    if (cardDisplayType != null) {
      _result.cardDisplayType = cardDisplayType;
    }
    if (redirectType != null) {
      _result.redirectType = redirectType;
    }
    if (subType != null) {
      _result.subType = subType;
    }
    if (jumpUrl != null) {
      _result.jumpUrl = jumpUrl;
    }
    return _result;
  }
  factory MateSearchJointEggItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateSearchJointEggItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateSearchJointEggItem clone() =>
      MateSearchJointEggItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateSearchJointEggItem copyWith(
          void Function(MateSearchJointEggItem) updates) =>
      super.copyWith((message) => updates(message as MateSearchJointEggItem))
          as MateSearchJointEggItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateSearchJointEggItem create() => MateSearchJointEggItem._();
  MateSearchJointEggItem createEmptyInstance() => create();
  static $pb.PbList<MateSearchJointEggItem> createRepeated() =>
      $pb.PbList<MateSearchJointEggItem>();
  @$core.pragma('dart2js:noInline')
  static MateSearchJointEggItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateSearchJointEggItem>(create);
  static MateSearchJointEggItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sourcePath => $_getSZ(0);
  @$pb.TagNumber(1)
  set sourcePath($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSourcePath() => $_has(0);
  @$pb.TagNumber(1)
  void clearSourcePath() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sourceText => $_getSZ(1);
  @$pb.TagNumber(2)
  set sourceText($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSourceText() => $_has(1);
  @$pb.TagNumber(2)
  void clearSourceText() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sourceUserName => $_getSZ(2);
  @$pb.TagNumber(3)
  set sourceUserName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSourceUserName() => $_has(2);
  @$pb.TagNumber(3)
  void clearSourceUserName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get sourceUid => $_getIZ(3);
  @$pb.TagNumber(4)
  set sourceUid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSourceUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearSourceUid() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get sourceSex => $_getIZ(4);
  @$pb.TagNumber(5)
  set sourceSex($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSourceSex() => $_has(4);
  @$pb.TagNumber(5)
  void clearSourceSex() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get cardText => $_getSZ(5);
  @$pb.TagNumber(6)
  set cardText($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCardText() => $_has(5);
  @$pb.TagNumber(6)
  void clearCardText() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get cardButtonText => $_getSZ(6);
  @$pb.TagNumber(7)
  set cardButtonText($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCardButtonText() => $_has(6);
  @$pb.TagNumber(7)
  void clearCardButtonText() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get objectIcon => $_getSZ(7);
  @$pb.TagNumber(8)
  set objectIcon($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasObjectIcon() => $_has(7);
  @$pb.TagNumber(8)
  void clearObjectIcon() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get objectId => $_getIZ(8);
  @$pb.TagNumber(9)
  set objectId($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasObjectId() => $_has(8);
  @$pb.TagNumber(9)
  void clearObjectId() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get cardDisplayType => $_getIZ(9);
  @$pb.TagNumber(10)
  set cardDisplayType($core.int v) {
    $_setSignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasCardDisplayType() => $_has(9);
  @$pb.TagNumber(10)
  void clearCardDisplayType() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get redirectType => $_getIZ(10);
  @$pb.TagNumber(11)
  set redirectType($core.int v) {
    $_setSignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasRedirectType() => $_has(10);
  @$pb.TagNumber(11)
  void clearRedirectType() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get subType => $_getSZ(11);
  @$pb.TagNumber(12)
  set subType($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasSubType() => $_has(11);
  @$pb.TagNumber(12)
  void clearSubType() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get jumpUrl => $_getSZ(12);
  @$pb.TagNumber(13)
  set jumpUrl($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasJumpUrl() => $_has(12);
  @$pb.TagNumber(13)
  void clearJumpUrl() => clearField(13);
}

class MateSearchJointBagItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateSearchJointBagItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bagPretty')
    ..hasRequiredFields = false;

  MateSearchJointBagItem._() : super();
  factory MateSearchJointBagItem({
    $core.String? bagPretty,
  }) {
    final _result = create();
    if (bagPretty != null) {
      _result.bagPretty = bagPretty;
    }
    return _result;
  }
  factory MateSearchJointBagItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateSearchJointBagItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateSearchJointBagItem clone() =>
      MateSearchJointBagItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateSearchJointBagItem copyWith(
          void Function(MateSearchJointBagItem) updates) =>
      super.copyWith((message) => updates(message as MateSearchJointBagItem))
          as MateSearchJointBagItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateSearchJointBagItem create() => MateSearchJointBagItem._();
  MateSearchJointBagItem createEmptyInstance() => create();
  static $pb.PbList<MateSearchJointBagItem> createRepeated() =>
      $pb.PbList<MateSearchJointBagItem>();
  @$core.pragma('dart2js:noInline')
  static MateSearchJointBagItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateSearchJointBagItem>(create);
  static MateSearchJointBagItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bagPretty => $_getSZ(0);
  @$pb.TagNumber(1)
  set bagPretty($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBagPretty() => $_has(0);
  @$pb.TagNumber(1)
  void clearBagPretty() => clearField(1);
}

class MateSearchJointGroupItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateSearchJointGroupItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isInGroup')
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isOfficial')
    ..hasRequiredFields = false;

  MateSearchJointGroupItem._() : super();
  factory MateSearchJointGroupItem({
    $core.bool? isInGroup,
    $core.bool? isOfficial,
  }) {
    final _result = create();
    if (isInGroup != null) {
      _result.isInGroup = isInGroup;
    }
    if (isOfficial != null) {
      _result.isOfficial = isOfficial;
    }
    return _result;
  }
  factory MateSearchJointGroupItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateSearchJointGroupItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateSearchJointGroupItem clone() =>
      MateSearchJointGroupItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateSearchJointGroupItem copyWith(
          void Function(MateSearchJointGroupItem) updates) =>
      super.copyWith((message) => updates(message as MateSearchJointGroupItem))
          as MateSearchJointGroupItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateSearchJointGroupItem create() => MateSearchJointGroupItem._();
  MateSearchJointGroupItem createEmptyInstance() => create();
  static $pb.PbList<MateSearchJointGroupItem> createRepeated() =>
      $pb.PbList<MateSearchJointGroupItem>();
  @$core.pragma('dart2js:noInline')
  static MateSearchJointGroupItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateSearchJointGroupItem>(create);
  static MateSearchJointGroupItem? _defaultInstance;

  @$pb.TagNumber(2)
  $core.bool get isInGroup => $_getBF(0);
  @$pb.TagNumber(2)
  set isInGroup($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIsInGroup() => $_has(0);
  @$pb.TagNumber(2)
  void clearIsInGroup() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isOfficial => $_getBF(1);
  @$pb.TagNumber(3)
  set isOfficial($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIsOfficial() => $_has(1);
  @$pb.TagNumber(3)
  void clearIsOfficial() => clearField(3);
}

class MateSearchJointRoomItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateSearchJointRoomItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prettyId')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'receptionName')
    ..hasRequiredFields = false;

  MateSearchJointRoomItem._() : super();
  factory MateSearchJointRoomItem({
    $core.String? prettyId,
    $core.String? receptionName,
  }) {
    final _result = create();
    if (prettyId != null) {
      _result.prettyId = prettyId;
    }
    if (receptionName != null) {
      _result.receptionName = receptionName;
    }
    return _result;
  }
  factory MateSearchJointRoomItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateSearchJointRoomItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateSearchJointRoomItem clone() =>
      MateSearchJointRoomItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateSearchJointRoomItem copyWith(
          void Function(MateSearchJointRoomItem) updates) =>
      super.copyWith((message) => updates(message as MateSearchJointRoomItem))
          as MateSearchJointRoomItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateSearchJointRoomItem create() => MateSearchJointRoomItem._();
  MateSearchJointRoomItem createEmptyInstance() => create();
  static $pb.PbList<MateSearchJointRoomItem> createRepeated() =>
      $pb.PbList<MateSearchJointRoomItem>();
  @$core.pragma('dart2js:noInline')
  static MateSearchJointRoomItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateSearchJointRoomItem>(create);
  static MateSearchJointRoomItem? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get prettyId => $_getSZ(0);
  @$pb.TagNumber(2)
  set prettyId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPrettyId() => $_has(0);
  @$pb.TagNumber(2)
  void clearPrettyId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get receptionName => $_getSZ(1);
  @$pb.TagNumber(3)
  set receptionName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasReceptionName() => $_has(1);
  @$pb.TagNumber(3)
  void clearReceptionName() => clearField(3);
}

class MateSearchJointUnionItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateSearchJointUnionItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'shortName')
    ..hasRequiredFields = false;

  MateSearchJointUnionItem._() : super();
  factory MateSearchJointUnionItem({
    $core.String? shortName,
  }) {
    final _result = create();
    if (shortName != null) {
      _result.shortName = shortName;
    }
    return _result;
  }
  factory MateSearchJointUnionItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateSearchJointUnionItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateSearchJointUnionItem clone() =>
      MateSearchJointUnionItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateSearchJointUnionItem copyWith(
          void Function(MateSearchJointUnionItem) updates) =>
      super.copyWith((message) => updates(message as MateSearchJointUnionItem))
          as MateSearchJointUnionItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateSearchJointUnionItem create() => MateSearchJointUnionItem._();
  MateSearchJointUnionItem createEmptyInstance() => create();
  static $pb.PbList<MateSearchJointUnionItem> createRepeated() =>
      $pb.PbList<MateSearchJointUnionItem>();
  @$core.pragma('dart2js:noInline')
  static MateSearchJointUnionItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateSearchJointUnionItem>(create);
  static MateSearchJointUnionItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get shortName => $_getSZ(0);
  @$pb.TagNumber(1)
  set shortName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShortName() => $_has(0);
  @$pb.TagNumber(1)
  void clearShortName() => clearField(1);
}

class MateSearchJointTourItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MateSearchJointTourItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupId',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MateSearchJointTourItem._() : super();
  factory MateSearchJointTourItem({
    $core.int? roomId,
    $core.int? groupId,
  }) {
    final _result = create();
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    return _result;
  }
  factory MateSearchJointTourItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MateSearchJointTourItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MateSearchJointTourItem clone() =>
      MateSearchJointTourItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MateSearchJointTourItem copyWith(
          void Function(MateSearchJointTourItem) updates) =>
      super.copyWith((message) => updates(message as MateSearchJointTourItem))
          as MateSearchJointTourItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MateSearchJointTourItem create() => MateSearchJointTourItem._();
  MateSearchJointTourItem createEmptyInstance() => create();
  static $pb.PbList<MateSearchJointTourItem> createRepeated() =>
      $pb.PbList<MateSearchJointTourItem>();
  @$core.pragma('dart2js:noInline')
  static MateSearchJointTourItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MateSearchJointTourItem>(create);
  static MateSearchJointTourItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get roomId => $_getIZ(0);
  @$pb.TagNumber(1)
  set roomId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get groupId => $_getIZ(1);
  @$pb.TagNumber(2)
  set groupId($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGroupId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupId() => clearField(2);
}
