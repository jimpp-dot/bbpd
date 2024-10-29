///
//  Generated code. Do not modify.
//  source: pet.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ApiPetHomeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiPetHomeResponse',
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
    ..aOM<PetHomeData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: PetHomeData.create)
    ..hasRequiredFields = false;

  ApiPetHomeResponse._() : super();
  factory ApiPetHomeResponse({
    $core.bool? success,
    $core.String? message,
    PetHomeData? data,
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
  factory ApiPetHomeResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiPetHomeResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiPetHomeResponse clone() => ApiPetHomeResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiPetHomeResponse copyWith(void Function(ApiPetHomeResponse) updates) =>
      super.copyWith((message) => updates(message as ApiPetHomeResponse))
          as ApiPetHomeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiPetHomeResponse create() => ApiPetHomeResponse._();
  ApiPetHomeResponse createEmptyInstance() => create();
  static $pb.PbList<ApiPetHomeResponse> createRepeated() =>
      $pb.PbList<ApiPetHomeResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiPetHomeResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiPetHomeResponse>(create);
  static ApiPetHomeResponse? _defaultInstance;

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
  PetHomeData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(PetHomeData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  PetHomeData ensureData() => $_ensure(2);
}

class PetHomeData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PetHomeData',
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
    ..aOM<PetInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cat',
        subBuilder: PetInfo.create)
    ..aOM<PetUserProps>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'props',
        subBuilder: PetUserProps.create)
    ..hasRequiredFields = false;

  PetHomeData._() : super();
  factory PetHomeData({
    $core.int? uid,
    PetInfo? cat,
    PetUserProps? props,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (cat != null) {
      _result.cat = cat;
    }
    if (props != null) {
      _result.props = props;
    }
    return _result;
  }
  factory PetHomeData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PetHomeData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PetHomeData clone() => PetHomeData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PetHomeData copyWith(void Function(PetHomeData) updates) =>
      super.copyWith((message) => updates(message as PetHomeData))
          as PetHomeData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PetHomeData create() => PetHomeData._();
  PetHomeData createEmptyInstance() => create();
  static $pb.PbList<PetHomeData> createRepeated() => $pb.PbList<PetHomeData>();
  @$core.pragma('dart2js:noInline')
  static PetHomeData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PetHomeData>(create);
  static PetHomeData? _defaultInstance;

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
  PetInfo get cat => $_getN(1);
  @$pb.TagNumber(2)
  set cat(PetInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCat() => $_has(1);
  @$pb.TagNumber(2)
  void clearCat() => clearField(2);
  @$pb.TagNumber(2)
  PetInfo ensureCat() => $_ensure(1);

  @$pb.TagNumber(3)
  PetUserProps get props => $_getN(2);
  @$pb.TagNumber(3)
  set props(PetUserProps v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasProps() => $_has(2);
  @$pb.TagNumber(3)
  void clearProps() => clearField(3);
  @$pb.TagNumber(3)
  PetUserProps ensureProps() => $_ensure(2);
}

class PetInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PetInfo',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pet',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'urlSleeping')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'urlFeed')
    ..aOM<PetStealProgress>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'progress',
        subBuilder: PetStealProgress.create)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'protectDuration',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'award',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PetInfo._() : super();
  factory PetInfo({
    $core.int? id,
    $core.int? pet,
    $core.String? name,
    $core.int? level,
    $core.int? status,
    $core.String? url,
    $core.String? urlSleeping,
    $core.String? urlFeed,
    PetStealProgress? progress,
    $core.int? protectDuration,
    $core.int? award,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (pet != null) {
      _result.pet = pet;
    }
    if (name != null) {
      _result.name = name;
    }
    if (level != null) {
      _result.level = level;
    }
    if (status != null) {
      _result.status = status;
    }
    if (url != null) {
      _result.url = url;
    }
    if (urlSleeping != null) {
      _result.urlSleeping = urlSleeping;
    }
    if (urlFeed != null) {
      _result.urlFeed = urlFeed;
    }
    if (progress != null) {
      _result.progress = progress;
    }
    if (protectDuration != null) {
      _result.protectDuration = protectDuration;
    }
    if (award != null) {
      _result.award = award;
    }
    return _result;
  }
  factory PetInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PetInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PetInfo clone() => PetInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PetInfo copyWith(void Function(PetInfo) updates) =>
      super.copyWith((message) => updates(message as PetInfo))
          as PetInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PetInfo create() => PetInfo._();
  PetInfo createEmptyInstance() => create();
  static $pb.PbList<PetInfo> createRepeated() => $pb.PbList<PetInfo>();
  @$core.pragma('dart2js:noInline')
  static PetInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PetInfo>(create);
  static PetInfo? _defaultInstance;

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
  $core.int get pet => $_getIZ(1);
  @$pb.TagNumber(2)
  set pet($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPet() => $_has(1);
  @$pb.TagNumber(2)
  void clearPet() => clearField(2);

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
  $core.int get level => $_getIZ(3);
  @$pb.TagNumber(4)
  set level($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevel() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get status => $_getIZ(4);
  @$pb.TagNumber(5)
  set status($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get url => $_getSZ(5);
  @$pb.TagNumber(6)
  set url($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearUrl() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get urlSleeping => $_getSZ(6);
  @$pb.TagNumber(7)
  set urlSleeping($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUrlSleeping() => $_has(6);
  @$pb.TagNumber(7)
  void clearUrlSleeping() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get urlFeed => $_getSZ(7);
  @$pb.TagNumber(8)
  set urlFeed($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasUrlFeed() => $_has(7);
  @$pb.TagNumber(8)
  void clearUrlFeed() => clearField(8);

  @$pb.TagNumber(9)
  PetStealProgress get progress => $_getN(8);
  @$pb.TagNumber(9)
  set progress(PetStealProgress v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasProgress() => $_has(8);
  @$pb.TagNumber(9)
  void clearProgress() => clearField(9);
  @$pb.TagNumber(9)
  PetStealProgress ensureProgress() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.int get protectDuration => $_getIZ(9);
  @$pb.TagNumber(10)
  set protectDuration($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasProtectDuration() => $_has(9);
  @$pb.TagNumber(10)
  void clearProtectDuration() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get award => $_getIZ(10);
  @$pb.TagNumber(11)
  set award($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasAward() => $_has(10);
  @$pb.TagNumber(11)
  void clearAward() => clearField(11);
}

class PetStealProgress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PetStealProgress',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'min',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cur',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'max',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PetStealProgress._() : super();
  factory PetStealProgress({
    $core.int? min,
    $core.int? cur,
    $core.int? max,
  }) {
    final _result = create();
    if (min != null) {
      _result.min = min;
    }
    if (cur != null) {
      _result.cur = cur;
    }
    if (max != null) {
      _result.max = max;
    }
    return _result;
  }
  factory PetStealProgress.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PetStealProgress.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PetStealProgress clone() => PetStealProgress()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PetStealProgress copyWith(void Function(PetStealProgress) updates) =>
      super.copyWith((message) => updates(message as PetStealProgress))
          as PetStealProgress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PetStealProgress create() => PetStealProgress._();
  PetStealProgress createEmptyInstance() => create();
  static $pb.PbList<PetStealProgress> createRepeated() =>
      $pb.PbList<PetStealProgress>();
  @$core.pragma('dart2js:noInline')
  static PetStealProgress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PetStealProgress>(create);
  static PetStealProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get min => $_getIZ(0);
  @$pb.TagNumber(1)
  set min($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMin() => $_has(0);
  @$pb.TagNumber(1)
  void clearMin() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get cur => $_getIZ(1);
  @$pb.TagNumber(2)
  set cur($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCur() => $_has(1);
  @$pb.TagNumber(2)
  void clearCur() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get max => $_getIZ(2);
  @$pb.TagNumber(3)
  set max($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMax() => $_has(2);
  @$pb.TagNumber(3)
  void clearMax() => clearField(3);
}

class PetUserProps extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PetUserProps',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fish',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stick',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'shield',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PetUserProps._() : super();
  factory PetUserProps({
    $core.int? fish,
    $core.int? stick,
    $core.int? shield,
  }) {
    final _result = create();
    if (fish != null) {
      _result.fish = fish;
    }
    if (stick != null) {
      _result.stick = stick;
    }
    if (shield != null) {
      _result.shield = shield;
    }
    return _result;
  }
  factory PetUserProps.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PetUserProps.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PetUserProps clone() => PetUserProps()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PetUserProps copyWith(void Function(PetUserProps) updates) =>
      super.copyWith((message) => updates(message as PetUserProps))
          as PetUserProps; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PetUserProps create() => PetUserProps._();
  PetUserProps createEmptyInstance() => create();
  static $pb.PbList<PetUserProps> createRepeated() =>
      $pb.PbList<PetUserProps>();
  @$core.pragma('dart2js:noInline')
  static PetUserProps getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PetUserProps>(create);
  static PetUserProps? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get fish => $_getIZ(0);
  @$pb.TagNumber(1)
  set fish($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFish() => $_has(0);
  @$pb.TagNumber(1)
  void clearFish() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get stick => $_getIZ(1);
  @$pb.TagNumber(2)
  set stick($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStick() => $_has(1);
  @$pb.TagNumber(2)
  void clearStick() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get shield => $_getIZ(2);
  @$pb.TagNumber(3)
  set shield($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasShield() => $_has(2);
  @$pb.TagNumber(3)
  void clearShield() => clearField(3);
}

class ApiPetTaskResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiPetTaskResponse',
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
    ..aOM<PetTaskData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: PetTaskData.create)
    ..hasRequiredFields = false;

  ApiPetTaskResponse._() : super();
  factory ApiPetTaskResponse({
    $core.bool? success,
    $core.String? message,
    PetTaskData? data,
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
  factory ApiPetTaskResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiPetTaskResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiPetTaskResponse clone() => ApiPetTaskResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiPetTaskResponse copyWith(void Function(ApiPetTaskResponse) updates) =>
      super.copyWith((message) => updates(message as ApiPetTaskResponse))
          as ApiPetTaskResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiPetTaskResponse create() => ApiPetTaskResponse._();
  ApiPetTaskResponse createEmptyInstance() => create();
  static $pb.PbList<ApiPetTaskResponse> createRepeated() =>
      $pb.PbList<ApiPetTaskResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiPetTaskResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiPetTaskResponse>(create);
  static ApiPetTaskResponse? _defaultInstance;

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
  PetTaskData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(PetTaskData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  PetTaskData ensureData() => $_ensure(2);
}

class PetTaskData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PetTaskData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<PetTaskItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tasks',
        $pb.PbFieldType.PM,
        subBuilder: PetTaskItem.create)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasMore')
    ..hasRequiredFields = false;

  PetTaskData._() : super();
  factory PetTaskData({
    $core.Iterable<PetTaskItem>? tasks,
    $core.bool? hasMore,
  }) {
    final _result = create();
    if (tasks != null) {
      _result.tasks.addAll(tasks);
    }
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    return _result;
  }
  factory PetTaskData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PetTaskData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PetTaskData clone() => PetTaskData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PetTaskData copyWith(void Function(PetTaskData) updates) =>
      super.copyWith((message) => updates(message as PetTaskData))
          as PetTaskData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PetTaskData create() => PetTaskData._();
  PetTaskData createEmptyInstance() => create();
  static $pb.PbList<PetTaskData> createRepeated() => $pb.PbList<PetTaskData>();
  @$core.pragma('dart2js:noInline')
  static PetTaskData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PetTaskData>(create);
  static PetTaskData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PetTaskItem> get tasks => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get hasMore => $_getBF(1);
  @$pb.TagNumber(2)
  set hasMore($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHasMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearHasMore() => clearField(2);
}

class PetTaskItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PetTaskItem',
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
            : 'prop')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'propNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'progressCur',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'progressMax',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PetTaskItem._() : super();
  factory PetTaskItem({
    $core.int? id,
    $core.String? icon,
    $core.String? name,
    $core.String? prop,
    $core.int? propNum,
    $core.int? progressCur,
    $core.int? progressMax,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (prop != null) {
      _result.prop = prop;
    }
    if (propNum != null) {
      _result.propNum = propNum;
    }
    if (progressCur != null) {
      _result.progressCur = progressCur;
    }
    if (progressMax != null) {
      _result.progressMax = progressMax;
    }
    return _result;
  }
  factory PetTaskItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PetTaskItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PetTaskItem clone() => PetTaskItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PetTaskItem copyWith(void Function(PetTaskItem) updates) =>
      super.copyWith((message) => updates(message as PetTaskItem))
          as PetTaskItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PetTaskItem create() => PetTaskItem._();
  PetTaskItem createEmptyInstance() => create();
  static $pb.PbList<PetTaskItem> createRepeated() => $pb.PbList<PetTaskItem>();
  @$core.pragma('dart2js:noInline')
  static PetTaskItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PetTaskItem>(create);
  static PetTaskItem? _defaultInstance;

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
  $core.String get prop => $_getSZ(3);
  @$pb.TagNumber(4)
  set prop($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasProp() => $_has(3);
  @$pb.TagNumber(4)
  void clearProp() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get propNum => $_getIZ(4);
  @$pb.TagNumber(5)
  set propNum($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPropNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearPropNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get progressCur => $_getIZ(5);
  @$pb.TagNumber(6)
  set progressCur($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasProgressCur() => $_has(5);
  @$pb.TagNumber(6)
  void clearProgressCur() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get progressMax => $_getIZ(6);
  @$pb.TagNumber(7)
  set progressMax($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasProgressMax() => $_has(6);
  @$pb.TagNumber(7)
  void clearProgressMax() => clearField(7);
}

class ApiPetRankResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiPetRankResponse',
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
    ..aOM<PetRankData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: PetRankData.create)
    ..hasRequiredFields = false;

  ApiPetRankResponse._() : super();
  factory ApiPetRankResponse({
    $core.bool? success,
    $core.String? message,
    PetRankData? data,
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
  factory ApiPetRankResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiPetRankResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiPetRankResponse clone() => ApiPetRankResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiPetRankResponse copyWith(void Function(ApiPetRankResponse) updates) =>
      super.copyWith((message) => updates(message as ApiPetRankResponse))
          as ApiPetRankResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiPetRankResponse create() => ApiPetRankResponse._();
  ApiPetRankResponse createEmptyInstance() => create();
  static $pb.PbList<ApiPetRankResponse> createRepeated() =>
      $pb.PbList<ApiPetRankResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiPetRankResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiPetRankResponse>(create);
  static ApiPetRankResponse? _defaultInstance;

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
  PetRankData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(PetRankData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  PetRankData ensureData() => $_ensure(2);
}

class PetRankData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PetRankData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<PetRankItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ranks',
        $pb.PbFieldType.PM,
        subBuilder: PetRankItem.create)
    ..aOM<PetRankItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'self',
        subBuilder: PetRankItem.create)
    ..aOB(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasMore')
    ..hasRequiredFields = false;

  PetRankData._() : super();
  factory PetRankData({
    $core.Iterable<PetRankItem>? ranks,
    PetRankItem? self,
    $core.bool? hasMore,
  }) {
    final _result = create();
    if (ranks != null) {
      _result.ranks.addAll(ranks);
    }
    if (self != null) {
      _result.self = self;
    }
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    return _result;
  }
  factory PetRankData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PetRankData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PetRankData clone() => PetRankData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PetRankData copyWith(void Function(PetRankData) updates) =>
      super.copyWith((message) => updates(message as PetRankData))
          as PetRankData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PetRankData create() => PetRankData._();
  PetRankData createEmptyInstance() => create();
  static $pb.PbList<PetRankData> createRepeated() => $pb.PbList<PetRankData>();
  @$core.pragma('dart2js:noInline')
  static PetRankData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PetRankData>(create);
  static PetRankData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PetRankItem> get ranks => $_getList(0);

  @$pb.TagNumber(2)
  PetRankItem get self => $_getN(1);
  @$pb.TagNumber(2)
  set self(PetRankItem v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSelf() => $_has(1);
  @$pb.TagNumber(2)
  void clearSelf() => clearField(2);
  @$pb.TagNumber(2)
  PetRankItem ensureSelf() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get hasMore => $_getBF(2);
  @$pb.TagNumber(3)
  set hasMore($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasHasMore() => $_has(2);
  @$pb.TagNumber(3)
  void clearHasMore() => clearField(3);
}

class PetRankItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PetRankItem',
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
            : 'icon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'petLevel',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rank',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PetRankItem._() : super();
  factory PetRankItem({
    $core.int? uid,
    $core.String? icon,
    $core.String? name,
    $core.int? petLevel,
    $core.int? rank,
    $core.int? score,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (petLevel != null) {
      _result.petLevel = petLevel;
    }
    if (rank != null) {
      _result.rank = rank;
    }
    if (score != null) {
      _result.score = score;
    }
    return _result;
  }
  factory PetRankItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PetRankItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PetRankItem clone() => PetRankItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PetRankItem copyWith(void Function(PetRankItem) updates) =>
      super.copyWith((message) => updates(message as PetRankItem))
          as PetRankItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PetRankItem create() => PetRankItem._();
  PetRankItem createEmptyInstance() => create();
  static $pb.PbList<PetRankItem> createRepeated() => $pb.PbList<PetRankItem>();
  @$core.pragma('dart2js:noInline')
  static PetRankItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PetRankItem>(create);
  static PetRankItem? _defaultInstance;

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
  $core.int get petLevel => $_getIZ(3);
  @$pb.TagNumber(4)
  set petLevel($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPetLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearPetLevel() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get rank => $_getIZ(4);
  @$pb.TagNumber(5)
  set rank($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRank() => $_has(4);
  @$pb.TagNumber(5)
  void clearRank() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get score => $_getIZ(5);
  @$pb.TagNumber(6)
  set score($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasScore() => $_has(5);
  @$pb.TagNumber(6)
  void clearScore() => clearField(6);
}

class ApiPetRecordResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiPetRecordResponse',
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
    ..aOM<PetRecordData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: PetRecordData.create)
    ..hasRequiredFields = false;

  ApiPetRecordResponse._() : super();
  factory ApiPetRecordResponse({
    $core.bool? success,
    $core.String? message,
    PetRecordData? data,
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
  factory ApiPetRecordResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiPetRecordResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiPetRecordResponse clone() =>
      ApiPetRecordResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiPetRecordResponse copyWith(void Function(ApiPetRecordResponse) updates) =>
      super.copyWith((message) => updates(message as ApiPetRecordResponse))
          as ApiPetRecordResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiPetRecordResponse create() => ApiPetRecordResponse._();
  ApiPetRecordResponse createEmptyInstance() => create();
  static $pb.PbList<ApiPetRecordResponse> createRepeated() =>
      $pb.PbList<ApiPetRecordResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiPetRecordResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiPetRecordResponse>(create);
  static ApiPetRecordResponse? _defaultInstance;

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
  PetRecordData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(PetRecordData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  PetRecordData ensureData() => $_ensure(2);
}

class PetRecordData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PetRecordData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<PetRecordItem>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'records',
        $pb.PbFieldType.PM,
        subBuilder: PetRecordItem.create)
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasMore')
    ..hasRequiredFields = false;

  PetRecordData._() : super();
  factory PetRecordData({
    $core.Iterable<PetRecordItem>? records,
    $core.bool? hasMore,
  }) {
    final _result = create();
    if (records != null) {
      _result.records.addAll(records);
    }
    if (hasMore != null) {
      _result.hasMore = hasMore;
    }
    return _result;
  }
  factory PetRecordData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PetRecordData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PetRecordData clone() => PetRecordData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PetRecordData copyWith(void Function(PetRecordData) updates) =>
      super.copyWith((message) => updates(message as PetRecordData))
          as PetRecordData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PetRecordData create() => PetRecordData._();
  PetRecordData createEmptyInstance() => create();
  static $pb.PbList<PetRecordData> createRepeated() =>
      $pb.PbList<PetRecordData>();
  @$core.pragma('dart2js:noInline')
  static PetRecordData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PetRecordData>(create);
  static PetRecordData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PetRecordItem> get records => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get hasMore => $_getBF(1);
  @$pb.TagNumber(2)
  set hasMore($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHasMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearHasMore() => clearField(2);
}

class PetRecordItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PetRecordItem',
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
            : 'icon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'optType',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'propNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  PetRecordItem._() : super();
  factory PetRecordItem({
    $core.int? uid,
    $core.String? icon,
    $core.String? name,
    $core.int? optType,
    $core.int? propNum,
    $core.int? time,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (optType != null) {
      _result.optType = optType;
    }
    if (propNum != null) {
      _result.propNum = propNum;
    }
    if (time != null) {
      _result.time = time;
    }
    return _result;
  }
  factory PetRecordItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PetRecordItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PetRecordItem clone() => PetRecordItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PetRecordItem copyWith(void Function(PetRecordItem) updates) =>
      super.copyWith((message) => updates(message as PetRecordItem))
          as PetRecordItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PetRecordItem create() => PetRecordItem._();
  PetRecordItem createEmptyInstance() => create();
  static $pb.PbList<PetRecordItem> createRepeated() =>
      $pb.PbList<PetRecordItem>();
  @$core.pragma('dart2js:noInline')
  static PetRecordItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PetRecordItem>(create);
  static PetRecordItem? _defaultInstance;

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
  $core.int get optType => $_getIZ(3);
  @$pb.TagNumber(4)
  set optType($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasOptType() => $_has(3);
  @$pb.TagNumber(4)
  void clearOptType() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get propNum => $_getIZ(4);
  @$pb.TagNumber(5)
  set propNum($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPropNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearPropNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get time => $_getIZ(5);
  @$pb.TagNumber(6)
  set time($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearTime() => clearField(6);
}

class ApiPetAwardResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiPetAwardResponse',
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
    ..aOM<PetAwardData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: PetAwardData.create)
    ..hasRequiredFields = false;

  ApiPetAwardResponse._() : super();
  factory ApiPetAwardResponse({
    $core.bool? success,
    $core.String? message,
    PetAwardData? data,
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
  factory ApiPetAwardResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiPetAwardResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiPetAwardResponse clone() => ApiPetAwardResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiPetAwardResponse copyWith(void Function(ApiPetAwardResponse) updates) =>
      super.copyWith((message) => updates(message as ApiPetAwardResponse))
          as ApiPetAwardResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiPetAwardResponse create() => ApiPetAwardResponse._();
  ApiPetAwardResponse createEmptyInstance() => create();
  static $pb.PbList<ApiPetAwardResponse> createRepeated() =>
      $pb.PbList<ApiPetAwardResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiPetAwardResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiPetAwardResponse>(create);
  static ApiPetAwardResponse? _defaultInstance;

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
  PetAwardData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(PetAwardData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  PetAwardData ensureData() => $_ensure(2);
}

class PetAwardData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PetAwardData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'propId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'propName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'propType')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'propIcon')
    ..hasRequiredFields = false;

  PetAwardData._() : super();
  factory PetAwardData({
    $core.int? propId,
    $core.String? propName,
    $core.String? propType,
    $core.String? propIcon,
  }) {
    final _result = create();
    if (propId != null) {
      _result.propId = propId;
    }
    if (propName != null) {
      _result.propName = propName;
    }
    if (propType != null) {
      _result.propType = propType;
    }
    if (propIcon != null) {
      _result.propIcon = propIcon;
    }
    return _result;
  }
  factory PetAwardData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PetAwardData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PetAwardData clone() => PetAwardData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PetAwardData copyWith(void Function(PetAwardData) updates) =>
      super.copyWith((message) => updates(message as PetAwardData))
          as PetAwardData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PetAwardData create() => PetAwardData._();
  PetAwardData createEmptyInstance() => create();
  static $pb.PbList<PetAwardData> createRepeated() =>
      $pb.PbList<PetAwardData>();
  @$core.pragma('dart2js:noInline')
  static PetAwardData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PetAwardData>(create);
  static PetAwardData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get propId => $_getIZ(0);
  @$pb.TagNumber(1)
  set propId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPropId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPropId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get propName => $_getSZ(1);
  @$pb.TagNumber(2)
  set propName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPropName() => $_has(1);
  @$pb.TagNumber(2)
  void clearPropName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get propType => $_getSZ(2);
  @$pb.TagNumber(3)
  set propType($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPropType() => $_has(2);
  @$pb.TagNumber(3)
  void clearPropType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get propIcon => $_getSZ(3);
  @$pb.TagNumber(4)
  set propIcon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPropIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearPropIcon() => clearField(4);
}
