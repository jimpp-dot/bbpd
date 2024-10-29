import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moment/moment.dart';
import 'package:moment/src/album/moment_album_header.dart';
import 'package:moment/src/album/moment_album_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../k.dart';

/// 朋友圈图片预览页面
// ignore: must_be_immutable
class PhotoViewGalleryScreen extends StatefulWidget {
  final List<ImageBean> images;
  final String? refer;
  final List<String>? heroTags;
  final int index;
  final bool showAlbum; // 是否展现相册
  final int uid; // 展现相册必选
  final Moment? moment;

  static const String routeName = 'photo_view_gallery_screen';

  static Future showPhotoViewGalleryScreen(
    BuildContext context, {
    Key? key,
    required List<ImageBean> images,
    String? refer,
    int index = 0,
    List<String>? heroTags,
    bool showAlbum = false,
    int uid = 0,
    Moment? moment,
  }) {
    if (refer == null) {
      if (ModalRoute.of(context) != null) {
        refer = ModalRoute.of(context)?.settings.name;
      } else {
        refer = '';
      }
    }
    return Navigator.of(context).push(
      PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation secondaryAnimation) =>
            FadeTransition(
          opacity: animation,
          child: PhotoViewGalleryScreen(
            key: key,
            images: images,
            refer: refer,
            index: index,
            heroTags: heroTags,
            showAlbum: showAlbum,
            uid: uid,
            moment: moment,
          ),
        ),
      ),
    );
  }

  const PhotoViewGalleryScreen({
    super.key,
    required this.images,
    required this.refer,
    this.index = 0,
    this.heroTags,
    this.showAlbum = false,
    required this.uid,
    required this.moment,
  });

  @override
  _PhotoViewGalleryScreenState createState() => _PhotoViewGalleryScreenState();
}

class _PhotoViewGalleryScreenState extends State<PhotoViewGalleryScreen> {
  int currentIndex = 0;

  double _dragEnd = 0.0;
  double _dragStart = 0.0;

  bool isPop = false;

  final Map<int, PhotoViewGalleryPageOptions> _options = {};

  int _realCount = 0;

  bool _isInfoShow = true;

  AlbumUserInfo? _userInfo;

  bool _showAlbum = false;

  Map<int, PhotoViewScaleStateController> scaleStateControllers = {};
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _realCount = widget.images.length;
    _showAlbum = widget.showAlbum;
    currentIndex = widget.index;
    _controller = PageController(initialPage: currentIndex);
    if (_showAlbum) {
      _realCount += 1;
      _loadUserInfo();
    }
  }

  @override
  void dispose() {
    for (var element in scaleStateControllers.values) {
      element.dispose();
    }
    _controller.dispose();
    super.dispose();
  }

  _loadUserInfo() async {
    DataRsp<AlbumData> resp = await Api.getCirclePicsInfo(widget.uid);
    if (resp.success == true && resp.data != null) {
      _userInfo = resp.data!.info;
      _refresh();
    }
  }

  _saveImage() async {
    if (widget.showAlbum && currentIndex == widget.images.length) {
      return;
    }
    List<SheetItem> res = [];
    res.add(SheetItem(K.moment_save_photo, "save"));
    SheetCallback? sheetCallback = await displayModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return RadioBottomSheet(data: res, suppDarkTheme: true);
        });
    if (sheetCallback == null ||
        sheetCallback.reason == SheetCloseReason.Active) {
      return;
    }

    if (Platform.isAndroid) {
      PermissionStatus storagePermission =
          await PermissionUtil.checkAndRequestPermissions(
              context, Permission.storage);
      if (storagePermission != PermissionStatus.granted) {
        return;
      }
    }

    PhotoViewGalleryPageOptions option = _options[currentIndex]!;
    ui.Image img = await MomentUtils.loadImageByProvider(option.imageProvider!);
    ByteData? byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) return;
    Uint8List pngBytes = byteData.buffer.asUint8List();
    if (sheetCallback.value?.key == 'save') {
      String? result = await ImagePicker.saveByteDataImageToGallery(pngBytes);
      if (result != null) {
        Fluttertoast.showToast(msg: K.moment_save_photo_success);
      } else {
        Fluttertoast.showToast(msg: K.save_failed);
      }
    }
  }

  void _onFollowTap(String click) async {
    if (!Session.isLogined) {
      ILoginManager loginManager =
          ComponentManager.instance.getManager(ComponentManager.MANAGER_LOGIN);
      loginManager.show(context);
      return;
    }

    if (_userInfo?.isfollow == 0) {
      NormalNull response = await BaseRequestManager.onFollow(
          widget.moment?.uid.toString() ?? '');
      if (response.success) {
        _userInfo?.isfollow = 1;
        Fluttertoast.showToast(
            msg: K.moment_follow_success, gravity: ToastGravity.CENTER);

        Tracker.instance.track(TrackEvent.moment_picture_click, properties: {
          'click': click,
          'follow_uid': widget.moment?.uid,
        });
      } else {
        if (response.msg.isNotEmpty) {
          Fluttertoast.showToast(
              msg: response.msg, gravity: ToastGravity.CENTER);
        }
      }
      _refresh();
    }
  }

  _onSayHiTaped() {
    IChatManager chatManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_CHAT);
    chatManager.openUserChatScreen(context,
        type: 'private',
        targetId: widget.moment?.uid ?? 0,
        title: widget.moment?.name,
        refer: PhotoViewGalleryScreen.routeName);
    Tracker.instance.track(TrackEvent.moment_picture_click, properties: {
      'click': 'chat_bottom',
      'chat_uid': widget.moment?.uid,
    });
  }

  _onMomentTaped() {
    IMomentManager manager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_MOMENT);
    manager.openMomentDetailScreen(context,
        topicId: widget.moment?.topicId ?? 0,
        topicUid: widget.moment?.uid ?? 0,
        parentPage: MomentFlowPage.Album);
  }

  _refresh() {
    if (mounted) setState(() {});
  }

  void _back() {
    if (isPop) {
      return;
    }
    isPop = true;
    Navigator.of(context).pop();
  }

  void _showInfo() {
    if (!widget.showAlbum) {
      _back();
      return;
    }
    // 最后一页不隐藏
    if (widget.showAlbum && currentIndex == widget.images.length) {
      if (mounted) {
        setState(() {
          _isInfoShow = true;
        });
      }
      return;
    }
    if (mounted) {
      setState(() {
        _isInfoShow = !_isInfoShow;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: R.colors.homeBgColor,
        body: Container(
          decoration: const BoxDecoration(color: Colors.black),
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: widget.showAlbum ? _buildAlbum() : _buildNormal(),
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
    );
  }

  Widget _buildAlbum() {
    return Stack(
      children: <Widget>[
        _buildContent(),
        if (_isInfoShow && _userInfo != null) _buildMask(),
      ],
    );
  }

  Widget _buildTopUserInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
          padding:
              const EdgeInsetsDirectional.only(bottom: 8.0, top: 52, end: 20),
          child: MomentAlbumHeader(
              albumUserInfo: _userInfo!,
              onFollowTaped: () => _onFollowTap('follow_top')),
        ),
        if ((currentIndex + 1) <= widget.images.length)
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 12.0, end: 20),
              child: Text(
                '${currentIndex + 1}/${widget.images.length}',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8), fontSize: 13),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBottomContent() {
    return Container(
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
      padding: EdgeInsetsDirectional.only(
          start: 20, end: 20, bottom: Util.iphoneXBottom + 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 16),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _onMomentTaped,
            child: Container(
              width: Util.width,
              padding:
                  const EdgeInsetsDirectional.only(bottom: 4, start: 0, end: 0),
              child: Text(
                widget.moment?.content ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          if (Session.uid != widget.uid)
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: GestureDetector(
                onTap: _onSayHiTaped,
                child: Container(
                  height: 54,
                  alignment: AlignmentDirectional.centerEnd,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      R.img('ic_album_say_hi.svg',
                          width: 20,
                          height: 20,
                          package: ComponentManager.MANAGER_MOMENT),
                      const SizedBox(width: 4),
                      Text(
                        K.moment_say_hi_v2,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 13),
                      )
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    PhotoViewScaleStateController? scaleStateController =
        scaleStateControllers[currentIndex];
    return Positioned.fill(
      child: Listener(
        onPointerDown: (details) {
          if (_showAlbum && currentIndex == _realCount - 1) return;
          if (scaleStateController != null && scaleStateController.isZooming)
            return;
          _dragStart = details.position.dy;
          // Log.d('onVerticalDragStart, _dragStart: $_dragStart');
        },
        onPointerMove: (details) {
          if (_showAlbum && currentIndex == _realCount - 1) return;
          if (scaleStateController != null && scaleStateController.isZooming)
            return;
          _dragEnd = details.position.dy;
          if (_isInfoShow && _dragEnd - _dragStart > 100) {
            _isInfoShow = false;
          }
          setState(() {});
        },
        onPointerUp: (details) {
          if (_showAlbum && currentIndex == _realCount - 1) return;
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
              GestureDetector(
                onLongPress: _saveImage,
                child: PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  customSize: MediaQuery.of(context).size,
                  itemCount: _realCount,
                  backgroundDecoration:
                      const BoxDecoration(color: Colors.black),
                  pageController: _controller,
                  enableRotation: false,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                      if (widget.showAlbum && currentIndex == _realCount - 1) {
                        _isInfoShow = true;
                      }
                    });
                  },
                  builder: (BuildContext context, int index) {
                    if (_showAlbum && index == _realCount - 1) {
                      return PhotoViewGalleryPageOptions.customChild(
                        child: _buildAlbumPage(),
                        basePosition: Alignment.center,
                        initialScale: PhotoViewComputedScale.contained,
                        disableGestures: true,
                      );
                    }

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
                    if (!scaleStateControllers.containsKey(index)) {
                      scaleStateControllers[index] =
                          PhotoViewScaleStateController();
                    }

                    PhotoViewGalleryPageOptions option =
                        PhotoViewGalleryPageOptions(
                      onTapUp: (BuildContext context, TapUpDetails details,
                              PhotoViewControllerValue controllerValue) =>
                          _showInfo(),
                      scaleStateController: scaleStateControllers[index],
                      gestureDetectorBehavior: HitTestBehavior.deferToChild,
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered,
                      basePosition: Alignment.center,
                      initialScale: PhotoViewComputedScale.contained,
                      imageProvider:
                          NetworkImage(widget.images[index].url ?? ''),
                      heroAttributes: tags != null
                          ? PhotoViewHeroAttributes(tag: tags)
                          : null,
                    );

                    _options[index] = option;
                    return option;
                  },
                  loadingBuilder: (context, event) {
                    if (currentIndex > widget.images.length - 1) {
                      return const CupertinoActivityIndicator();
                    }
                    ImageBean bean = widget.images[currentIndex];
                    String? tags = widget.heroTags != null &&
                            widget.heroTags!.length > currentIndex
                        ? widget.heroTags![currentIndex]
                        : null;
                    return tags != null
                        ? Hero(
                            tag: tags,
                            child: CachedNetworkImage(
                              imageUrl: bean.cover375,
                              fit: BoxFit.contain,
                            ),
                          )
                        : CachedNetworkImage(
                            imageUrl: bean.cover375,
                            fit: BoxFit.contain,
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMask() {
    return PositionedDirectional(
      start: 0,
      end: 0,
      top: 0,
      bottom: 0,
      child: Stack(
        children: <Widget>[
          _buildTopUserInfo(),
          if (currentIndex + 1 <= widget.images.length)
            PositionedDirectional(
              bottom: 0,
              width: Util.width,
              child: _buildBottomContent(),
            ),
        ],
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

  Widget _buildAlbumPage() {
    return MomentAlbumPage(
      uid: widget.uid,
      albumUserInfo: _userInfo,
      onFollowTaped: () => _onFollowTap('follow_last'),
    );
  }
}
