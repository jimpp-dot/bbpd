///
//  Generated code. Do not modify.
//  source: room_cross_pk.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class RoomCrossPKMode extends $pb.ProtobufEnum {
  static const RoomCrossPKMode ROOM_CROSS_PK_MODE_UNKNOWN = RoomCrossPKMode._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ROOM_CROSS_PK_MODE_UNKNOWN');
  static const RoomCrossPKMode ROOM_CROSS_PK_MODE_2 = RoomCrossPKMode._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ROOM_CROSS_PK_MODE_2');
  static const RoomCrossPKMode ROOM_CROSS_PK_MODE_3 = RoomCrossPKMode._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ROOM_CROSS_PK_MODE_3');
  static const RoomCrossPKMode ROOM_CROSS_PK_MODE_TOWER = RoomCrossPKMode._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ROOM_CROSS_PK_MODE_TOWER');
  static const RoomCrossPKMode ROOM_CROSS_PK_MODE_QUALIFY = RoomCrossPKMode._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ROOM_CROSS_PK_MODE_QUALIFY');

  static const $core.List<RoomCrossPKMode> values = <RoomCrossPKMode>[
    ROOM_CROSS_PK_MODE_UNKNOWN,
    ROOM_CROSS_PK_MODE_2,
    ROOM_CROSS_PK_MODE_3,
    ROOM_CROSS_PK_MODE_TOWER,
    ROOM_CROSS_PK_MODE_QUALIFY,
  ];

  static final $core.Map<$core.int, RoomCrossPKMode> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RoomCrossPKMode? valueOf($core.int value) => _byValue[value];

  const RoomCrossPKMode._($core.int v, $core.String n) : super(v, n);
}

class RoomCrossPKStatus extends $pb.ProtobufEnum {
  static const RoomCrossPKStatus ROOM_CROSS_PK_STATUS_UNKONWN =
      RoomCrossPKStatus._(
          0,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'ROOM_CROSS_PK_STATUS_UNKONWN');
  static const RoomCrossPKStatus ROOM_CROSS_PK_STATUS_LIVING =
      RoomCrossPKStatus._(
          1,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'ROOM_CROSS_PK_STATUS_LIVING');
  static const RoomCrossPKStatus ROOM_CROSS_PK_STATUS_MATCH =
      RoomCrossPKStatus._(
          2,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'ROOM_CROSS_PK_STATUS_MATCH');
  static const RoomCrossPKStatus ROOM_CROSS_PK_STATUS_PKING =
      RoomCrossPKStatus._(
          3,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'ROOM_CROSS_PK_STATUS_PKING');
  static const RoomCrossPKStatus ROOM_CROSS_PK_STATUS_ENDING =
      RoomCrossPKStatus._(
          4,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'ROOM_CROSS_PK_STATUS_ENDING');
  static const RoomCrossPKStatus ROOM_CROSS_PK_STATUS_CLOSED =
      RoomCrossPKStatus._(
          5,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'ROOM_CROSS_PK_STATUS_CLOSED');

  static const $core.List<RoomCrossPKStatus> values = <RoomCrossPKStatus>[
    ROOM_CROSS_PK_STATUS_UNKONWN,
    ROOM_CROSS_PK_STATUS_LIVING,
    ROOM_CROSS_PK_STATUS_MATCH,
    ROOM_CROSS_PK_STATUS_PKING,
    ROOM_CROSS_PK_STATUS_ENDING,
    ROOM_CROSS_PK_STATUS_CLOSED,
  ];

  static final $core.Map<$core.int, RoomCrossPKStatus> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RoomCrossPKStatus? valueOf($core.int value) => _byValue[value];

  const RoomCrossPKStatus._($core.int v, $core.String n) : super(v, n);
}

class RoomCrossPkWin extends $pb.ProtobufEnum {
  static const RoomCrossPkWin ROOM_CROSS_PK_WIN_UNKNOWN = RoomCrossPkWin._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ROOM_CROSS_PK_WIN_UNKNOWN');
  static const RoomCrossPkWin ROOM_CROSS_PK_WIN_NORMAL = RoomCrossPkWin._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ROOM_CROSS_PK_WIN_NORMAL');
  static const RoomCrossPkWin ROOM_CROSS_PK_WIN_DRAW = RoomCrossPkWin._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ROOM_CROSS_PK_WIN_DRAW');

  static const $core.List<RoomCrossPkWin> values = <RoomCrossPkWin>[
    ROOM_CROSS_PK_WIN_UNKNOWN,
    ROOM_CROSS_PK_WIN_NORMAL,
    ROOM_CROSS_PK_WIN_DRAW,
  ];

  static final $core.Map<$core.int, RoomCrossPkWin> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RoomCrossPkWin? valueOf($core.int value) => _byValue[value];

  const RoomCrossPkWin._($core.int v, $core.String n) : super(v, n);
}

class RoomCrossPkInviteMode extends $pb.ProtobufEnum {
  static const RoomCrossPkInviteMode UNKNOWN_MODE = RoomCrossPkInviteMode._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'UNKNOWN_MODE');
  static const RoomCrossPkInviteMode INVITE_MODE = RoomCrossPkInviteMode._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'INVITE_MODE');
  static const RoomCrossPkInviteMode MATCH_MODE = RoomCrossPkInviteMode._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'MATCH_MODE');

  static const $core.List<RoomCrossPkInviteMode> values =
      <RoomCrossPkInviteMode>[
    UNKNOWN_MODE,
    INVITE_MODE,
    MATCH_MODE,
  ];

  static final $core.Map<$core.int, RoomCrossPkInviteMode> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RoomCrossPkInviteMode? valueOf($core.int value) => _byValue[value];

  const RoomCrossPkInviteMode._($core.int v, $core.String n) : super(v, n);
}

class RoomCrossPkChannel extends $pb.ProtobufEnum {
  static const RoomCrossPkChannel UNKNOWN_CHANNEL = RoomCrossPkChannel._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'UNKNOWN_CHANNEL');
  static const RoomCrossPkChannel SEARCH_LIST_CHANNEL = RoomCrossPkChannel._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SEARCH_LIST_CHANNEL');
  static const RoomCrossPkChannel ANCHOR_LIST_CHANNEL = RoomCrossPkChannel._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ANCHOR_LIST_CHANNEL');
  static const RoomCrossPkChannel MATCH_POOL_CHANNEL = RoomCrossPkChannel._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'MATCH_POOL_CHANNEL');

  static const $core.List<RoomCrossPkChannel> values = <RoomCrossPkChannel>[
    UNKNOWN_CHANNEL,
    SEARCH_LIST_CHANNEL,
    ANCHOR_LIST_CHANNEL,
    MATCH_POOL_CHANNEL,
  ];

  static final $core.Map<$core.int, RoomCrossPkChannel> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RoomCrossPkChannel? valueOf($core.int value) => _byValue[value];

  const RoomCrossPkChannel._($core.int v, $core.String n) : super(v, n);
}

class RoomCrossAnchorState extends $pb.ProtobufEnum {
  static const RoomCrossAnchorState ROOM_CROSS_PK_ANCHOR_UNLIVING =
      RoomCrossAnchorState._(
          0,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'ROOM_CROSS_PK_ANCHOR_UNLIVING');
  static const RoomCrossAnchorState ROOM_CROSS_PK_ANCHOR_LIVING =
      RoomCrossAnchorState._(
          1,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'ROOM_CROSS_PK_ANCHOR_LIVING');
  static const RoomCrossAnchorState ROOM_CROSS_PK_ANCHOR_PKING =
      RoomCrossAnchorState._(
          2,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'ROOM_CROSS_PK_ANCHOR_PKING');

  static const $core.List<RoomCrossAnchorState> values = <RoomCrossAnchorState>[
    ROOM_CROSS_PK_ANCHOR_UNLIVING,
    ROOM_CROSS_PK_ANCHOR_LIVING,
    ROOM_CROSS_PK_ANCHOR_PKING,
  ];

  static final $core.Map<$core.int, RoomCrossAnchorState> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RoomCrossAnchorState? valueOf($core.int value) => _byValue[value];

  const RoomCrossAnchorState._($core.int v, $core.String n) : super(v, n);
}

class RoomCrossPkWinState extends $pb.ProtobufEnum {
  static const RoomCrossPkWinState CROSSPK_UNKNOWN = RoomCrossPkWinState._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'CROSSPK_UNKNOWN');
  static const RoomCrossPkWinState CROSSPK_WIN = RoomCrossPkWinState._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'CROSSPK_WIN');
  static const RoomCrossPkWinState CROSSPK_DRAW = RoomCrossPkWinState._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'CROSSPK_DRAW');
  static const RoomCrossPkWinState CROSSPK_FAIL = RoomCrossPkWinState._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'CROSSPK_FAIL');

  static const $core.List<RoomCrossPkWinState> values = <RoomCrossPkWinState>[
    CROSSPK_UNKNOWN,
    CROSSPK_WIN,
    CROSSPK_DRAW,
    CROSSPK_FAIL,
  ];

  static final $core.Map<$core.int, RoomCrossPkWinState> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static RoomCrossPkWinState? valueOf($core.int value) => _byValue[value];

  const RoomCrossPkWinState._($core.int v, $core.String n) : super(v, n);
}
