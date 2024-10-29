///
//  Generated code. Do not modify.
//  source: room.duty.refresh.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RoomDutyRefresh extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RoomDutyRefresh',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room.duty.refresh'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'has_award')
    ..hasRequiredFields = false;

  RoomDutyRefresh._() : super();
  factory RoomDutyRefresh({
    $core.bool? hasAward,
  }) {
    final _result = create();
    if (hasAward != null) {
      _result.hasAward = hasAward;
    }
    return _result;
  }
  factory RoomDutyRefresh.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RoomDutyRefresh.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RoomDutyRefresh clone() => RoomDutyRefresh()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RoomDutyRefresh copyWith(void Function(RoomDutyRefresh) updates) =>
      super.copyWith((message) => updates(message as RoomDutyRefresh))
          as RoomDutyRefresh; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RoomDutyRefresh create() => RoomDutyRefresh._();
  RoomDutyRefresh createEmptyInstance() => create();
  static $pb.PbList<RoomDutyRefresh> createRepeated() =>
      $pb.PbList<RoomDutyRefresh>();
  @$core.pragma('dart2js:noInline')
  static RoomDutyRefresh getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RoomDutyRefresh>(create);
  static RoomDutyRefresh? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get hasAward => $_getBF(0);
  @$pb.TagNumber(1)
  set hasAward($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHasAward() => $_has(0);
  @$pb.TagNumber(1)
  void clearHasAward() => clearField(1);
}
