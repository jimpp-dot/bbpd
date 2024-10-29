///
//  Generated code. Do not modify.
//  source: auction.defend.diy.emit.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AuctionDefendDiyEmit extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AuctionDefendDiyEmit',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'auction.defend.diy.emit'),
      createEmptyInstance: create)
    ..p<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pb',
        $pb.PbFieldType.PU3)
    ..hasRequiredFields = false;

  AuctionDefendDiyEmit._() : super();
  factory AuctionDefendDiyEmit({
    $core.Iterable<$core.int>? pb,
  }) {
    final _result = create();
    if (pb != null) {
      _result.pb.addAll(pb);
    }
    return _result;
  }
  factory AuctionDefendDiyEmit.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuctionDefendDiyEmit.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuctionDefendDiyEmit clone() =>
      AuctionDefendDiyEmit()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuctionDefendDiyEmit copyWith(void Function(AuctionDefendDiyEmit) updates) =>
      super.copyWith((message) => updates(message as AuctionDefendDiyEmit))
          as AuctionDefendDiyEmit; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuctionDefendDiyEmit create() => AuctionDefendDiyEmit._();
  AuctionDefendDiyEmit createEmptyInstance() => create();
  static $pb.PbList<AuctionDefendDiyEmit> createRepeated() =>
      $pb.PbList<AuctionDefendDiyEmit>();
  @$core.pragma('dart2js:noInline')
  static AuctionDefendDiyEmit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuctionDefendDiyEmit>(create);
  static AuctionDefendDiyEmit? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get pb => $_getList(0);
}
