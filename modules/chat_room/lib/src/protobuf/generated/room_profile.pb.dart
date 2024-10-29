///
//  Generated code. Do not modify.
//  source: room_profile.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomCardProfileBase extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileBase',
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
            : 'age',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'birthday')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sign')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineStatus',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDateline',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDatelineDiff')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'job',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleted',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'blockUnAutherMessage',
        $pb.PbFieldType.OU3)
    ..aOS(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position')
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vipLevel',
        $pb.PbFieldType.OU3,
        protoName: 'vipLevel')
    ..pPS(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'photos')
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'markName')
    ..aOB(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icongray')
    ..a<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topic',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'needVerify',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'needVerifyNew',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'official',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isNewer',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'popularityLevel',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'followRelation',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fansNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'distance')
    ..a<$core.int>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'accompanyNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'newNoble',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'authentication',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'authenticationScore',
        $pb.PbFieldType.OU3,
        protoName: 'authenticationScore')
    ..aOS(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'authenticationSign',
        protoName: 'authenticationSign')
    ..a<$core.int>(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defendCount',
        $pb.PbFieldType.OU3)
    ..aOS(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'frame')
    ..a<$core.int>(
        38,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'virtualMan',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'knightLevel',
        $pb.PbFieldType.OU3)
    ..aOS(
        40,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveLabelHeader')
    ..aOS(
        41,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveLabelBubble')
    ..aOS(
        42,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveLabelEffect')
    ..a<$core.int>(
        43,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'liveOnly',
        $pb.PbFieldType.OU3)
    ..aOS(
        44,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'littleAlarm')
    ..aOS(
        45,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jukebox')
    ..aOB(
        46,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'consumeLabel')
    ..aOB(
        47,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rechargeLabel')
    ..a<$core.int>(
        48,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starSinger',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        49,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starVerifyTag',
        $pb.PbFieldType.OU3)
    ..aOS(
        50,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'starVerifyDesc')
    ..aOB(
        51,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'kaWhiteIcon')
    ..a<$core.int>(
        52,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'musicOrderCount',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomCardProfileBase._() : super();
  factory RoomCardProfileBase({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.int? age,
    $core.String? birthday,
    $core.String? sign,
    $core.int? onlineStatus,
    $core.int? dateline,
    $core.int? onlineDateline,
    $core.String? onlineDatelineDiff,
    $core.int? job,
    $core.int? sex,
    $core.int? title,
    $core.int? deleted,
    $core.int? blockUnAutherMessage,
    $core.String? position,
    $core.int? role,
    $core.int? vipLevel,
    $core.Iterable<$core.String>? photos,
    $core.String? markName,
    $core.bool? icongray,
    $core.int? topic,
    $core.int? needVerify,
    $core.int? needVerifyNew,
    $core.int? official,
    $core.int? isNewer,
    $core.int? popularityLevel,
    $core.int? followRelation,
    $core.int? fansNum,
    $core.String? distance,
    $core.int? accompanyNum,
    $core.int? newNoble,
    $core.int? authentication,
    $core.int? authenticationScore,
    $core.String? authenticationSign,
    $core.int? defendCount,
    $core.String? frame,
    $core.int? virtualMan,
    $core.int? knightLevel,
    $core.String? liveLabelHeader,
    $core.String? liveLabelBubble,
    $core.String? liveLabelEffect,
    $core.int? liveOnly,
    $core.String? littleAlarm,
    $core.String? jukebox,
    $core.bool? consumeLabel,
    $core.bool? rechargeLabel,
    $core.int? starSinger,
    $core.int? starVerifyTag,
    $core.String? starVerifyDesc,
    $core.bool? kaWhiteIcon,
    $core.int? musicOrderCount,
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
    if (age != null) {
      _result.age = age;
    }
    if (birthday != null) {
      _result.birthday = birthday;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (onlineDateline != null) {
      _result.onlineDateline = onlineDateline;
    }
    if (onlineDatelineDiff != null) {
      _result.onlineDatelineDiff = onlineDatelineDiff;
    }
    if (job != null) {
      _result.job = job;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (title != null) {
      _result.title = title;
    }
    if (deleted != null) {
      _result.deleted = deleted;
    }
    if (blockUnAutherMessage != null) {
      _result.blockUnAutherMessage = blockUnAutherMessage;
    }
    if (position != null) {
      _result.position = position;
    }
    if (role != null) {
      _result.role = role;
    }
    if (vipLevel != null) {
      _result.vipLevel = vipLevel;
    }
    if (photos != null) {
      _result.photos.addAll(photos);
    }
    if (markName != null) {
      _result.markName = markName;
    }
    if (icongray != null) {
      _result.icongray = icongray;
    }
    if (topic != null) {
      _result.topic = topic;
    }
    if (needVerify != null) {
      _result.needVerify = needVerify;
    }
    if (needVerifyNew != null) {
      _result.needVerifyNew = needVerifyNew;
    }
    if (official != null) {
      _result.official = official;
    }
    if (isNewer != null) {
      _result.isNewer = isNewer;
    }
    if (popularityLevel != null) {
      _result.popularityLevel = popularityLevel;
    }
    if (followRelation != null) {
      _result.followRelation = followRelation;
    }
    if (fansNum != null) {
      _result.fansNum = fansNum;
    }
    if (distance != null) {
      _result.distance = distance;
    }
    if (accompanyNum != null) {
      _result.accompanyNum = accompanyNum;
    }
    if (newNoble != null) {
      _result.newNoble = newNoble;
    }
    if (authentication != null) {
      _result.authentication = authentication;
    }
    if (authenticationScore != null) {
      _result.authenticationScore = authenticationScore;
    }
    if (authenticationSign != null) {
      _result.authenticationSign = authenticationSign;
    }
    if (defendCount != null) {
      _result.defendCount = defendCount;
    }
    if (frame != null) {
      _result.frame = frame;
    }
    if (virtualMan != null) {
      _result.virtualMan = virtualMan;
    }
    if (knightLevel != null) {
      _result.knightLevel = knightLevel;
    }
    if (liveLabelHeader != null) {
      _result.liveLabelHeader = liveLabelHeader;
    }
    if (liveLabelBubble != null) {
      _result.liveLabelBubble = liveLabelBubble;
    }
    if (liveLabelEffect != null) {
      _result.liveLabelEffect = liveLabelEffect;
    }
    if (liveOnly != null) {
      _result.liveOnly = liveOnly;
    }
    if (littleAlarm != null) {
      _result.littleAlarm = littleAlarm;
    }
    if (jukebox != null) {
      _result.jukebox = jukebox;
    }
    if (consumeLabel != null) {
      _result.consumeLabel = consumeLabel;
    }
    if (rechargeLabel != null) {
      _result.rechargeLabel = rechargeLabel;
    }
    if (starSinger != null) {
      _result.starSinger = starSinger;
    }
    if (starVerifyTag != null) {
      _result.starVerifyTag = starVerifyTag;
    }
    if (starVerifyDesc != null) {
      _result.starVerifyDesc = starVerifyDesc;
    }
    if (kaWhiteIcon != null) {
      _result.kaWhiteIcon = kaWhiteIcon;
    }
    if (musicOrderCount != null) {
      _result.musicOrderCount = musicOrderCount;
    }
    return _result;
  }
  factory RoomCardProfileBase.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileBase.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileBase clone() => RoomCardProfileBase()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileBase copyWith(void Function(RoomCardProfileBase) updates) =>
      super.copyWith((message) => updates(message as RoomCardProfileBase))
          as RoomCardProfileBase; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileBase create() => RoomCardProfileBase._();
  RoomCardProfileBase createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileBase> createRepeated() =>
      $pb.PbList<RoomCardProfileBase>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileBase getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileBase>(create);
  static RoomCardProfileBase? _defaultInstance;

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
  $core.int get age => $_getIZ(3);
  @$pb.TagNumber(4)
  set age($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAge() => $_has(3);
  @$pb.TagNumber(4)
  void clearAge() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get birthday => $_getSZ(4);
  @$pb.TagNumber(5)
  set birthday($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBirthday() => $_has(4);
  @$pb.TagNumber(5)
  void clearBirthday() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get sign => $_getSZ(5);
  @$pb.TagNumber(6)
  set sign($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSign() => $_has(5);
  @$pb.TagNumber(6)
  void clearSign() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get onlineStatus => $_getIZ(6);
  @$pb.TagNumber(7)
  set onlineStatus($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasOnlineStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearOnlineStatus() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get dateline => $_getIZ(7);
  @$pb.TagNumber(8)
  set dateline($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDateline() => $_has(7);
  @$pb.TagNumber(8)
  void clearDateline() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get onlineDateline => $_getIZ(8);
  @$pb.TagNumber(9)
  set onlineDateline($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasOnlineDateline() => $_has(8);
  @$pb.TagNumber(9)
  void clearOnlineDateline() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get onlineDatelineDiff => $_getSZ(9);
  @$pb.TagNumber(10)
  set onlineDatelineDiff($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasOnlineDatelineDiff() => $_has(9);
  @$pb.TagNumber(10)
  void clearOnlineDatelineDiff() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get job => $_getIZ(10);
  @$pb.TagNumber(11)
  set job($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasJob() => $_has(10);
  @$pb.TagNumber(11)
  void clearJob() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get sex => $_getIZ(11);
  @$pb.TagNumber(12)
  set sex($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasSex() => $_has(11);
  @$pb.TagNumber(12)
  void clearSex() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get title => $_getIZ(12);
  @$pb.TagNumber(13)
  set title($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasTitle() => $_has(12);
  @$pb.TagNumber(13)
  void clearTitle() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get deleted => $_getIZ(13);
  @$pb.TagNumber(14)
  set deleted($core.int v) {
    $_setSignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasDeleted() => $_has(13);
  @$pb.TagNumber(14)
  void clearDeleted() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get blockUnAutherMessage => $_getIZ(14);
  @$pb.TagNumber(15)
  set blockUnAutherMessage($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasBlockUnAutherMessage() => $_has(14);
  @$pb.TagNumber(15)
  void clearBlockUnAutherMessage() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get position => $_getSZ(15);
  @$pb.TagNumber(16)
  set position($core.String v) {
    $_setString(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasPosition() => $_has(15);
  @$pb.TagNumber(16)
  void clearPosition() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get role => $_getIZ(16);
  @$pb.TagNumber(17)
  set role($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasRole() => $_has(16);
  @$pb.TagNumber(17)
  void clearRole() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get vipLevel => $_getIZ(17);
  @$pb.TagNumber(18)
  set vipLevel($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasVipLevel() => $_has(17);
  @$pb.TagNumber(18)
  void clearVipLevel() => clearField(18);

  @$pb.TagNumber(19)
  $core.List<$core.String> get photos => $_getList(18);

  @$pb.TagNumber(20)
  $core.String get markName => $_getSZ(19);
  @$pb.TagNumber(20)
  set markName($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasMarkName() => $_has(19);
  @$pb.TagNumber(20)
  void clearMarkName() => clearField(20);

  @$pb.TagNumber(21)
  $core.bool get icongray => $_getBF(20);
  @$pb.TagNumber(21)
  set icongray($core.bool v) {
    $_setBool(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasIcongray() => $_has(20);
  @$pb.TagNumber(21)
  void clearIcongray() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get topic => $_getIZ(21);
  @$pb.TagNumber(22)
  set topic($core.int v) {
    $_setUnsignedInt32(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasTopic() => $_has(21);
  @$pb.TagNumber(22)
  void clearTopic() => clearField(22);

  @$pb.TagNumber(23)
  $core.int get needVerify => $_getIZ(22);
  @$pb.TagNumber(23)
  set needVerify($core.int v) {
    $_setUnsignedInt32(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasNeedVerify() => $_has(22);
  @$pb.TagNumber(23)
  void clearNeedVerify() => clearField(23);

  @$pb.TagNumber(24)
  $core.int get needVerifyNew => $_getIZ(23);
  @$pb.TagNumber(24)
  set needVerifyNew($core.int v) {
    $_setUnsignedInt32(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasNeedVerifyNew() => $_has(23);
  @$pb.TagNumber(24)
  void clearNeedVerifyNew() => clearField(24);

  @$pb.TagNumber(25)
  $core.int get official => $_getIZ(24);
  @$pb.TagNumber(25)
  set official($core.int v) {
    $_setUnsignedInt32(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasOfficial() => $_has(24);
  @$pb.TagNumber(25)
  void clearOfficial() => clearField(25);

  @$pb.TagNumber(26)
  $core.int get isNewer => $_getIZ(25);
  @$pb.TagNumber(26)
  set isNewer($core.int v) {
    $_setUnsignedInt32(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasIsNewer() => $_has(25);
  @$pb.TagNumber(26)
  void clearIsNewer() => clearField(26);

  @$pb.TagNumber(27)
  $core.int get popularityLevel => $_getIZ(26);
  @$pb.TagNumber(27)
  set popularityLevel($core.int v) {
    $_setUnsignedInt32(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasPopularityLevel() => $_has(26);
  @$pb.TagNumber(27)
  void clearPopularityLevel() => clearField(27);

  @$pb.TagNumber(28)
  $core.int get followRelation => $_getIZ(27);
  @$pb.TagNumber(28)
  set followRelation($core.int v) {
    $_setUnsignedInt32(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasFollowRelation() => $_has(27);
  @$pb.TagNumber(28)
  void clearFollowRelation() => clearField(28);

  @$pb.TagNumber(29)
  $core.int get fansNum => $_getIZ(28);
  @$pb.TagNumber(29)
  set fansNum($core.int v) {
    $_setUnsignedInt32(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasFansNum() => $_has(28);
  @$pb.TagNumber(29)
  void clearFansNum() => clearField(29);

  @$pb.TagNumber(30)
  $core.String get distance => $_getSZ(29);
  @$pb.TagNumber(30)
  set distance($core.String v) {
    $_setString(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasDistance() => $_has(29);
  @$pb.TagNumber(30)
  void clearDistance() => clearField(30);

  @$pb.TagNumber(31)
  $core.int get accompanyNum => $_getIZ(30);
  @$pb.TagNumber(31)
  set accompanyNum($core.int v) {
    $_setUnsignedInt32(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasAccompanyNum() => $_has(30);
  @$pb.TagNumber(31)
  void clearAccompanyNum() => clearField(31);

  @$pb.TagNumber(32)
  $core.int get newNoble => $_getIZ(31);
  @$pb.TagNumber(32)
  set newNoble($core.int v) {
    $_setUnsignedInt32(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasNewNoble() => $_has(31);
  @$pb.TagNumber(32)
  void clearNewNoble() => clearField(32);

  @$pb.TagNumber(33)
  $core.int get authentication => $_getIZ(32);
  @$pb.TagNumber(33)
  set authentication($core.int v) {
    $_setUnsignedInt32(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasAuthentication() => $_has(32);
  @$pb.TagNumber(33)
  void clearAuthentication() => clearField(33);

  @$pb.TagNumber(34)
  $core.int get authenticationScore => $_getIZ(33);
  @$pb.TagNumber(34)
  set authenticationScore($core.int v) {
    $_setUnsignedInt32(33, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasAuthenticationScore() => $_has(33);
  @$pb.TagNumber(34)
  void clearAuthenticationScore() => clearField(34);

  @$pb.TagNumber(35)
  $core.String get authenticationSign => $_getSZ(34);
  @$pb.TagNumber(35)
  set authenticationSign($core.String v) {
    $_setString(34, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasAuthenticationSign() => $_has(34);
  @$pb.TagNumber(35)
  void clearAuthenticationSign() => clearField(35);

  @$pb.TagNumber(36)
  $core.int get defendCount => $_getIZ(35);
  @$pb.TagNumber(36)
  set defendCount($core.int v) {
    $_setUnsignedInt32(35, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasDefendCount() => $_has(35);
  @$pb.TagNumber(36)
  void clearDefendCount() => clearField(36);

  @$pb.TagNumber(37)
  $core.String get frame => $_getSZ(36);
  @$pb.TagNumber(37)
  set frame($core.String v) {
    $_setString(36, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasFrame() => $_has(36);
  @$pb.TagNumber(37)
  void clearFrame() => clearField(37);

  @$pb.TagNumber(38)
  $core.int get virtualMan => $_getIZ(37);
  @$pb.TagNumber(38)
  set virtualMan($core.int v) {
    $_setUnsignedInt32(37, v);
  }

  @$pb.TagNumber(38)
  $core.bool hasVirtualMan() => $_has(37);
  @$pb.TagNumber(38)
  void clearVirtualMan() => clearField(38);

  @$pb.TagNumber(39)
  $core.int get knightLevel => $_getIZ(38);
  @$pb.TagNumber(39)
  set knightLevel($core.int v) {
    $_setUnsignedInt32(38, v);
  }

  @$pb.TagNumber(39)
  $core.bool hasKnightLevel() => $_has(38);
  @$pb.TagNumber(39)
  void clearKnightLevel() => clearField(39);

  @$pb.TagNumber(40)
  $core.String get liveLabelHeader => $_getSZ(39);
  @$pb.TagNumber(40)
  set liveLabelHeader($core.String v) {
    $_setString(39, v);
  }

  @$pb.TagNumber(40)
  $core.bool hasLiveLabelHeader() => $_has(39);
  @$pb.TagNumber(40)
  void clearLiveLabelHeader() => clearField(40);

  @$pb.TagNumber(41)
  $core.String get liveLabelBubble => $_getSZ(40);
  @$pb.TagNumber(41)
  set liveLabelBubble($core.String v) {
    $_setString(40, v);
  }

  @$pb.TagNumber(41)
  $core.bool hasLiveLabelBubble() => $_has(40);
  @$pb.TagNumber(41)
  void clearLiveLabelBubble() => clearField(41);

  @$pb.TagNumber(42)
  $core.String get liveLabelEffect => $_getSZ(41);
  @$pb.TagNumber(42)
  set liveLabelEffect($core.String v) {
    $_setString(41, v);
  }

  @$pb.TagNumber(42)
  $core.bool hasLiveLabelEffect() => $_has(41);
  @$pb.TagNumber(42)
  void clearLiveLabelEffect() => clearField(42);

  @$pb.TagNumber(43)
  $core.int get liveOnly => $_getIZ(42);
  @$pb.TagNumber(43)
  set liveOnly($core.int v) {
    $_setUnsignedInt32(42, v);
  }

  @$pb.TagNumber(43)
  $core.bool hasLiveOnly() => $_has(42);
  @$pb.TagNumber(43)
  void clearLiveOnly() => clearField(43);

  @$pb.TagNumber(44)
  $core.String get littleAlarm => $_getSZ(43);
  @$pb.TagNumber(44)
  set littleAlarm($core.String v) {
    $_setString(43, v);
  }

  @$pb.TagNumber(44)
  $core.bool hasLittleAlarm() => $_has(43);
  @$pb.TagNumber(44)
  void clearLittleAlarm() => clearField(44);

  @$pb.TagNumber(45)
  $core.String get jukebox => $_getSZ(44);
  @$pb.TagNumber(45)
  set jukebox($core.String v) {
    $_setString(44, v);
  }

  @$pb.TagNumber(45)
  $core.bool hasJukebox() => $_has(44);
  @$pb.TagNumber(45)
  void clearJukebox() => clearField(45);

  @$pb.TagNumber(46)
  $core.bool get consumeLabel => $_getBF(45);
  @$pb.TagNumber(46)
  set consumeLabel($core.bool v) {
    $_setBool(45, v);
  }

  @$pb.TagNumber(46)
  $core.bool hasConsumeLabel() => $_has(45);
  @$pb.TagNumber(46)
  void clearConsumeLabel() => clearField(46);

  @$pb.TagNumber(47)
  $core.bool get rechargeLabel => $_getBF(46);
  @$pb.TagNumber(47)
  set rechargeLabel($core.bool v) {
    $_setBool(46, v);
  }

  @$pb.TagNumber(47)
  $core.bool hasRechargeLabel() => $_has(46);
  @$pb.TagNumber(47)
  void clearRechargeLabel() => clearField(47);

  @$pb.TagNumber(48)
  $core.int get starSinger => $_getIZ(47);
  @$pb.TagNumber(48)
  set starSinger($core.int v) {
    $_setUnsignedInt32(47, v);
  }

  @$pb.TagNumber(48)
  $core.bool hasStarSinger() => $_has(47);
  @$pb.TagNumber(48)
  void clearStarSinger() => clearField(48);

  @$pb.TagNumber(49)
  $core.int get starVerifyTag => $_getIZ(48);
  @$pb.TagNumber(49)
  set starVerifyTag($core.int v) {
    $_setUnsignedInt32(48, v);
  }

  @$pb.TagNumber(49)
  $core.bool hasStarVerifyTag() => $_has(48);
  @$pb.TagNumber(49)
  void clearStarVerifyTag() => clearField(49);

  @$pb.TagNumber(50)
  $core.String get starVerifyDesc => $_getSZ(49);
  @$pb.TagNumber(50)
  set starVerifyDesc($core.String v) {
    $_setString(49, v);
  }

  @$pb.TagNumber(50)
  $core.bool hasStarVerifyDesc() => $_has(49);
  @$pb.TagNumber(50)
  void clearStarVerifyDesc() => clearField(50);

  @$pb.TagNumber(51)
  $core.bool get kaWhiteIcon => $_getBF(50);
  @$pb.TagNumber(51)
  set kaWhiteIcon($core.bool v) {
    $_setBool(50, v);
  }

  @$pb.TagNumber(51)
  $core.bool hasKaWhiteIcon() => $_has(50);
  @$pb.TagNumber(51)
  void clearKaWhiteIcon() => clearField(51);

  @$pb.TagNumber(52)
  $core.int get musicOrderCount => $_getIZ(51);
  @$pb.TagNumber(52)
  set musicOrderCount($core.int v) {
    $_setUnsignedInt32(51, v);
  }

  @$pb.TagNumber(52)
  $core.bool hasMusicOrderCount() => $_has(51);
  @$pb.TagNumber(52)
  void clearMusicOrderCount() => clearField(52);
}

class RoomCardProfileRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileRoom',
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
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.O3)
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
            : 'property')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onmicNum',
        $pb.PbFieldType.O3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'label')
    ..hasRequiredFields = false;

  RoomCardProfileRoom._() : super();
  factory RoomCardProfileRoom({
    $core.int? rid,
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? property,
    $core.int? onmicNum,
    $core.String? role,
    $core.String? label,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
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
    if (property != null) {
      _result.property = property;
    }
    if (onmicNum != null) {
      _result.onmicNum = onmicNum;
    }
    if (role != null) {
      _result.role = role;
    }
    if (label != null) {
      _result.label = label;
    }
    return _result;
  }
  factory RoomCardProfileRoom.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileRoom.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileRoom clone() => RoomCardProfileRoom()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileRoom copyWith(void Function(RoomCardProfileRoom) updates) =>
      super.copyWith((message) => updates(message as RoomCardProfileRoom))
          as RoomCardProfileRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileRoom create() => RoomCardProfileRoom._();
  RoomCardProfileRoom createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileRoom> createRepeated() =>
      $pb.PbList<RoomCardProfileRoom>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileRoom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileRoom>(create);
  static RoomCardProfileRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rid => $_getIZ(0);
  @$pb.TagNumber(1)
  set rid($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get uid => $_getIZ(1);
  @$pb.TagNumber(2)
  set uid($core.int v) {
    $_setSignedInt32(1, v);
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
  $core.String get property => $_getSZ(4);
  @$pb.TagNumber(5)
  set property($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasProperty() => $_has(4);
  @$pb.TagNumber(5)
  void clearProperty() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get onmicNum => $_getIZ(5);
  @$pb.TagNumber(6)
  set onmicNum($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasOnmicNum() => $_has(5);
  @$pb.TagNumber(6)
  void clearOnmicNum() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get role => $_getSZ(6);
  @$pb.TagNumber(7)
  set role($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRole() => $_has(6);
  @$pb.TagNumber(7)
  void clearRole() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get label => $_getSZ(7);
  @$pb.TagNumber(8)
  set label($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLabel() => $_has(7);
  @$pb.TagNumber(8)
  void clearLabel() => clearField(8);
}

class RoomCardProfileGift extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileGift',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
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
            : 'sum',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomCardProfileGift._() : super();
  factory RoomCardProfileGift({
    $core.int? gid,
    $core.int? num,
    $core.String? name,
    $core.int? sum,
  }) {
    final _result = create();
    if (gid != null) {
      _result.gid = gid;
    }
    if (num != null) {
      _result.num = num;
    }
    if (name != null) {
      _result.name = name;
    }
    if (sum != null) {
      _result.sum = sum;
    }
    return _result;
  }
  factory RoomCardProfileGift.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileGift.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileGift clone() => RoomCardProfileGift()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileGift copyWith(void Function(RoomCardProfileGift) updates) =>
      super.copyWith((message) => updates(message as RoomCardProfileGift))
          as RoomCardProfileGift; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileGift create() => RoomCardProfileGift._();
  RoomCardProfileGift createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileGift> createRepeated() =>
      $pb.PbList<RoomCardProfileGift>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileGift getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileGift>(create);
  static RoomCardProfileGift? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get gid => $_getIZ(0);
  @$pb.TagNumber(1)
  set gid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGid() => $_has(0);
  @$pb.TagNumber(1)
  void clearGid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get num => $_getIZ(1);
  @$pb.TagNumber(2)
  set num($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNum() => $_has(1);
  @$pb.TagNumber(2)
  void clearNum() => clearField(2);

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
  $core.int get sum => $_getIZ(3);
  @$pb.TagNumber(4)
  set sum($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSum() => $_has(3);
  @$pb.TagNumber(4)
  void clearSum() => clearField(4);
}

class RoomCardProfileGod extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileGod',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godCategory')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'servicePause',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serviceBusy',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'creditGodLevel',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RoomCardProfileGod._() : super();
  factory RoomCardProfileGod({
    $core.int? godNum,
    $core.String? godCategory,
    $core.int? servicePause,
    $core.int? serviceBusy,
    $core.int? creditGodLevel,
  }) {
    final _result = create();
    if (godNum != null) {
      _result.godNum = godNum;
    }
    if (godCategory != null) {
      _result.godCategory = godCategory;
    }
    if (servicePause != null) {
      _result.servicePause = servicePause;
    }
    if (serviceBusy != null) {
      _result.serviceBusy = serviceBusy;
    }
    if (creditGodLevel != null) {
      _result.creditGodLevel = creditGodLevel;
    }
    return _result;
  }
  factory RoomCardProfileGod.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileGod.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileGod clone() => RoomCardProfileGod()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileGod copyWith(void Function(RoomCardProfileGod) updates) =>
      super.copyWith((message) => updates(message as RoomCardProfileGod))
          as RoomCardProfileGod; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileGod create() => RoomCardProfileGod._();
  RoomCardProfileGod createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileGod> createRepeated() =>
      $pb.PbList<RoomCardProfileGod>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileGod getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileGod>(create);
  static RoomCardProfileGod? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get godNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set godNum($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGodNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearGodNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get godCategory => $_getSZ(1);
  @$pb.TagNumber(2)
  set godCategory($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGodCategory() => $_has(1);
  @$pb.TagNumber(2)
  void clearGodCategory() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get servicePause => $_getIZ(2);
  @$pb.TagNumber(3)
  set servicePause($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasServicePause() => $_has(2);
  @$pb.TagNumber(3)
  void clearServicePause() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get serviceBusy => $_getIZ(3);
  @$pb.TagNumber(4)
  set serviceBusy($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasServiceBusy() => $_has(3);
  @$pb.TagNumber(4)
  void clearServiceBusy() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get creditGodLevel => $_getIZ(4);
  @$pb.TagNumber(5)
  set creditGodLevel($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCreditGodLevel() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreditGodLevel() => clearField(5);
}

class RoomCardProfileFleet extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileFleet',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gid',
        $pb.PbFieldType.O3)
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
            : 'total',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'creator',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'in',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RoomCardProfileFleet._() : super();
  factory RoomCardProfileFleet({
    $core.int? gid,
    $core.String? name,
    $core.String? icon,
    $core.int? total,
    $core.int? creator,
    $core.int? in_6,
  }) {
    final _result = create();
    if (gid != null) {
      _result.gid = gid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (total != null) {
      _result.total = total;
    }
    if (creator != null) {
      _result.creator = creator;
    }
    if (in_6 != null) {
      _result.in_6 = in_6;
    }
    return _result;
  }
  factory RoomCardProfileFleet.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileFleet.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileFleet clone() =>
      RoomCardProfileFleet()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileFleet copyWith(void Function(RoomCardProfileFleet) updates) =>
      super.copyWith((message) => updates(message as RoomCardProfileFleet))
          as RoomCardProfileFleet; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileFleet create() => RoomCardProfileFleet._();
  RoomCardProfileFleet createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileFleet> createRepeated() =>
      $pb.PbList<RoomCardProfileFleet>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileFleet getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileFleet>(create);
  static RoomCardProfileFleet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get gid => $_getIZ(0);
  @$pb.TagNumber(1)
  set gid($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGid() => $_has(0);
  @$pb.TagNumber(1)
  void clearGid() => clearField(1);

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
  $core.int get total => $_getIZ(3);
  @$pb.TagNumber(4)
  set total($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTotal() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotal() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get creator => $_getIZ(4);
  @$pb.TagNumber(5)
  set creator($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCreator() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreator() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get in_6 => $_getIZ(5);
  @$pb.TagNumber(6)
  set in_6($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIn_6() => $_has(5);
  @$pb.TagNumber(6)
  void clearIn_6() => clearField(6);
}

class RoomCardProfileCard extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileCard',
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
        $pb.PbFieldType.O3)
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
            : 'desc')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audio')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hometownCity')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hometownCityCode',
        $pb.PbFieldType.O3)
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'likedNum',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RoomCardProfileCard._() : super();
  factory RoomCardProfileCard({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? desc,
    $core.String? audio,
    $core.String? hometownCity,
    $core.int? hometownCityCode,
    $core.String? duration,
    $core.int? age,
    $core.int? likedNum,
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
    if (desc != null) {
      _result.desc = desc;
    }
    if (audio != null) {
      _result.audio = audio;
    }
    if (hometownCity != null) {
      _result.hometownCity = hometownCity;
    }
    if (hometownCityCode != null) {
      _result.hometownCityCode = hometownCityCode;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (age != null) {
      _result.age = age;
    }
    if (likedNum != null) {
      _result.likedNum = likedNum;
    }
    return _result;
  }
  factory RoomCardProfileCard.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileCard.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileCard clone() => RoomCardProfileCard()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileCard copyWith(void Function(RoomCardProfileCard) updates) =>
      super.copyWith((message) => updates(message as RoomCardProfileCard))
          as RoomCardProfileCard; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileCard create() => RoomCardProfileCard._();
  RoomCardProfileCard createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileCard> createRepeated() =>
      $pb.PbList<RoomCardProfileCard>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileCard>(create);
  static RoomCardProfileCard? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setSignedInt32(0, v);
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
  $core.String get audio => $_getSZ(4);
  @$pb.TagNumber(5)
  set audio($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAudio() => $_has(4);
  @$pb.TagNumber(5)
  void clearAudio() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get hometownCity => $_getSZ(5);
  @$pb.TagNumber(6)
  set hometownCity($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasHometownCity() => $_has(5);
  @$pb.TagNumber(6)
  void clearHometownCity() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get hometownCityCode => $_getIZ(6);
  @$pb.TagNumber(7)
  set hometownCityCode($core.int v) {
    $_setSignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasHometownCityCode() => $_has(6);
  @$pb.TagNumber(7)
  void clearHometownCityCode() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get duration => $_getSZ(7);
  @$pb.TagNumber(8)
  set duration($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDuration() => $_has(7);
  @$pb.TagNumber(8)
  void clearDuration() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get age => $_getIZ(8);
  @$pb.TagNumber(9)
  set age($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasAge() => $_has(8);
  @$pb.TagNumber(9)
  void clearAge() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get likedNum => $_getIZ(9);
  @$pb.TagNumber(10)
  set likedNum($core.int v) {
    $_setSignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasLikedNum() => $_has(9);
  @$pb.TagNumber(10)
  void clearLikedNum() => clearField(10);
}

class RoomCardProfileDefend extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileDefend',
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
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defendValue',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'expire',
        $pb.PbFieldType.O3)
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'borderIndex',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RoomCardProfileDefend._() : super();
  factory RoomCardProfileDefend({
    $core.int? uid,
    $core.String? title,
    $core.int? defendValue,
    $core.int? position,
    $core.int? expire,
    $core.String? name,
    $core.String? icon,
    $core.int? borderIndex,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (title != null) {
      _result.title = title;
    }
    if (defendValue != null) {
      _result.defendValue = defendValue;
    }
    if (position != null) {
      _result.position = position;
    }
    if (expire != null) {
      _result.expire = expire;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (borderIndex != null) {
      _result.borderIndex = borderIndex;
    }
    return _result;
  }
  factory RoomCardProfileDefend.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileDefend.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileDefend clone() =>
      RoomCardProfileDefend()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileDefend copyWith(
          void Function(RoomCardProfileDefend) updates) =>
      super.copyWith((message) => updates(message as RoomCardProfileDefend))
          as RoomCardProfileDefend; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileDefend create() => RoomCardProfileDefend._();
  RoomCardProfileDefend createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileDefend> createRepeated() =>
      $pb.PbList<RoomCardProfileDefend>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileDefend getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileDefend>(create);
  static RoomCardProfileDefend? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get uid => $_getIZ(0);
  @$pb.TagNumber(1)
  set uid($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get defendValue => $_getIZ(2);
  @$pb.TagNumber(3)
  set defendValue($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDefendValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearDefendValue() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get position => $_getIZ(3);
  @$pb.TagNumber(4)
  set position($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasPosition() => $_has(3);
  @$pb.TagNumber(4)
  void clearPosition() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get expire => $_getIZ(4);
  @$pb.TagNumber(5)
  set expire($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasExpire() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpire() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get icon => $_getSZ(6);
  @$pb.TagNumber(7)
  set icon($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearIcon() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get borderIndex => $_getIZ(7);
  @$pb.TagNumber(8)
  set borderIndex($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasBorderIndex() => $_has(7);
  @$pb.TagNumber(8)
  void clearBorderIndex() => clearField(8);
}

class RoomCardProfileUnion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileUnion',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'unId',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createUid',
        $pb.PbFieldType.O3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'logo')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userTitle')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleName')
    ..hasRequiredFields = false;

  RoomCardProfileUnion._() : super();
  factory RoomCardProfileUnion({
    $core.int? unId,
    $core.String? name,
    $core.int? createUid,
    $core.String? logo,
    $core.String? userTitle,
    $core.String? titleName,
  }) {
    final _result = create();
    if (unId != null) {
      _result.unId = unId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (createUid != null) {
      _result.createUid = createUid;
    }
    if (logo != null) {
      _result.logo = logo;
    }
    if (userTitle != null) {
      _result.userTitle = userTitle;
    }
    if (titleName != null) {
      _result.titleName = titleName;
    }
    return _result;
  }
  factory RoomCardProfileUnion.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileUnion.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileUnion clone() =>
      RoomCardProfileUnion()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileUnion copyWith(void Function(RoomCardProfileUnion) updates) =>
      super.copyWith((message) => updates(message as RoomCardProfileUnion))
          as RoomCardProfileUnion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileUnion create() => RoomCardProfileUnion._();
  RoomCardProfileUnion createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileUnion> createRepeated() =>
      $pb.PbList<RoomCardProfileUnion>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileUnion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileUnion>(create);
  static RoomCardProfileUnion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get unId => $_getIZ(0);
  @$pb.TagNumber(1)
  set unId($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUnId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnId() => clearField(1);

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
  $core.int get createUid => $_getIZ(2);
  @$pb.TagNumber(3)
  set createUid($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCreateUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreateUid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get logo => $_getSZ(3);
  @$pb.TagNumber(4)
  set logo($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLogo() => $_has(3);
  @$pb.TagNumber(4)
  void clearLogo() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get userTitle => $_getSZ(4);
  @$pb.TagNumber(5)
  set userTitle($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasUserTitle() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserTitle() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get titleName => $_getSZ(5);
  @$pb.TagNumber(6)
  set titleName($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTitleName() => $_has(5);
  @$pb.TagNumber(6)
  void clearTitleName() => clearField(6);
}

class RoomCardProfilePartyGroup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfilePartyGroup',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'groupId',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cover')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'memberNum')
    ..aOB(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'official')
    ..hasRequiredFields = false;

  RoomCardProfilePartyGroup._() : super();
  factory RoomCardProfilePartyGroup({
    $core.int? groupId,
    $core.String? name,
    $core.String? cover,
    $core.String? memberNum,
    $core.bool? official,
  }) {
    final _result = create();
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (cover != null) {
      _result.cover = cover;
    }
    if (memberNum != null) {
      _result.memberNum = memberNum;
    }
    if (official != null) {
      _result.official = official;
    }
    return _result;
  }
  factory RoomCardProfilePartyGroup.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfilePartyGroup.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfilePartyGroup clone() =>
      RoomCardProfilePartyGroup()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfilePartyGroup copyWith(
          void Function(RoomCardProfilePartyGroup) updates) =>
      super.copyWith((message) => updates(message as RoomCardProfilePartyGroup))
          as RoomCardProfilePartyGroup; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfilePartyGroup create() => RoomCardProfilePartyGroup._();
  RoomCardProfilePartyGroup createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfilePartyGroup> createRepeated() =>
      $pb.PbList<RoomCardProfilePartyGroup>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfilePartyGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfilePartyGroup>(create);
  static RoomCardProfilePartyGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get groupId => $_getIZ(0);
  @$pb.TagNumber(1)
  set groupId($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupId() => clearField(1);

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
  $core.String get cover => $_getSZ(2);
  @$pb.TagNumber(3)
  set cover($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCover() => $_has(2);
  @$pb.TagNumber(3)
  void clearCover() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get memberNum => $_getSZ(3);
  @$pb.TagNumber(4)
  set memberNum($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMemberNum() => $_has(3);
  @$pb.TagNumber(4)
  void clearMemberNum() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get official => $_getBF(4);
  @$pb.TagNumber(5)
  set official($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasOfficial() => $_has(4);
  @$pb.TagNumber(5)
  void clearOfficial() => clearField(5);
}

class RoomCardProfileBussinessCard extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileBussinessCard',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'banner')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'header')
    ..hasRequiredFields = false;

  RoomCardProfileBussinessCard._() : super();
  factory RoomCardProfileBussinessCard({
    $core.String? banner,
    $core.String? header,
  }) {
    final _result = create();
    if (banner != null) {
      _result.banner = banner;
    }
    if (header != null) {
      _result.header = header;
    }
    return _result;
  }
  factory RoomCardProfileBussinessCard.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileBussinessCard.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileBussinessCard clone() =>
      RoomCardProfileBussinessCard()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileBussinessCard copyWith(
          void Function(RoomCardProfileBussinessCard) updates) =>
      super.copyWith(
              (message) => updates(message as RoomCardProfileBussinessCard))
          as RoomCardProfileBussinessCard; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileBussinessCard create() =>
      RoomCardProfileBussinessCard._();
  RoomCardProfileBussinessCard createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileBussinessCard> createRepeated() =>
      $pb.PbList<RoomCardProfileBussinessCard>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileBussinessCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileBussinessCard>(create);
  static RoomCardProfileBussinessCard? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get banner => $_getSZ(0);
  @$pb.TagNumber(1)
  set banner($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBanner() => $_has(0);
  @$pb.TagNumber(1)
  void clearBanner() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get header => $_getSZ(1);
  @$pb.TagNumber(2)
  set header($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHeader() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeader() => clearField(2);
}

class RoomCardProfileInterest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileInterest',
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
    ..hasRequiredFields = false;

  RoomCardProfileInterest._() : super();
  factory RoomCardProfileInterest({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory RoomCardProfileInterest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileInterest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileInterest clone() =>
      RoomCardProfileInterest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileInterest copyWith(
          void Function(RoomCardProfileInterest) updates) =>
      super.copyWith((message) => updates(message as RoomCardProfileInterest))
          as RoomCardProfileInterest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileInterest create() => RoomCardProfileInterest._();
  RoomCardProfileInterest createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileInterest> createRepeated() =>
      $pb.PbList<RoomCardProfileInterest>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileInterest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileInterest>(create);
  static RoomCardProfileInterest? _defaultInstance;

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
}

class RoomCardProfileGlist extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileGlist',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  RoomCardProfileGlist._() : super();
  factory RoomCardProfileGlist({
    $core.String? id,
    $core.String? name,
    $core.String? price,
    $core.String? icon,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (price != null) {
      _result.price = price;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory RoomCardProfileGlist.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileGlist.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileGlist clone() =>
      RoomCardProfileGlist()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileGlist copyWith(void Function(RoomCardProfileGlist) updates) =>
      super.copyWith((message) => updates(message as RoomCardProfileGlist))
          as RoomCardProfileGlist; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileGlist create() => RoomCardProfileGlist._();
  RoomCardProfileGlist createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileGlist> createRepeated() =>
      $pb.PbList<RoomCardProfileGlist>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileGlist getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileGlist>(create);
  static RoomCardProfileGlist? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

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
  $core.String get price => $_getSZ(2);
  @$pb.TagNumber(3)
  set price($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => clearField(3);

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
}

class RoomCardProfileRookieTag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileRookieTag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sevenNew',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payLevel',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RoomCardProfileRookieTag._() : super();
  factory RoomCardProfileRookieTag({
    $core.int? sevenNew,
    $core.int? payLevel,
  }) {
    final _result = create();
    if (sevenNew != null) {
      _result.sevenNew = sevenNew;
    }
    if (payLevel != null) {
      _result.payLevel = payLevel;
    }
    return _result;
  }
  factory RoomCardProfileRookieTag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileRookieTag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileRookieTag clone() =>
      RoomCardProfileRookieTag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileRookieTag copyWith(
          void Function(RoomCardProfileRookieTag) updates) =>
      super.copyWith((message) => updates(message as RoomCardProfileRookieTag))
          as RoomCardProfileRookieTag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileRookieTag create() => RoomCardProfileRookieTag._();
  RoomCardProfileRookieTag createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileRookieTag> createRepeated() =>
      $pb.PbList<RoomCardProfileRookieTag>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileRookieTag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileRookieTag>(create);
  static RoomCardProfileRookieTag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get sevenNew => $_getIZ(0);
  @$pb.TagNumber(1)
  set sevenNew($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSevenNew() => $_has(0);
  @$pb.TagNumber(1)
  void clearSevenNew() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get payLevel => $_getIZ(1);
  @$pb.TagNumber(2)
  set payLevel($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPayLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayLevel() => clearField(2);
}

class RoomCardProfileSkillPrice extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileSkillPrice',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uint')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cheap',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  RoomCardProfileSkillPrice._() : super();
  factory RoomCardProfileSkillPrice({
    $core.String? uint,
    $core.int? price,
    $core.int? cheap,
  }) {
    final _result = create();
    if (uint != null) {
      _result.uint = uint;
    }
    if (price != null) {
      _result.price = price;
    }
    if (cheap != null) {
      _result.cheap = cheap;
    }
    return _result;
  }
  factory RoomCardProfileSkillPrice.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileSkillPrice.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileSkillPrice clone() =>
      RoomCardProfileSkillPrice()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileSkillPrice copyWith(
          void Function(RoomCardProfileSkillPrice) updates) =>
      super.copyWith((message) => updates(message as RoomCardProfileSkillPrice))
          as RoomCardProfileSkillPrice; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileSkillPrice create() => RoomCardProfileSkillPrice._();
  RoomCardProfileSkillPrice createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileSkillPrice> createRepeated() =>
      $pb.PbList<RoomCardProfileSkillPrice>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileSkillPrice getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileSkillPrice>(create);
  static RoomCardProfileSkillPrice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uint => $_getSZ(0);
  @$pb.TagNumber(1)
  set uint($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUint() => $_has(0);
  @$pb.TagNumber(1)
  void clearUint() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get price => $_getIZ(1);
  @$pb.TagNumber(2)
  set price($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get cheap => $_getIZ(2);
  @$pb.TagNumber(3)
  set cheap($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCheap() => $_has(2);
  @$pb.TagNumber(3)
  void clearCheap() => clearField(3);
}

class RoomCardProfileSkill extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileSkill',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.O3)
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
            : 'Level')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'num',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isDefault',
        $pb.PbFieldType.O3)
    ..pc<RoomCardProfileSkillPrice>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'price',
        $pb.PbFieldType.PM,
        subBuilder: RoomCardProfileSkillPrice.create)
    ..pPS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userGodTagList')
    ..hasRequiredFields = false;

  RoomCardProfileSkill._() : super();
  factory RoomCardProfileSkill({
    $core.int? cid,
    $core.String? name,
    $core.String? icon,
    $core.String? level,
    $core.int? num,
    $core.int? isDefault,
    $core.Iterable<RoomCardProfileSkillPrice>? price,
    $core.Iterable<$core.String>? userGodTagList,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (level != null) {
      _result.level = level;
    }
    if (num != null) {
      _result.num = num;
    }
    if (isDefault != null) {
      _result.isDefault = isDefault;
    }
    if (price != null) {
      _result.price.addAll(price);
    }
    if (userGodTagList != null) {
      _result.userGodTagList.addAll(userGodTagList);
    }
    return _result;
  }
  factory RoomCardProfileSkill.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileSkill.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileSkill clone() =>
      RoomCardProfileSkill()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileSkill copyWith(void Function(RoomCardProfileSkill) updates) =>
      super.copyWith((message) => updates(message as RoomCardProfileSkill))
          as RoomCardProfileSkill; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileSkill create() => RoomCardProfileSkill._();
  RoomCardProfileSkill createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileSkill> createRepeated() =>
      $pb.PbList<RoomCardProfileSkill>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileSkill getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileSkill>(create);
  static RoomCardProfileSkill? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cid => $_getIZ(0);
  @$pb.TagNumber(1)
  set cid($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

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
  $core.String get level => $_getSZ(3);
  @$pb.TagNumber(4)
  set level($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearLevel() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get num => $_getIZ(4);
  @$pb.TagNumber(5)
  set num($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNum() => $_has(4);
  @$pb.TagNumber(5)
  void clearNum() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get isDefault => $_getIZ(5);
  @$pb.TagNumber(6)
  set isDefault($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIsDefault() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsDefault() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<RoomCardProfileSkillPrice> get price => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$core.String> get userGodTagList => $_getList(7);
}

class RoomCardProfileGame extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileGame',
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
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gameId',
        protoName: 'gameId')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gameZone',
        protoName: 'gameZone')
    ..hasRequiredFields = false;

  RoomCardProfileGame._() : super();
  factory RoomCardProfileGame({
    $core.String? type,
    $core.String? gameId,
    $core.String? gameZone,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (gameId != null) {
      _result.gameId = gameId;
    }
    if (gameZone != null) {
      _result.gameZone = gameZone;
    }
    return _result;
  }
  factory RoomCardProfileGame.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileGame.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileGame clone() => RoomCardProfileGame()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileGame copyWith(void Function(RoomCardProfileGame) updates) =>
      super.copyWith((message) => updates(message as RoomCardProfileGame))
          as RoomCardProfileGame; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileGame create() => RoomCardProfileGame._();
  RoomCardProfileGame createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileGame> createRepeated() =>
      $pb.PbList<RoomCardProfileGame>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileGame getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileGame>(create);
  static RoomCardProfileGame? _defaultInstance;

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
  $core.String get gameId => $_getSZ(1);
  @$pb.TagNumber(2)
  set gameId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGameId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGameId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get gameZone => $_getSZ(2);
  @$pb.TagNumber(3)
  set gameZone($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGameZone() => $_has(2);
  @$pb.TagNumber(3)
  void clearGameZone() => clearField(3);
}

class RoomCardProfileAccompanyInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileAccompanyInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'degree',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'staySecs',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomCardProfileAccompanyInfo._() : super();
  factory RoomCardProfileAccompanyInfo({
    $core.int? degree,
    $core.int? staySecs,
  }) {
    final _result = create();
    if (degree != null) {
      _result.degree = degree;
    }
    if (staySecs != null) {
      _result.staySecs = staySecs;
    }
    return _result;
  }
  factory RoomCardProfileAccompanyInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileAccompanyInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileAccompanyInfo clone() =>
      RoomCardProfileAccompanyInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileAccompanyInfo copyWith(
          void Function(RoomCardProfileAccompanyInfo) updates) =>
      super.copyWith(
              (message) => updates(message as RoomCardProfileAccompanyInfo))
          as RoomCardProfileAccompanyInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileAccompanyInfo create() =>
      RoomCardProfileAccompanyInfo._();
  RoomCardProfileAccompanyInfo createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileAccompanyInfo> createRepeated() =>
      $pb.PbList<RoomCardProfileAccompanyInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileAccompanyInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileAccompanyInfo>(create);
  static RoomCardProfileAccompanyInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get degree => $_getIZ(0);
  @$pb.TagNumber(1)
  set degree($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDegree() => $_has(0);
  @$pb.TagNumber(1)
  void clearDegree() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get staySecs => $_getIZ(1);
  @$pb.TagNumber(2)
  set staySecs($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStaySecs() => $_has(1);
  @$pb.TagNumber(2)
  void clearStaySecs() => clearField(2);
}

class RoomCardProfileMarrySingleInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileMarrySingleInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cName',
        protoName: 'cName')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'img')
    ..hasRequiredFields = false;

  RoomCardProfileMarrySingleInfo._() : super();
  factory RoomCardProfileMarrySingleInfo({
    $core.String? mid,
    $core.String? cid,
    $core.String? cName,
    $core.String? img,
  }) {
    final _result = create();
    if (mid != null) {
      _result.mid = mid;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (cName != null) {
      _result.cName = cName;
    }
    if (img != null) {
      _result.img = img;
    }
    return _result;
  }
  factory RoomCardProfileMarrySingleInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileMarrySingleInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileMarrySingleInfo clone() =>
      RoomCardProfileMarrySingleInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileMarrySingleInfo copyWith(
          void Function(RoomCardProfileMarrySingleInfo) updates) =>
      super.copyWith(
              (message) => updates(message as RoomCardProfileMarrySingleInfo))
          as RoomCardProfileMarrySingleInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileMarrySingleInfo create() =>
      RoomCardProfileMarrySingleInfo._();
  RoomCardProfileMarrySingleInfo createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileMarrySingleInfo> createRepeated() =>
      $pb.PbList<RoomCardProfileMarrySingleInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileMarrySingleInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileMarrySingleInfo>(create);
  static RoomCardProfileMarrySingleInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mid => $_getSZ(0);
  @$pb.TagNumber(1)
  set mid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMid() => $_has(0);
  @$pb.TagNumber(1)
  void clearMid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cid => $_getSZ(1);
  @$pb.TagNumber(2)
  set cid($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cName => $_getSZ(2);
  @$pb.TagNumber(3)
  set cName($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCName() => $_has(2);
  @$pb.TagNumber(3)
  void clearCName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get img => $_getSZ(3);
  @$pb.TagNumber(4)
  set img($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasImg() => $_has(3);
  @$pb.TagNumber(4)
  void clearImg() => clearField(4);
}

class RoomCardProfileMarryRelationInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileMarryRelationInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'img')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'degree',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomCardProfileMarryRelationInfo._() : super();
  factory RoomCardProfileMarryRelationInfo({
    $core.String? mid,
    $core.String? cid,
    $core.String? img,
    $core.int? degree,
  }) {
    final _result = create();
    if (mid != null) {
      _result.mid = mid;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (img != null) {
      _result.img = img;
    }
    if (degree != null) {
      _result.degree = degree;
    }
    return _result;
  }
  factory RoomCardProfileMarryRelationInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileMarryRelationInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileMarryRelationInfo clone() =>
      RoomCardProfileMarryRelationInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileMarryRelationInfo copyWith(
          void Function(RoomCardProfileMarryRelationInfo) updates) =>
      super.copyWith(
              (message) => updates(message as RoomCardProfileMarryRelationInfo))
          as RoomCardProfileMarryRelationInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileMarryRelationInfo create() =>
      RoomCardProfileMarryRelationInfo._();
  RoomCardProfileMarryRelationInfo createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileMarryRelationInfo> createRepeated() =>
      $pb.PbList<RoomCardProfileMarryRelationInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileMarryRelationInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileMarryRelationInfo>(
          create);
  static RoomCardProfileMarryRelationInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mid => $_getSZ(0);
  @$pb.TagNumber(1)
  set mid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMid() => $_has(0);
  @$pb.TagNumber(1)
  void clearMid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cid => $_getSZ(1);
  @$pb.TagNumber(2)
  set cid($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCid() => $_has(1);
  @$pb.TagNumber(2)
  void clearCid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get img => $_getSZ(2);
  @$pb.TagNumber(3)
  set img($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImg() => $_has(2);
  @$pb.TagNumber(3)
  void clearImg() => clearField(3);

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
}

class RoomCardProfileMarryInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileMarryInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<RoomCardProfileMarrySingleInfo>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'single',
        subBuilder: RoomCardProfileMarrySingleInfo.create)
    ..aOM<RoomCardProfileMarryRelationInfo>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'relation',
        subBuilder: RoomCardProfileMarryRelationInfo.create)
    ..hasRequiredFields = false;

  RoomCardProfileMarryInfo._() : super();
  factory RoomCardProfileMarryInfo({
    RoomCardProfileMarrySingleInfo? single,
    RoomCardProfileMarryRelationInfo? relation,
  }) {
    final _result = create();
    if (single != null) {
      _result.single = single;
    }
    if (relation != null) {
      _result.relation = relation;
    }
    return _result;
  }
  factory RoomCardProfileMarryInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileMarryInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileMarryInfo clone() =>
      RoomCardProfileMarryInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileMarryInfo copyWith(
          void Function(RoomCardProfileMarryInfo) updates) =>
      super.copyWith((message) => updates(message as RoomCardProfileMarryInfo))
          as RoomCardProfileMarryInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileMarryInfo create() => RoomCardProfileMarryInfo._();
  RoomCardProfileMarryInfo createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileMarryInfo> createRepeated() =>
      $pb.PbList<RoomCardProfileMarryInfo>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileMarryInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileMarryInfo>(create);
  static RoomCardProfileMarryInfo? _defaultInstance;

  @$pb.TagNumber(1)
  RoomCardProfileMarrySingleInfo get single => $_getN(0);
  @$pb.TagNumber(1)
  set single(RoomCardProfileMarrySingleInfo v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSingle() => $_has(0);
  @$pb.TagNumber(1)
  void clearSingle() => clearField(1);
  @$pb.TagNumber(1)
  RoomCardProfileMarrySingleInfo ensureSingle() => $_ensure(0);

  @$pb.TagNumber(2)
  RoomCardProfileMarryRelationInfo get relation => $_getN(1);
  @$pb.TagNumber(2)
  set relation(RoomCardProfileMarryRelationInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRelation() => $_has(1);
  @$pb.TagNumber(2)
  void clearRelation() => clearField(2);
  @$pb.TagNumber(2)
  RoomCardProfileMarryRelationInfo ensureRelation() => $_ensure(1);
}

class RoomCardProfileGameHistory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileGameHistory',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'populace',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'under',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'total',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'thumbsUp',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wolfWin',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'goodWin',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'level',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'juCount',
        $pb.PbFieldType.OU3)
    ..a<$core.double>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'winRate',
        $pb.PbFieldType.OF)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'round',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'champion',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  RoomCardProfileGameHistory._() : super();
  factory RoomCardProfileGameHistory({
    $core.int? populace,
    $core.int? under,
    $core.int? total,
    $core.int? score,
    $core.int? thumbsUp,
    $core.int? wolfWin,
    $core.int? goodWin,
    $core.int? level,
    $core.int? juCount,
    $core.double? winRate,
    $core.int? round,
    $core.int? champion,
  }) {
    final _result = create();
    if (populace != null) {
      _result.populace = populace;
    }
    if (under != null) {
      _result.under = under;
    }
    if (total != null) {
      _result.total = total;
    }
    if (score != null) {
      _result.score = score;
    }
    if (thumbsUp != null) {
      _result.thumbsUp = thumbsUp;
    }
    if (wolfWin != null) {
      _result.wolfWin = wolfWin;
    }
    if (goodWin != null) {
      _result.goodWin = goodWin;
    }
    if (level != null) {
      _result.level = level;
    }
    if (juCount != null) {
      _result.juCount = juCount;
    }
    if (winRate != null) {
      _result.winRate = winRate;
    }
    if (round != null) {
      _result.round = round;
    }
    if (champion != null) {
      _result.champion = champion;
    }
    return _result;
  }
  factory RoomCardProfileGameHistory.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileGameHistory.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileGameHistory clone() =>
      RoomCardProfileGameHistory()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileGameHistory copyWith(
          void Function(RoomCardProfileGameHistory) updates) =>
      super.copyWith(
              (message) => updates(message as RoomCardProfileGameHistory))
          as RoomCardProfileGameHistory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileGameHistory create() => RoomCardProfileGameHistory._();
  RoomCardProfileGameHistory createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileGameHistory> createRepeated() =>
      $pb.PbList<RoomCardProfileGameHistory>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileGameHistory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileGameHistory>(create);
  static RoomCardProfileGameHistory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get populace => $_getIZ(0);
  @$pb.TagNumber(1)
  set populace($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPopulace() => $_has(0);
  @$pb.TagNumber(1)
  void clearPopulace() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get under => $_getIZ(1);
  @$pb.TagNumber(2)
  set under($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUnder() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnder() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get total => $_getIZ(2);
  @$pb.TagNumber(3)
  set total($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTotal() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotal() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get score => $_getIZ(3);
  @$pb.TagNumber(4)
  set score($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearScore() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get thumbsUp => $_getIZ(4);
  @$pb.TagNumber(5)
  set thumbsUp($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasThumbsUp() => $_has(4);
  @$pb.TagNumber(5)
  void clearThumbsUp() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get wolfWin => $_getIZ(5);
  @$pb.TagNumber(6)
  set wolfWin($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasWolfWin() => $_has(5);
  @$pb.TagNumber(6)
  void clearWolfWin() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get goodWin => $_getIZ(6);
  @$pb.TagNumber(7)
  set goodWin($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasGoodWin() => $_has(6);
  @$pb.TagNumber(7)
  void clearGoodWin() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get level => $_getIZ(7);
  @$pb.TagNumber(8)
  set level($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLevel() => $_has(7);
  @$pb.TagNumber(8)
  void clearLevel() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get juCount => $_getIZ(8);
  @$pb.TagNumber(9)
  set juCount($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasJuCount() => $_has(8);
  @$pb.TagNumber(9)
  void clearJuCount() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get winRate => $_getN(9);
  @$pb.TagNumber(10)
  set winRate($core.double v) {
    $_setFloat(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasWinRate() => $_has(9);
  @$pb.TagNumber(10)
  void clearWinRate() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get round => $_getIZ(10);
  @$pb.TagNumber(11)
  set round($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasRound() => $_has(10);
  @$pb.TagNumber(11)
  void clearRound() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get champion => $_getIZ(11);
  @$pb.TagNumber(12)
  set champion($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasChampion() => $_has(11);
  @$pb.TagNumber(12)
  void clearChampion() => clearField(12);
}

class RoomCardProfileData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomCardProfileData',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOM<RoomCardProfileBase>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'base',
        subBuilder: RoomCardProfileBase.create)
    ..aOM<RoomCardProfileGod>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'god',
        subBuilder: RoomCardProfileGod.create)
    ..pc<RoomCardProfileGift>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gift',
        $pb.PbFieldType.PM,
        subBuilder: RoomCardProfileGift.create)
    ..aOM<RoomCardProfileFleet>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fleet',
        subBuilder: RoomCardProfileFleet.create)
    ..aOM<RoomCardProfileCard>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'card',
        subBuilder: RoomCardProfileCard.create)
    ..pc<RoomCardProfileDefend>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'defendList',
        $pb.PbFieldType.PM,
        subBuilder: RoomCardProfileDefend.create)
    ..aOM<RoomCardProfileUnion>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'union',
        subBuilder: RoomCardProfileUnion.create)
    ..pc<RoomCardProfilePartyGroup>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'partyGroup',
        $pb.PbFieldType.PM,
        subBuilder: RoomCardProfilePartyGroup.create)
    ..aOM<RoomCardProfileBussinessCard>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'businessCard',
        subBuilder: RoomCardProfileBussinessCard.create)
    ..pc<RoomCardProfileInterest>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'interest',
        $pb.PbFieldType.PM,
        subBuilder: RoomCardProfileInterest.create)
    ..pc<RoomCardProfileGlist>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'glist',
        $pb.PbFieldType.PM,
        subBuilder: RoomCardProfileGlist.create)
    ..aOM<RoomCardProfileRookieTag>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rookieTag',
        subBuilder: RoomCardProfileRookieTag.create)
    ..pc<RoomCardProfileSkill>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'skill',
        $pb.PbFieldType.PM,
        subBuilder: RoomCardProfileSkill.create)
    ..aOM<RoomCardProfileGame>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'game',
        subBuilder: RoomCardProfileGame.create)
    ..aOM<RoomCardProfileAccompanyInfo>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'accompany',
        subBuilder: RoomCardProfileAccompanyInfo.create)
    ..aOM<RoomCardProfileMarryInfo>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'marry',
        subBuilder: RoomCardProfileMarryInfo.create)
    ..aOM<RoomCardProfileGameHistory>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'gameHistory',
        subBuilder: RoomCardProfileGameHistory.create)
    ..hasRequiredFields = false;

  RoomCardProfileData._() : super();
  factory RoomCardProfileData({
    RoomCardProfileBase? base,
    RoomCardProfileGod? god,
    $core.Iterable<RoomCardProfileGift>? gift,
    RoomCardProfileFleet? fleet,
    RoomCardProfileCard? card,
    $core.Iterable<RoomCardProfileDefend>? defendList,
    RoomCardProfileUnion? union,
    $core.Iterable<RoomCardProfilePartyGroup>? partyGroup,
    RoomCardProfileBussinessCard? businessCard,
    $core.Iterable<RoomCardProfileInterest>? interest,
    $core.Iterable<RoomCardProfileGlist>? glist,
    RoomCardProfileRookieTag? rookieTag,
    $core.Iterable<RoomCardProfileSkill>? skill,
    RoomCardProfileGame? game,
    RoomCardProfileAccompanyInfo? accompany,
    RoomCardProfileMarryInfo? marry,
    RoomCardProfileGameHistory? gameHistory,
  }) {
    final _result = create();
    if (base != null) {
      _result.base = base;
    }
    if (god != null) {
      _result.god = god;
    }
    if (gift != null) {
      _result.gift.addAll(gift);
    }
    if (fleet != null) {
      _result.fleet = fleet;
    }
    if (card != null) {
      _result.card = card;
    }
    if (defendList != null) {
      _result.defendList.addAll(defendList);
    }
    if (union != null) {
      _result.union = union;
    }
    if (partyGroup != null) {
      _result.partyGroup.addAll(partyGroup);
    }
    if (businessCard != null) {
      _result.businessCard = businessCard;
    }
    if (interest != null) {
      _result.interest.addAll(interest);
    }
    if (glist != null) {
      _result.glist.addAll(glist);
    }
    if (rookieTag != null) {
      _result.rookieTag = rookieTag;
    }
    if (skill != null) {
      _result.skill.addAll(skill);
    }
    if (game != null) {
      _result.game = game;
    }
    if (accompany != null) {
      _result.accompany = accompany;
    }
    if (marry != null) {
      _result.marry = marry;
    }
    if (gameHistory != null) {
      _result.gameHistory = gameHistory;
    }
    return _result;
  }
  factory RoomCardProfileData.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomCardProfileData.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomCardProfileData clone() => RoomCardProfileData()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomCardProfileData copyWith(void Function(RoomCardProfileData) updates) =>
      super.copyWith((message) => updates(message as RoomCardProfileData))
          as RoomCardProfileData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileData create() => RoomCardProfileData._();
  RoomCardProfileData createEmptyInstance() => create();
  static $pb.PbList<RoomCardProfileData> createRepeated() =>
      $pb.PbList<RoomCardProfileData>();
  @$core.pragma('dart2js:noInline')
  static RoomCardProfileData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomCardProfileData>(create);
  static RoomCardProfileData? _defaultInstance;

  @$pb.TagNumber(1)
  RoomCardProfileBase get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(RoomCardProfileBase v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  RoomCardProfileBase ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  RoomCardProfileGod get god => $_getN(1);
  @$pb.TagNumber(2)
  set god(RoomCardProfileGod v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGod() => $_has(1);
  @$pb.TagNumber(2)
  void clearGod() => clearField(2);
  @$pb.TagNumber(2)
  RoomCardProfileGod ensureGod() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<RoomCardProfileGift> get gift => $_getList(2);

  @$pb.TagNumber(4)
  RoomCardProfileFleet get fleet => $_getN(3);
  @$pb.TagNumber(4)
  set fleet(RoomCardProfileFleet v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasFleet() => $_has(3);
  @$pb.TagNumber(4)
  void clearFleet() => clearField(4);
  @$pb.TagNumber(4)
  RoomCardProfileFleet ensureFleet() => $_ensure(3);

  @$pb.TagNumber(5)
  RoomCardProfileCard get card => $_getN(4);
  @$pb.TagNumber(5)
  set card(RoomCardProfileCard v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCard() => $_has(4);
  @$pb.TagNumber(5)
  void clearCard() => clearField(5);
  @$pb.TagNumber(5)
  RoomCardProfileCard ensureCard() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.List<RoomCardProfileDefend> get defendList => $_getList(5);

  @$pb.TagNumber(7)
  RoomCardProfileUnion get union => $_getN(6);
  @$pb.TagNumber(7)
  set union(RoomCardProfileUnion v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUnion() => $_has(6);
  @$pb.TagNumber(7)
  void clearUnion() => clearField(7);
  @$pb.TagNumber(7)
  RoomCardProfileUnion ensureUnion() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.List<RoomCardProfilePartyGroup> get partyGroup => $_getList(7);

  @$pb.TagNumber(9)
  RoomCardProfileBussinessCard get businessCard => $_getN(8);
  @$pb.TagNumber(9)
  set businessCard(RoomCardProfileBussinessCard v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasBusinessCard() => $_has(8);
  @$pb.TagNumber(9)
  void clearBusinessCard() => clearField(9);
  @$pb.TagNumber(9)
  RoomCardProfileBussinessCard ensureBusinessCard() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.List<RoomCardProfileInterest> get interest => $_getList(9);

  @$pb.TagNumber(11)
  $core.List<RoomCardProfileGlist> get glist => $_getList(10);

  @$pb.TagNumber(12)
  RoomCardProfileRookieTag get rookieTag => $_getN(11);
  @$pb.TagNumber(12)
  set rookieTag(RoomCardProfileRookieTag v) {
    setField(12, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasRookieTag() => $_has(11);
  @$pb.TagNumber(12)
  void clearRookieTag() => clearField(12);
  @$pb.TagNumber(12)
  RoomCardProfileRookieTag ensureRookieTag() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.List<RoomCardProfileSkill> get skill => $_getList(12);

  @$pb.TagNumber(14)
  RoomCardProfileGame get game => $_getN(13);
  @$pb.TagNumber(14)
  set game(RoomCardProfileGame v) {
    setField(14, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasGame() => $_has(13);
  @$pb.TagNumber(14)
  void clearGame() => clearField(14);
  @$pb.TagNumber(14)
  RoomCardProfileGame ensureGame() => $_ensure(13);

  @$pb.TagNumber(15)
  RoomCardProfileAccompanyInfo get accompany => $_getN(14);
  @$pb.TagNumber(15)
  set accompany(RoomCardProfileAccompanyInfo v) {
    setField(15, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasAccompany() => $_has(14);
  @$pb.TagNumber(15)
  void clearAccompany() => clearField(15);
  @$pb.TagNumber(15)
  RoomCardProfileAccompanyInfo ensureAccompany() => $_ensure(14);

  @$pb.TagNumber(16)
  RoomCardProfileMarryInfo get marry => $_getN(15);
  @$pb.TagNumber(16)
  set marry(RoomCardProfileMarryInfo v) {
    setField(16, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasMarry() => $_has(15);
  @$pb.TagNumber(16)
  void clearMarry() => clearField(16);
  @$pb.TagNumber(16)
  RoomCardProfileMarryInfo ensureMarry() => $_ensure(15);

  @$pb.TagNumber(17)
  RoomCardProfileGameHistory get gameHistory => $_getN(16);
  @$pb.TagNumber(17)
  set gameHistory(RoomCardProfileGameHistory v) {
    setField(17, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasGameHistory() => $_has(16);
  @$pb.TagNumber(17)
  void clearGameHistory() => clearField(17);
  @$pb.TagNumber(17)
  RoomCardProfileGameHistory ensureGameHistory() => $_ensure(16);
}

class ResRoomCardProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResRoomCardProfile',
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
    ..aOM<RoomCardProfileData>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: RoomCardProfileData.create)
    ..hasRequiredFields = false;

  ResRoomCardProfile._() : super();
  factory ResRoomCardProfile({
    $core.bool? success,
    $core.String? msg,
    RoomCardProfileData? data,
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
  factory ResRoomCardProfile.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResRoomCardProfile.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResRoomCardProfile clone() => ResRoomCardProfile()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResRoomCardProfile copyWith(void Function(ResRoomCardProfile) updates) =>
      super.copyWith((message) => updates(message as ResRoomCardProfile))
          as ResRoomCardProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResRoomCardProfile create() => ResRoomCardProfile._();
  ResRoomCardProfile createEmptyInstance() => create();
  static $pb.PbList<ResRoomCardProfile> createRepeated() =>
      $pb.PbList<ResRoomCardProfile>();
  @$core.pragma('dart2js:noInline')
  static ResRoomCardProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResRoomCardProfile>(create);
  static ResRoomCardProfile? _defaultInstance;

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
  RoomCardProfileData get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(RoomCardProfileData v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  RoomCardProfileData ensureData() => $_ensure(2);
}
