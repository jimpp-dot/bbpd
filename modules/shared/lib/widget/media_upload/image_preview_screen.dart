import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImagePreviewBean {
  final String url;
  double? width;
  double? height;

  String? heroTag;

  ImagePreviewBean({required this.url, this.width, this.height});

  String get cover375 {
    if (url.isNotEmpty) {
      return '$url!cover375';
    } else {
      return '';
    }
  }
}

/// 朋友圈图片预览页面
// ignore: must_be_immutable
class ImagePreviewScreen extends StatefulWidget {
  final List<ImagePreviewBean> images;
  final List<String>? heroTags;
  int index = 0;
  late PageController controller;

  static Future showImagePreviewScreen(
    BuildContext context, {
    Key? key,
    required List<ImagePreviewBean> images,
    required int index,
    List<String>? heroTags,
  }) {
    return Navigator.of(context).push(
      PageRouteBuilder(
        settings: const RouteSettings(name: 'photo_view_gallery_screen'),
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            FadeTransition(
          opacity: animation,
          child: ImagePreviewScreen(
            key: key,
            images: images,
            index: index,
            heroTags: heroTags,
          ),
        ),
      ),
    );
  }

  ImagePreviewScreen({
    super.key,
    required this.images,
    required this.index,
    this.heroTags,
  }) {
    controller = PageController(initialPage: index);
  }

  @override
  _ImagePreviewScreenState createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  int currentIndex = 0;
  late PhotoViewScaleStateController scaleStateController;

  double _dragEnd = 0.0;
  double _dragStart = 0.0;

  bool isPop = false;

  final Map<int, PhotoViewGalleryPageOptions> _options = {};

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
    scaleStateController = PhotoViewScaleStateController();
  }

  @override
  void dispose() {
    scaleStateController.dispose();
    super.dispose();
  }

  void _back() {
    if (isPop) {
      return;
    }
    isPop = true;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          children: <Widget>[
            PositionedDirectional(
              top: 0,
              start: 0,
              bottom: 0,
              end: 0,
              child: GestureDetector(
                onTap: _back,
                onLongPress: () async {
                  Log.d('onLongPress');
//                  _saveImage();
                },
                onVerticalDragStart: (details) {
                  _dragStart = details.globalPosition.dy;
                  Log.d('onVerticalDragStart, _dragStart: $_dragStart');
                },
                onVerticalDragUpdate: (details) {
                  _dragEnd = details.globalPosition.dy;
                  setState(() {});
                },
                onVerticalDragEnd: (details) {
                  Log.d(
                      'DEBUG: onVerticalDragEnd, deltaY: ${_dragEnd - _dragStart}, dy: ${details.velocity.pixelsPerSecond.dy}');

                  if (_dragEnd - _dragStart > 150 ||
                      details.velocity.pixelsPerSecond.dy > 500) {
                    if (isPop) {
                      return;
                    }
                    isPop = true;
                    Navigator.of(context).pop();
                  } else {
                    _dragEnd = _dragStart = 0;
                    setState(() {});
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: max(0.0, _dragEnd - _dragStart)),
                  child: PhotoViewGallery.builder(
                    scrollPhysics: const BouncingScrollPhysics(),
                    builder: (BuildContext context, int index) {
                      String? tags;
                      if (widget.heroTags != null &&
                          widget.heroTags!.length > index) {
                        if (currentIndex == index) {
                          tags = widget.heroTags![index];
                        } else {
                          // 防止滑动过程中退出，出现多个图片的Hero动画
                          tags = 'other_${widget.heroTags![index]}';
                        }
                      }
                      PhotoViewGalleryPageOptions option =
                          PhotoViewGalleryPageOptions(
                        gestureDetectorBehavior: HitTestBehavior.deferToChild,
                        minScale: PhotoViewComputedScale.contained,
                        maxScale: PhotoViewComputedScale.covered,
                        basePosition: Alignment.center,
                        initialScale: PhotoViewComputedScale.contained,
                        imageProvider: NetworkImage(widget.images[index].url),
                        heroAttributes: tags != null
                            ? PhotoViewHeroAttributes(tag: tags)
                            : null,
                      );

                      _options[index] = option;
                      return option;
                    },
                    customSize: MediaQuery.of(context).size,
                    itemCount: widget.images.length,
                    loadingBuilder: (context, event) {
                      ImagePreviewBean bean = widget.images[currentIndex];
                      String? tags = widget.heroTags != null &&
                              widget.heroTags!.length > currentIndex
                          ? widget.heroTags![currentIndex]
                          : null;
                      return tags != null
                          ? Hero(
                              tag: tags,
                              child: Image.network(
                                bean.cover375,
                                fit: BoxFit.contain,
                              ),
                            )
                          : Image.network(
                              bean.cover375,
                              fit: BoxFit.contain,
                            );
                    },
                    backgroundDecoration:
                        const BoxDecoration(color: Colors.black),
                    pageController: widget.controller,
                    enableRotation: false,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ),
            if (widget.images.length > 1)
              Positioned(
                //图片index显示
                bottom: MediaQuery.of(context).padding.bottom + 15,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: _buildPageDot(),
                ),
              ),
            PositionedDirectional(
              //右上角关闭按钮
              end: 10,
              top: MediaQuery.of(context).padding.top,
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (isPop) {
                    return;
                  }
                  isPop = true;
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageDot() {
    List<Widget> list = [];
    for (int i = 0; i < widget.images.length; ++i) {
      bool active = i == currentIndex;
      list.add(Container(
        key: Key("pagination_$i"),
        margin: const EdgeInsets.all(2),
        child: ClipOval(
          child: Container(
            color: active ? Colors.grey : Colors.white30,
            width: active ? 6 : 6,
            height: active ? 6 : 6,
          ),
        ),
      ));
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: list,
    );
  }

//  _saveImage() async {
//    List<SheetItem> res = [];
//    res.add(SheetItem(R.string('save_photo'), "save"));
//    SheetCallback sheetCallback = await displayModalBottomSheet(
//        context: this.context,
//        builder: (BuildContext context) {
//          return RadioBottomSheet(data: res);
//        });
//    if (sheetCallback == null || sheetCallback.reason == SheetCloseReason.Active) {
//      return;
//    }
//
//    if (Platform.isAndroid) {
//      PermissionStatus cameraPermission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
//      if (cameraPermission != PermissionStatus.granted) {
//        await PermissionHandler().requestPermissions([PermissionGroup.storage]);
//        return;
//      }
//    }
//
//    PhotoViewGalleryPageOptions option = _options[currentIndex];
//    Directory dir = Directory(Constant.temporaryDirectory.path);
//    await dir.create(recursive: true);
//
//    List<int> bytes = utf8.encode(widget.images[currentIndex].url);
//    Digest digest = sha1.convert(bytes);
//    String key = digest.toString().toLowerCase();
//
//    ui.Image img = await MomentUtils.loadImageByProvider(option.imageProvider);
//    File file = await MomentUtils.saveImage(img, join(dir.path, key + '.v2.png'));
//    img.dispose();
//    if (sheetCallback.value.key == 'save') {
//      String result = await ImagePicker.saveToCameraRoll(file.path);
//      if (result != null && result is String) {
//        Fluttertoast.showToast(msg: K.save_failed);
//      } else {
//        Fluttertoast.showToast(msg: R.string('save_success'));
//      }
//    }
//  }
}
