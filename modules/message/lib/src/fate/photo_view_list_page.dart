import 'dart:math';
import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

/// 图片预览页面
class PhotoViewListPage extends StatefulWidget {
  final List<String> images;
  final List<String> heroTags;
  final int index;

  static Future show(
    BuildContext context, {
    required List<String> images,
    int index = 0,
    required List<String> heroTags,
  }) {
    return Navigator.of(context).push(
      PageRouteBuilder(
        settings: const RouteSettings(name: 'PhotoViewListPage'),
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation secondaryAnimation) =>
            FadeTransition(
          opacity: animation,
          child: PhotoViewListPage(
            images: images,
            index: index,
            heroTags: heroTags,
          ),
        ),
      ),
    );
  }

  const PhotoViewListPage({
    super.key,
    required this.images,
    required this.index,
    required this.heroTags,
  });

  @override
  PhotoViewListState createState() {
    return PhotoViewListState();
  }
}

class PhotoViewListState extends State<PhotoViewListPage> {
  int currentIndex = 0;
  double _dragEnd = 0.0;
  double _dragStart = 0.0;
  bool isPop = false;
  Map<int, PhotoViewScaleStateController> scaleStateControllers = {};
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
    _controller = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    for (var element in scaleStateControllers.values) {
      element.dispose();
    }
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Colors.black),
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: _buildNormal(),
        ),
      ),
    );
  }

  Widget _buildNormal() {
    return Stack(
      children: <Widget>[
        _buildContent(),
        if (widget.images.length > 1)
          Positioned(
            //图片index显示 bottom: MediaQuery.of(context).padding.bottom + 15,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: _buildPageDot(),
            ),
          ),
        PositionedDirectional(
          //右上角关闭按钮 end: 10,
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
    );
  }

  Widget _buildContent() {
    PhotoViewScaleStateController? scaleStateController =
        scaleStateControllers[currentIndex];
    return Positioned.fill(
      child: Listener(
        onPointerDown: (details) {
          if (scaleStateController != null && scaleStateController.isZooming)
            return;
          _dragStart = details.position
              .dy; // Log.d('onVerticalDragStart, _dragStart: $_dragStart');
        },
        onPointerMove: (details) {
          if (scaleStateController != null && scaleStateController.isZooming)
            return;
          _dragEnd = details.position.dy;
          setState(() {});
        },
        onPointerUp: (details) {
          if (scaleStateController != null && scaleStateController.isZooming)
            return;
          if (_dragEnd - _dragStart > 150) {
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
          child: Stack(
            children: <Widget>[
              PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                customSize: MediaQuery.of(context).size,
                itemCount: widget.images.length,
                backgroundDecoration: const BoxDecoration(color: Colors.black),
                pageController: _controller,
                enableRotation: false,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                builder: (BuildContext context, int index) {
                  String tags = '';
                  if (widget.heroTags.length > index) {
                    if (currentIndex == index) {
                      tags = widget.heroTags[index];
                    } else {
                      // 防止滑动过程中退出，出现多个图片的Hero动画 tags = 'other_${widget.heroTags[index]}';
                    }
                  }
                  if (!scaleStateControllers.containsKey(index)) {
                    scaleStateControllers[index] =
                        PhotoViewScaleStateController();
                  }
                  PhotoViewGalleryPageOptions option =
                      PhotoViewGalleryPageOptions(
                    scaleStateController: scaleStateControllers[index],
                    gestureDetectorBehavior: HitTestBehavior.deferToChild,
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered,
                    basePosition: Alignment.center,
                    initialScale: PhotoViewComputedScale.contained,
                    imageProvider:
                        NetworkImage(cover375(widget.images[index]) ?? ''),
                    heroAttributes: PhotoViewHeroAttributes(tag: tags),
                  );
                  return option;
                },
                loadingBuilder: (context, event) {
                  if (currentIndex > widget.images.length - 1) {
                    return const CupertinoActivityIndicator();
                  }
                  String url = widget.images[currentIndex];
                  String? tags = widget.heroTags.length > currentIndex
                      ? widget.heroTags[currentIndex]
                      : null;
                  return tags != null
                      ? Hero(
                          tag: tags,
                          child: CachedNetworkImage(
                            imageUrl: cover375(url),
                            fit: BoxFit.contain,
                          ),
                        )
                      : CachedNetworkImage(
                          imageUrl: cover375(url),
                          fit: BoxFit.contain,
                        );
                },
              ),
            ],
          ),
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

  String? cover375(String? url) {
    if (url == null || url.isEmpty) {
      return url;
    }
    String result = url;
    if (!result.startsWith(RegExp(r'http(s?)://'))) {
      result = System.imageDomain + result;
    }
    if (!result.contains(RegExp(r'!cover(\d+)')) &&
        !result.contains(RegExp(r'!head(\d+)'))) {
      result = '$result!cover375';
    }
    return result;
  }
}
