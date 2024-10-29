///
//  Generated code. Do not modify.
//  source: sweet_album.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ApiSweetAlbumHomeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiSweetAlbumHomeResponse',
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
    ..aOM<SweetAlbumHomeData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: SweetAlbumHomeData.create)
    ..hasRequiredFields = false;

  ApiSweetAlbumHomeResponse._() : super();
  factory ApiSweetAlbumHomeResponse({
    $core.bool? success,
    $core.String? message,
    SweetAlbumHomeData? data,
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
  factory ApiSweetAlbumHomeResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiSweetAlbumHomeResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiSweetAlbumHomeResponse clone() =>
      ApiSweetAlbumHomeResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiSweetAlbumHomeResponse copyWith(
          void Function(ApiSweetAlbumHomeResponse) updates) =>
      super.copyWith((message) => updates(message as ApiSweetAlbumHomeResponse))
          as ApiSweetAlbumHomeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiSweetAlbumHomeResponse create() => ApiSweetAlbumHomeResponse._();
  ApiSweetAlbumHomeResponse createEmptyInstance() => create();
  static $pb.PbList<ApiSweetAlbumHomeResponse> createRepeated() =>
      $pb.PbList<ApiSweetAlbumHomeResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiSweetAlbumHomeResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiSweetAlbumHomeResponse>(create);
  static ApiSweetAlbumHomeResponse? _defaultInstance;

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
  SweetAlbumHomeData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(SweetAlbumHomeData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  SweetAlbumHomeData ensureData() => $_ensure(2);
}

class SweetAlbumHomeData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SweetAlbumHomeData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<SweetImprintUser>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'companion',
        subBuilder: SweetImprintUser.create)
    ..pc<SweetAlbumCategory>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'categories',
        $pb.PbFieldType.PM,
        subBuilder: SweetAlbumCategory.create)
    ..pc<SweetAlbumNumConfig>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numConfig',
        $pb.PbFieldType.PM,
        subBuilder: SweetAlbumNumConfig.create)
    ..hasRequiredFields = false;

  SweetAlbumHomeData._() : super();
  factory SweetAlbumHomeData({
    SweetImprintUser? companion,
    $core.Iterable<SweetAlbumCategory>? categories,
    $core.Iterable<SweetAlbumNumConfig>? numConfig,
  }) {
    final _result = create();
    if (companion != null) {
      _result.companion = companion;
    }
    if (categories != null) {
      _result.categories.addAll(categories);
    }
    if (numConfig != null) {
      _result.numConfig.addAll(numConfig);
    }
    return _result;
  }
  factory SweetAlbumHomeData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SweetAlbumHomeData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SweetAlbumHomeData clone() => SweetAlbumHomeData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SweetAlbumHomeData copyWith(void Function(SweetAlbumHomeData) updates) =>
      super.copyWith((message) => updates(message as SweetAlbumHomeData))
          as SweetAlbumHomeData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SweetAlbumHomeData create() => SweetAlbumHomeData._();
  SweetAlbumHomeData createEmptyInstance() => create();
  static $pb.PbList<SweetAlbumHomeData> createRepeated() =>
      $pb.PbList<SweetAlbumHomeData>();
  @$core.pragma('dart2js:noInline')
  static SweetAlbumHomeData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SweetAlbumHomeData>(create);
  static SweetAlbumHomeData? _defaultInstance;

  @$pb.TagNumber(1)
  SweetImprintUser get companion => $_getN(0);
  @$pb.TagNumber(1)
  set companion(SweetImprintUser v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCompanion() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompanion() => clearField(1);
  @$pb.TagNumber(1)
  SweetImprintUser ensureCompanion() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<SweetAlbumCategory> get categories => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<SweetAlbumNumConfig> get numConfig => $_getList(2);
}

class SweetAlbumNumConfig extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SweetAlbumNumConfig',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  SweetAlbumNumConfig._() : super();
  factory SweetAlbumNumConfig({
    $core.int? num,
    $core.String? desc,
  }) {
    final _result = create();
    if (num != null) {
      _result.num = num;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory SweetAlbumNumConfig.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SweetAlbumNumConfig.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SweetAlbumNumConfig clone() => SweetAlbumNumConfig()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SweetAlbumNumConfig copyWith(void Function(SweetAlbumNumConfig) updates) =>
      super.copyWith((message) => updates(message as SweetAlbumNumConfig))
          as SweetAlbumNumConfig; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SweetAlbumNumConfig create() => SweetAlbumNumConfig._();
  SweetAlbumNumConfig createEmptyInstance() => create();
  static $pb.PbList<SweetAlbumNumConfig> createRepeated() =>
      $pb.PbList<SweetAlbumNumConfig>();
  @$core.pragma('dart2js:noInline')
  static SweetAlbumNumConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SweetAlbumNumConfig>(create);
  static SweetAlbumNumConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get num => $_getIZ(0);
  @$pb.TagNumber(1)
  set num($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get desc => $_getSZ(1);
  @$pb.TagNumber(2)
  set desc($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearDesc() => clearField(2);
}

class SweetImprintUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SweetImprintUser',
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
            : 'currentLevel',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SweetImprintUser._() : super();
  factory SweetImprintUser({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? currentLevel,
    $core.int? age,
    $core.int? sex,
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
    if (currentLevel != null) {
      _result.currentLevel = currentLevel;
    }
    if (age != null) {
      _result.age = age;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    return _result;
  }
  factory SweetImprintUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SweetImprintUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SweetImprintUser clone() => SweetImprintUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SweetImprintUser copyWith(void Function(SweetImprintUser) updates) =>
      super.copyWith((message) => updates(message as SweetImprintUser))
          as SweetImprintUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SweetImprintUser create() => SweetImprintUser._();
  SweetImprintUser createEmptyInstance() => create();
  static $pb.PbList<SweetImprintUser> createRepeated() =>
      $pb.PbList<SweetImprintUser>();
  @$core.pragma('dart2js:noInline')
  static SweetImprintUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SweetImprintUser>(create);
  static SweetImprintUser? _defaultInstance;

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
  $core.int get currentLevel => $_getIZ(3);
  @$pb.TagNumber(4)
  set currentLevel($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCurrentLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrentLevel() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get age => $_getIZ(4);
  @$pb.TagNumber(5)
  set age($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAge() => $_has(4);
  @$pb.TagNumber(5)
  void clearAge() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get sex => $_getIZ(5);
  @$pb.TagNumber(6)
  set sex($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSex() => $_has(5);
  @$pb.TagNumber(6)
  void clearSex() => clearField(6);
}

class SweetAlbumCategory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SweetAlbumCategory',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'levelRequired',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unlocked',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'background')
    ..pc<SweetAlbumGiftItem>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gifts',
        $pb.PbFieldType.PM,
        subBuilder: SweetAlbumGiftItem.create)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'seqName')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chapter')
    ..hasRequiredFields = false;

  SweetAlbumCategory._() : super();
  factory SweetAlbumCategory({
    $core.String? name,
    $core.int? levelRequired,
    $core.int? unlocked,
    $core.String? description,
    $core.String? background,
    $core.Iterable<SweetAlbumGiftItem>? gifts,
    $core.String? seqName,
    $core.String? chapter,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (levelRequired != null) {
      _result.levelRequired = levelRequired;
    }
    if (unlocked != null) {
      _result.unlocked = unlocked;
    }
    if (description != null) {
      _result.description = description;
    }
    if (background != null) {
      _result.background = background;
    }
    if (gifts != null) {
      _result.gifts.addAll(gifts);
    }
    if (seqName != null) {
      _result.seqName = seqName;
    }
    if (chapter != null) {
      _result.chapter = chapter;
    }
    return _result;
  }
  factory SweetAlbumCategory.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SweetAlbumCategory.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SweetAlbumCategory clone() => SweetAlbumCategory()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SweetAlbumCategory copyWith(void Function(SweetAlbumCategory) updates) =>
      super.copyWith((message) => updates(message as SweetAlbumCategory))
          as SweetAlbumCategory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SweetAlbumCategory create() => SweetAlbumCategory._();
  SweetAlbumCategory createEmptyInstance() => create();
  static $pb.PbList<SweetAlbumCategory> createRepeated() =>
      $pb.PbList<SweetAlbumCategory>();
  @$core.pragma('dart2js:noInline')
  static SweetAlbumCategory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SweetAlbumCategory>(create);
  static SweetAlbumCategory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get levelRequired => $_getIZ(1);
  @$pb.TagNumber(2)
  set levelRequired($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLevelRequired() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevelRequired() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get unlocked => $_getIZ(2);
  @$pb.TagNumber(3)
  set unlocked($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUnlocked() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnlocked() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get background => $_getSZ(4);
  @$pb.TagNumber(5)
  set background($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBackground() => $_has(4);
  @$pb.TagNumber(5)
  void clearBackground() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<SweetAlbumGiftItem> get gifts => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get seqName => $_getSZ(6);
  @$pb.TagNumber(7)
  set seqName($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSeqName() => $_has(6);
  @$pb.TagNumber(7)
  void clearSeqName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get chapter => $_getSZ(7);
  @$pb.TagNumber(8)
  set chapter($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasChapter() => $_has(7);
  @$pb.TagNumber(8)
  void clearChapter() => clearField(8);
}

class SweetAlbumGiftItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SweetAlbumGiftItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftIcon')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftName')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'light',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SweetAlbumGiftItem._() : super();
  factory SweetAlbumGiftItem({
    $core.int? giftId,
    $core.String? giftIcon,
    $core.String? giftName,
    $core.int? price,
    $core.int? light,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (giftIcon != null) {
      _result.giftIcon = giftIcon;
    }
    if (giftName != null) {
      _result.giftName = giftName;
    }
    if (price != null) {
      _result.price = price;
    }
    if (light != null) {
      _result.light = light;
    }
    return _result;
  }
  factory SweetAlbumGiftItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SweetAlbumGiftItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SweetAlbumGiftItem clone() => SweetAlbumGiftItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SweetAlbumGiftItem copyWith(void Function(SweetAlbumGiftItem) updates) =>
      super.copyWith((message) => updates(message as SweetAlbumGiftItem))
          as SweetAlbumGiftItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SweetAlbumGiftItem create() => SweetAlbumGiftItem._();
  SweetAlbumGiftItem createEmptyInstance() => create();
  static $pb.PbList<SweetAlbumGiftItem> createRepeated() =>
      $pb.PbList<SweetAlbumGiftItem>();
  @$core.pragma('dart2js:noInline')
  static SweetAlbumGiftItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SweetAlbumGiftItem>(create);
  static SweetAlbumGiftItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get giftId => $_getIZ(0);
  @$pb.TagNumber(1)
  set giftId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get giftIcon => $_getSZ(1);
  @$pb.TagNumber(2)
  set giftIcon($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGiftIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get giftName => $_getSZ(2);
  @$pb.TagNumber(3)
  set giftName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGiftName() => $_has(2);
  @$pb.TagNumber(3)
  void clearGiftName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get price => $_getIZ(3);
  @$pb.TagNumber(4)
  set price($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get light => $_getIZ(4);
  @$pb.TagNumber(5)
  set light($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLight() => $_has(4);
  @$pb.TagNumber(5)
  void clearLight() => clearField(5);
}

class ApiSweetAlbumPageResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiSweetAlbumPageResponse',
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
    ..aOM<SweetAlbumPageData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: SweetAlbumPageData.create)
    ..hasRequiredFields = false;

  ApiSweetAlbumPageResponse._() : super();
  factory ApiSweetAlbumPageResponse({
    $core.bool? success,
    $core.String? message,
    SweetAlbumPageData? data,
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
  factory ApiSweetAlbumPageResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiSweetAlbumPageResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiSweetAlbumPageResponse clone() =>
      ApiSweetAlbumPageResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiSweetAlbumPageResponse copyWith(
          void Function(ApiSweetAlbumPageResponse) updates) =>
      super.copyWith((message) => updates(message as ApiSweetAlbumPageResponse))
          as ApiSweetAlbumPageResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiSweetAlbumPageResponse create() => ApiSweetAlbumPageResponse._();
  ApiSweetAlbumPageResponse createEmptyInstance() => create();
  static $pb.PbList<ApiSweetAlbumPageResponse> createRepeated() =>
      $pb.PbList<ApiSweetAlbumPageResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiSweetAlbumPageResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiSweetAlbumPageResponse>(create);
  static ApiSweetAlbumPageResponse? _defaultInstance;

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
  SweetAlbumPageData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(SweetAlbumPageData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  SweetAlbumPageData ensureData() => $_ensure(2);
}

class SweetAlbumPageData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SweetAlbumPageData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<SweetImprintUser>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user1',
        subBuilder: SweetImprintUser.create)
    ..aOM<SweetImprintUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'user2',
        subBuilder: SweetImprintUser.create)
    ..pc<SweetAlbumCategory>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'categories',
        $pb.PbFieldType.PM,
        subBuilder: SweetAlbumCategory.create)
    ..pc<SweetAlbumNumConfig>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numConfig',
        $pb.PbFieldType.PM,
        subBuilder: SweetAlbumNumConfig.create)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'currentLevel',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  SweetAlbumPageData._() : super();
  factory SweetAlbumPageData({
    SweetImprintUser? user1,
    SweetImprintUser? user2,
    $core.Iterable<SweetAlbumCategory>? categories,
    $core.Iterable<SweetAlbumNumConfig>? numConfig,
    $core.int? currentLevel,
  }) {
    final _result = create();
    if (user1 != null) {
      _result.user1 = user1;
    }
    if (user2 != null) {
      _result.user2 = user2;
    }
    if (categories != null) {
      _result.categories.addAll(categories);
    }
    if (numConfig != null) {
      _result.numConfig.addAll(numConfig);
    }
    if (currentLevel != null) {
      _result.currentLevel = currentLevel;
    }
    return _result;
  }
  factory SweetAlbumPageData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SweetAlbumPageData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SweetAlbumPageData clone() => SweetAlbumPageData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SweetAlbumPageData copyWith(void Function(SweetAlbumPageData) updates) =>
      super.copyWith((message) => updates(message as SweetAlbumPageData))
          as SweetAlbumPageData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SweetAlbumPageData create() => SweetAlbumPageData._();
  SweetAlbumPageData createEmptyInstance() => create();
  static $pb.PbList<SweetAlbumPageData> createRepeated() =>
      $pb.PbList<SweetAlbumPageData>();
  @$core.pragma('dart2js:noInline')
  static SweetAlbumPageData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SweetAlbumPageData>(create);
  static SweetAlbumPageData? _defaultInstance;

  @$pb.TagNumber(1)
  SweetImprintUser get user1 => $_getN(0);
  @$pb.TagNumber(1)
  set user1(SweetImprintUser v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUser1() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser1() => clearField(1);
  @$pb.TagNumber(1)
  SweetImprintUser ensureUser1() => $_ensure(0);

  @$pb.TagNumber(2)
  SweetImprintUser get user2 => $_getN(1);
  @$pb.TagNumber(2)
  set user2(SweetImprintUser v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUser2() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser2() => clearField(2);
  @$pb.TagNumber(2)
  SweetImprintUser ensureUser2() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<SweetAlbumCategory> get categories => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<SweetAlbumNumConfig> get numConfig => $_getList(3);

  @$pb.TagNumber(5)
  $core.int get currentLevel => $_getIZ(4);
  @$pb.TagNumber(5)
  set currentLevel($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCurrentLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrentLevel() => clearField(5);
}

class ApiSweetAlbumCompanionListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiSweetAlbumCompanionListResponse',
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
    ..aOM<SweetAlbumCompanionListData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: SweetAlbumCompanionListData.create)
    ..hasRequiredFields = false;

  ApiSweetAlbumCompanionListResponse._() : super();
  factory ApiSweetAlbumCompanionListResponse({
    $core.bool? success,
    $core.String? message,
    SweetAlbumCompanionListData? data,
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
  factory ApiSweetAlbumCompanionListResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiSweetAlbumCompanionListResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiSweetAlbumCompanionListResponse clone() =>
      ApiSweetAlbumCompanionListResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiSweetAlbumCompanionListResponse copyWith(
          void Function(ApiSweetAlbumCompanionListResponse) updates) =>
      super.copyWith((message) =>
              updates(message as ApiSweetAlbumCompanionListResponse))
          as ApiSweetAlbumCompanionListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiSweetAlbumCompanionListResponse create() =>
      ApiSweetAlbumCompanionListResponse._();
  ApiSweetAlbumCompanionListResponse createEmptyInstance() => create();
  static $pb.PbList<ApiSweetAlbumCompanionListResponse> createRepeated() =>
      $pb.PbList<ApiSweetAlbumCompanionListResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiSweetAlbumCompanionListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiSweetAlbumCompanionListResponse>(
          create);
  static ApiSweetAlbumCompanionListResponse? _defaultInstance;

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
  SweetAlbumCompanionListData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(SweetAlbumCompanionListData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  SweetAlbumCompanionListData ensureData() => $_ensure(2);
}

class SweetAlbumCompanionListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SweetAlbumCompanionListData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more',
        $pb.PbFieldType.OU3)
    ..pc<SweetImprintUser>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'companions',
        $pb.PbFieldType.PM,
        subBuilder: SweetImprintUser.create)
    ..hasRequiredFields = false;

  SweetAlbumCompanionListData._() : super();
  factory SweetAlbumCompanionListData({
    $core.int? more,
    $core.Iterable<SweetImprintUser>? companions,
  }) {
    final _result = create();
    if (more != null) {
      _result.more = more;
    }
    if (companions != null) {
      _result.companions.addAll(companions);
    }
    return _result;
  }
  factory SweetAlbumCompanionListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SweetAlbumCompanionListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SweetAlbumCompanionListData clone() =>
      SweetAlbumCompanionListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SweetAlbumCompanionListData copyWith(
          void Function(SweetAlbumCompanionListData) updates) =>
      super.copyWith(
              (message) => updates(message as SweetAlbumCompanionListData))
          as SweetAlbumCompanionListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SweetAlbumCompanionListData create() =>
      SweetAlbumCompanionListData._();
  SweetAlbumCompanionListData createEmptyInstance() => create();
  static $pb.PbList<SweetAlbumCompanionListData> createRepeated() =>
      $pb.PbList<SweetAlbumCompanionListData>();
  @$core.pragma('dart2js:noInline')
  static SweetAlbumCompanionListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SweetAlbumCompanionListData>(create);
  static SweetAlbumCompanionListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get more => $_getIZ(0);
  @$pb.TagNumber(1)
  set more($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMore() => $_has(0);
  @$pb.TagNumber(1)
  void clearMore() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<SweetImprintUser> get companions => $_getList(1);
}
