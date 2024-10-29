///
//  Generated code. Do not modify.
//  source: gs_birthday.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ApiGsBirthdayPreferencesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiGsBirthdayPreferencesResponse',
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
    ..aOM<GsBirthdayPreferencesData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GsBirthdayPreferencesData.create)
    ..hasRequiredFields = false;

  ApiGsBirthdayPreferencesResponse._() : super();
  factory ApiGsBirthdayPreferencesResponse({
    $core.bool? success,
    $core.String? message,
    GsBirthdayPreferencesData? data,
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
  factory ApiGsBirthdayPreferencesResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiGsBirthdayPreferencesResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiGsBirthdayPreferencesResponse clone() =>
      ApiGsBirthdayPreferencesResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiGsBirthdayPreferencesResponse copyWith(
          void Function(ApiGsBirthdayPreferencesResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ApiGsBirthdayPreferencesResponse))
          as ApiGsBirthdayPreferencesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiGsBirthdayPreferencesResponse create() =>
      ApiGsBirthdayPreferencesResponse._();
  ApiGsBirthdayPreferencesResponse createEmptyInstance() => create();
  static $pb.PbList<ApiGsBirthdayPreferencesResponse> createRepeated() =>
      $pb.PbList<ApiGsBirthdayPreferencesResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiGsBirthdayPreferencesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiGsBirthdayPreferencesResponse>(
          create);
  static ApiGsBirthdayPreferencesResponse? _defaultInstance;

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
  GsBirthdayPreferencesData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GsBirthdayPreferencesData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GsBirthdayPreferencesData ensureData() => $_ensure(2);
}

class GsBirthdayPreferencesData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GsBirthdayPreferencesData',
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
            : 'awayBirthday',
        $pb.PbFieldType.OU3,
        protoName: 'awayBirthday')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gregorianBirthday',
        protoName: 'gregorianBirthday')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lunarBirthday',
        protoName: 'lunarBirthday')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chineseZodiac',
        protoName: 'chineseZodiac')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'years',
        $pb.PbFieldType.OU3)
    ..pc<GsBirthdayGiftInfo>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gifts',
        $pb.PbFieldType.PM,
        subBuilder: GsBirthdayGiftInfo.create)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defaultWithContent',
        protoName: 'defaultWithContent')
    ..hasRequiredFields = false;

  GsBirthdayPreferencesData._() : super();
  factory GsBirthdayPreferencesData({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? awayBirthday,
    $core.String? gregorianBirthday,
    $core.String? lunarBirthday,
    $core.String? chineseZodiac,
    $core.int? years,
    $core.Iterable<GsBirthdayGiftInfo>? gifts,
    $core.String? defaultWithContent,
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
    if (awayBirthday != null) {
      _result.awayBirthday = awayBirthday;
    }
    if (gregorianBirthday != null) {
      _result.gregorianBirthday = gregorianBirthday;
    }
    if (lunarBirthday != null) {
      _result.lunarBirthday = lunarBirthday;
    }
    if (chineseZodiac != null) {
      _result.chineseZodiac = chineseZodiac;
    }
    if (years != null) {
      _result.years = years;
    }
    if (gifts != null) {
      _result.gifts.addAll(gifts);
    }
    if (defaultWithContent != null) {
      _result.defaultWithContent = defaultWithContent;
    }
    return _result;
  }
  factory GsBirthdayPreferencesData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GsBirthdayPreferencesData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GsBirthdayPreferencesData clone() =>
      GsBirthdayPreferencesData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GsBirthdayPreferencesData copyWith(
          void Function(GsBirthdayPreferencesData) updates) =>
      super.copyWith((message) => updates(message as GsBirthdayPreferencesData))
          as GsBirthdayPreferencesData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GsBirthdayPreferencesData create() => GsBirthdayPreferencesData._();
  GsBirthdayPreferencesData createEmptyInstance() => create();
  static $pb.PbList<GsBirthdayPreferencesData> createRepeated() =>
      $pb.PbList<GsBirthdayPreferencesData>();
  @$core.pragma('dart2js:noInline')
  static GsBirthdayPreferencesData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsBirthdayPreferencesData>(create);
  static GsBirthdayPreferencesData? _defaultInstance;

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
  $core.int get awayBirthday => $_getIZ(3);
  @$pb.TagNumber(4)
  set awayBirthday($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAwayBirthday() => $_has(3);
  @$pb.TagNumber(4)
  void clearAwayBirthday() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get gregorianBirthday => $_getSZ(4);
  @$pb.TagNumber(5)
  set gregorianBirthday($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGregorianBirthday() => $_has(4);
  @$pb.TagNumber(5)
  void clearGregorianBirthday() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get lunarBirthday => $_getSZ(5);
  @$pb.TagNumber(6)
  set lunarBirthday($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasLunarBirthday() => $_has(5);
  @$pb.TagNumber(6)
  void clearLunarBirthday() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get chineseZodiac => $_getSZ(6);
  @$pb.TagNumber(7)
  set chineseZodiac($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasChineseZodiac() => $_has(6);
  @$pb.TagNumber(7)
  void clearChineseZodiac() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get years => $_getIZ(7);
  @$pb.TagNumber(8)
  set years($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasYears() => $_has(7);
  @$pb.TagNumber(8)
  void clearYears() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<GsBirthdayGiftInfo> get gifts => $_getList(8);

  @$pb.TagNumber(10)
  $core.String get defaultWithContent => $_getSZ(9);
  @$pb.TagNumber(10)
  set defaultWithContent($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasDefaultWithContent() => $_has(9);
  @$pb.TagNumber(10)
  void clearDefaultWithContent() => clearField(10);
}

class GsBirthdayGiftInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GsBirthdayGiftInfo',
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
        $pb.PbFieldType.OU3,
        protoName: 'giftId')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
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
            : 'cid',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'giftType')
    ..hasRequiredFields = false;

  GsBirthdayGiftInfo._() : super();
  factory GsBirthdayGiftInfo({
    $core.int? giftId,
    $core.int? price,
    $core.String? name,
    $core.int? cid,
    $core.String? giftType,
  }) {
    final _result = create();
    if (giftId != null) {
      _result.giftId = giftId;
    }
    if (price != null) {
      _result.price = price;
    }
    if (name != null) {
      _result.name = name;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (giftType != null) {
      _result.giftType = giftType;
    }
    return _result;
  }
  factory GsBirthdayGiftInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GsBirthdayGiftInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GsBirthdayGiftInfo clone() => GsBirthdayGiftInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GsBirthdayGiftInfo copyWith(void Function(GsBirthdayGiftInfo) updates) =>
      super.copyWith((message) => updates(message as GsBirthdayGiftInfo))
          as GsBirthdayGiftInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GsBirthdayGiftInfo create() => GsBirthdayGiftInfo._();
  GsBirthdayGiftInfo createEmptyInstance() => create();
  static $pb.PbList<GsBirthdayGiftInfo> createRepeated() =>
      $pb.PbList<GsBirthdayGiftInfo>();
  @$core.pragma('dart2js:noInline')
  static GsBirthdayGiftInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsBirthdayGiftInfo>(create);
  static GsBirthdayGiftInfo? _defaultInstance;

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
  $core.int get price => $_getIZ(1);
  @$pb.TagNumber(2)
  set price($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);

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
  $core.int get cid => $_getIZ(3);
  @$pb.TagNumber(4)
  set cid($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCid() => $_has(3);
  @$pb.TagNumber(4)
  void clearCid() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get giftType => $_getSZ(4);
  @$pb.TagNumber(5)
  set giftType($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGiftType() => $_has(4);
  @$pb.TagNumber(5)
  void clearGiftType() => clearField(5);
}

class ApiGsBirthdayListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ApiGsBirthdayListResponse',
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
    ..aOM<GsBirthdayListData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: GsBirthdayListData.create)
    ..hasRequiredFields = false;

  ApiGsBirthdayListResponse._() : super();
  factory ApiGsBirthdayListResponse({
    $core.bool? success,
    $core.String? message,
    GsBirthdayListData? data,
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
  factory ApiGsBirthdayListResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApiGsBirthdayListResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApiGsBirthdayListResponse clone() =>
      ApiGsBirthdayListResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApiGsBirthdayListResponse copyWith(
          void Function(ApiGsBirthdayListResponse) updates) =>
      super.copyWith((message) => updates(message as ApiGsBirthdayListResponse))
          as ApiGsBirthdayListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApiGsBirthdayListResponse create() => ApiGsBirthdayListResponse._();
  ApiGsBirthdayListResponse createEmptyInstance() => create();
  static $pb.PbList<ApiGsBirthdayListResponse> createRepeated() =>
      $pb.PbList<ApiGsBirthdayListResponse>();
  @$core.pragma('dart2js:noInline')
  static ApiGsBirthdayListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApiGsBirthdayListResponse>(create);
  static ApiGsBirthdayListResponse? _defaultInstance;

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
  GsBirthdayListData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(GsBirthdayListData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  GsBirthdayListData ensureData() => $_ensure(2);
}

class GsBirthdayListData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GsBirthdayListData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'more',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'page',
        $pb.PbFieldType.OU3)
    ..pc<GsBirthdayListItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'list',
        $pb.PbFieldType.PM,
        subBuilder: GsBirthdayListItem.create)
    ..aOM<GsBirthdayListItem>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extra',
        subBuilder: GsBirthdayListItem.create)
    ..hasRequiredFields = false;

  GsBirthdayListData._() : super();
  factory GsBirthdayListData({
    $core.String? type,
    $core.int? more,
    $core.int? page,
    $core.Iterable<GsBirthdayListItem>? list,
    GsBirthdayListItem? extra,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (more != null) {
      _result.more = more;
    }
    if (page != null) {
      _result.page = page;
    }
    if (list != null) {
      _result.list.addAll(list);
    }
    if (extra != null) {
      _result.extra = extra;
    }
    return _result;
  }
  factory GsBirthdayListData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GsBirthdayListData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GsBirthdayListData clone() => GsBirthdayListData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GsBirthdayListData copyWith(void Function(GsBirthdayListData) updates) =>
      super.copyWith((message) => updates(message as GsBirthdayListData))
          as GsBirthdayListData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GsBirthdayListData create() => GsBirthdayListData._();
  GsBirthdayListData createEmptyInstance() => create();
  static $pb.PbList<GsBirthdayListData> createRepeated() =>
      $pb.PbList<GsBirthdayListData>();
  @$core.pragma('dart2js:noInline')
  static GsBirthdayListData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsBirthdayListData>(create);
  static GsBirthdayListData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get more => $_getIZ(1);
  @$pb.TagNumber(2)
  set more($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearMore() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get page => $_getIZ(2);
  @$pb.TagNumber(3)
  set page($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<GsBirthdayListItem> get list => $_getList(3);

  @$pb.TagNumber(5)
  GsBirthdayListItem get extra => $_getN(4);
  @$pb.TagNumber(5)
  set extra(GsBirthdayListItem v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasExtra() => $_has(4);
  @$pb.TagNumber(5)
  void clearExtra() => clearField(5);
  @$pb.TagNumber(5)
  GsBirthdayListItem ensureExtra() => $_ensure(4);
}

class GsBirthdayListItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GsBirthdayListItem',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'index',
        $pb.PbFieldType.O3)
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
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOM<GsBirthdayListItemExtra>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'extra',
        subBuilder: GsBirthdayListItemExtra.create)
    ..hasRequiredFields = false;

  GsBirthdayListItem._() : super();
  factory GsBirthdayListItem({
    $core.int? index,
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    GsBirthdayListItemExtra? extra,
  }) {
    final _result = create();
    if (index != null) {
      _result.index = index;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (extra != null) {
      _result.extra = extra;
    }
    return _result;
  }
  factory GsBirthdayListItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GsBirthdayListItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GsBirthdayListItem clone() => GsBirthdayListItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GsBirthdayListItem copyWith(void Function(GsBirthdayListItem) updates) =>
      super.copyWith((message) => updates(message as GsBirthdayListItem))
          as GsBirthdayListItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GsBirthdayListItem create() => GsBirthdayListItem._();
  GsBirthdayListItem createEmptyInstance() => create();
  static $pb.PbList<GsBirthdayListItem> createRepeated() =>
      $pb.PbList<GsBirthdayListItem>();
  @$core.pragma('dart2js:noInline')
  static GsBirthdayListItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsBirthdayListItem>(create);
  static GsBirthdayListItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get index => $_getIZ(0);
  @$pb.TagNumber(1)
  set index($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => clearField(1);

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
  GsBirthdayListItemExtra get extra => $_getN(4);
  @$pb.TagNumber(5)
  set extra(GsBirthdayListItemExtra v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasExtra() => $_has(4);
  @$pb.TagNumber(5)
  void clearExtra() => clearField(5);
  @$pb.TagNumber(5)
  GsBirthdayListItemExtra ensureExtra() => $_ensure(4);
}

enum GsBirthdayListItemExtra_Extra { room, wish, gift, friend, notSet }

class GsBirthdayListItemExtra extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, GsBirthdayListItemExtra_Extra>
      _GsBirthdayListItemExtra_ExtraByTag = {
    1: GsBirthdayListItemExtra_Extra.room,
    2: GsBirthdayListItemExtra_Extra.wish,
    3: GsBirthdayListItemExtra_Extra.gift,
    4: GsBirthdayListItemExtra_Extra.friend,
    0: GsBirthdayListItemExtra_Extra.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GsBirthdayListItemExtra',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4])
    ..aOM<GsBirthdayRoomListExtra>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room',
        subBuilder: GsBirthdayRoomListExtra.create)
    ..aOM<GsBirthdayWishListExtra>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wish',
        subBuilder: GsBirthdayWishListExtra.create)
    ..aOM<GsBirthdayGiftListExtra>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift',
        subBuilder: GsBirthdayGiftListExtra.create)
    ..aOM<GsBirthdayFriendListExtra>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'friend',
        subBuilder: GsBirthdayFriendListExtra.create)
    ..hasRequiredFields = false;

  GsBirthdayListItemExtra._() : super();
  factory GsBirthdayListItemExtra({
    GsBirthdayRoomListExtra? room,
    GsBirthdayWishListExtra? wish,
    GsBirthdayGiftListExtra? gift,
    GsBirthdayFriendListExtra? friend,
  }) {
    final _result = create();
    if (room != null) {
      _result.room = room;
    }
    if (wish != null) {
      _result.wish = wish;
    }
    if (gift != null) {
      _result.gift = gift;
    }
    if (friend != null) {
      _result.friend = friend;
    }
    return _result;
  }
  factory GsBirthdayListItemExtra.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GsBirthdayListItemExtra.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GsBirthdayListItemExtra clone() =>
      GsBirthdayListItemExtra()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GsBirthdayListItemExtra copyWith(
          void Function(GsBirthdayListItemExtra) updates) =>
      super.copyWith((message) => updates(message as GsBirthdayListItemExtra))
          as GsBirthdayListItemExtra; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GsBirthdayListItemExtra create() => GsBirthdayListItemExtra._();
  GsBirthdayListItemExtra createEmptyInstance() => create();
  static $pb.PbList<GsBirthdayListItemExtra> createRepeated() =>
      $pb.PbList<GsBirthdayListItemExtra>();
  @$core.pragma('dart2js:noInline')
  static GsBirthdayListItemExtra getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsBirthdayListItemExtra>(create);
  static GsBirthdayListItemExtra? _defaultInstance;

  GsBirthdayListItemExtra_Extra whichExtra() =>
      _GsBirthdayListItemExtra_ExtraByTag[$_whichOneof(0)]!;
  void clearExtra() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  GsBirthdayRoomListExtra get room => $_getN(0);
  @$pb.TagNumber(1)
  set room(GsBirthdayRoomListExtra v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRoom() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoom() => clearField(1);
  @$pb.TagNumber(1)
  GsBirthdayRoomListExtra ensureRoom() => $_ensure(0);

  @$pb.TagNumber(2)
  GsBirthdayWishListExtra get wish => $_getN(1);
  @$pb.TagNumber(2)
  set wish(GsBirthdayWishListExtra v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasWish() => $_has(1);
  @$pb.TagNumber(2)
  void clearWish() => clearField(2);
  @$pb.TagNumber(2)
  GsBirthdayWishListExtra ensureWish() => $_ensure(1);

  @$pb.TagNumber(3)
  GsBirthdayGiftListExtra get gift => $_getN(2);
  @$pb.TagNumber(3)
  set gift(GsBirthdayGiftListExtra v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGift() => $_has(2);
  @$pb.TagNumber(3)
  void clearGift() => clearField(3);
  @$pb.TagNumber(3)
  GsBirthdayGiftListExtra ensureGift() => $_ensure(2);

  @$pb.TagNumber(4)
  GsBirthdayFriendListExtra get friend => $_getN(3);
  @$pb.TagNumber(4)
  set friend(GsBirthdayFriendListExtra v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFriend() => $_has(3);
  @$pb.TagNumber(4)
  void clearFriend() => clearField(4);
  @$pb.TagNumber(4)
  GsBirthdayFriendListExtra ensureFriend() => $_ensure(3);
}

class GsBirthdayRoomListExtra extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GsBirthdayRoomListExtra',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'birthday',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awayBirthday',
        $pb.PbFieldType.O3,
        protoName: 'awayBirthday')
    ..hasRequiredFields = false;

  GsBirthdayRoomListExtra._() : super();
  factory GsBirthdayRoomListExtra({
    $core.int? birthday,
    $core.int? awayBirthday,
  }) {
    final _result = create();
    if (birthday != null) {
      _result.birthday = birthday;
    }
    if (awayBirthday != null) {
      _result.awayBirthday = awayBirthday;
    }
    return _result;
  }
  factory GsBirthdayRoomListExtra.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GsBirthdayRoomListExtra.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GsBirthdayRoomListExtra clone() =>
      GsBirthdayRoomListExtra()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GsBirthdayRoomListExtra copyWith(
          void Function(GsBirthdayRoomListExtra) updates) =>
      super.copyWith((message) => updates(message as GsBirthdayRoomListExtra))
          as GsBirthdayRoomListExtra; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GsBirthdayRoomListExtra create() => GsBirthdayRoomListExtra._();
  GsBirthdayRoomListExtra createEmptyInstance() => create();
  static $pb.PbList<GsBirthdayRoomListExtra> createRepeated() =>
      $pb.PbList<GsBirthdayRoomListExtra>();
  @$core.pragma('dart2js:noInline')
  static GsBirthdayRoomListExtra getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsBirthdayRoomListExtra>(create);
  static GsBirthdayRoomListExtra? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get birthday => $_getIZ(0);
  @$pb.TagNumber(1)
  set birthday($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBirthday() => $_has(0);
  @$pb.TagNumber(1)
  void clearBirthday() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get awayBirthday => $_getIZ(1);
  @$pb.TagNumber(2)
  set awayBirthday($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAwayBirthday() => $_has(1);
  @$pb.TagNumber(2)
  void clearAwayBirthday() => clearField(2);
}

class GsBirthdayWishListExtra extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GsBirthdayWishListExtra',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'birthday',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wishContent',
        protoName: 'wishContent')
    ..hasRequiredFields = false;

  GsBirthdayWishListExtra._() : super();
  factory GsBirthdayWishListExtra({
    $core.int? birthday,
    $core.String? wishContent,
  }) {
    final _result = create();
    if (birthday != null) {
      _result.birthday = birthday;
    }
    if (wishContent != null) {
      _result.wishContent = wishContent;
    }
    return _result;
  }
  factory GsBirthdayWishListExtra.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GsBirthdayWishListExtra.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GsBirthdayWishListExtra clone() =>
      GsBirthdayWishListExtra()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GsBirthdayWishListExtra copyWith(
          void Function(GsBirthdayWishListExtra) updates) =>
      super.copyWith((message) => updates(message as GsBirthdayWishListExtra))
          as GsBirthdayWishListExtra; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GsBirthdayWishListExtra create() => GsBirthdayWishListExtra._();
  GsBirthdayWishListExtra createEmptyInstance() => create();
  static $pb.PbList<GsBirthdayWishListExtra> createRepeated() =>
      $pb.PbList<GsBirthdayWishListExtra>();
  @$core.pragma('dart2js:noInline')
  static GsBirthdayWishListExtra getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsBirthdayWishListExtra>(create);
  static GsBirthdayWishListExtra? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get birthday => $_getIZ(0);
  @$pb.TagNumber(1)
  set birthday($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBirthday() => $_has(0);
  @$pb.TagNumber(1)
  void clearBirthday() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get wishContent => $_getSZ(1);
  @$pb.TagNumber(2)
  set wishContent($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasWishContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearWishContent() => clearField(2);
}

class GsBirthdayGiftListExtra extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GsBirthdayGiftListExtra',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wish',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GsBirthdayGiftListExtra._() : super();
  factory GsBirthdayGiftListExtra({
    $core.int? wish,
  }) {
    final _result = create();
    if (wish != null) {
      _result.wish = wish;
    }
    return _result;
  }
  factory GsBirthdayGiftListExtra.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GsBirthdayGiftListExtra.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GsBirthdayGiftListExtra clone() =>
      GsBirthdayGiftListExtra()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GsBirthdayGiftListExtra copyWith(
          void Function(GsBirthdayGiftListExtra) updates) =>
      super.copyWith((message) => updates(message as GsBirthdayGiftListExtra))
          as GsBirthdayGiftListExtra; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GsBirthdayGiftListExtra create() => GsBirthdayGiftListExtra._();
  GsBirthdayGiftListExtra createEmptyInstance() => create();
  static $pb.PbList<GsBirthdayGiftListExtra> createRepeated() =>
      $pb.PbList<GsBirthdayGiftListExtra>();
  @$core.pragma('dart2js:noInline')
  static GsBirthdayGiftListExtra getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsBirthdayGiftListExtra>(create);
  static GsBirthdayGiftListExtra? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get wish => $_getIZ(0);
  @$pb.TagNumber(1)
  set wish($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasWish() => $_has(0);
  @$pb.TagNumber(1)
  void clearWish() => clearField(1);
}

class GsBirthdayFriendListExtra extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GsBirthdayFriendListExtra',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'birthday',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'awayBirthday',
        $pb.PbFieldType.O3,
        protoName: 'awayBirthday')
    ..hasRequiredFields = false;

  GsBirthdayFriendListExtra._() : super();
  factory GsBirthdayFriendListExtra({
    $core.int? birthday,
    $core.int? awayBirthday,
  }) {
    final _result = create();
    if (birthday != null) {
      _result.birthday = birthday;
    }
    if (awayBirthday != null) {
      _result.awayBirthday = awayBirthday;
    }
    return _result;
  }
  factory GsBirthdayFriendListExtra.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GsBirthdayFriendListExtra.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GsBirthdayFriendListExtra clone() =>
      GsBirthdayFriendListExtra()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GsBirthdayFriendListExtra copyWith(
          void Function(GsBirthdayFriendListExtra) updates) =>
      super.copyWith((message) => updates(message as GsBirthdayFriendListExtra))
          as GsBirthdayFriendListExtra; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GsBirthdayFriendListExtra create() => GsBirthdayFriendListExtra._();
  GsBirthdayFriendListExtra createEmptyInstance() => create();
  static $pb.PbList<GsBirthdayFriendListExtra> createRepeated() =>
      $pb.PbList<GsBirthdayFriendListExtra>();
  @$core.pragma('dart2js:noInline')
  static GsBirthdayFriendListExtra getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GsBirthdayFriendListExtra>(create);
  static GsBirthdayFriendListExtra? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get birthday => $_getIZ(0);
  @$pb.TagNumber(1)
  set birthday($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBirthday() => $_has(0);
  @$pb.TagNumber(1)
  void clearBirthday() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get awayBirthday => $_getIZ(1);
  @$pb.TagNumber(2)
  set awayBirthday($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAwayBirthday() => $_has(1);
  @$pb.TagNumber(2)
  void clearAwayBirthday() => clearField(2);
}
