///
//  Generated code. Do not modify.
//  source: room.refresh.wait.mic.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class WaitMic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WaitMic',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'screen.msg.pull'),
      createEmptyInstance: create)
    ..p<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'wait',
        $pb.PbFieldType.PU3)
    ..p<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'waitForBoss',
        $pb.PbFieldType.PU3,
        protoName: 'waitForBoss')
    ..p<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'waitForAuction',
        $pb.PbFieldType.PU3,
        protoName: 'waitForAuction')
    ..pc<WaitProfile>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'waitProfiles',
        $pb.PbFieldType.PM,
        protoName: 'waitProfiles',
        subBuilder: WaitProfile.create)
    ..hasRequiredFields = false;

  WaitMic._() : super();
  factory WaitMic({
    $core.Iterable<$core.int>? wait,
    $core.Iterable<$core.int>? waitForBoss,
    $core.Iterable<$core.int>? waitForAuction,
    $core.Iterable<WaitProfile>? waitProfiles,
  }) {
    final _result = create();
    if (wait != null) {
      _result.wait.addAll(wait);
    }
    if (waitForBoss != null) {
      _result.waitForBoss.addAll(waitForBoss);
    }
    if (waitForAuction != null) {
      _result.waitForAuction.addAll(waitForAuction);
    }
    if (waitProfiles != null) {
      _result.waitProfiles.addAll(waitProfiles);
    }
    return _result;
  }
  factory WaitMic.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WaitMic.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WaitMic clone() => WaitMic()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WaitMic copyWith(void Function(WaitMic) updates) =>
      super.copyWith((message) => updates(message as WaitMic))
          as WaitMic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WaitMic create() => WaitMic._();
  WaitMic createEmptyInstance() => create();
  static $pb.PbList<WaitMic> createRepeated() => $pb.PbList<WaitMic>();
  @$core.pragma('dart2js:noInline')
  static WaitMic getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WaitMic>(create);
  static WaitMic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get wait => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get waitForBoss => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get waitForAuction => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<WaitProfile> get waitProfiles => $_getList(3);
}

class WaitProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'WaitProfile',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'screen.msg.pull'),
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
    ..hasRequiredFields = false;

  WaitProfile._() : super();
  factory WaitProfile({
    $core.int? uid,
    $core.String? icon,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory WaitProfile.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WaitProfile.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WaitProfile clone() => WaitProfile()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WaitProfile copyWith(void Function(WaitProfile) updates) =>
      super.copyWith((message) => updates(message as WaitProfile))
          as WaitProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WaitProfile create() => WaitProfile._();
  WaitProfile createEmptyInstance() => create();
  static $pb.PbList<WaitProfile> createRepeated() => $pb.PbList<WaitProfile>();
  @$core.pragma('dart2js:noInline')
  static WaitProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WaitProfile>(create);
  static WaitProfile? _defaultInstance;

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
}
