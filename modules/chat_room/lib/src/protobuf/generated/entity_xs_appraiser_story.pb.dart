///
//  Generated code. Do not modify.
//  source: entity_xs_appraiser_story.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class EntityXsAppraiserStory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EntityXsAppraiserStory',
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
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cid',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagId')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'qid')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topicContent')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'likeNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'topicNum',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleted',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'appId',
        $pb.PbFieldType.OU3)
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'area')
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'updateTime',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createTime',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  EntityXsAppraiserStory._() : super();
  factory EntityXsAppraiserStory({
    $core.int? id,
    $core.int? uid,
    $core.int? cid,
    $core.String? tagId,
    $core.String? qid,
    $core.String? title,
    $core.String? content,
    $core.String? topicContent,
    $core.int? likeNum,
    $core.int? topicNum,
    $core.int? status,
    $core.int? deleted,
    $core.int? appId,
    $core.String? area,
    $core.int? updateTime,
    $core.int? createTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (cid != null) {
      _result.cid = cid;
    }
    if (tagId != null) {
      _result.tagId = tagId;
    }
    if (qid != null) {
      _result.qid = qid;
    }
    if (title != null) {
      _result.title = title;
    }
    if (content != null) {
      _result.content = content;
    }
    if (topicContent != null) {
      _result.topicContent = topicContent;
    }
    if (likeNum != null) {
      _result.likeNum = likeNum;
    }
    if (topicNum != null) {
      _result.topicNum = topicNum;
    }
    if (status != null) {
      _result.status = status;
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
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    return _result;
  }
  factory EntityXsAppraiserStory.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EntityXsAppraiserStory.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EntityXsAppraiserStory clone() =>
      EntityXsAppraiserStory()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EntityXsAppraiserStory copyWith(
          void Function(EntityXsAppraiserStory) updates) =>
      super.copyWith((message) => updates(message as EntityXsAppraiserStory))
          as EntityXsAppraiserStory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EntityXsAppraiserStory create() => EntityXsAppraiserStory._();
  EntityXsAppraiserStory createEmptyInstance() => create();
  static $pb.PbList<EntityXsAppraiserStory> createRepeated() =>
      $pb.PbList<EntityXsAppraiserStory>();
  @$core.pragma('dart2js:noInline')
  static EntityXsAppraiserStory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EntityXsAppraiserStory>(create);
  static EntityXsAppraiserStory? _defaultInstance;

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
  $core.int get cid => $_getIZ(2);
  @$pb.TagNumber(3)
  set cid($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCid() => $_has(2);
  @$pb.TagNumber(3)
  void clearCid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get tagId => $_getSZ(3);
  @$pb.TagNumber(4)
  set tagId($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTagId() => $_has(3);
  @$pb.TagNumber(4)
  void clearTagId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get qid => $_getSZ(4);
  @$pb.TagNumber(5)
  set qid($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasQid() => $_has(4);
  @$pb.TagNumber(5)
  void clearQid() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get title => $_getSZ(5);
  @$pb.TagNumber(6)
  set title($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasTitle() => $_has(5);
  @$pb.TagNumber(6)
  void clearTitle() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get content => $_getSZ(6);
  @$pb.TagNumber(7)
  set content($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasContent() => $_has(6);
  @$pb.TagNumber(7)
  void clearContent() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get topicContent => $_getSZ(7);
  @$pb.TagNumber(8)
  set topicContent($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTopicContent() => $_has(7);
  @$pb.TagNumber(8)
  void clearTopicContent() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get likeNum => $_getIZ(8);
  @$pb.TagNumber(9)
  set likeNum($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasLikeNum() => $_has(8);
  @$pb.TagNumber(9)
  void clearLikeNum() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get topicNum => $_getIZ(9);
  @$pb.TagNumber(10)
  set topicNum($core.int v) {
    $_setSignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasTopicNum() => $_has(9);
  @$pb.TagNumber(10)
  void clearTopicNum() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get status => $_getIZ(10);
  @$pb.TagNumber(11)
  set status($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearStatus() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get deleted => $_getIZ(11);
  @$pb.TagNumber(12)
  set deleted($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasDeleted() => $_has(11);
  @$pb.TagNumber(12)
  void clearDeleted() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get appId => $_getIZ(12);
  @$pb.TagNumber(13)
  set appId($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasAppId() => $_has(12);
  @$pb.TagNumber(13)
  void clearAppId() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get area => $_getSZ(13);
  @$pb.TagNumber(14)
  set area($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasArea() => $_has(13);
  @$pb.TagNumber(14)
  void clearArea() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get updateTime => $_getIZ(14);
  @$pb.TagNumber(15)
  set updateTime($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasUpdateTime() => $_has(14);
  @$pb.TagNumber(15)
  void clearUpdateTime() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get createTime => $_getIZ(15);
  @$pb.TagNumber(16)
  set createTime($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasCreateTime() => $_has(15);
  @$pb.TagNumber(16)
  void clearCreateTime() => clearField(16);
}
