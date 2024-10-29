///
//  Generated code. Do not modify.
//  source: entity_xs_appraiser_tag.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class EntityXsAppraiserTag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EntityXsAppraiserTag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleted',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'appId',
        $pb.PbFieldType.OU3)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'area')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createTime',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  EntityXsAppraiserTag._() : super();
  factory EntityXsAppraiserTag({
    $core.int? id,
    $core.String? name,
    $core.int? deleted,
    $core.int? appId,
    $core.String? area,
    $core.int? createTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (deleted != null) {
      _result.deleted = deleted;
    }
    if (appId != null) {
      _result.appId = appId;
    }
    if (area != null) {
      _result.area = area;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    return _result;
  }
  factory EntityXsAppraiserTag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EntityXsAppraiserTag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EntityXsAppraiserTag clone() =>
      EntityXsAppraiserTag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EntityXsAppraiserTag copyWith(void Function(EntityXsAppraiserTag) updates) =>
      super.copyWith((message) => updates(message as EntityXsAppraiserTag))
          as EntityXsAppraiserTag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EntityXsAppraiserTag create() => EntityXsAppraiserTag._();
  EntityXsAppraiserTag createEmptyInstance() => create();
  static $pb.PbList<EntityXsAppraiserTag> createRepeated() =>
      $pb.PbList<EntityXsAppraiserTag>();
  @$core.pragma('dart2js:noInline')
  static EntityXsAppraiserTag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EntityXsAppraiserTag>(create);
  static EntityXsAppraiserTag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setUnsignedInt32(0, v);
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
  $core.int get deleted => $_getIZ(2);
  @$pb.TagNumber(3)
  set deleted($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDeleted() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeleted() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get appId => $_getIZ(3);
  @$pb.TagNumber(4)
  set appId($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAppId() => $_has(3);
  @$pb.TagNumber(4)
  void clearAppId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get area => $_getSZ(4);
  @$pb.TagNumber(5)
  set area($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasArea() => $_has(4);
  @$pb.TagNumber(5)
  void clearArea() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get createTime => $_getIZ(5);
  @$pb.TagNumber(6)
  set createTime($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCreateTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreateTime() => clearField(6);
}
