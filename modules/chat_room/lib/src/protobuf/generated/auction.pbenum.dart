///
//  Generated code. Do not modify.
//  source: auction.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class AuctionStatus extends $pb.ProtobufEnum {
  static const AuctionStatus UNKNOWN = AuctionStatus._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'UNKNOWN');
  static const AuctionStatus WAIT = AuctionStatus._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'WAIT');
  static const AuctionStatus SETTING = AuctionStatus._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SETTING');
  static const AuctionStatus START = AuctionStatus._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'START');
  static const AuctionStatus AUCTION = AuctionStatus._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'AUCTION');
  static const AuctionStatus UPGRADE = AuctionStatus._(
      5,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'UPGRADE');
  static const AuctionStatus CLOSED = AuctionStatus._(
      6,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'CLOSED');

  static const $core.List<AuctionStatus> values = <AuctionStatus>[
    UNKNOWN,
    WAIT,
    SETTING,
    START,
    AUCTION,
    UPGRADE,
    CLOSED,
  ];

  static final $core.Map<$core.int, AuctionStatus> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static AuctionStatus? valueOf($core.int value) => _byValue[value];

  const AuctionStatus._($core.int v, $core.String n) : super(v, n);
}

class AuctionRelationLevel extends $pb.ProtobufEnum {
  static const AuctionRelationLevel NORMAL = AuctionRelationLevel._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'NORMAL');
  static const AuctionRelationLevel GOLD = AuctionRelationLevel._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'GOLD');
  static const AuctionRelationLevel PLATINUM = AuctionRelationLevel._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PLATINUM');
  static const AuctionRelationLevel DIAMOND = AuctionRelationLevel._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'DIAMOND');
  static const AuctionRelationLevel HONOUR = AuctionRelationLevel._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'HONOUR');

  static const $core.List<AuctionRelationLevel> values = <AuctionRelationLevel>[
    NORMAL,
    GOLD,
    PLATINUM,
    DIAMOND,
    HONOUR,
  ];

  static final $core.Map<$core.int, AuctionRelationLevel> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static AuctionRelationLevel? valueOf($core.int value) => _byValue[value];

  const AuctionRelationLevel._($core.int v, $core.String n) : super(v, n);
}
