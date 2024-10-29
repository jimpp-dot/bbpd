///
//  Generated code. Do not modify.
//  source: common_full_screen.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SendCommonFullScreen extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SendCommonFullScreen',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'show_time',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'back_img')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'jump_path')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'front')
    ..aOM<CommonScreenExtra>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'common_screen_extra',
        subBuilder: CommonScreenExtra.create)
    ..hasRequiredFields = false;

  SendCommonFullScreen._() : super();
  factory SendCommonFullScreen({
    $core.int? showTime,
    $core.String? backImg,
    $core.String? jumpPath,
    $core.String? type,
    $core.String? front,
    CommonScreenExtra? commonScreenExtra,
  }) {
    final _result = create();
    if (showTime != null) {
      _result.showTime = showTime;
    }
    if (backImg != null) {
      _result.backImg = backImg;
    }
    if (jumpPath != null) {
      _result.jumpPath = jumpPath;
    }
    if (type != null) {
      _result.type = type;
    }
    if (front != null) {
      _result.front = front;
    }
    if (commonScreenExtra != null) {
      _result.commonScreenExtra = commonScreenExtra;
    }
    return _result;
  }
  factory SendCommonFullScreen.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SendCommonFullScreen.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SendCommonFullScreen clone() =>
      SendCommonFullScreen()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SendCommonFullScreen copyWith(void Function(SendCommonFullScreen) updates) =>
      super.copyWith((message) => updates(message as SendCommonFullScreen))
          as SendCommonFullScreen; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendCommonFullScreen create() => SendCommonFullScreen._();
  SendCommonFullScreen createEmptyInstance() => create();
  static $pb.PbList<SendCommonFullScreen> createRepeated() =>
      $pb.PbList<SendCommonFullScreen>();
  @$core.pragma('dart2js:noInline')
  static SendCommonFullScreen getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendCommonFullScreen>(create);
  static SendCommonFullScreen? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get showTime => $_getIZ(0);
  @$pb.TagNumber(1)
  set showTime($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasShowTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearShowTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get backImg => $_getSZ(1);
  @$pb.TagNumber(2)
  set backImg($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBackImg() => $_has(1);
  @$pb.TagNumber(2)
  void clearBackImg() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get jumpPath => $_getSZ(2);
  @$pb.TagNumber(3)
  set jumpPath($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasJumpPath() => $_has(2);
  @$pb.TagNumber(3)
  void clearJumpPath() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get front => $_getSZ(4);
  @$pb.TagNumber(5)
  set front($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasFront() => $_has(4);
  @$pb.TagNumber(5)
  void clearFront() => clearField(5);

  @$pb.TagNumber(6)
  CommonScreenExtra get commonScreenExtra => $_getN(5);
  @$pb.TagNumber(6)
  set commonScreenExtra(CommonScreenExtra v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCommonScreenExtra() => $_has(5);
  @$pb.TagNumber(6)
  void clearCommonScreenExtra() => clearField(6);
  @$pb.TagNumber(6)
  CommonScreenExtra ensureCommonScreenExtra() => $_ensure(5);
}

class AvatarZone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AvatarZone',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'left_image')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'right_image')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image_size',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'interval',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  AvatarZone._() : super();
  factory AvatarZone({
    $core.String? leftImage,
    $core.String? rightImage,
    $core.int? imageSize,
    $core.int? interval,
  }) {
    final _result = create();
    if (leftImage != null) {
      _result.leftImage = leftImage;
    }
    if (rightImage != null) {
      _result.rightImage = rightImage;
    }
    if (imageSize != null) {
      _result.imageSize = imageSize;
    }
    if (interval != null) {
      _result.interval = interval;
    }
    return _result;
  }
  factory AvatarZone.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AvatarZone.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AvatarZone clone() => AvatarZone()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AvatarZone copyWith(void Function(AvatarZone) updates) =>
      super.copyWith((message) => updates(message as AvatarZone))
          as AvatarZone; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AvatarZone create() => AvatarZone._();
  AvatarZone createEmptyInstance() => create();
  static $pb.PbList<AvatarZone> createRepeated() => $pb.PbList<AvatarZone>();
  @$core.pragma('dart2js:noInline')
  static AvatarZone getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AvatarZone>(create);
  static AvatarZone? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get leftImage => $_getSZ(0);
  @$pb.TagNumber(1)
  set leftImage($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLeftImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearLeftImage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get rightImage => $_getSZ(1);
  @$pb.TagNumber(2)
  set rightImage($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRightImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearRightImage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get imageSize => $_getIZ(2);
  @$pb.TagNumber(3)
  set imageSize($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImageSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearImageSize() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get interval => $_getIZ(3);
  @$pb.TagNumber(4)
  set interval($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasInterval() => $_has(3);
  @$pb.TagNumber(4)
  void clearInterval() => clearField(4);
}

class CommonScreenExtra extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CommonScreenExtra',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<ImageZone>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image_zone',
        $pb.PbFieldType.PM,
        subBuilder: ImageZone.create)
    ..pc<ContentZone>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'up_content_zone',
        $pb.PbFieldType.PM,
        subBuilder: ContentZone.create)
    ..pc<ContentZone>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'down_content_zone',
        $pb.PbFieldType.PM,
        subBuilder: ContentZone.create)
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'left_margin',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'right_margin',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mid_margin',
        $pb.PbFieldType.OU3)
    ..aOM<AvatarZone>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'avatar_zone',
        subBuilder: AvatarZone.create)
    ..a<$core.int>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mid_line',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  CommonScreenExtra._() : super();
  factory CommonScreenExtra({
    $core.Iterable<ImageZone>? imageZone,
    $core.Iterable<ContentZone>? upContentZone,
    $core.Iterable<ContentZone>? downContentZone,
    $core.int? leftMargin,
    $core.int? rightMargin,
    $core.int? midMargin,
    AvatarZone? avatarZone,
    $core.int? midLine,
  }) {
    final _result = create();
    if (imageZone != null) {
      _result.imageZone.addAll(imageZone);
    }
    if (upContentZone != null) {
      _result.upContentZone.addAll(upContentZone);
    }
    if (downContentZone != null) {
      _result.downContentZone.addAll(downContentZone);
    }
    if (leftMargin != null) {
      _result.leftMargin = leftMargin;
    }
    if (rightMargin != null) {
      _result.rightMargin = rightMargin;
    }
    if (midMargin != null) {
      _result.midMargin = midMargin;
    }
    if (avatarZone != null) {
      _result.avatarZone = avatarZone;
    }
    if (midLine != null) {
      _result.midLine = midLine;
    }
    return _result;
  }
  factory CommonScreenExtra.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CommonScreenExtra.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CommonScreenExtra clone() => CommonScreenExtra()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CommonScreenExtra copyWith(void Function(CommonScreenExtra) updates) =>
      super.copyWith((message) => updates(message as CommonScreenExtra))
          as CommonScreenExtra; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommonScreenExtra create() => CommonScreenExtra._();
  CommonScreenExtra createEmptyInstance() => create();
  static $pb.PbList<CommonScreenExtra> createRepeated() =>
      $pb.PbList<CommonScreenExtra>();
  @$core.pragma('dart2js:noInline')
  static CommonScreenExtra getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CommonScreenExtra>(create);
  static CommonScreenExtra? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ImageZone> get imageZone => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<ContentZone> get upContentZone => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<ContentZone> get downContentZone => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get leftMargin => $_getIZ(3);
  @$pb.TagNumber(4)
  set leftMargin($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLeftMargin() => $_has(3);
  @$pb.TagNumber(4)
  void clearLeftMargin() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get rightMargin => $_getIZ(4);
  @$pb.TagNumber(5)
  set rightMargin($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRightMargin() => $_has(4);
  @$pb.TagNumber(5)
  void clearRightMargin() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get midMargin => $_getIZ(5);
  @$pb.TagNumber(6)
  set midMargin($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMidMargin() => $_has(5);
  @$pb.TagNumber(6)
  void clearMidMargin() => clearField(6);

  @$pb.TagNumber(7)
  AvatarZone get avatarZone => $_getN(6);
  @$pb.TagNumber(7)
  set avatarZone(AvatarZone v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasAvatarZone() => $_has(6);
  @$pb.TagNumber(7)
  void clearAvatarZone() => clearField(7);
  @$pb.TagNumber(7)
  AvatarZone ensureAvatarZone() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.int get midLine => $_getIZ(7);
  @$pb.TagNumber(8)
  set midLine($core.int v) {
    $_setUnsignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasMidLine() => $_has(7);
  @$pb.TagNumber(8)
  void clearMidLine() => clearField(8);
}

class ImageZone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ImageZone',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'image')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'corner_angle',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ImageZone._() : super();
  factory ImageZone({
    $core.String? image,
    $core.String? color,
    $core.int? cornerAngle,
  }) {
    final _result = create();
    if (image != null) {
      _result.image = image;
    }
    if (color != null) {
      _result.color = color;
    }
    if (cornerAngle != null) {
      _result.cornerAngle = cornerAngle;
    }
    return _result;
  }
  factory ImageZone.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ImageZone.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ImageZone clone() => ImageZone()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ImageZone copyWith(void Function(ImageZone) updates) =>
      super.copyWith((message) => updates(message as ImageZone))
          as ImageZone; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImageZone create() => ImageZone._();
  ImageZone createEmptyInstance() => create();
  static $pb.PbList<ImageZone> createRepeated() => $pb.PbList<ImageZone>();
  @$core.pragma('dart2js:noInline')
  static ImageZone getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageZone>(create);
  static ImageZone? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get image => $_getSZ(0);
  @$pb.TagNumber(1)
  set image($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearImage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get color => $_getSZ(1);
  @$pb.TagNumber(2)
  set color($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearColor() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get cornerAngle => $_getIZ(2);
  @$pb.TagNumber(3)
  set cornerAngle($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCornerAngle() => $_has(2);
  @$pb.TagNumber(3)
  void clearCornerAngle() => clearField(3);
}

class ContentZone extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ContentZone',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type',
        $pb.PbFieldType.OU3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'color')
    ..a<$core.int>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'width',
        $pb.PbFieldType.OU3)
    ..a<$core.int>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'height',
        $pb.PbFieldType.OU3)
    ..aOB(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'is_bold')
    ..a<$core.int>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'words_limit',
        $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  ContentZone._() : super();
  factory ContentZone({
    $core.int? type,
    $core.String? content,
    $core.String? color,
    $core.int? width,
    $core.int? height,
    $core.bool? isBold,
    $core.int? wordsLimit,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (content != null) {
      _result.content = content;
    }
    if (color != null) {
      _result.color = color;
    }
    if (width != null) {
      _result.width = width;
    }
    if (height != null) {
      _result.height = height;
    }
    if (isBold != null) {
      _result.isBold = isBold;
    }
    if (wordsLimit != null) {
      _result.wordsLimit = wordsLimit;
    }
    return _result;
  }
  factory ContentZone.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ContentZone.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ContentZone clone() => ContentZone()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ContentZone copyWith(void Function(ContentZone) updates) =>
      super.copyWith((message) => updates(message as ContentZone))
          as ContentZone; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContentZone create() => ContentZone._();
  ContentZone createEmptyInstance() => create();
  static $pb.PbList<ContentZone> createRepeated() => $pb.PbList<ContentZone>();
  @$core.pragma('dart2js:noInline')
  static ContentZone getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ContentZone>(create);
  static ContentZone? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get type => $_getIZ(0);
  @$pb.TagNumber(1)
  set type($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get color => $_getSZ(2);
  @$pb.TagNumber(3)
  set color($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasColor() => $_has(2);
  @$pb.TagNumber(3)
  void clearColor() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get width => $_getIZ(3);
  @$pb.TagNumber(4)
  set width($core.int v) {
    $_setUnsignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasWidth() => $_has(3);
  @$pb.TagNumber(4)
  void clearWidth() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get height => $_getIZ(4);
  @$pb.TagNumber(5)
  set height($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasHeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeight() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isBold => $_getBF(5);
  @$pb.TagNumber(6)
  set isBold($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasIsBold() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsBold() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get wordsLimit => $_getIZ(6);
  @$pb.TagNumber(7)
  set wordsLimit($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasWordsLimit() => $_has(6);
  @$pb.TagNumber(7)
  void clearWordsLimit() => clearField(7);
}
