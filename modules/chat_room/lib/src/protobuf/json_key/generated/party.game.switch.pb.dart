///
//  Generated code. Do not modify.
//  source: party.game.switch.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PartyGameSwitch extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyGameSwitch',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.game.switch'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'game_type')
    ..hasRequiredFields = false;

  PartyGameSwitch._() : super();
  factory PartyGameSwitch({
    $core.String? gameType,
  }) {
    final _result = create();
    if (gameType != null) {
      _result.gameType = gameType;
    }
    return _result;
  }
  factory PartyGameSwitch.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyGameSwitch.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyGameSwitch clone() => PartyGameSwitch()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyGameSwitch copyWith(void Function(PartyGameSwitch) updates) =>
      super.copyWith((message) => updates(message as PartyGameSwitch))
          as PartyGameSwitch; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyGameSwitch create() => PartyGameSwitch._();
  PartyGameSwitch createEmptyInstance() => create();
  static $pb.PbList<PartyGameSwitch> createRepeated() =>
      $pb.PbList<PartyGameSwitch>();
  @$core.pragma('dart2js:noInline')
  static PartyGameSwitch getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyGameSwitch>(create);
  static PartyGameSwitch? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get gameType => $_getSZ(0);
  @$pb.TagNumber(1)
  set gameType($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasGameType() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameType() => clearField(1);
}
