///
//  Generated code. Do not modify.
//  source: room.group.pk.new.result.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomGroupPkNewResult_BlueList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomGroupPkNewResult.BlueList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.group.pk.new.result'),
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
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomGroupPkNewResult_BlueList._() : super();
  factory RoomGroupPkNewResult_BlueList({
    $core.String? icon,
    $core.String? name,
    $core.int? score,
    $core.String? sex,
    $core.int? uid,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (score != null) {
      _result.score = score;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory RoomGroupPkNewResult_BlueList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomGroupPkNewResult_BlueList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomGroupPkNewResult_BlueList clone() =>
      RoomGroupPkNewResult_BlueList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomGroupPkNewResult_BlueList copyWith(
          void Function(RoomGroupPkNewResult_BlueList) updates) =>
      super.copyWith(
              (message) => updates(message as RoomGroupPkNewResult_BlueList))
          as RoomGroupPkNewResult_BlueList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomGroupPkNewResult_BlueList create() =>
      RoomGroupPkNewResult_BlueList._();
  RoomGroupPkNewResult_BlueList createEmptyInstance() => create();
  static $pb.PbList<RoomGroupPkNewResult_BlueList> createRepeated() =>
      $pb.PbList<RoomGroupPkNewResult_BlueList>();
  @$core.pragma('dart2js:noInline')
  static RoomGroupPkNewResult_BlueList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomGroupPkNewResult_BlueList>(create);
  static RoomGroupPkNewResult_BlueList? _defaultInstance;

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
  $core.int get score => $_getIZ(2);
  @$pb.TagNumber(3)
  set score($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearScore() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sex => $_getSZ(3);
  @$pb.TagNumber(4)
  set sex($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

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

class RoomGroupPkNewResult_Contribution extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomGroupPkNewResult.Contribution',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.group.pk.new.result'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift_value')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomGroupPkNewResult_Contribution._() : super();
  factory RoomGroupPkNewResult_Contribution({
    $core.String? giftValue,
    $core.String? icon,
    $core.String? name,
    $core.String? sex,
    $core.int? uid,
  }) {
    final _result = create();
    if (giftValue != null) {
      _result.giftValue = giftValue;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory RoomGroupPkNewResult_Contribution.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomGroupPkNewResult_Contribution.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomGroupPkNewResult_Contribution clone() =>
      RoomGroupPkNewResult_Contribution()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomGroupPkNewResult_Contribution copyWith(
          void Function(RoomGroupPkNewResult_Contribution) updates) =>
      super.copyWith((message) =>
              updates(message as RoomGroupPkNewResult_Contribution))
          as RoomGroupPkNewResult_Contribution; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomGroupPkNewResult_Contribution create() =>
      RoomGroupPkNewResult_Contribution._();
  RoomGroupPkNewResult_Contribution createEmptyInstance() => create();
  static $pb.PbList<RoomGroupPkNewResult_Contribution> createRepeated() =>
      $pb.PbList<RoomGroupPkNewResult_Contribution>();
  @$core.pragma('dart2js:noInline')
  static RoomGroupPkNewResult_Contribution getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomGroupPkNewResult_Contribution>(
          create);
  static RoomGroupPkNewResult_Contribution? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get giftValue => $_getSZ(0);
  @$pb.TagNumber(1)
  set giftValue($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGiftValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftValue() => clearField(1);

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
  $core.String get sex => $_getSZ(3);
  @$pb.TagNumber(4)
  set sex($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

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

class RoomGroupPkNewResult_RedList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomGroupPkNewResult.RedList',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.group.pk.new.result'),
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
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomGroupPkNewResult_RedList._() : super();
  factory RoomGroupPkNewResult_RedList({
    $core.String? icon,
    $core.String? name,
    $core.int? score,
    $core.String? sex,
    $core.int? uid,
  }) {
    final _result = create();
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (score != null) {
      _result.score = score;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory RoomGroupPkNewResult_RedList.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomGroupPkNewResult_RedList.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomGroupPkNewResult_RedList clone() =>
      RoomGroupPkNewResult_RedList()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomGroupPkNewResult_RedList copyWith(
          void Function(RoomGroupPkNewResult_RedList) updates) =>
      super.copyWith(
              (message) => updates(message as RoomGroupPkNewResult_RedList))
          as RoomGroupPkNewResult_RedList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomGroupPkNewResult_RedList create() =>
      RoomGroupPkNewResult_RedList._();
  RoomGroupPkNewResult_RedList createEmptyInstance() => create();
  static $pb.PbList<RoomGroupPkNewResult_RedList> createRepeated() =>
      $pb.PbList<RoomGroupPkNewResult_RedList>();
  @$core.pragma('dart2js:noInline')
  static RoomGroupPkNewResult_RedList getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomGroupPkNewResult_RedList>(create);
  static RoomGroupPkNewResult_RedList? _defaultInstance;

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
  $core.int get score => $_getIZ(2);
  @$pb.TagNumber(3)
  set score($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearScore() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sex => $_getSZ(3);
  @$pb.TagNumber(4)
  set sex($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSex() => $_has(3);
  @$pb.TagNumber(4)
  void clearSex() => clearField(4);

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

class RoomGroupPkNewResult_Card extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomGroupPkNewResult.Card',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.group.pk.new.result'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'card_icon')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'card_name')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'count',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomGroupPkNewResult_Card._() : super();
  factory RoomGroupPkNewResult_Card({
    $core.String? cardIcon,
    $core.String? cardName,
    $core.int? count,
    $core.int? uid,
  }) {
    final _result = create();
    if (cardIcon != null) {
      _result.cardIcon = cardIcon;
    }
    if (cardName != null) {
      _result.cardName = cardName;
    }
    if (count != null) {
      _result.count = count;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory RoomGroupPkNewResult_Card.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomGroupPkNewResult_Card.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomGroupPkNewResult_Card clone() =>
      RoomGroupPkNewResult_Card()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomGroupPkNewResult_Card copyWith(
          void Function(RoomGroupPkNewResult_Card) updates) =>
      super.copyWith((message) => updates(message as RoomGroupPkNewResult_Card))
          as RoomGroupPkNewResult_Card; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomGroupPkNewResult_Card create() => RoomGroupPkNewResult_Card._();
  RoomGroupPkNewResult_Card createEmptyInstance() => create();
  static $pb.PbList<RoomGroupPkNewResult_Card> createRepeated() =>
      $pb.PbList<RoomGroupPkNewResult_Card>();
  @$core.pragma('dart2js:noInline')
  static RoomGroupPkNewResult_Card getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomGroupPkNewResult_Card>(create);
  static RoomGroupPkNewResult_Card? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cardIcon => $_getSZ(0);
  @$pb.TagNumber(1)
  set cardIcon($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCardIcon() => $_has(0);
  @$pb.TagNumber(1)
  void clearCardIcon() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cardName => $_getSZ(1);
  @$pb.TagNumber(2)
  set cardName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCardName() => $_has(1);
  @$pb.TagNumber(2)
  void clearCardName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get count => $_getIZ(2);
  @$pb.TagNumber(3)
  set count($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get uid => $_getIZ(3);
  @$pb.TagNumber(4)
  set uid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearUid() => clearField(4);
}

class RoomGroupPkNewResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomGroupPkNewResult',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.group.pk.new.result'),
      createEmptyInstance: create)
    ..pc<RoomGroupPkNewResult_BlueList>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'blue_list',
        $pb.PbFieldType.PM,
        subBuilder: RoomGroupPkNewResult_BlueList.create)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'blue_total',
        $pb.PbFieldType.OU3)
    ..pc<RoomGroupPkNewResult_Contribution>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'contribution',
        $pb.PbFieldType.PM,
        subBuilder: RoomGroupPkNewResult_Contribution.create)
    ..pc<RoomGroupPkNewResult_RedList>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'red_list',
        $pb.PbFieldType.PM,
        subBuilder: RoomGroupPkNewResult_RedList.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'red_total',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rule')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'side')
    ..aOM<RoomGroupPkNewResult_Card>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'card',
        subBuilder: RoomGroupPkNewResult_Card.create)
    ..hasRequiredFields = false;

  RoomGroupPkNewResult._() : super();
  factory RoomGroupPkNewResult({
    $core.Iterable<RoomGroupPkNewResult_BlueList>? blueList,
    $core.int? blueTotal,
    $core.Iterable<RoomGroupPkNewResult_Contribution>? contribution,
    $core.Iterable<RoomGroupPkNewResult_RedList>? redList,
    $core.int? redTotal,
    $core.String? rule,
    $core.String? side,
    RoomGroupPkNewResult_Card? card,
  }) {
    final _result = create();
    if (blueList != null) {
      _result.blueList.addAll(blueList);
    }
    if (blueTotal != null) {
      _result.blueTotal = blueTotal;
    }
    if (contribution != null) {
      _result.contribution.addAll(contribution);
    }
    if (redList != null) {
      _result.redList.addAll(redList);
    }
    if (redTotal != null) {
      _result.redTotal = redTotal;
    }
    if (rule != null) {
      _result.rule = rule;
    }
    if (side != null) {
      _result.side = side;
    }
    if (card != null) {
      _result.card = card;
    }
    return _result;
  }
  factory RoomGroupPkNewResult.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomGroupPkNewResult.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomGroupPkNewResult clone() =>
      RoomGroupPkNewResult()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomGroupPkNewResult copyWith(void Function(RoomGroupPkNewResult) updates) =>
      super.copyWith((message) => updates(message as RoomGroupPkNewResult))
          as RoomGroupPkNewResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomGroupPkNewResult create() => RoomGroupPkNewResult._();
  RoomGroupPkNewResult createEmptyInstance() => create();
  static $pb.PbList<RoomGroupPkNewResult> createRepeated() =>
      $pb.PbList<RoomGroupPkNewResult>();
  @$core.pragma('dart2js:noInline')
  static RoomGroupPkNewResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomGroupPkNewResult>(create);
  static RoomGroupPkNewResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RoomGroupPkNewResult_BlueList> get blueList => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get blueTotal => $_getIZ(1);
  @$pb.TagNumber(2)
  set blueTotal($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBlueTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlueTotal() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<RoomGroupPkNewResult_Contribution> get contribution =>
      $_getList(2);

  @$pb.TagNumber(4)
  $core.List<RoomGroupPkNewResult_RedList> get redList => $_getList(3);

  @$pb.TagNumber(5)
  $core.int get redTotal => $_getIZ(4);
  @$pb.TagNumber(5)
  set redTotal($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRedTotal() => $_has(4);
  @$pb.TagNumber(5)
  void clearRedTotal() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get rule => $_getSZ(5);
  @$pb.TagNumber(6)
  set rule($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRule() => $_has(5);
  @$pb.TagNumber(6)
  void clearRule() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get side => $_getSZ(6);
  @$pb.TagNumber(7)
  set side($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSide() => $_has(6);
  @$pb.TagNumber(7)
  void clearSide() => clearField(7);

  @$pb.TagNumber(8)
  RoomGroupPkNewResult_Card get card => $_getN(7);
  @$pb.TagNumber(8)
  set card(RoomGroupPkNewResult_Card v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasCard() => $_has(7);
  @$pb.TagNumber(8)
  void clearCard() => clearField(8);
  @$pb.TagNumber(8)
  RoomGroupPkNewResult_Card ensureCard() => $_ensure(7);
}
