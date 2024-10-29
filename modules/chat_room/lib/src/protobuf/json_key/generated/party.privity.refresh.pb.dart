///
//  Generated code. Do not modify.
//  source: party.privity.refresh.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PartyPrivityRefresh_Privity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyPrivityRefresh.Privity',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.privity.refresh'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..p<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'player',
        $pb.PbFieldType.PU3)
    ..hasRequiredFields = false;

  PartyPrivityRefresh_Privity._() : super();
  factory PartyPrivityRefresh_Privity({
    $core.String? state,
    $core.Iterable<$core.int>? player,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    if (player != null) {
      _result.player.addAll(player);
    }
    return _result;
  }
  factory PartyPrivityRefresh_Privity.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyPrivityRefresh_Privity.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyPrivityRefresh_Privity clone() =>
      PartyPrivityRefresh_Privity()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyPrivityRefresh_Privity copyWith(
          void Function(PartyPrivityRefresh_Privity) updates) =>
      super.copyWith(
              (message) => updates(message as PartyPrivityRefresh_Privity))
          as PartyPrivityRefresh_Privity; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyPrivityRefresh_Privity create() =>
      PartyPrivityRefresh_Privity._();
  PartyPrivityRefresh_Privity createEmptyInstance() => create();
  static $pb.PbList<PartyPrivityRefresh_Privity> createRepeated() =>
      $pb.PbList<PartyPrivityRefresh_Privity>();
  @$core.pragma('dart2js:noInline')
  static PartyPrivityRefresh_Privity getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyPrivityRefresh_Privity>(create);
  static PartyPrivityRefresh_Privity? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get state => $_getSZ(0);
  @$pb.TagNumber(1)
  set state($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get player => $_getList(1);
}

class PartyPrivityRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PartyPrivityRefresh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'party.privity.refresh'),
      createEmptyInstance: create)
    ..aOM<PartyPrivityRefresh_Privity>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'privity',
        subBuilder: PartyPrivityRefresh_Privity.create)
    ..hasRequiredFields = false;

  PartyPrivityRefresh._() : super();
  factory PartyPrivityRefresh({
    PartyPrivityRefresh_Privity? privity,
  }) {
    final _result = create();
    if (privity != null) {
      _result.privity = privity;
    }
    return _result;
  }
  factory PartyPrivityRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PartyPrivityRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PartyPrivityRefresh clone() => PartyPrivityRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PartyPrivityRefresh copyWith(void Function(PartyPrivityRefresh) updates) =>
      super.copyWith((message) => updates(message as PartyPrivityRefresh))
          as PartyPrivityRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PartyPrivityRefresh create() => PartyPrivityRefresh._();
  PartyPrivityRefresh createEmptyInstance() => create();
  static $pb.PbList<PartyPrivityRefresh> createRepeated() =>
      $pb.PbList<PartyPrivityRefresh>();
  @$core.pragma('dart2js:noInline')
  static PartyPrivityRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PartyPrivityRefresh>(create);
  static PartyPrivityRefresh? _defaultInstance;

  @$pb.TagNumber(1)
  PartyPrivityRefresh_Privity get privity => $_getN(0);
  @$pb.TagNumber(1)
  set privity(PartyPrivityRefresh_Privity v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPrivity() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrivity() => clearField(1);
  @$pb.TagNumber(1)
  PartyPrivityRefresh_Privity ensurePrivity() => $_ensure(0);
}
