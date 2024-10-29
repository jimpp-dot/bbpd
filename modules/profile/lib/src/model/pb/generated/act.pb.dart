///
//  Generated code. Do not modify.
//  source: act.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResLoveMatchRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResLoveMatchRes',
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
    ..aOM<LoveMatchData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: LoveMatchData.create)
    ..hasRequiredFields = false;

  ResLoveMatchRes._() : super();
  factory ResLoveMatchRes({
    $core.bool? success,
    $core.String? msg,
    LoveMatchData? data,
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
  factory ResLoveMatchRes.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResLoveMatchRes.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResLoveMatchRes clone() => ResLoveMatchRes()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResLoveMatchRes copyWith(void Function(ResLoveMatchRes) updates) =>
      super.copyWith((message) => updates(message as ResLoveMatchRes))
          as ResLoveMatchRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResLoveMatchRes create() => ResLoveMatchRes._();
  ResLoveMatchRes createEmptyInstance() => create();
  static $pb.PbList<ResLoveMatchRes> createRepeated() =>
      $pb.PbList<ResLoveMatchRes>();
  @$core.pragma('dart2js:noInline')
  static ResLoveMatchRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResLoveMatchRes>(create);
  static ResLoveMatchRes? _defaultInstance;

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
  LoveMatchData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(LoveMatchData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  LoveMatchData ensureData() => $_ensure(2);
}

class LoveMatchData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LoveMatchData',
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
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'resType')
    ..pc<MatchTag>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagList',
        $pb.PbFieldType.PM,
        subBuilder: MatchTag.create)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bestCpTitle')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bestCpDesc')
    ..pc<MatchPerson>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'personList',
        $pb.PbFieldType.PM,
        subBuilder: MatchPerson.create)
    ..hasRequiredFields = false;

  LoveMatchData._() : super();
  factory LoveMatchData({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? resType,
    $core.Iterable<MatchTag>? tagList,
    $core.String? bestCpTitle,
    $core.String? bestCpDesc,
    $core.Iterable<MatchPerson>? personList,
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
    if (resType != null) {
      _result.resType = resType;
    }
    if (tagList != null) {
      _result.tagList.addAll(tagList);
    }
    if (bestCpTitle != null) {
      _result.bestCpTitle = bestCpTitle;
    }
    if (bestCpDesc != null) {
      _result.bestCpDesc = bestCpDesc;
    }
    if (personList != null) {
      _result.personList.addAll(personList);
    }
    return _result;
  }
  factory LoveMatchData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LoveMatchData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LoveMatchData clone() => LoveMatchData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LoveMatchData copyWith(void Function(LoveMatchData) updates) =>
      super.copyWith((message) => updates(message as LoveMatchData))
          as LoveMatchData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoveMatchData create() => LoveMatchData._();
  LoveMatchData createEmptyInstance() => create();
  static $pb.PbList<LoveMatchData> createRepeated() =>
      $pb.PbList<LoveMatchData>();
  @$core.pragma('dart2js:noInline')
  static LoveMatchData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoveMatchData>(create);
  static LoveMatchData? _defaultInstance;

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
  $core.String get resType => $_getSZ(3);
  @$pb.TagNumber(4)
  set resType($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasResType() => $_has(3);
  @$pb.TagNumber(4)
  void clearResType() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<MatchTag> get tagList => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get bestCpTitle => $_getSZ(5);
  @$pb.TagNumber(6)
  set bestCpTitle($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasBestCpTitle() => $_has(5);
  @$pb.TagNumber(6)
  void clearBestCpTitle() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get bestCpDesc => $_getSZ(6);
  @$pb.TagNumber(7)
  set bestCpDesc($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasBestCpDesc() => $_has(6);
  @$pb.TagNumber(7)
  void clearBestCpDesc() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<MatchPerson> get personList => $_getList(7);
}

class MatchTag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MatchTag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  MatchTag._() : super();
  factory MatchTag({
    $core.String? title,
    $core.String? desc,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory MatchTag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MatchTag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MatchTag clone() => MatchTag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MatchTag copyWith(void Function(MatchTag) updates) =>
      super.copyWith((message) => updates(message as MatchTag))
          as MatchTag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MatchTag create() => MatchTag._();
  MatchTag createEmptyInstance() => create();
  static $pb.PbList<MatchTag> createRepeated() => $pb.PbList<MatchTag>();
  @$core.pragma('dart2js:noInline')
  static MatchTag getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MatchTag>(create);
  static MatchTag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

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

class MatchPerson extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MatchPerson',
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
    ..pPS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'marks')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sayHiWord')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  MatchPerson._() : super();
  factory MatchPerson({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.Iterable<$core.String>? marks,
    $core.String? sayHiWord,
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
    if (marks != null) {
      _result.marks.addAll(marks);
    }
    if (sayHiWord != null) {
      _result.sayHiWord = sayHiWord;
    }
    if (age != null) {
      _result.age = age;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    return _result;
  }
  factory MatchPerson.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MatchPerson.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MatchPerson clone() => MatchPerson()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MatchPerson copyWith(void Function(MatchPerson) updates) =>
      super.copyWith((message) => updates(message as MatchPerson))
          as MatchPerson; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MatchPerson create() => MatchPerson._();
  MatchPerson createEmptyInstance() => create();
  static $pb.PbList<MatchPerson> createRepeated() => $pb.PbList<MatchPerson>();
  @$core.pragma('dart2js:noInline')
  static MatchPerson getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MatchPerson>(create);
  static MatchPerson? _defaultInstance;

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
  $core.List<$core.String> get marks => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get sayHiWord => $_getSZ(4);
  @$pb.TagNumber(5)
  set sayHiWord($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasSayHiWord() => $_has(4);
  @$pb.TagNumber(5)
  void clearSayHiWord() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get age => $_getIZ(5);
  @$pb.TagNumber(6)
  set age($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAge() => $_has(5);
  @$pb.TagNumber(6)
  void clearAge() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get sex => $_getIZ(6);
  @$pb.TagNumber(7)
  set sex($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSex() => $_has(6);
  @$pb.TagNumber(7)
  void clearSex() => clearField(7);
}

class LoveExamIndexRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LoveExamIndexRes',
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
    ..aOM<LoveExamStatus>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: LoveExamStatus.create)
    ..hasRequiredFields = false;

  LoveExamIndexRes._() : super();
  factory LoveExamIndexRes({
    $core.bool? success,
    $core.String? msg,
    LoveExamStatus? data,
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
  factory LoveExamIndexRes.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LoveExamIndexRes.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LoveExamIndexRes clone() => LoveExamIndexRes()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LoveExamIndexRes copyWith(void Function(LoveExamIndexRes) updates) =>
      super.copyWith((message) => updates(message as LoveExamIndexRes))
          as LoveExamIndexRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoveExamIndexRes create() => LoveExamIndexRes._();
  LoveExamIndexRes createEmptyInstance() => create();
  static $pb.PbList<LoveExamIndexRes> createRepeated() =>
      $pb.PbList<LoveExamIndexRes>();
  @$core.pragma('dart2js:noInline')
  static LoveExamIndexRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoveExamIndexRes>(create);
  static LoveExamIndexRes? _defaultInstance;

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
  LoveExamStatus get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(LoveExamStatus v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  LoveExamStatus ensureData() => $_ensure(2);
}

class LoveExamStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LoveExamStatus',
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
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagId',
        $pb.PbFieldType.OU3)
    ..pc<MatchPerson>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'matchPool',
        $pb.PbFieldType.PM,
        subBuilder: MatchPerson.create)
    ..hasRequiredFields = false;

  LoveExamStatus._() : super();
  factory LoveExamStatus({
    $core.int? status,
    $core.int? tagId,
    $core.Iterable<MatchPerson>? matchPool,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (tagId != null) {
      _result.tagId = tagId;
    }
    if (matchPool != null) {
      _result.matchPool.addAll(matchPool);
    }
    return _result;
  }
  factory LoveExamStatus.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LoveExamStatus.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LoveExamStatus clone() => LoveExamStatus()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LoveExamStatus copyWith(void Function(LoveExamStatus) updates) =>
      super.copyWith((message) => updates(message as LoveExamStatus))
          as LoveExamStatus; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoveExamStatus create() => LoveExamStatus._();
  LoveExamStatus createEmptyInstance() => create();
  static $pb.PbList<LoveExamStatus> createRepeated() =>
      $pb.PbList<LoveExamStatus>();
  @$core.pragma('dart2js:noInline')
  static LoveExamStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoveExamStatus>(create);
  static LoveExamStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

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
  $core.List<MatchPerson> get matchPool => $_getList(2);
}

class GetLoveExamRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetLoveExamRes',
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
    ..aOM<LoveExamData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: LoveExamData.create)
    ..hasRequiredFields = false;

  GetLoveExamRes._() : super();
  factory GetLoveExamRes({
    $core.bool? success,
    $core.String? msg,
    LoveExamData? data,
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
  factory GetLoveExamRes.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetLoveExamRes.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetLoveExamRes clone() => GetLoveExamRes()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetLoveExamRes copyWith(void Function(GetLoveExamRes) updates) =>
      super.copyWith((message) => updates(message as GetLoveExamRes))
          as GetLoveExamRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLoveExamRes create() => GetLoveExamRes._();
  GetLoveExamRes createEmptyInstance() => create();
  static $pb.PbList<GetLoveExamRes> createRepeated() =>
      $pb.PbList<GetLoveExamRes>();
  @$core.pragma('dart2js:noInline')
  static GetLoveExamRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetLoveExamRes>(create);
  static GetLoveExamRes? _defaultInstance;

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
  LoveExamData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(LoveExamData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  LoveExamData ensureData() => $_ensure(2);
}

class LoveExamData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LoveExamData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<LoveExamQuestion>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'LoveExamQuestions',
        $pb.PbFieldType.PM,
        protoName: 'LoveExamQuestions',
        subBuilder: LoveExamQuestion.create)
    ..hasRequiredFields = false;

  LoveExamData._() : super();
  factory LoveExamData({
    $core.Iterable<LoveExamQuestion>? loveExamQuestions,
  }) {
    final _result = create();
    if (loveExamQuestions != null) {
      _result.loveExamQuestions.addAll(loveExamQuestions);
    }
    return _result;
  }
  factory LoveExamData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LoveExamData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LoveExamData clone() => LoveExamData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LoveExamData copyWith(void Function(LoveExamData) updates) =>
      super.copyWith((message) => updates(message as LoveExamData))
          as LoveExamData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoveExamData create() => LoveExamData._();
  LoveExamData createEmptyInstance() => create();
  static $pb.PbList<LoveExamData> createRepeated() =>
      $pb.PbList<LoveExamData>();
  @$core.pragma('dart2js:noInline')
  static LoveExamData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoveExamData>(create);
  static LoveExamData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<LoveExamQuestion> get loveExamQuestions => $_getList(0);
}

class LoveExamQuestion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LoveExamQuestion',
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
            : 'questionDesc')
    ..pc<LoveExamAnswer>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'answer',
        $pb.PbFieldType.PM,
        subBuilder: LoveExamAnswer.create)
    ..hasRequiredFields = false;

  LoveExamQuestion._() : super();
  factory LoveExamQuestion({
    $core.int? id,
    $core.String? questionDesc,
    $core.Iterable<LoveExamAnswer>? answer,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (questionDesc != null) {
      _result.questionDesc = questionDesc;
    }
    if (answer != null) {
      _result.answer.addAll(answer);
    }
    return _result;
  }
  factory LoveExamQuestion.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LoveExamQuestion.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LoveExamQuestion clone() => LoveExamQuestion()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LoveExamQuestion copyWith(void Function(LoveExamQuestion) updates) =>
      super.copyWith((message) => updates(message as LoveExamQuestion))
          as LoveExamQuestion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoveExamQuestion create() => LoveExamQuestion._();
  LoveExamQuestion createEmptyInstance() => create();
  static $pb.PbList<LoveExamQuestion> createRepeated() =>
      $pb.PbList<LoveExamQuestion>();
  @$core.pragma('dart2js:noInline')
  static LoveExamQuestion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoveExamQuestion>(create);
  static LoveExamQuestion? _defaultInstance;

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
  $core.String get questionDesc => $_getSZ(1);
  @$pb.TagNumber(2)
  set questionDesc($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasQuestionDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuestionDesc() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<LoveExamAnswer> get answer => $_getList(2);
}

class LoveExamAnswer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LoveExamAnswer',
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
            : 'answerDesc')
    ..hasRequiredFields = false;

  LoveExamAnswer._() : super();
  factory LoveExamAnswer({
    $core.int? id,
    $core.String? answerDesc,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (answerDesc != null) {
      _result.answerDesc = answerDesc;
    }
    return _result;
  }
  factory LoveExamAnswer.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LoveExamAnswer.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LoveExamAnswer clone() => LoveExamAnswer()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LoveExamAnswer copyWith(void Function(LoveExamAnswer) updates) =>
      super.copyWith((message) => updates(message as LoveExamAnswer))
          as LoveExamAnswer; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoveExamAnswer create() => LoveExamAnswer._();
  LoveExamAnswer createEmptyInstance() => create();
  static $pb.PbList<LoveExamAnswer> createRepeated() =>
      $pb.PbList<LoveExamAnswer>();
  @$core.pragma('dart2js:noInline')
  static LoveExamAnswer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoveExamAnswer>(create);
  static LoveExamAnswer? _defaultInstance;

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
  $core.String get answerDesc => $_getSZ(1);
  @$pb.TagNumber(2)
  set answerDesc($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAnswerDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearAnswerDesc() => clearField(2);
}

class GetLoveExamResultRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetLoveExamResultRes',
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
    ..aOM<LoveExamResult>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: LoveExamResult.create)
    ..hasRequiredFields = false;

  GetLoveExamResultRes._() : super();
  factory GetLoveExamResultRes({
    $core.bool? success,
    $core.String? msg,
    LoveExamResult? data,
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
  factory GetLoveExamResultRes.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetLoveExamResultRes.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetLoveExamResultRes clone() =>
      GetLoveExamResultRes()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetLoveExamResultRes copyWith(void Function(GetLoveExamResultRes) updates) =>
      super.copyWith((message) => updates(message as GetLoveExamResultRes))
          as GetLoveExamResultRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLoveExamResultRes create() => GetLoveExamResultRes._();
  GetLoveExamResultRes createEmptyInstance() => create();
  static $pb.PbList<GetLoveExamResultRes> createRepeated() =>
      $pb.PbList<GetLoveExamResultRes>();
  @$core.pragma('dart2js:noInline')
  static GetLoveExamResultRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetLoveExamResultRes>(create);
  static GetLoveExamResultRes? _defaultInstance;

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
  LoveExamResult get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(LoveExamResult v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  LoveExamResult ensureData() => $_ensure(2);
}

class LoveExamResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LoveExamResult',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagId',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..hasRequiredFields = false;

  LoveExamResult._() : super();
  factory LoveExamResult({
    $core.int? tagId,
    $core.String? desc,
  }) {
    final _result = create();
    if (tagId != null) {
      _result.tagId = tagId;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    return _result;
  }
  factory LoveExamResult.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LoveExamResult.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LoveExamResult clone() => LoveExamResult()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LoveExamResult copyWith(void Function(LoveExamResult) updates) =>
      super.copyWith((message) => updates(message as LoveExamResult))
          as LoveExamResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoveExamResult create() => LoveExamResult._();
  LoveExamResult createEmptyInstance() => create();
  static $pb.PbList<LoveExamResult> createRepeated() =>
      $pb.PbList<LoveExamResult>();
  @$core.pragma('dart2js:noInline')
  static LoveExamResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoveExamResult>(create);
  static LoveExamResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tagId => $_getIZ(0);
  @$pb.TagNumber(1)
  set tagId($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => clearField(1);

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
