///
//  Generated code. Do not modify.
//  source: joint_search.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class JointSearchItemType extends $pb.ProtobufEnum {
  static const JointSearchItemType ItemTypeInvalid = JointSearchItemType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ItemTypeInvalid');
  static const JointSearchItemType ItemTypeUser = JointSearchItemType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ItemTypeUser');
  static const JointSearchItemType ItemTypeFleet = JointSearchItemType._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ItemTypeFleet');
  static const JointSearchItemType ItemTypeUnion = JointSearchItemType._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ItemTypeUnion');
  static const JointSearchItemType ItemTypeGroup = JointSearchItemType._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ItemTypeGroup');
  static const JointSearchItemType ItemTypeBag = JointSearchItemType._(
      5,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ItemTypeBag');
  static const JointSearchItemType ItemTypeRoom = JointSearchItemType._(
      6,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ItemTypeRoom');
  static const JointSearchItemType ItemTypeTour = JointSearchItemType._(
      7,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ItemTypeTour');
  static const JointSearchItemType ItemTypeEgg = JointSearchItemType._(
      8,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ItemTypeEgg');
  static const JointSearchItemType ItemTypeMusic = JointSearchItemType._(
      9,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ItemTypeMusic');
  static const JointSearchItemType ItemTypeWork = JointSearchItemType._(
      10,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ItemTypeWork');
  static const JointSearchItemType ItemTypeKolRoom = JointSearchItemType._(
      11,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ItemTypeKolRoom');
  static const JointSearchItemType ItemTypeKolBanner = JointSearchItemType._(
      12,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ItemTypeKolBanner');
  static const JointSearchItemType ItemTypeSingerClub = JointSearchItemType._(
      13,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ItemTypeSingerClub');
  static const JointSearchItemType ItemTypeStarship = JointSearchItemType._(
      14,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ItemTypeStarship');

  static const $core.List<JointSearchItemType> values = <JointSearchItemType>[
    ItemTypeInvalid,
    ItemTypeUser,
    ItemTypeFleet,
    ItemTypeUnion,
    ItemTypeGroup,
    ItemTypeBag,
    ItemTypeRoom,
    ItemTypeTour,
    ItemTypeEgg,
    ItemTypeMusic,
    ItemTypeWork,
    ItemTypeKolRoom,
    ItemTypeKolBanner,
    ItemTypeSingerClub,
    ItemTypeStarship,
  ];

  static final $core.Map<$core.int, JointSearchItemType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static JointSearchItemType? valueOf($core.int value) => _byValue[value];

  const JointSearchItemType._($core.int v, $core.String n) : super(v, n);
}

class JointSearchFollowType extends $pb.ProtobufEnum {
  static const JointSearchFollowType FollowTypeNotFollow =
      JointSearchFollowType._(
          0,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'FollowTypeNotFollow');
  static const JointSearchFollowType FollowTypeFollow = JointSearchFollowType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'FollowTypeFollow');
  static const JointSearchFollowType FollowTypeFriends =
      JointSearchFollowType._(
          2,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'FollowTypeFriends');

  static const $core.List<JointSearchFollowType> values =
      <JointSearchFollowType>[
    FollowTypeNotFollow,
    FollowTypeFollow,
    FollowTypeFriends,
  ];

  static final $core.Map<$core.int, JointSearchFollowType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static JointSearchFollowType? valueOf($core.int value) => _byValue[value];

  const JointSearchFollowType._($core.int v, $core.String n) : super(v, n);
}

class JointSearchCardDisplayType extends $pb.ProtobufEnum {
  static const JointSearchCardDisplayType CardDisPlayTypeContinue =
      JointSearchCardDisplayType._(
          0,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'CardDisPlayTypeContinue');
  static const JointSearchCardDisplayType CardDisplayTypeAfterVideo =
      JointSearchCardDisplayType._(
          1,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'CardDisplayTypeAfterVideo');

  static const $core.List<JointSearchCardDisplayType> values =
      <JointSearchCardDisplayType>[
    CardDisPlayTypeContinue,
    CardDisplayTypeAfterVideo,
  ];

  static final $core.Map<$core.int, JointSearchCardDisplayType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static JointSearchCardDisplayType? valueOf($core.int value) =>
      _byValue[value];

  const JointSearchCardDisplayType._($core.int v, $core.String n) : super(v, n);
}

class JointSearchRedirectType extends $pb.ProtobufEnum {
  static const JointSearchRedirectType RedirectTypePersonalPage =
      JointSearchRedirectType._(
          0,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'RedirectTypePersonalPage');
  static const JointSearchRedirectType RedirectTypeRoom =
      JointSearchRedirectType._(
          1,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'RedirectTypeRoom');
  static const JointSearchRedirectType RedirectTypePrivateChat =
      JointSearchRedirectType._(
          2,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'RedirectTypePrivateChat');
  static const JointSearchRedirectType RedirectTypeDrama =
      JointSearchRedirectType._(
          3,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'RedirectTypeDrama');
  static const JointSearchRedirectType RedirectTypeDrawAndGuess =
      JointSearchRedirectType._(
          4,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'RedirectTypeDrawAndGuess');
  static const JointSearchRedirectType RedirectTypeTurtleSoup =
      JointSearchRedirectType._(
          5,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'RedirectTypeTurtleSoup');
  static const JointSearchRedirectType RedirectTypeWolfKiller =
      JointSearchRedirectType._(
          6,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'RedirectTypeWolfKiller');
  static const JointSearchRedirectType RedirectTypeUndercover =
      JointSearchRedirectType._(
          7,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'RedirectTypeUndercover');

  static const $core.List<JointSearchRedirectType> values =
      <JointSearchRedirectType>[
    RedirectTypePersonalPage,
    RedirectTypeRoom,
    RedirectTypePrivateChat,
    RedirectTypeDrama,
    RedirectTypeDrawAndGuess,
    RedirectTypeTurtleSoup,
    RedirectTypeWolfKiller,
    RedirectTypeUndercover,
  ];

  static final $core.Map<$core.int, JointSearchRedirectType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static JointSearchRedirectType? valueOf($core.int value) => _byValue[value];

  const JointSearchRedirectType._($core.int v, $core.String n) : super(v, n);
}
