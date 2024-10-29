///
//  Generated code. Do not modify.
//  source: account.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AccountInfoVideo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccountInfoVideo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'path')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cover')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'reason')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'datelineComplete')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'modify',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AccountInfoVideo._() : super();
  factory AccountInfoVideo({
    $core.String? uid,
    $core.String? path,
    $core.String? cover,
    $core.String? duration,
    $core.String? state,
    $core.String? reason,
    $core.String? dateline,
    $core.String? datelineComplete,
    $core.int? modify,
  }) {
    final _result = create();
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
    if (state != null) {
      _result.state = state;
    }
    if (reason != null) {
      _result.reason = reason;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (datelineComplete != null) {
      _result.datelineComplete = datelineComplete;
    }
    if (modify != null) {
      _result.modify = modify;
    }
    return _result;
  }
  factory AccountInfoVideo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccountInfoVideo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccountInfoVideo clone() => AccountInfoVideo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccountInfoVideo copyWith(void Function(AccountInfoVideo) updates) =>
      super.copyWith((message) => updates(message as AccountInfoVideo))
          as AccountInfoVideo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountInfoVideo create() => AccountInfoVideo._();
  AccountInfoVideo createEmptyInstance() => create();
  static $pb.PbList<AccountInfoVideo> createRepeated() =>
      $pb.PbList<AccountInfoVideo>();
  @$core.pragma('dart2js:noInline')
  static AccountInfoVideo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccountInfoVideo>(create);
  static AccountInfoVideo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get path => $_getSZ(1);
  @$pb.TagNumber(2)
  set path($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cover => $_getSZ(2);
  @$pb.TagNumber(3)
  set cover($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCover() => $_has(2);
  @$pb.TagNumber(3)
  void clearCover() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get duration => $_getSZ(3);
  @$pb.TagNumber(4)
  set duration($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearDuration() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get state => $_getSZ(4);
  @$pb.TagNumber(5)
  set state($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasState() => $_has(4);
  @$pb.TagNumber(5)
  void clearState() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get reason => $_getSZ(5);
  @$pb.TagNumber(6)
  set reason($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasReason() => $_has(5);
  @$pb.TagNumber(6)
  void clearReason() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get dateline => $_getSZ(6);
  @$pb.TagNumber(7)
  set dateline($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDateline() => $_has(6);
  @$pb.TagNumber(7)
  void clearDateline() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get datelineComplete => $_getSZ(7);
  @$pb.TagNumber(8)
  set datelineComplete($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDatelineComplete() => $_has(7);
  @$pb.TagNumber(8)
  void clearDatelineComplete() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get modify => $_getIZ(8);
  @$pb.TagNumber(9)
  set modify($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasModify() => $_has(8);
  @$pb.TagNumber(9)
  void clearModify() => clearField(9);
}

class AccountInfoHeader extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccountInfoHeader',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'path')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'video')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleted')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ordering')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state')
    ..a<$core.int>(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'header',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AccountInfoHeader._() : super();
  factory AccountInfoHeader({
    $core.String? id,
    $core.String? uid,
    $core.String? path,
    $core.String? video,
    $core.String? deleted,
    $core.String? dateline,
    $core.String? ordering,
    $core.String? state,
    $core.int? header,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (path != null) {
      _result.path = path;
    }
    if (video != null) {
      _result.video = video;
    }
    if (deleted != null) {
      _result.deleted = deleted;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (ordering != null) {
      _result.ordering = ordering;
    }
    if (state != null) {
      _result.state = state;
    }
    if (header != null) {
      _result.header = header;
    }
    return _result;
  }
  factory AccountInfoHeader.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccountInfoHeader.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccountInfoHeader clone() => AccountInfoHeader()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccountInfoHeader copyWith(void Function(AccountInfoHeader) updates) =>
      super.copyWith((message) => updates(message as AccountInfoHeader))
          as AccountInfoHeader; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountInfoHeader create() => AccountInfoHeader._();
  AccountInfoHeader createEmptyInstance() => create();
  static $pb.PbList<AccountInfoHeader> createRepeated() =>
      $pb.PbList<AccountInfoHeader>();
  @$core.pragma('dart2js:noInline')
  static AccountInfoHeader getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccountInfoHeader>(create);
  static AccountInfoHeader? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get uid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uid($core.String v) {
    $_setString(1, v);
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
  $core.String get video => $_getSZ(3);
  @$pb.TagNumber(4)
  set video($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasVideo() => $_has(3);
  @$pb.TagNumber(4)
  void clearVideo() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get deleted => $_getSZ(4);
  @$pb.TagNumber(5)
  set deleted($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasDeleted() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeleted() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get dateline => $_getSZ(5);
  @$pb.TagNumber(6)
  set dateline($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDateline() => $_has(5);
  @$pb.TagNumber(6)
  void clearDateline() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get ordering => $_getSZ(6);
  @$pb.TagNumber(7)
  set ordering($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasOrdering() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrdering() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get state => $_getSZ(7);
  @$pb.TagNumber(8)
  set state($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasState() => $_has(7);
  @$pb.TagNumber(8)
  void clearState() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get header => $_getIZ(8);
  @$pb.TagNumber(9)
  set header($core.int v) {
    $_setUnsignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasHeader() => $_has(8);
  @$pb.TagNumber(9)
  void clearHeader() => clearField(9);
}

class AccountSexInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccountSexInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'firstTime')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'doc')
    ..hasRequiredFields = false;

  AccountSexInfo._() : super();
  factory AccountSexInfo({
    $core.bool? firstTime,
    $core.String? doc,
  }) {
    final _result = create();
    if (firstTime != null) {
      _result.firstTime = firstTime;
    }
    if (doc != null) {
      _result.doc = doc;
    }
    return _result;
  }
  factory AccountSexInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccountSexInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccountSexInfo clone() => AccountSexInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccountSexInfo copyWith(void Function(AccountSexInfo) updates) =>
      super.copyWith((message) => updates(message as AccountSexInfo))
          as AccountSexInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountSexInfo create() => AccountSexInfo._();
  AccountSexInfo createEmptyInstance() => create();
  static $pb.PbList<AccountSexInfo> createRepeated() =>
      $pb.PbList<AccountSexInfo>();
  @$core.pragma('dart2js:noInline')
  static AccountSexInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccountSexInfo>(create);
  static AccountSexInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get firstTime => $_getBF(0);
  @$pb.TagNumber(1)
  set firstTime($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFirstTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get doc => $_getSZ(1);
  @$pb.TagNumber(2)
  set doc($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDoc() => $_has(1);
  @$pb.TagNumber(2)
  void clearDoc() => clearField(2);
}

class AccountCardTag extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccountCardTag',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..hasRequiredFields = false;

  AccountCardTag._() : super();
  factory AccountCardTag({
    $core.String? id,
    $core.String? name,
    $core.String? icon,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    return _result;
  }
  factory AccountCardTag.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccountCardTag.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccountCardTag clone() => AccountCardTag()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccountCardTag copyWith(void Function(AccountCardTag) updates) =>
      super.copyWith((message) => updates(message as AccountCardTag))
          as AccountCardTag; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountCardTag create() => AccountCardTag._();
  AccountCardTag createEmptyInstance() => create();
  static $pb.PbList<AccountCardTag> createRepeated() =>
      $pb.PbList<AccountCardTag>();
  @$core.pragma('dart2js:noInline')
  static AccountCardTag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccountCardTag>(create);
  static AccountCardTag? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
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
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);
}

class AccountDialog extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccountDialog',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subtitle')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..hasRequiredFields = false;

  AccountDialog._() : super();
  factory AccountDialog({
    $core.String? title,
    $core.String? subtitle,
    $core.String? content,
  }) {
    final _result = create();
    if (title != null) {
      _result.title = title;
    }
    if (subtitle != null) {
      _result.subtitle = subtitle;
    }
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory AccountDialog.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccountDialog.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccountDialog clone() => AccountDialog()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccountDialog copyWith(void Function(AccountDialog) updates) =>
      super.copyWith((message) => updates(message as AccountDialog))
          as AccountDialog; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountDialog create() => AccountDialog._();
  AccountDialog createEmptyInstance() => create();
  static $pb.PbList<AccountDialog> createRepeated() =>
      $pb.PbList<AccountDialog>();
  @$core.pragma('dart2js:noInline')
  static AccountDialog getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccountDialog>(create);
  static AccountDialog? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get subtitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set subtitle($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSubtitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubtitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);
}

class AccountVideo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccountVideo',
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
            : 'url')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cover')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AccountVideo._() : super();
  factory AccountVideo({
    $core.int? id,
    $core.String? url,
    $core.String? cover,
    $core.int? duration,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (url != null) {
      _result.url = url;
    }
    if (cover != null) {
      _result.cover = cover;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    return _result;
  }
  factory AccountVideo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccountVideo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccountVideo clone() => AccountVideo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccountVideo copyWith(void Function(AccountVideo) updates) =>
      super.copyWith((message) => updates(message as AccountVideo))
          as AccountVideo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountVideo create() => AccountVideo._();
  AccountVideo createEmptyInstance() => create();
  static $pb.PbList<AccountVideo> createRepeated() =>
      $pb.PbList<AccountVideo>();
  @$core.pragma('dart2js:noInline')
  static AccountVideo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccountVideo>(create);
  static AccountVideo? _defaultInstance;

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
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cover => $_getSZ(2);
  @$pb.TagNumber(3)
  set cover($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCover() => $_has(2);
  @$pb.TagNumber(3)
  void clearCover() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get duration => $_getIZ(3);
  @$pb.TagNumber(4)
  set duration($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearDuration() => clearField(4);
}

class AccountInfoColor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccountInfoColor',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bgStart')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'bgEnd')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'borderStart')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'borderEnd')
    ..hasRequiredFields = false;

  AccountInfoColor._() : super();
  factory AccountInfoColor({
    $core.String? bgStart,
    $core.String? bgEnd,
    $core.String? borderStart,
    $core.String? borderEnd,
  }) {
    final _result = create();
    if (bgStart != null) {
      _result.bgStart = bgStart;
    }
    if (bgEnd != null) {
      _result.bgEnd = bgEnd;
    }
    if (borderStart != null) {
      _result.borderStart = borderStart;
    }
    if (borderEnd != null) {
      _result.borderEnd = borderEnd;
    }
    return _result;
  }
  factory AccountInfoColor.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccountInfoColor.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccountInfoColor clone() => AccountInfoColor()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccountInfoColor copyWith(void Function(AccountInfoColor) updates) =>
      super.copyWith((message) => updates(message as AccountInfoColor))
          as AccountInfoColor; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountInfoColor create() => AccountInfoColor._();
  AccountInfoColor createEmptyInstance() => create();
  static $pb.PbList<AccountInfoColor> createRepeated() =>
      $pb.PbList<AccountInfoColor>();
  @$core.pragma('dart2js:noInline')
  static AccountInfoColor getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccountInfoColor>(create);
  static AccountInfoColor? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get bgStart => $_getSZ(0);
  @$pb.TagNumber(1)
  set bgStart($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBgStart() => $_has(0);
  @$pb.TagNumber(1)
  void clearBgStart() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get bgEnd => $_getSZ(1);
  @$pb.TagNumber(2)
  set bgEnd($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBgEnd() => $_has(1);
  @$pb.TagNumber(2)
  void clearBgEnd() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get borderStart => $_getSZ(2);
  @$pb.TagNumber(3)
  set borderStart($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBorderStart() => $_has(2);
  @$pb.TagNumber(3)
  void clearBorderStart() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get borderEnd => $_getSZ(3);
  @$pb.TagNumber(4)
  set borderEnd($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBorderEnd() => $_has(3);
  @$pb.TagNumber(4)
  void clearBorderEnd() => clearField(4);
}

class AccountInfoCard extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccountInfoCard',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
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
            : 'appId')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'desc')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audio')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hometownCity')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hometownCityCode',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'likedNum',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'exposure',
        $pb.PbFieldType.OU3)
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'clickNum')
    ..a<$core.int>(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'checked',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'visiable',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'score',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'duration',
        $pb.PbFieldType.OU3)
    ..aOS(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'audioIcon',
        protoName: 'audioIcon')
    ..pc<AccountCardTag>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tags',
        $pb.PbFieldType.PM,
        subBuilder: AccountCardTag.create)
    ..aOM<AccountDialog>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dialog',
        subBuilder: AccountDialog.create)
    ..aOM<AccountVideo>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'video',
        subBuilder: AccountVideo.create)
    ..pc<AccountInfoColor>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color',
        $pb.PbFieldType.PM,
        subBuilder: AccountInfoColor.create)
    ..a<$core.int>(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'height',
        $pb.PbFieldType.OU3)
    ..aOS(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'industry')
    ..aOS(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'education')
    ..hasRequiredFields = false;

  AccountInfoCard._() : super();
  factory AccountInfoCard({
    $core.int? uid,
    $core.String? appId,
    $core.String? desc,
    $core.String? audio,
    $core.String? hometownCity,
    $core.int? hometownCityCode,
    $core.int? likedNum,
    $core.int? exposure,
    $core.String? clickNum,
    $core.int? checked,
    $core.int? visiable,
    $core.int? score,
    $core.int? dateline,
    $core.int? duration,
    $core.String? audioIcon,
    $core.Iterable<AccountCardTag>? tags,
    AccountDialog? dialog,
    AccountVideo? video,
    $core.Iterable<AccountInfoColor>? color,
    $core.int? height,
    $core.String? industry,
    $core.String? education,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (appId != null) {
      _result.appId = appId;
    }
    if (desc != null) {
      _result.desc = desc;
    }
    if (audio != null) {
      _result.audio = audio;
    }
    if (hometownCity != null) {
      _result.hometownCity = hometownCity;
    }
    if (hometownCityCode != null) {
      _result.hometownCityCode = hometownCityCode;
    }
    if (likedNum != null) {
      _result.likedNum = likedNum;
    }
    if (exposure != null) {
      _result.exposure = exposure;
    }
    if (clickNum != null) {
      _result.clickNum = clickNum;
    }
    if (checked != null) {
      _result.checked = checked;
    }
    if (visiable != null) {
      _result.visiable = visiable;
    }
    if (score != null) {
      _result.score = score;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (duration != null) {
      _result.duration = duration;
    }
    if (audioIcon != null) {
      _result.audioIcon = audioIcon;
    }
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    if (dialog != null) {
      _result.dialog = dialog;
    }
    if (video != null) {
      _result.video = video;
    }
    if (color != null) {
      _result.color.addAll(color);
    }
    if (height != null) {
      _result.height = height;
    }
    if (industry != null) {
      _result.industry = industry;
    }
    if (education != null) {
      _result.education = education;
    }
    return _result;
  }
  factory AccountInfoCard.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccountInfoCard.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccountInfoCard clone() => AccountInfoCard()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccountInfoCard copyWith(void Function(AccountInfoCard) updates) =>
      super.copyWith((message) => updates(message as AccountInfoCard))
          as AccountInfoCard; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountInfoCard create() => AccountInfoCard._();
  AccountInfoCard createEmptyInstance() => create();
  static $pb.PbList<AccountInfoCard> createRepeated() =>
      $pb.PbList<AccountInfoCard>();
  @$core.pragma('dart2js:noInline')
  static AccountInfoCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccountInfoCard>(create);
  static AccountInfoCard? _defaultInstance;

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
  $core.String get appId => $_getSZ(1);
  @$pb.TagNumber(2)
  set appId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAppId() => $_has(1);
  @$pb.TagNumber(2)
  void clearAppId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get desc => $_getSZ(2);
  @$pb.TagNumber(3)
  set desc($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDesc() => $_has(2);
  @$pb.TagNumber(3)
  void clearDesc() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get audio => $_getSZ(3);
  @$pb.TagNumber(4)
  set audio($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasAudio() => $_has(3);
  @$pb.TagNumber(4)
  void clearAudio() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get hometownCity => $_getSZ(4);
  @$pb.TagNumber(5)
  set hometownCity($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHometownCity() => $_has(4);
  @$pb.TagNumber(5)
  void clearHometownCity() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get hometownCityCode => $_getIZ(5);
  @$pb.TagNumber(6)
  set hometownCityCode($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasHometownCityCode() => $_has(5);
  @$pb.TagNumber(6)
  void clearHometownCityCode() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get likedNum => $_getIZ(6);
  @$pb.TagNumber(7)
  set likedNum($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasLikedNum() => $_has(6);
  @$pb.TagNumber(7)
  void clearLikedNum() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get exposure => $_getIZ(7);
  @$pb.TagNumber(8)
  set exposure($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasExposure() => $_has(7);
  @$pb.TagNumber(8)
  void clearExposure() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get clickNum => $_getSZ(8);
  @$pb.TagNumber(9)
  set clickNum($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasClickNum() => $_has(8);
  @$pb.TagNumber(9)
  void clearClickNum() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get checked => $_getIZ(9);
  @$pb.TagNumber(10)
  set checked($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasChecked() => $_has(9);
  @$pb.TagNumber(10)
  void clearChecked() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get visiable => $_getIZ(10);
  @$pb.TagNumber(11)
  set visiable($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasVisiable() => $_has(10);
  @$pb.TagNumber(11)
  void clearVisiable() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get score => $_getIZ(11);
  @$pb.TagNumber(12)
  set score($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasScore() => $_has(11);
  @$pb.TagNumber(12)
  void clearScore() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get dateline => $_getIZ(12);
  @$pb.TagNumber(13)
  set dateline($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasDateline() => $_has(12);
  @$pb.TagNumber(13)
  void clearDateline() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get duration => $_getIZ(13);
  @$pb.TagNumber(14)
  set duration($core.int v) {
    $_setUnsignedInt32(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasDuration() => $_has(13);
  @$pb.TagNumber(14)
  void clearDuration() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get audioIcon => $_getSZ(14);
  @$pb.TagNumber(15)
  set audioIcon($core.String v) {
    $_setString(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasAudioIcon() => $_has(14);
  @$pb.TagNumber(15)
  void clearAudioIcon() => clearField(15);

  @$pb.TagNumber(16)
  $core.List<AccountCardTag> get tags => $_getList(15);

  @$pb.TagNumber(17)
  AccountDialog get dialog => $_getN(16);
  @$pb.TagNumber(17)
  set dialog(AccountDialog v) {
    setField(17, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasDialog() => $_has(16);
  @$pb.TagNumber(17)
  void clearDialog() => clearField(17);
  @$pb.TagNumber(17)
  AccountDialog ensureDialog() => $_ensure(16);

  @$pb.TagNumber(18)
  AccountVideo get video => $_getN(17);
  @$pb.TagNumber(18)
  set video(AccountVideo v) {
    setField(18, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasVideo() => $_has(17);
  @$pb.TagNumber(18)
  void clearVideo() => clearField(18);
  @$pb.TagNumber(18)
  AccountVideo ensureVideo() => $_ensure(17);

  @$pb.TagNumber(19)
  $core.List<AccountInfoColor> get color => $_getList(18);

  @$pb.TagNumber(20)
  $core.int get height => $_getIZ(19);
  @$pb.TagNumber(20)
  set height($core.int v) {
    $_setUnsignedInt32(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasHeight() => $_has(19);
  @$pb.TagNumber(20)
  void clearHeight() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get industry => $_getSZ(20);
  @$pb.TagNumber(21)
  set industry($core.String v) {
    $_setString(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasIndustry() => $_has(20);
  @$pb.TagNumber(21)
  void clearIndustry() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get education => $_getSZ(21);
  @$pb.TagNumber(22)
  set education($core.String v) {
    $_setString(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasEducation() => $_has(21);
  @$pb.TagNumber(22)
  void clearEducation() => clearField(22);
}

class AccountTags extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccountTags',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  AccountTags._() : super();
  factory AccountTags({
    $core.String? id,
    $core.String? name,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory AccountTags.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccountTags.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccountTags clone() => AccountTags()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccountTags copyWith(void Function(AccountTags) updates) =>
      super.copyWith((message) => updates(message as AccountTags))
          as AccountTags; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountTags create() => AccountTags._();
  AccountTags createEmptyInstance() => create();
  static $pb.PbList<AccountTags> createRepeated() => $pb.PbList<AccountTags>();
  @$core.pragma('dart2js:noInline')
  static AccountTags getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccountTags>(create);
  static AccountTags? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
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
}

class AccountInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AccountInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
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
            : 'name')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'video')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cover')
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'age',
        $pb.PbFieldType.OU3)
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'birthday')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sign')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'city')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cityCode')
    ..a<$core.int>(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineStatus',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'dateline',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDateline',
        $pb.PbFieldType.OU3)
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'onlineDatelineDiff')
    ..a<$core.int>(
        15,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'job',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        16,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sex',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        17,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        18,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'star',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        19,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godNum',
        $pb.PbFieldType.OU3)
    ..aOS(
        20,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'godCategory')
    ..a<$core.int>(
        21,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'deleted',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        22,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'blockUnAutherMessage',
        $pb.PbFieldType.OU3)
    ..aOS(
        23,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tmpIcon')
    ..aOS(
        24,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position')
    ..a<$core.int>(
        25,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'payReceiveToday',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        26,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'servicePause',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        27,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'serviceBusy',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        28,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'creditGodLevel',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        29,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'creditUserLevel',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        30,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tag',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        31,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'friendState',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        32,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'hasVideo',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        33,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'role',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        34,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'vipLevel',
        $pb.PbFieldType.OU3,
        protoName: 'vipLevel')
    ..a<$core.double>(
        35,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'longitude',
        $pb.PbFieldType.OF)
    ..a<$core.double>(
        36,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'latitude',
        $pb.PbFieldType.OF)
    ..a<$core.int>(
        37,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'virtualMan',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        38,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'titleNew',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        39,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'appId',
        $pb.PbFieldType.OU3)
    ..pc<AccountInfoHeader>(
        40,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'photos',
        $pb.PbFieldType.PM,
        subBuilder: AccountInfoHeader.create)
    ..aOM<AccountInfoVideo>(
        41,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'videoInfo',
        protoName: 'videoInfo',
        subBuilder: AccountInfoVideo.create)
    ..a<$core.int>(
        42,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'ModifySexDisabled',
        $pb.PbFieldType.OU3,
        protoName: '_modifySexDisabled')
    ..aOM<AccountSexInfo>(
        43,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sexInfo',
        subBuilder: AccountSexInfo.create)
    ..aOM<AccountInfoCard>(
        44,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'card',
        subBuilder: AccountInfoCard.create)
    ..pc<AccountTags>(
        45,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tags',
        $pb.PbFieldType.PM,
        subBuilder: AccountTags.create)
    ..pc<AccountTags>(
        46,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'friendTags',
        $pb.PbFieldType.PM,
        subBuilder: AccountTags.create)
    ..a<$core.int>(
        47,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'header',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  AccountInfo._() : super();
  factory AccountInfo({
    $core.int? uid,
    $core.String? name,
    $core.String? icon,
    $core.String? video,
    $core.String? cover,
    $core.int? age,
    $core.String? birthday,
    $core.String? sign,
    $core.String? city,
    $core.String? cityCode,
    $core.int? onlineStatus,
    $core.int? dateline,
    $core.int? onlineDateline,
    $core.String? onlineDatelineDiff,
    $core.int? job,
    $core.int? sex,
    $core.int? title,
    $core.int? star,
    $core.int? godNum,
    $core.String? godCategory,
    $core.int? deleted,
    $core.int? blockUnAutherMessage,
    $core.String? tmpIcon,
    $core.String? position,
    $core.int? payReceiveToday,
    $core.int? servicePause,
    $core.int? serviceBusy,
    $core.int? creditGodLevel,
    $core.int? creditUserLevel,
    $core.int? tag,
    $core.int? friendState,
    $core.int? hasVideo_32,
    $core.int? role,
    $core.int? vipLevel,
    $core.double? longitude,
    $core.double? latitude,
    $core.int? virtualMan,
    $core.int? titleNew,
    $core.int? appId,
    $core.Iterable<AccountInfoHeader>? photos,
    AccountInfoVideo? videoInfo,
    $core.int? modifySexDisabled,
    AccountSexInfo? sexInfo,
    AccountInfoCard? card,
    $core.Iterable<AccountTags>? tags,
    $core.Iterable<AccountTags>? friendTags,
    $core.int? header,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (video != null) {
      _result.video = video;
    }
    if (cover != null) {
      _result.cover = cover;
    }
    if (age != null) {
      _result.age = age;
    }
    if (birthday != null) {
      _result.birthday = birthday;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    if (city != null) {
      _result.city = city;
    }
    if (cityCode != null) {
      _result.cityCode = cityCode;
    }
    if (onlineStatus != null) {
      _result.onlineStatus = onlineStatus;
    }
    if (dateline != null) {
      _result.dateline = dateline;
    }
    if (onlineDateline != null) {
      _result.onlineDateline = onlineDateline;
    }
    if (onlineDatelineDiff != null) {
      _result.onlineDatelineDiff = onlineDatelineDiff;
    }
    if (job != null) {
      _result.job = job;
    }
    if (sex != null) {
      _result.sex = sex;
    }
    if (title != null) {
      _result.title = title;
    }
    if (star != null) {
      _result.star = star;
    }
    if (godNum != null) {
      _result.godNum = godNum;
    }
    if (godCategory != null) {
      _result.godCategory = godCategory;
    }
    if (deleted != null) {
      _result.deleted = deleted;
    }
    if (blockUnAutherMessage != null) {
      _result.blockUnAutherMessage = blockUnAutherMessage;
    }
    if (tmpIcon != null) {
      _result.tmpIcon = tmpIcon;
    }
    if (position != null) {
      _result.position = position;
    }
    if (payReceiveToday != null) {
      _result.payReceiveToday = payReceiveToday;
    }
    if (servicePause != null) {
      _result.servicePause = servicePause;
    }
    if (serviceBusy != null) {
      _result.serviceBusy = serviceBusy;
    }
    if (creditGodLevel != null) {
      _result.creditGodLevel = creditGodLevel;
    }
    if (creditUserLevel != null) {
      _result.creditUserLevel = creditUserLevel;
    }
    if (tag != null) {
      _result.tag = tag;
    }
    if (friendState != null) {
      _result.friendState = friendState;
    }
    if (hasVideo_32 != null) {
      _result.hasVideo_32 = hasVideo_32;
    }
    if (role != null) {
      _result.role = role;
    }
    if (vipLevel != null) {
      _result.vipLevel = vipLevel;
    }
    if (longitude != null) {
      _result.longitude = longitude;
    }
    if (latitude != null) {
      _result.latitude = latitude;
    }
    if (virtualMan != null) {
      _result.virtualMan = virtualMan;
    }
    if (titleNew != null) {
      _result.titleNew = titleNew;
    }
    if (appId != null) {
      _result.appId = appId;
    }
    if (photos != null) {
      _result.photos.addAll(photos);
    }
    if (videoInfo != null) {
      _result.videoInfo = videoInfo;
    }
    if (modifySexDisabled != null) {
      _result.modifySexDisabled = modifySexDisabled;
    }
    if (sexInfo != null) {
      _result.sexInfo = sexInfo;
    }
    if (card != null) {
      _result.card = card;
    }
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    if (friendTags != null) {
      _result.friendTags.addAll(friendTags);
    }
    if (header != null) {
      _result.header = header;
    }
    return _result;
  }
  factory AccountInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AccountInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AccountInfo clone() => AccountInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AccountInfo copyWith(void Function(AccountInfo) updates) =>
      super.copyWith((message) => updates(message as AccountInfo))
          as AccountInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountInfo create() => AccountInfo._();
  AccountInfo createEmptyInstance() => create();
  static $pb.PbList<AccountInfo> createRepeated() => $pb.PbList<AccountInfo>();
  @$core.pragma('dart2js:noInline')
  static AccountInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccountInfo>(create);
  static AccountInfo? _defaultInstance;

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
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get video => $_getSZ(3);
  @$pb.TagNumber(4)
  set video($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasVideo() => $_has(3);
  @$pb.TagNumber(4)
  void clearVideo() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get cover => $_getSZ(4);
  @$pb.TagNumber(5)
  set cover($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCover() => $_has(4);
  @$pb.TagNumber(5)
  void clearCover() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get age => $_getIZ(5);
  @$pb.TagNumber(6)
  set age($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAge() => $_has(5);
  @$pb.TagNumber(6)
  void clearAge() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get birthday => $_getSZ(6);
  @$pb.TagNumber(7)
  set birthday($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasBirthday() => $_has(6);
  @$pb.TagNumber(7)
  void clearBirthday() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get sign => $_getSZ(7);
  @$pb.TagNumber(8)
  set sign($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSign() => $_has(7);
  @$pb.TagNumber(8)
  void clearSign() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get city => $_getSZ(8);
  @$pb.TagNumber(9)
  set city($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasCity() => $_has(8);
  @$pb.TagNumber(9)
  void clearCity() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get cityCode => $_getSZ(9);
  @$pb.TagNumber(10)
  set cityCode($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasCityCode() => $_has(9);
  @$pb.TagNumber(10)
  void clearCityCode() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get onlineStatus => $_getIZ(10);
  @$pb.TagNumber(11)
  set onlineStatus($core.int v) {
    $_setUnsignedInt32(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasOnlineStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearOnlineStatus() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get dateline => $_getIZ(11);
  @$pb.TagNumber(12)
  set dateline($core.int v) {
    $_setUnsignedInt32(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasDateline() => $_has(11);
  @$pb.TagNumber(12)
  void clearDateline() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get onlineDateline => $_getIZ(12);
  @$pb.TagNumber(13)
  set onlineDateline($core.int v) {
    $_setUnsignedInt32(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasOnlineDateline() => $_has(12);
  @$pb.TagNumber(13)
  void clearOnlineDateline() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get onlineDatelineDiff => $_getSZ(13);
  @$pb.TagNumber(14)
  set onlineDatelineDiff($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasOnlineDatelineDiff() => $_has(13);
  @$pb.TagNumber(14)
  void clearOnlineDatelineDiff() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get job => $_getIZ(14);
  @$pb.TagNumber(15)
  set job($core.int v) {
    $_setUnsignedInt32(14, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasJob() => $_has(14);
  @$pb.TagNumber(15)
  void clearJob() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get sex => $_getIZ(15);
  @$pb.TagNumber(16)
  set sex($core.int v) {
    $_setUnsignedInt32(15, v);
  }

  @$pb.TagNumber(16)
  $core.bool hasSex() => $_has(15);
  @$pb.TagNumber(16)
  void clearSex() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get title => $_getIZ(16);
  @$pb.TagNumber(17)
  set title($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasTitle() => $_has(16);
  @$pb.TagNumber(17)
  void clearTitle() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get star => $_getIZ(17);
  @$pb.TagNumber(18)
  set star($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasStar() => $_has(17);
  @$pb.TagNumber(18)
  void clearStar() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get godNum => $_getIZ(18);
  @$pb.TagNumber(19)
  set godNum($core.int v) {
    $_setUnsignedInt32(18, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasGodNum() => $_has(18);
  @$pb.TagNumber(19)
  void clearGodNum() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get godCategory => $_getSZ(19);
  @$pb.TagNumber(20)
  set godCategory($core.String v) {
    $_setString(19, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasGodCategory() => $_has(19);
  @$pb.TagNumber(20)
  void clearGodCategory() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get deleted => $_getIZ(20);
  @$pb.TagNumber(21)
  set deleted($core.int v) {
    $_setUnsignedInt32(20, v);
  }

  @$pb.TagNumber(21)
  $core.bool hasDeleted() => $_has(20);
  @$pb.TagNumber(21)
  void clearDeleted() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get blockUnAutherMessage => $_getIZ(21);
  @$pb.TagNumber(22)
  set blockUnAutherMessage($core.int v) {
    $_setUnsignedInt32(21, v);
  }

  @$pb.TagNumber(22)
  $core.bool hasBlockUnAutherMessage() => $_has(21);
  @$pb.TagNumber(22)
  void clearBlockUnAutherMessage() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get tmpIcon => $_getSZ(22);
  @$pb.TagNumber(23)
  set tmpIcon($core.String v) {
    $_setString(22, v);
  }

  @$pb.TagNumber(23)
  $core.bool hasTmpIcon() => $_has(22);
  @$pb.TagNumber(23)
  void clearTmpIcon() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get position => $_getSZ(23);
  @$pb.TagNumber(24)
  set position($core.String v) {
    $_setString(23, v);
  }

  @$pb.TagNumber(24)
  $core.bool hasPosition() => $_has(23);
  @$pb.TagNumber(24)
  void clearPosition() => clearField(24);

  @$pb.TagNumber(25)
  $core.int get payReceiveToday => $_getIZ(24);
  @$pb.TagNumber(25)
  set payReceiveToday($core.int v) {
    $_setUnsignedInt32(24, v);
  }

  @$pb.TagNumber(25)
  $core.bool hasPayReceiveToday() => $_has(24);
  @$pb.TagNumber(25)
  void clearPayReceiveToday() => clearField(25);

  @$pb.TagNumber(26)
  $core.int get servicePause => $_getIZ(25);
  @$pb.TagNumber(26)
  set servicePause($core.int v) {
    $_setUnsignedInt32(25, v);
  }

  @$pb.TagNumber(26)
  $core.bool hasServicePause() => $_has(25);
  @$pb.TagNumber(26)
  void clearServicePause() => clearField(26);

  @$pb.TagNumber(27)
  $core.int get serviceBusy => $_getIZ(26);
  @$pb.TagNumber(27)
  set serviceBusy($core.int v) {
    $_setUnsignedInt32(26, v);
  }

  @$pb.TagNumber(27)
  $core.bool hasServiceBusy() => $_has(26);
  @$pb.TagNumber(27)
  void clearServiceBusy() => clearField(27);

  @$pb.TagNumber(28)
  $core.int get creditGodLevel => $_getIZ(27);
  @$pb.TagNumber(28)
  set creditGodLevel($core.int v) {
    $_setUnsignedInt32(27, v);
  }

  @$pb.TagNumber(28)
  $core.bool hasCreditGodLevel() => $_has(27);
  @$pb.TagNumber(28)
  void clearCreditGodLevel() => clearField(28);

  @$pb.TagNumber(29)
  $core.int get creditUserLevel => $_getIZ(28);
  @$pb.TagNumber(29)
  set creditUserLevel($core.int v) {
    $_setUnsignedInt32(28, v);
  }

  @$pb.TagNumber(29)
  $core.bool hasCreditUserLevel() => $_has(28);
  @$pb.TagNumber(29)
  void clearCreditUserLevel() => clearField(29);

  @$pb.TagNumber(30)
  $core.int get tag => $_getIZ(29);
  @$pb.TagNumber(30)
  set tag($core.int v) {
    $_setUnsignedInt32(29, v);
  }

  @$pb.TagNumber(30)
  $core.bool hasTag() => $_has(29);
  @$pb.TagNumber(30)
  void clearTag() => clearField(30);

  @$pb.TagNumber(31)
  $core.int get friendState => $_getIZ(30);
  @$pb.TagNumber(31)
  set friendState($core.int v) {
    $_setUnsignedInt32(30, v);
  }

  @$pb.TagNumber(31)
  $core.bool hasFriendState() => $_has(30);
  @$pb.TagNumber(31)
  void clearFriendState() => clearField(31);

  @$pb.TagNumber(32)
  $core.int get hasVideo_32 => $_getIZ(31);
  @$pb.TagNumber(32)
  set hasVideo_32($core.int v) {
    $_setUnsignedInt32(31, v);
  }

  @$pb.TagNumber(32)
  $core.bool hasHasVideo_32() => $_has(31);
  @$pb.TagNumber(32)
  void clearHasVideo_32() => clearField(32);

  @$pb.TagNumber(33)
  $core.int get role => $_getIZ(32);
  @$pb.TagNumber(33)
  set role($core.int v) {
    $_setUnsignedInt32(32, v);
  }

  @$pb.TagNumber(33)
  $core.bool hasRole() => $_has(32);
  @$pb.TagNumber(33)
  void clearRole() => clearField(33);

  @$pb.TagNumber(34)
  $core.int get vipLevel => $_getIZ(33);
  @$pb.TagNumber(34)
  set vipLevel($core.int v) {
    $_setUnsignedInt32(33, v);
  }

  @$pb.TagNumber(34)
  $core.bool hasVipLevel() => $_has(33);
  @$pb.TagNumber(34)
  void clearVipLevel() => clearField(34);

  @$pb.TagNumber(35)
  $core.double get longitude => $_getN(34);
  @$pb.TagNumber(35)
  set longitude($core.double v) {
    $_setFloat(34, v);
  }

  @$pb.TagNumber(35)
  $core.bool hasLongitude() => $_has(34);
  @$pb.TagNumber(35)
  void clearLongitude() => clearField(35);

  @$pb.TagNumber(36)
  $core.double get latitude => $_getN(35);
  @$pb.TagNumber(36)
  set latitude($core.double v) {
    $_setFloat(35, v);
  }

  @$pb.TagNumber(36)
  $core.bool hasLatitude() => $_has(35);
  @$pb.TagNumber(36)
  void clearLatitude() => clearField(36);

  @$pb.TagNumber(37)
  $core.int get virtualMan => $_getIZ(36);
  @$pb.TagNumber(37)
  set virtualMan($core.int v) {
    $_setUnsignedInt32(36, v);
  }

  @$pb.TagNumber(37)
  $core.bool hasVirtualMan() => $_has(36);
  @$pb.TagNumber(37)
  void clearVirtualMan() => clearField(37);

  @$pb.TagNumber(38)
  $core.int get titleNew => $_getIZ(37);
  @$pb.TagNumber(38)
  set titleNew($core.int v) {
    $_setUnsignedInt32(37, v);
  }

  @$pb.TagNumber(38)
  $core.bool hasTitleNew() => $_has(37);
  @$pb.TagNumber(38)
  void clearTitleNew() => clearField(38);

  @$pb.TagNumber(39)
  $core.int get appId => $_getIZ(38);
  @$pb.TagNumber(39)
  set appId($core.int v) {
    $_setUnsignedInt32(38, v);
  }

  @$pb.TagNumber(39)
  $core.bool hasAppId() => $_has(38);
  @$pb.TagNumber(39)
  void clearAppId() => clearField(39);

  @$pb.TagNumber(40)
  $core.List<AccountInfoHeader> get photos => $_getList(39);

  @$pb.TagNumber(41)
  AccountInfoVideo get videoInfo => $_getN(40);
  @$pb.TagNumber(41)
  set videoInfo(AccountInfoVideo v) {
    setField(41, v);
  }

  @$pb.TagNumber(41)
  $core.bool hasVideoInfo() => $_has(40);
  @$pb.TagNumber(41)
  void clearVideoInfo() => clearField(41);
  @$pb.TagNumber(41)
  AccountInfoVideo ensureVideoInfo() => $_ensure(40);

  @$pb.TagNumber(42)
  $core.int get modifySexDisabled => $_getIZ(41);
  @$pb.TagNumber(42)
  set modifySexDisabled($core.int v) {
    $_setUnsignedInt32(41, v);
  }

  @$pb.TagNumber(42)
  $core.bool hasModifySexDisabled() => $_has(41);
  @$pb.TagNumber(42)
  void clearModifySexDisabled() => clearField(42);

  @$pb.TagNumber(43)
  AccountSexInfo get sexInfo => $_getN(42);
  @$pb.TagNumber(43)
  set sexInfo(AccountSexInfo v) {
    setField(43, v);
  }

  @$pb.TagNumber(43)
  $core.bool hasSexInfo() => $_has(42);
  @$pb.TagNumber(43)
  void clearSexInfo() => clearField(43);
  @$pb.TagNumber(43)
  AccountSexInfo ensureSexInfo() => $_ensure(42);

  @$pb.TagNumber(44)
  AccountInfoCard get card => $_getN(43);
  @$pb.TagNumber(44)
  set card(AccountInfoCard v) {
    setField(44, v);
  }

  @$pb.TagNumber(44)
  $core.bool hasCard() => $_has(43);
  @$pb.TagNumber(44)
  void clearCard() => clearField(44);
  @$pb.TagNumber(44)
  AccountInfoCard ensureCard() => $_ensure(43);

  @$pb.TagNumber(45)
  $core.List<AccountTags> get tags => $_getList(44);

  @$pb.TagNumber(46)
  $core.List<AccountTags> get friendTags => $_getList(45);

  @$pb.TagNumber(47)
  $core.int get header => $_getIZ(46);
  @$pb.TagNumber(47)
  set header($core.int v) {
    $_setUnsignedInt32(46, v);
  }

  @$pb.TagNumber(47)
  $core.bool hasHeader() => $_has(46);
  @$pb.TagNumber(47)
  void clearHeader() => clearField(47);
}

class ResAccountInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ResAccountInfo',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'msg')
    ..aOM<AccountInfo>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'data',
        subBuilder: AccountInfo.create)
    ..hasRequiredFields = false;

  ResAccountInfo._() : super();
  factory ResAccountInfo({
    $core.bool? success,
    $core.String? msg,
    AccountInfo? data,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory ResAccountInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ResAccountInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ResAccountInfo clone() => ResAccountInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ResAccountInfo copyWith(void Function(ResAccountInfo) updates) =>
      super.copyWith((message) => updates(message as ResAccountInfo))
          as ResAccountInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResAccountInfo create() => ResAccountInfo._();
  ResAccountInfo createEmptyInstance() => create();
  static $pb.PbList<ResAccountInfo> createRepeated() =>
      $pb.PbList<ResAccountInfo>();
  @$core.pragma('dart2js:noInline')
  static ResAccountInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResAccountInfo>(create);
  static ResAccountInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  AccountInfo get data => $_getN(2);
  @$pb.TagNumber(3)
  set data(AccountInfo v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  AccountInfo ensureData() => $_ensure(2);
}
