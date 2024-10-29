import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:shared/shared.dart';
import 'package:shared/k.dart' as BaseK;
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moment/k.dart';
import 'package:moment/moment.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo/photo.dart';
import 'package:photo_manager/photo_manager.dart';

class MomentUtils {
  /// 朋友圈上传图片
  /// [images] 图片
  static Future<List<String>?> uploadImages(BuildContext context,
      {List<DragImageBean>? images}) async {
    List<String> imageUrl = [];

    if (images == null || images.isEmpty) {
      return null;
    }

    // var result = await Future.wait(images.map((e) => testCompressAndGetFile(context, e.file)));
    // if (result != null) {
    //   imageUrl.addAll(result.where((element) => element != null));
    // }

    await Future.forEach(images, (element) async {
      File file = element.file!;
      String? result = await testCompressAndGetFile(context, file);
      if (result != null && result.isNotEmpty) {
        imageUrl.add(result);
      }
    });
    Log.d('uploadImages:${imageUrl.toString()}');
    return imageUrl;
  }

  /// 上传单张图片
  static Future<String?> uploadSingleImage(
      BuildContext context, Uint8List image) async {
    Completer<String?> completer = Completer();

    ImageUploadState.uploadImageUint8List(
        imageData: image,
        uploadUrl: '${System.domain}upload/image/',
        onComplete: (Map? data) {
          if (data != null) {
            String url = data['name'];
            var width = data['width'];
            var height = data['height'];
            completer.complete('$url?$width*$height');
          } else {
            completer.complete(null);
          }
        },
        onError: (String error) {
          Fluttertoast.showToast(msg: error, gravity: ToastGravity.CENTER);
          completer.complete(null);
        });

    return completer.future;
  }

  /// reutrn {"cover":"video\/103273408_5dccd1e5f3f6f6.17345652.jpg","video":"video\/103273408_5dccd1e5f3f6f6.17345652.mov"}
  /// [video] 上传视频地址
  static Future<Map?> uploadVideo(BuildContext context, File video) async {
//    if (await video.length() > 30 * 1024 * 1024) {
//      Fluttertoast.showToast(msg: R.string('upload_error_size_too_big'));
//      return null;
//    }

    Completer<Map?> completer = Completer<Map>();

    VideoUpload.upload(
        file: video,
        onComplete: (Map data) {
          completer.complete(data);
        },
        onError: (String? tips) {
          Fluttertoast.showToast(
            msg: tips ?? BaseK.K.upload_error_retry,
            gravity: ToastGravity.CENTER,
          );
          completer.complete(null);
        });

    // {"cover":"video\/103273408_5dccd1e5f3f6f6.17345652.jpg","video":"video\/103273408_5dccd1e5f3f6f6.17345652.mov"}
    return completer.future;
  }

  /// a.图片宽高均≤1280px时，图片尺寸保持不变，图片压缩处理quality=90%； 图片size>500K quality=70%
  /// b.宽或高均＞1280px——图片宽高比≤3，则将图片宽或者高取大的等比压缩至1280px，图片压缩处理quality=90%；
  ///   但是图片宽高比＞3时，则宽或者高取小的等比压缩至1280px，图片压缩处理quality=50%； 图片size>500K quality=50%
  /// c.宽高一个＞1280px，另一个＜1280px，但是图片宽高比＞3时，则宽高尺寸不变，图片压缩处理quality=95%。
  static Future<String?> testCompressAndGetFile(
      BuildContext context, File file) async {
    try {
      Uint8List imageData = file.readAsBytesSync();
      Log.d('before compress: ${file.path}');

      int fileLength = await file.length();

      // ui.Image snapshot = await decodeImageFromList(imageData);
      ui.Image snapshot = await loadImageByProvider(FileImage(file));
      var scaleW = 1.0;
      var scaleH = 1.0;
      var scale = 1.0;
      int quality = 90;

      Log.d('before compress: ${snapshot.width} * ${snapshot.height}');
      if (snapshot.width <= 1280 && snapshot.height <= 1280) {
        scaleW = 1.0;
        scaleH = 1.0;
        scale = 1.0;
        if (fileLength > 500 * 1024) {
          quality = 70;
        }
      } else if (snapshot.width > 1280 && snapshot.height > 1280) {
        /// 长图 or 宽图
        if (snapshot.width / snapshot.height > 3 ||
            snapshot.height / snapshot.width > 3) {
          scaleW = snapshot.width / 1280;
          scaleH = snapshot.height / 1280;
          scale = math.min(scaleW, scaleH);
          quality = 70;
          if (fileLength > 500 * 1024) {
            quality = 50;
          }
        } else {
          scaleW = snapshot.width / 1280;
          scaleH = snapshot.height / 1280;
          scale = math.max(1.0, math.max(scaleW, scaleH));
          quality = 80;
          if (fileLength > 500 * 1024) {
            quality = 70;
          }
        }
      } else if ((snapshot.width > 1280 && snapshot.height < 1280) ||
          (snapshot.width < 1280 && snapshot.height > 1280)) {
        /// 长图 or 宽图
        if (snapshot.width / snapshot.height > 3 ||
            snapshot.height / snapshot.width > 3) {
          scaleW = 1.0;
          scaleH = 1.0;
          scale = 1.0;
          quality = 80;
          if (fileLength > 500 * 1024) {
            quality = 50;
          }
        } else {
          scaleW = snapshot.width / 1280;
          scaleH = snapshot.height / 1280;

          scale = math.max(1.0, math.max(scaleW, scaleH));
        }
      }

      Log.d('compress $scale');

      int height = snapshot.height ~/ scale;
      int width = snapshot.width ~/ scale;

      Log.d('compress $width * $height  *  $quality');
      Uint8List result = await FlutterImageCompress.compressWithList(
        imageData,
        minWidth: width,
        minHeight: height,
        quality: quality,
        keepExif: true,
      );
      return uploadSingleImage(context, result);
    } catch (e) {
      Fluttertoast.showToast(msg: K.moment_image_compress_failed);
      return null;
    }
  }

  //通过ImageProvider读取Image
  static Future<ui.Image> loadImageByProvider(
    ImageProvider provider, {
    ImageConfiguration config = ImageConfiguration.empty,
  }) async {
    Completer<ui.Image> completer = Completer<ui.Image>(); //完成的回调
    ImageStreamListener? listener;
    ImageStream stream = provider.resolve(config); //获取图片流
    listener = ImageStreamListener((ImageInfo frame, bool sync) {
      //监听
      final ui.Image image = frame.image;
      completer.complete(image); //完成
      stream.removeListener(listener!); //移除监听
    });
    stream.addListener(listener); //添加监听
    return completer.future; //返回
  }

  static Future<List<File>?> pickImage(BuildContext context,
      {int maxSelected = 9}) async {
    if (Platform.isAndroid) {
      // Android获取storage权限
      PermissionStatus storagePermission =
          await PermissionUtil.checkAndRequestPermissions(
              context, Permission.storage);
      if (storagePermission != PermissionStatus.granted) {
        return [];
      }
    } else if (Platform.isIOS) {
      // Android获取photos权限
      PermissionStatus photosPermission =
          await PermissionUtil.checkAndRequestPermissions(
              context, Permission.photos);
      if (photosPermission != PermissionStatus.granted) {
        return [];
      }
    }

    if (Platform.isIOS && Util.compareSystemVersion('14.0') >= 0) {
      List<File>? files = await ImagePicker.pickImages(
          source: ImageSource.gallery, count: maxSelected);
      return files;
    }

    List<AssetEntity>? imgList = await PhotoPicker.pickAsset(
      context: context,
      textColor: R.color.mainTextColor,
      padding: 1.0,
      dividerColor: R.color.dividerColor,
      disableColor: R.color.mainTextColor,
      itemRadio: 1,
      maxSelected: maxSelected,
      themeColor: R.color.mainBgColor,
      provider: I18nProvider.chinese,
      rowCount: 3,
      thumbSize: 128,
      sortDelegate: SortDelegate.common,
      // default is common ,or you make custom delegate to sort your gallery
      checkBoxBuilderDelegate: DefaultCheckBoxBuilderDelegate(
        activeColor: Colors.white,
        unselectedColor: Colors.white,
        checkColor: R.color.mainBrandColor,
      ),

      loadingDelegate: SimpleLoadingDelegate(),
      // if you want to build custom loading widget,extends LoadingDelegate, [see example/lib/main.dart]

      badgeDelegate: const DurationBadgeDelegate(),
      // badgeDelegate to show badge widget

      pickType: PickType.onlyImage,

      photoPathList: null,
    );

    Log.d(imgList);
    List<File> allImagesPath = [];
    if (imgList == null) {
      return allImagesPath;
    } else {
      for (var asset in imgList) {
        try {
          File? file = await asset.file;
          if (file == null) continue;

          /// iOS系统相册编辑图片后从asset.file取到的图片是编辑前的，需要手动转一遍
          if (Platform.isIOS ||
              (await file.exists() &&
                  file.path.toLowerCase().endsWith('.heic'))) {
            file = await _convertHeicImageToJpeg(asset, file);
          }
          if (file == null) continue;
          Log.d('covert heic path: ${file.path}');
          allImagesPath.add(file);
        } catch (e) {
          Log.d(e);
        }
      }
    }

    return allImagesPath;
  }

  static Future<File?> _convertHeicImageToJpeg(
      AssetEntity asset, File originImageFile) async {
    Uint8List? jpegBytes = await asset
        .thumbnailDataWithSize(ThumbnailSize(asset.width, asset.height));
    if (jpegBytes == null) return null;
    Directory dir =
        Directory(join(Constant.temporaryDirectory.path, 'converted'));
    await dir.create(recursive: true);

    List<int> bytes = utf8.encode(originImageFile.path);
    Digest digest = sha1.convert(bytes);
    String key = digest.toString().toLowerCase();
    File convertedImageFile = File(join(dir.path, '$key.jpg'));
    convertedImageFile.writeAsBytes(jpegBytes);
    return convertedImageFile;
  }

  static bool needFold(String text, int maxLine, double maxWidth,
      {TextStyle? textStyle}) {
    return reachMaxLine(text, maxLine, maxWidth, textStyle: textStyle);
  }

  static bool reachMaxLine(String? text, int maxLine, double maxWidth,
      {TextStyle? textStyle}) {
    if (text == null || text.isEmpty) {
      return false;
    }
    TextPainter textPainter = TextPainter(
      maxLines: maxLine,
      text: TextSpan(
        text: text.trim(),
        style: textStyle ??
            TextStyle(fontSize: 15.0, color: R.color.mainTextColor),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);
    if (textPainter.didExceedMaxLines) {
      return true;
    } else {
      return false;
    }
  }

  ///对图片重定义宽高尺寸[dstWidth],[dstHeight]
  static Future<ui.Image> resize(ui.Image image, int dstWidth, int dstHeight) {
    var recorder = ui.PictureRecorder(); //使用PictureRecorder对图片进行录制
    Paint paint = Paint();
    Canvas canvas = Canvas(recorder);
    double srcWidth = image.width.toDouble();
    double srcHeight = image.height.toDouble();
    canvas.drawImageRect(
        image, //使用drawImageRect对图片进行定尺寸填充
        Rect.fromLTWH(0, 0, srcWidth, srcHeight),
        Rect.fromLTWH(0, 0, dstWidth.toDouble(), dstHeight.toDouble()),
        paint);
    return recorder.endRecording().toImage(dstWidth, dstHeight); //返回图片
  }

  //保存一个Image
  static Future<File?> saveImage(ui.Image image, String path,
      {format = ui.ImageByteFormat.png}) async {
    var file = File(path);
    if (!await file.exists()) {
      await file.create(recursive: true);
    }
    ByteData? byteData = await image.toByteData(format: format);
    if (byteData == null) return null;
    Uint8List pngBytes = byteData.buffer.asUint8List();
    return file.writeAsBytes(pngBytes);
  }

  /// 分享动态
  static void shareMoment(BuildContext context, Moment moment) async {
    ISettingManager settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    Map? map;
    MomentType type = moment.type;
    if (type == MomentType.text ||
        type == MomentType.picture ||
        type == MomentType.video) {
      map = getShareExtra(moment);
    }

    settingManager.share(context, moment.uid,
        tp: 8, topicId: moment.topicId, extra: map);
  }

  //根据字符串pageType返回PageType
  static PageType? getPageType(String? pageType) {
    if ('broadcast' == pageType) {
      return PageType.Broadcast;
    } else if ('case' == pageType) {
      return PageType.Case;
    } else if ('discovery' == pageType) {
      return PageType.Discovery;
    } else if ('playtag' == pageType) {
      return PageType.PlayTag;
    } else if ('recommend' == pageType) {
      return PageType.Recommend;
    } else if ('tag' == pageType) {
      return PageType.Tag;
    }
    return null;
  }

  static CaseTag? getCaseTag(Map? tagJson) {
    if (tagJson != null) {
      return CaseTag(
        Util.parseInt(tagJson['cid'], 0),
        '${tagJson['title']}',
        '${tagJson['icon']}',
      );
    }
    return null;
  }

  static Map getShareExtra(Moment moment) {
    List<String> keys = [
      'topic_id',
      'uid',
      'name',
      'icon',
      'content',
      'atype',
      'attach',
      'cover',
      'isWork'
    ];
    Map map = moment.toJson();
    if (moment.images != null && moment.images!.length > 3) {
      map['attach'] = moment.images!.sublist(0, 3);
    }
    map['isWork'] = moment.workInfo ?? false;
    map.removeWhere((key, value) => !keys.contains(key));
    map['type'] = 'share_moment';
    return map;
  }
}

/// 数数平台数据上报
/// 信息流点击
trackerReport(
    {required Moment? moment,
    required MomentFlowPage? page,
    required String? clickType,
    String? topicName}) {
  if (moment == null || page == null || clickType == null || clickType.isEmpty)
    return;

  Api.reportCircleClick(moment.topicId);

  Tracker.instance.track(TrackEvent.click_flow, properties: {
    'moment_id': moment.topicId,
    'owner_uid': moment.uid,
    'flow_type': moment.flowType,
    'click_type': clickType,
    'tag': moment.reportTag,
    'subject_id': moment.reportTagIds,
    'page': getFlowPage(page),
    if (page == MomentFlowPage.NetDetail) 'net_page': '$topicName',
    if (page == MomentFlowPage.TopicDetail) 'topic_page': '$topicName',
  });
}

/// 数数平台数据上报
/// 信息流点击
trackerViewFlowReport(
    {required Moment? moment,
    required MomentFlowPage? page,
    String? topicName}) {
  if (moment == null || page == null) return;

  Tracker.instance.track(TrackEvent.view_flow, properties: {
    'page': getFlowPage(page),
    'flow_type': moment.flowType,
    'owner_uid': moment.uid,
    'moment_id': moment.topicId,
    'tag': moment.reportTag,
    'subject_id': moment.reportTagIds,
    if (page == MomentFlowPage.NetDetail) 'net_page': '$topicName',
    if (page == MomentFlowPage.TopicDetail) 'topic_page': '$topicName',
  });

  Api.reportStreamExposure(['circle_${moment.topicId}']);
}

void reportExposureTime(ExposureMoment? item, MomentFlowPage page) {
  if (item == null || item.moment == null || item.duration < 1000) return;
  // Log.d('_reportExposureTime: topicId: ${item.topicId}, duration: ${item.duration}');
}
