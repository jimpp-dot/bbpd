///
//  Generated code. Do not modify.
//  source: api_im_data.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MarkData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MarkData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'text')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  MarkData._() : super();
  factory MarkData({
    $core.String? text,
    $core.String? icon,
  }) {
    final _result = create();
    if (text != null) {
      _result.text = text;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory MarkData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MarkData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MarkData clone() => MarkData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MarkData copyWith(void Function(MarkData) updates) =>
      super.copyWith((message) => updates(message as MarkData))
          as MarkData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarkData create() => MarkData._();
  MarkData createEmptyInstance() => create();
  static $pb.PbList<MarkData> createRepeated() => $pb.PbList<MarkData>();
  @$core.pragma('dart2js:noInline')
  static MarkData getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarkData>(create);
  static MarkData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);

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
}

class ImUserData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImUserData',
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
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'official',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'degree',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isVerified',
        $pb.PbFieldType.OU3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mark')
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isChatPayGs')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'photoNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vip',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popularity',
        $pb.PbFieldType.OU3)
    ..aOB(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'newUser')
    ..pPS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'marks')
    ..aOM<ImUserOnlineData>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineData',
        subBuilder: ImUserOnlineData.create)
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'appId',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version',
        $pb.PbFieldType.OU3)
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'orderStatus')
    ..aOB(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'iconGray')
    ..a<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'birthday',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDateline',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleted',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleNew',
        $pb.PbFieldType.OU3)
    ..aOS(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..a<$core.int>(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starVerifyTag',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chatEggTitle',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'daka',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jiaren',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'accost',
        $pb.PbFieldType.OU3)
    ..aOS(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chatEggTitleName',
        protoName: 'chatEggTitleName')
    ..aOS(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chatEggTitleColor',
        protoName: 'chatEggTitleColor')
    ..pPS(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'chatEggTitleBolder',
        protoName: 'chatEggTitleBolder')
    ..aOS(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userMachine')
    ..hasRequiredFields = false;

  ImUserData._() : super();
  factory ImUserData({
    $core.int? uid,
    $core.String? icon,
    $core.int? official,
    $core.int? degree,
    $core.int? isVerified,
    $core.String? mark,
    $core.bool? isChatPayGs,
    $core.int? sex,
    $core.int? title,
    $core.String? name,
    $core.int? age,
    $core.int? photoNum,
    $core.int? vip,
    $core.int? popularity,
    $core.bool? newUser,
    $core.Iterable<$core.String>? marks,
    ImUserOnlineData? onlineData,
    $core.int? appId,
    $core.int? version,
    $core.String? orderStatus,
    $core.bool? iconGray,
    $core.int? birthday,
    $core.int? onlineDateline,
    $core.int? deleted,
    $core.int? titleNew,
    $core.String? frame,
    $core.int? starVerifyTag,
    $core.int? chatEggTitle,
    $core.int? daka,
    $core.int? jiaren,
    $core.int? accost,
    $core.String? chatEggTitleName,
    $core.String? chatEggTitleColor,
    $core.Iterable<$core.String>? chatEggTitleBolder,
    $core.String? userMachine,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (official != null) {
      _result.official = official;
    }
    if (degree != null) {
      _result.degree = degree;
    }
    if (isVerified != null) {
      _result.isVerified = isVerified;
    }
    if (mark != null) {
      _result.mark = mark;
    }
    if (isChatPayGs != null) {
      _result.isChatPayGs = isChatPayGs;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (title != null) {
      _result.title = title;
    }
    if (name != null) {
      _result.name = name;
    }
    if (age != null) {
      _result.age = age;
    }
    if (photoNum != null) {
      _result.photoNum = photoNum;
    }
    if (vip != null) {
      _result.vip = vip;
    }
    if (popularity != null) {
      _result.popularity = popularity;
    }
    if (newUser != null) {
      _result.newUser = newUser;
    }
    if (marks != null) {
      _result.marks.addAll(marks);
    }
    if (onlineData != null) {
      _result.onlineData = onlineData;
    }
    if (appId != null) {
      _result.appId = appId;
    }
    if (version != null) {
      _result.version = version;
    }
    if (orderStatus != null) {
      _result.orderStatus = orderStatus;
    }
    if (iconGray != null) {
      _result.iconGray = iconGray;
    }
    if (birthday != null) {
      _result.birthday = birthday;
    }
    if (onlineDateline != null) {
      _result.onlineDateline = onlineDateline;
    }
    if (deleted != null) {
      _result.deleted = deleted;
    }
    if (titleNew != null) {
      _result.titleNew = titleNew;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (starVerifyTag != null) {
      _result.starVerifyTag = starVerifyTag;
    }
    if (chatEggTitle != null) {
      _result.chatEggTitle = chatEggTitle;
    }
    if (daka != null) {
      _result.daka = daka;
    }
    if (jiaren != null) {
      _result.jiaren = jiaren;
    }
    if (accost != null) {
      _result.accost = accost;
    }
    if (chatEggTitleName != null) {
      _result.chatEggTitleName = chatEggTitleName;
    }
    if (chatEggTitleColor != null) {
      _result.chatEggTitleColor = chatEggTitleColor;
    }
    if (chatEggTitleBolder != null) {
      _result.chatEggTitleBolder.addAll(chatEggTitleBolder);
    }
    if (userMachine != null) {
      _result.userMachine = userMachine;
    }
    return _result;
  }
  factory ImUserData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImUserData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImUserData clone() => ImUserData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImUserData copyWith(void Function(ImUserData) updates) =>
      super.copyWith((message) => updates(message as ImUserData))
          as ImUserData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImUserData create() => ImUserData._();
  ImUserData createEmptyInstance() => create();
  static $pb.PbList<ImUserData> createRepeated() => $pb.PbList<ImUserData>();
  @$core.pragma('dart2js:noInline')
  static ImUserData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImUserData>(create);
  static ImUserData? _defaultInstance;

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
  $core.int get official => $_getIZ(2);
  @$pb.TagNumber(3)
  set official($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOfficial() => $_has(2);
  @$pb.TagNumber(3)
  void clearOfficial() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get degree => $_getIZ(3);
  @$pb.TagNumber(4)
  set degree($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDegree() => $_has(3);
  @$pb.TagNumber(4)
  void clearDegree() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get isVerified => $_getIZ(4);
  @$pb.TagNumber(5)
  set isVerified($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIsVerified() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsVerified() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get mark => $_getSZ(5);
  @$pb.TagNumber(6)
  set mark($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMark() => $_has(5);
  @$pb.TagNumber(6)
  void clearMark() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isChatPayGs => $_getBF(6);
  @$pb.TagNumber(7)
  set isChatPayGs($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIsChatPayGs() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsChatPayGs() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get sex => $_getIZ(7);
  @$pb.TagNumber(8)
  set sex($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSex() => $_has(7);
  @$pb.TagNumber(8)
  void clearSex() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get title => $_getIZ(8);
  @$pb.TagNumber(9)
  set title($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTitle() => $_has(8);
  @$pb.TagNumber(9)
  void clearTitle() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get name => $_getSZ(9);
  @$pb.TagNumber(10)
  set name($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasName() => $_has(9);
  @$pb.TagNumber(10)
  void clearName() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get age => $_getIZ(10);
  @$pb.TagNumber(11)
  set age($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasAge() => $_has(10);
  @$pb.TagNumber(11)
  void clearAge() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get photoNum => $_getIZ(11);
  @$pb.TagNumber(12)
  set photoNum($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasPhotoNum() => $_has(11);
  @$pb.TagNumber(12)
  void clearPhotoNum() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get vip => $_getIZ(12);
  @$pb.TagNumber(13)
  set vip($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasVip() => $_has(12);
  @$pb.TagNumber(13)
  void clearVip() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get popularity => $_getIZ(13);
  @$pb.TagNumber(14)
  set popularity($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasPopularity() => $_has(13);
  @$pb.TagNumber(14)
  void clearPopularity() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get newUser => $_getBF(14);
  @$pb.TagNumber(15)
  set newUser($core.bool v) {
    $_setBool(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasNewUser() => $_has(14);
  @$pb.TagNumber(15)
  void clearNewUser() => clearField(15);

  @$pb.TagNumber(16)
  $core.List<$core.String> get marks => $_getList(15);

  @$pb.TagNumber(17)
  ImUserOnlineData get onlineData => $_getN(16);
  @$pb.TagNumber(17)
  set onlineData(ImUserOnlineData v) {
    setField(17, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasOnlineData() => $_has(16);
  @$pb.TagNumber(17)
  void clearOnlineData() => clearField(17);
  @$pb.TagNumber(17)
  ImUserOnlineData ensureOnlineData() => $_ensure(16);

  @$pb.TagNumber(18)
  $core.int get appId => $_getIZ(17);
  @$pb.TagNumber(18)
  set appId($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasAppId() => $_has(17);
  @$pb.TagNumber(18)
  void clearAppId() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get version => $_getIZ(18);
  @$pb.TagNumber(19)
  set version($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasVersion() => $_has(18);
  @$pb.TagNumber(19)
  void clearVersion() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get orderStatus => $_getSZ(19);
  @$pb.TagNumber(20)
  set orderStatus($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasOrderStatus() => $_has(19);
  @$pb.TagNumber(20)
  void clearOrderStatus() => clearField(20);

  @$pb.TagNumber(21)
  $core.bool get iconGray => $_getBF(20);
  @$pb.TagNumber(21)
  set iconGray($core.bool v) {
    $_setBool(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasIconGray() => $_has(20);
  @$pb.TagNumber(21)
  void clearIconGray() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get birthday => $_getIZ(21);
  @$pb.TagNumber(22)
  set birthday($core.int v) {
    $_setUnsignedInt32(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasBirthday() => $_has(21);
  @$pb.TagNumber(22)
  void clearBirthday() => clearField(22);

  @$pb.TagNumber(23)
  $core.int get onlineDateline => $_getIZ(22);
  @$pb.TagNumber(23)
  set onlineDateline($core.int v) {
    $_setUnsignedInt32(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasOnlineDateline() => $_has(22);
  @$pb.TagNumber(23)
  void clearOnlineDateline() => clearField(23);

  @$pb.TagNumber(24)
  $core.int get deleted => $_getIZ(23);
  @$pb.TagNumber(24)
  set deleted($core.int v) {
    $_setUnsignedInt32(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasDeleted() => $_has(23);
  @$pb.TagNumber(24)
  void clearDeleted() => clearField(24);

  @$pb.TagNumber(25)
  $core.int get titleNew => $_getIZ(24);
  @$pb.TagNumber(25)
  set titleNew($core.int v) {
    $_setUnsignedInt32(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasTitleNew() => $_has(24);
  @$pb.TagNumber(25)
  void clearTitleNew() => clearField(25);

  @$pb.TagNumber(26)
  $core.String get frame => $_getSZ(25);
  @$pb.TagNumber(26)
  set frame($core.String v) {
    $_setString(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasFrame() => $_has(25);
  @$pb.TagNumber(26)
  void clearFrame() => clearField(26);

  @$pb.TagNumber(27)
  $core.int get starVerifyTag => $_getIZ(26);
  @$pb.TagNumber(27)
  set starVerifyTag($core.int v) {
    $_setUnsignedInt32(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasStarVerifyTag() => $_has(26);
  @$pb.TagNumber(27)
  void clearStarVerifyTag() => clearField(27);

  @$pb.TagNumber(28)
  $core.int get chatEggTitle => $_getIZ(27);
  @$pb.TagNumber(28)
  set chatEggTitle($core.int v) {
    $_setUnsignedInt32(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasChatEggTitle() => $_has(27);
  @$pb.TagNumber(28)
  void clearChatEggTitle() => clearField(28);

  @$pb.TagNumber(29)
  $core.int get daka => $_getIZ(28);
  @$pb.TagNumber(29)
  set daka($core.int v) {
    $_setUnsignedInt32(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasDaka() => $_has(28);
  @$pb.TagNumber(29)
  void clearDaka() => clearField(29);

  @$pb.TagNumber(30)
  $core.int get jiaren => $_getIZ(29);
  @$pb.TagNumber(30)
  set jiaren($core.int v) {
    $_setUnsignedInt32(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasJiaren() => $_has(29);
  @$pb.TagNumber(30)
  void clearJiaren() => clearField(30);

  @$pb.TagNumber(31)
  $core.int get accost => $_getIZ(30);
  @$pb.TagNumber(31)
  set accost($core.int v) {
    $_setUnsignedInt32(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasAccost() => $_has(30);
  @$pb.TagNumber(31)
  void clearAccost() => clearField(31);

  @$pb.TagNumber(32)
  $core.String get chatEggTitleName => $_getSZ(31);
  @$pb.TagNumber(32)
  set chatEggTitleName($core.String v) {
    $_setString(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasChatEggTitleName() => $_has(31);
  @$pb.TagNumber(32)
  void clearChatEggTitleName() => clearField(32);

  @$pb.TagNumber(33)
  $core.String get chatEggTitleColor => $_getSZ(32);
  @$pb.TagNumber(33)
  set chatEggTitleColor($core.String v) {
    $_setString(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasChatEggTitleColor() => $_has(32);
  @$pb.TagNumber(33)
  void clearChatEggTitleColor() => clearField(33);

  @$pb.TagNumber(34)
  $core.List<$core.String> get chatEggTitleBolder => $_getList(33);

  @$pb.TagNumber(35)
  $core.String get userMachine => $_getSZ(34);
  @$pb.TagNumber(35)
  set userMachine($core.String v) {
    $_setString(34, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasUserMachine() => $_has(34);
  @$pb.TagNumber(35)
  void clearUserMachine() => clearField(35);
}

class ImUserOnlineData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImUserOnlineData',
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
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'online')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDateline',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ImUserOnlineData._() : super();
  factory ImUserOnlineData({
    $core.int? uid,
    $core.bool? online,
    $core.int? onlineDateline,
    $core.int? time,
    $core.int? status,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (online != null) {
      _result.online = online;
    }
    if (onlineDateline != null) {
      _result.onlineDateline = onlineDateline;
    }
    if (time != null) {
      _result.time = time;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory ImUserOnlineData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImUserOnlineData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImUserOnlineData clone() => ImUserOnlineData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImUserOnlineData copyWith(void Function(ImUserOnlineData) updates) =>
      super.copyWith((message) => updates(message as ImUserOnlineData))
          as ImUserOnlineData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImUserOnlineData create() => ImUserOnlineData._();
  ImUserOnlineData createEmptyInstance() => create();
  static $pb.PbList<ImUserOnlineData> createRepeated() =>
      $pb.PbList<ImUserOnlineData>();
  @$core.pragma('dart2js:noInline')
  static ImUserOnlineData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImUserOnlineData>(create);
  static ImUserOnlineData? _defaultInstance;

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
  $core.bool get online => $_getBF(1);
  @$pb.TagNumber(2)
  set online($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOnline() => $_has(1);
  @$pb.TagNumber(2)
  void clearOnline() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get onlineDateline => $_getIZ(2);
  @$pb.TagNumber(3)
  set onlineDateline($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasOnlineDateline() => $_has(2);
  @$pb.TagNumber(3)
  void clearOnlineDateline() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get time => $_getIZ(3);
  @$pb.TagNumber(4)
  set time($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearTime() => clearField(4);

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
}

class ImUserRoomData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImUserRoomData',
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
            : 'room',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomicon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prefix')
    ..pPS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bg')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'acuteIcon')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'online',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'official',
        $pb.PbFieldType.OU3)
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagColor')
    ..aOS(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagIcon')
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'partyStyle',
        $pb.PbFieldType.OU3)
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeIcon')
    ..pPS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeBg')
    ..hasRequiredFields = false;

  ImUserRoomData._() : super();
  factory ImUserRoomData({
    $core.int? uid,
    $core.int? room,
    $core.String? roomicon,
    $core.String? prefix,
    $core.Iterable<$core.String>? bg,
    $core.String? acuteIcon,
    $core.String? show,
    $core.int? time,
    $core.int? online,
    $core.int? official,
    $core.String? label,
    $core.String? tagColor,
    $core.String? tagIcon,
    $core.int? partyStyle,
    $core.String? typeIcon,
    $core.Iterable<$core.String>? typeBg,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (room != null) {
      _result.room = room;
    }
    if (roomicon != null) {
      _result.roomicon = roomicon;
    }
    if (prefix != null) {
      _result.prefix = prefix;
    }
    if (bg != null) {
      _result.bg.addAll(bg);
    }
    if (acuteIcon != null) {
      _result.acuteIcon = acuteIcon;
    }
    if (show != null) {
      _result.show = show;
    }
    if (time != null) {
      _result.time = time;
    }
    if (online != null) {
      _result.online = online;
    }
    if (official != null) {
      _result.official = official;
    }
    if (label != null) {
      _result.label = label;
    }
    if (tagColor != null) {
      _result.tagColor = tagColor;
    }
    if (tagIcon != null) {
      _result.tagIcon = tagIcon;
    }
    if (partyStyle != null) {
      _result.partyStyle = partyStyle;
    }
    if (typeIcon != null) {
      _result.typeIcon = typeIcon;
    }
    if (typeBg != null) {
      _result.typeBg.addAll(typeBg);
    }
    return _result;
  }
  factory ImUserRoomData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImUserRoomData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImUserRoomData clone() => ImUserRoomData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImUserRoomData copyWith(void Function(ImUserRoomData) updates) =>
      super.copyWith((message) => updates(message as ImUserRoomData))
          as ImUserRoomData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImUserRoomData create() => ImUserRoomData._();
  ImUserRoomData createEmptyInstance() => create();
  static $pb.PbList<ImUserRoomData> createRepeated() =>
      $pb.PbList<ImUserRoomData>();
  @$core.pragma('dart2js:noInline')
  static ImUserRoomData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImUserRoomData>(create);
  static ImUserRoomData? _defaultInstance;

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
  $core.int get room => $_getIZ(1);
  @$pb.TagNumber(2)
  set room($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoom() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get roomicon => $_getSZ(2);
  @$pb.TagNumber(3)
  set roomicon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRoomicon() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomicon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get prefix => $_getSZ(3);
  @$pb.TagNumber(4)
  set prefix($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPrefix() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrefix() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get bg => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get acuteIcon => $_getSZ(5);
  @$pb.TagNumber(6)
  set acuteIcon($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAcuteIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearAcuteIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get show => $_getSZ(6);
  @$pb.TagNumber(7)
  set show($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasShow() => $_has(6);
  @$pb.TagNumber(7)
  void clearShow() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get time => $_getIZ(7);
  @$pb.TagNumber(8)
  set time($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearTime() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get online => $_getIZ(8);
  @$pb.TagNumber(9)
  set online($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasOnline() => $_has(8);
  @$pb.TagNumber(9)
  void clearOnline() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get official => $_getIZ(9);
  @$pb.TagNumber(10)
  set official($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasOfficial() => $_has(9);
  @$pb.TagNumber(10)
  void clearOfficial() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get label => $_getSZ(10);
  @$pb.TagNumber(11)
  set label($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasLabel() => $_has(10);
  @$pb.TagNumber(11)
  void clearLabel() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get tagColor => $_getSZ(11);
  @$pb.TagNumber(12)
  set tagColor($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasTagColor() => $_has(11);
  @$pb.TagNumber(12)
  void clearTagColor() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get tagIcon => $_getSZ(12);
  @$pb.TagNumber(13)
  set tagIcon($core.String v) {
    $_setString(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasTagIcon() => $_has(12);
  @$pb.TagNumber(13)
  void clearTagIcon() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get partyStyle => $_getIZ(13);
  @$pb.TagNumber(14)
  set partyStyle($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasPartyStyle() => $_has(13);
  @$pb.TagNumber(14)
  void clearPartyStyle() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get typeIcon => $_getSZ(14);
  @$pb.TagNumber(15)
  set typeIcon($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasTypeIcon() => $_has(14);
  @$pb.TagNumber(15)
  void clearTypeIcon() => clearField(15);

  @$pb.TagNumber(16)
  $core.List<$core.String> get typeBg => $_getList(15);
}

class ImGroupData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImGroupData',
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
            : 'version',
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
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..pc<GroupUser>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'members',
        $pb.PbFieldType.PM,
        subBuilder: GroupUser.create)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'official',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'online',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'room',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomIcon',
        protoName: 'roomIcon')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'prefix')
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'time',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'singerClubId',
        $pb.PbFieldType.OU3,
        protoName: 'singerClubId')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lvIcon',
        protoName: 'lvIcon')
    ..hasRequiredFields = false;

  ImGroupData._() : super();
  factory ImGroupData({
    $core.int? uid,
    $core.int? version,
    $core.String? name,
    $core.String? icon,
    $core.String? type,
    $core.Iterable<GroupUser>? members,
    $core.int? official,
    $core.int? online,
    $core.int? room,
    $core.String? roomIcon,
    $core.String? prefix,
    $core.int? time,
    $core.int? singerClubId,
    $core.String? lvIcon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (version != null) {
      _result.version = version;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (type != null) {
      _result.type = type;
    }
    if (members != null) {
      _result.members.addAll(members);
    }
    if (official != null) {
      _result.official = official;
    }
    if (online != null) {
      _result.online = online;
    }
    if (room != null) {
      _result.room = room;
    }
    if (roomIcon != null) {
      _result.roomIcon = roomIcon;
    }
    if (prefix != null) {
      _result.prefix = prefix;
    }
    if (time != null) {
      _result.time = time;
    }
    if (singerClubId != null) {
      _result.singerClubId = singerClubId;
    }
    if (lvIcon != null) {
      _result.lvIcon = lvIcon;
    }
    return _result;
  }
  factory ImGroupData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImGroupData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImGroupData clone() => ImGroupData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImGroupData copyWith(void Function(ImGroupData) updates) =>
      super.copyWith((message) => updates(message as ImGroupData))
          as ImGroupData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImGroupData create() => ImGroupData._();
  ImGroupData createEmptyInstance() => create();
  static $pb.PbList<ImGroupData> createRepeated() => $pb.PbList<ImGroupData>();
  @$core.pragma('dart2js:noInline')
  static ImGroupData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImGroupData>(create);
  static ImGroupData? _defaultInstance;

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
  $core.int get version => $_getIZ(1);
  @$pb.TagNumber(2)
  set version($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => clearField(2);

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
  $core.String get type => $_getSZ(4);
  @$pb.TagNumber(5)
  set type($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<GroupUser> get members => $_getList(5);

  @$pb.TagNumber(7)
  $core.int get official => $_getIZ(6);
  @$pb.TagNumber(7)
  set official($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasOfficial() => $_has(6);
  @$pb.TagNumber(7)
  void clearOfficial() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get online => $_getIZ(7);
  @$pb.TagNumber(8)
  set online($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasOnline() => $_has(7);
  @$pb.TagNumber(8)
  void clearOnline() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get room => $_getIZ(8);
  @$pb.TagNumber(9)
  set room($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasRoom() => $_has(8);
  @$pb.TagNumber(9)
  void clearRoom() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get roomIcon => $_getSZ(9);
  @$pb.TagNumber(10)
  set roomIcon($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasRoomIcon() => $_has(9);
  @$pb.TagNumber(10)
  void clearRoomIcon() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get prefix => $_getSZ(10);
  @$pb.TagNumber(11)
  set prefix($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasPrefix() => $_has(10);
  @$pb.TagNumber(11)
  void clearPrefix() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get time => $_getIZ(11);
  @$pb.TagNumber(12)
  set time($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasTime() => $_has(11);
  @$pb.TagNumber(12)
  void clearTime() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get singerClubId => $_getIZ(12);
  @$pb.TagNumber(13)
  set singerClubId($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasSingerClubId() => $_has(12);
  @$pb.TagNumber(13)
  void clearSingerClubId() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get lvIcon => $_getSZ(13);
  @$pb.TagNumber(14)
  set lvIcon($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasLvIcon() => $_has(13);
  @$pb.TagNumber(14)
  void clearLvIcon() => clearField(14);
}

class GroupUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GroupUser',
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
            : 'title',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDateline',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'speak',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  GroupUser._() : super();
  factory GroupUser({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? title,
    $core.int? onlineDateline,
    $core.int? speak,
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
    if (title != null) {
      _result.title = title;
    }
    if (onlineDateline != null) {
      _result.onlineDateline = onlineDateline;
    }
    if (speak != null) {
      _result.speak = speak;
    }
    return _result;
  }
  factory GroupUser.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GroupUser.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GroupUser clone() => GroupUser()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GroupUser copyWith(void Function(GroupUser) updates) =>
      super.copyWith((message) => updates(message as GroupUser))
          as GroupUser; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GroupUser create() => GroupUser._();
  GroupUser createEmptyInstance() => create();
  static $pb.PbList<GroupUser> createRepeated() => $pb.PbList<GroupUser>();
  @$core.pragma('dart2js:noInline')
  static GroupUser getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GroupUser>(create);
  static GroupUser? _defaultInstance;

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
  $core.int get title => $_getIZ(3);
  @$pb.TagNumber(4)
  set title($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get onlineDateline => $_getIZ(4);
  @$pb.TagNumber(5)
  set onlineDateline($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOnlineDateline() => $_has(4);
  @$pb.TagNumber(5)
  void clearOnlineDateline() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get speak => $_getIZ(5);
  @$pb.TagNumber(6)
  set speak($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSpeak() => $_has(5);
  @$pb.TagNumber(6)
  void clearSpeak() => clearField(6);
}

class ImCloudAllData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImCloudAllData',
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
    ..pc<ImUserData>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'users',
        $pb.PbFieldType.PM,
        subBuilder: ImUserData.create)
    ..pc<ImGroupData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupData',
        $pb.PbFieldType.PM,
        subBuilder: ImGroupData.create)
    ..pc<ImUserRoomData>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomData',
        $pb.PbFieldType.PM,
        subBuilder: ImUserRoomData.create)
    ..aOM<KaTouchData>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'kaTouch',
        subBuilder: KaTouchData.create)
    ..hasRequiredFields = false;

  ImCloudAllData._() : super();
  factory ImCloudAllData({
    $core.int? rid,
    $core.Iterable<ImUserData>? users,
    $core.Iterable<ImGroupData>? groupData,
    $core.Iterable<ImUserRoomData>? roomData,
    KaTouchData? kaTouch,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (users != null) {
      _result.users.addAll(users);
    }
    if (groupData != null) {
      _result.groupData.addAll(groupData);
    }
    if (roomData != null) {
      _result.roomData.addAll(roomData);
    }
    if (kaTouch != null) {
      _result.kaTouch = kaTouch;
    }
    return _result;
  }
  factory ImCloudAllData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImCloudAllData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImCloudAllData clone() => ImCloudAllData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImCloudAllData copyWith(void Function(ImCloudAllData) updates) =>
      super.copyWith((message) => updates(message as ImCloudAllData))
          as ImCloudAllData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImCloudAllData create() => ImCloudAllData._();
  ImCloudAllData createEmptyInstance() => create();
  static $pb.PbList<ImCloudAllData> createRepeated() =>
      $pb.PbList<ImCloudAllData>();
  @$core.pragma('dart2js:noInline')
  static ImCloudAllData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImCloudAllData>(create);
  static ImCloudAllData? _defaultInstance;

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
  $core.List<ImUserData> get users => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<ImGroupData> get groupData => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<ImUserRoomData> get roomData => $_getList(3);

  @$pb.TagNumber(5)
  KaTouchData get kaTouch => $_getN(4);
  @$pb.TagNumber(5)
  set kaTouch(KaTouchData v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasKaTouch() => $_has(4);
  @$pb.TagNumber(5)
  void clearKaTouch() => clearField(5);
  @$pb.TagNumber(5)
  KaTouchData ensureKaTouch() => $_ensure(4);
}

class ResImCloudAll extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResImCloudAll',
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
    ..aOM<ImCloudAllData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: ImCloudAllData.create)
    ..hasRequiredFields = false;

  ResImCloudAll._() : super();
  factory ResImCloudAll({
    $core.bool? success,
    $core.String? msg,
    ImCloudAllData? data,
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
  factory ResImCloudAll.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResImCloudAll.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResImCloudAll clone() => ResImCloudAll()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResImCloudAll copyWith(void Function(ResImCloudAll) updates) =>
      super.copyWith((message) => updates(message as ResImCloudAll))
          as ResImCloudAll; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResImCloudAll create() => ResImCloudAll._();
  ResImCloudAll createEmptyInstance() => create();
  static $pb.PbList<ResImCloudAll> createRepeated() =>
      $pb.PbList<ResImCloudAll>();
  @$core.pragma('dart2js:noInline')
  static ResImCloudAll getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResImCloudAll>(create);
  static ResImCloudAll? _defaultInstance;

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
  ImCloudAllData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(ImCloudAllData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  ImCloudAllData ensureData() => $_ensure(2);
}

class ImUserOnlineMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImUserOnlineMsg',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ImUserOnlineData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineData',
        $pb.PbFieldType.PM,
        subBuilder: ImUserOnlineData.create)
    ..hasRequiredFields = false;

  ImUserOnlineMsg._() : super();
  factory ImUserOnlineMsg({
    $core.Iterable<ImUserOnlineData>? onlineData,
  }) {
    final _result = create();
    if (onlineData != null) {
      _result.onlineData.addAll(onlineData);
    }
    return _result;
  }
  factory ImUserOnlineMsg.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImUserOnlineMsg.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImUserOnlineMsg clone() => ImUserOnlineMsg()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImUserOnlineMsg copyWith(void Function(ImUserOnlineMsg) updates) =>
      super.copyWith((message) => updates(message as ImUserOnlineMsg))
          as ImUserOnlineMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImUserOnlineMsg create() => ImUserOnlineMsg._();
  ImUserOnlineMsg createEmptyInstance() => create();
  static $pb.PbList<ImUserOnlineMsg> createRepeated() =>
      $pb.PbList<ImUserOnlineMsg>();
  @$core.pragma('dart2js:noInline')
  static ImUserOnlineMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImUserOnlineMsg>(create);
  static ImUserOnlineMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ImUserOnlineData> get onlineData => $_getList(0);
}

class ImUserRoomMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImUserRoomMsg',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ImUserRoomData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'roomData',
        $pb.PbFieldType.PM,
        subBuilder: ImUserRoomData.create)
    ..hasRequiredFields = false;

  ImUserRoomMsg._() : super();
  factory ImUserRoomMsg({
    $core.Iterable<ImUserRoomData>? roomData,
  }) {
    final _result = create();
    if (roomData != null) {
      _result.roomData.addAll(roomData);
    }
    return _result;
  }
  factory ImUserRoomMsg.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImUserRoomMsg.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImUserRoomMsg clone() => ImUserRoomMsg()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImUserRoomMsg copyWith(void Function(ImUserRoomMsg) updates) =>
      super.copyWith((message) => updates(message as ImUserRoomMsg))
          as ImUserRoomMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImUserRoomMsg create() => ImUserRoomMsg._();
  ImUserRoomMsg createEmptyInstance() => create();
  static $pb.PbList<ImUserRoomMsg> createRepeated() =>
      $pb.PbList<ImUserRoomMsg>();
  @$core.pragma('dart2js:noInline')
  static ImUserRoomMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImUserRoomMsg>(create);
  static ImUserRoomMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ImUserRoomData> get roomData => $_getList(0);
}

class ImGroupMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImGroupMsg',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ImGroupData>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupData',
        $pb.PbFieldType.PM,
        subBuilder: ImGroupData.create)
    ..hasRequiredFields = false;

  ImGroupMsg._() : super();
  factory ImGroupMsg({
    $core.Iterable<ImGroupData>? groupData,
  }) {
    final _result = create();
    if (groupData != null) {
      _result.groupData.addAll(groupData);
    }
    return _result;
  }
  factory ImGroupMsg.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImGroupMsg.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImGroupMsg clone() => ImGroupMsg()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImGroupMsg copyWith(void Function(ImGroupMsg) updates) =>
      super.copyWith((message) => updates(message as ImGroupMsg))
          as ImGroupMsg; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImGroupMsg create() => ImGroupMsg._();
  ImGroupMsg createEmptyInstance() => create();
  static $pb.PbList<ImGroupMsg> createRepeated() => $pb.PbList<ImGroupMsg>();
  @$core.pragma('dart2js:noInline')
  static ImGroupMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImGroupMsg>(create);
  static ImGroupMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ImGroupData> get groupData => $_getList(0);
}

class KaTouchData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'KaTouchData',
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
            : 'subTitle')
    ..hasRequiredFields = false;

  KaTouchData._() : super();
  factory KaTouchData({
    $core.String? title,
    $core.String? subTitle,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (subTitle != null) {
      _result.subTitle = subTitle;
    }
    return _result;
  }
  factory KaTouchData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory KaTouchData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  KaTouchData clone() => KaTouchData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  KaTouchData copyWith(void Function(KaTouchData) updates) =>
      super.copyWith((message) => updates(message as KaTouchData))
          as KaTouchData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KaTouchData create() => KaTouchData._();
  KaTouchData createEmptyInstance() => create();
  static $pb.PbList<KaTouchData> createRepeated() => $pb.PbList<KaTouchData>();
  @$core.pragma('dart2js:noInline')
  static KaTouchData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<KaTouchData>(create);
  static KaTouchData? _defaultInstance;

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
  $core.String get subTitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set subTitle($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSubTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubTitle() => clearField(2);
}
