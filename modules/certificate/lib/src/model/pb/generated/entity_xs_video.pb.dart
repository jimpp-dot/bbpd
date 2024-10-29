///
//  Generated code. Do not modify.
//  source: entity_xs_video.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class EntityXsVideo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EntityXsVideo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'path')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cover')
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'width',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'height',
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
            : 'ip',
        $pb.PbFieldType.OU3)
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uuid')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleted',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'viewNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'recommend',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'isVerify',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  EntityXsVideo._() : super();
  factory EntityXsVideo({
    $core.int? vid,
    $core.int? uid,
    $core.String? path,
    $core.String? cover,
    $core.int? duration,
    $core.int? width,
    $core.int? height,
    $core.int? dateline,
    $core.int? ip,
    $core.String? uuid,
    $core.int? deleted,
    $core.int? viewNum,
    $core.int? recommend,
    $core.int? isVerify,
  }) {
    final _result = create();
    if (vid != null) {
      _result.vid = vid;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (path != null) {
      _result.path = path;
    }
    if (cover != null) {
      _result.cover = cover;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (width != null) {
      _result.width = width;
    }
    if (height != null) {
      _result.height = height;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (ip != null) {
      _result.ip = ip;
    }
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (deleted != null) {
      _result.deleted = deleted;
    }
    if (viewNum != null) {
      _result.viewNum = viewNum;
    }
    if (recommend != null) {
      _result.recommend = recommend;
    }
    if (isVerify != null) {
      _result.isVerify = isVerify;
    }
    return _result;
  }
  factory EntityXsVideo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EntityXsVideo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EntityXsVideo clone() => EntityXsVideo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EntityXsVideo copyWith(void Function(EntityXsVideo) updates) =>
      super.copyWith((message) => updates(message as EntityXsVideo))
          as EntityXsVideo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EntityXsVideo create() => EntityXsVideo._();
  EntityXsVideo createEmptyInstance() => create();
  static $pb.PbList<EntityXsVideo> createRepeated() =>
      $pb.PbList<EntityXsVideo>();
  @$core.pragma('dart2js:noInline')
  static EntityXsVideo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EntityXsVideo>(create);
  static EntityXsVideo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get vid => $_getIZ(0);
  @$pb.TagNumber(1)
  set vid($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasVid() => $_has(0);
  @$pb.TagNumber(1)
  void clearVid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get uid => $_getIZ(1);
  @$pb.TagNumber(2)
  set uid($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get path => $_getSZ(2);
  @$pb.TagNumber(3)
  set path($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPath() => $_has(2);
  @$pb.TagNumber(3)
  void clearPath() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get cover => $_getSZ(3);
  @$pb.TagNumber(4)
  set cover($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCover() => $_has(3);
  @$pb.TagNumber(4)
  void clearCover() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get duration => $_getIZ(4);
  @$pb.TagNumber(5)
  set duration($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDuration() => $_has(4);
  @$pb.TagNumber(5)
  void clearDuration() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get width => $_getIZ(5);
  @$pb.TagNumber(6)
  set width($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasWidth() => $_has(5);
  @$pb.TagNumber(6)
  void clearWidth() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get height => $_getIZ(6);
  @$pb.TagNumber(7)
  set height($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasHeight() => $_has(6);
  @$pb.TagNumber(7)
  void clearHeight() => clearField(7);

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
  $core.int get ip => $_getIZ(8);
  @$pb.TagNumber(9)
  set ip($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasIp() => $_has(8);
  @$pb.TagNumber(9)
  void clearIp() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get uuid => $_getSZ(9);
  @$pb.TagNumber(10)
  set uuid($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasUuid() => $_has(9);
  @$pb.TagNumber(10)
  void clearUuid() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get deleted => $_getIZ(10);
  @$pb.TagNumber(11)
  set deleted($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasDeleted() => $_has(10);
  @$pb.TagNumber(11)
  void clearDeleted() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get viewNum => $_getIZ(11);
  @$pb.TagNumber(12)
  set viewNum($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasViewNum() => $_has(11);
  @$pb.TagNumber(12)
  void clearViewNum() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get recommend => $_getIZ(12);
  @$pb.TagNumber(13)
  set recommend($core.int v) {
    $_setSignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasRecommend() => $_has(12);
  @$pb.TagNumber(13)
  void clearRecommend() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get isVerify => $_getIZ(13);
  @$pb.TagNumber(14)
  set isVerify($core.int v) {
    $_setSignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasIsVerify() => $_has(13);
  @$pb.TagNumber(14)
  void clearIsVerify() => clearField(14);
}
