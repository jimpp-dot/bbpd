import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter_vap_texture/flutter_vap_texture.dart';
import 'package:flutter/material.dart';

/// 房间内vap Overlay动效
class RoomVapOverlay extends StatefulWidget {
  final String vapUrl;
  final List<String>? textList;
  final List<String>? imageList;
  final VoidCallback? onStartPlay;
  final VoidCallback? onComplete;

  const RoomVapOverlay(
      {super.key,
      required this.vapUrl,
      this.textList,
      this.imageList,
      this.onStartPlay,
      this.onComplete});

  @override
  State<StatefulWidget> createState() {
    return RoomVapOverlayState();
  }

  static OverlayEntry? _overlayEntry;

  /// vapUrl: vap链接
  /// vapSize: vap文件大小
  /// textList: 文字tags
  /// imageList: 图片tags
  static show(
      {BuildContext? context,
      String? vapUrl,
      int? vapSize,
      List<String>? textList,
      List<String>? imageList,
      VoidCallback? onStartPlay,
      VoidCallback? onComplete,
      bool onlyShowInRoom = true}) async {
    if (!Util.isAppActive) {
      Log.d('app is not Active, ignore');
      return;
    }

    IRoomManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    if (!manager.isInRoomPage() && onlyShowInRoom) {
      Log.d('app is not in room page, ignore');
      return;
    }

    var overlayState = Overlay.of(System.context);

    if (_overlayEntry != null) {
      return;
    }

    vapUrl = Util.getRemoteImgUrl(vapUrl ?? '');
    if (Util.validStr(vapUrl) && (vapSize ?? 0) > 0) {
      await cacheCpMatchBg(vapUrl, vapSize!);

      if (Util.validList(imageList)) {
        await Future.forEach(imageList!, (url) async {
          await CachedImageManager.instance()
              .downloadAsync(Util.getRemoteImgUrl(url));
        });
      }

      if (_overlayEntry != null) {
        return;
      }

      _overlayEntry = OverlayEntry(builder: (context) {
        return RoomVapOverlay(
            vapUrl: vapUrl!,
            textList: textList,
            imageList: imageList,
            onStartPlay: () {
              if (onStartPlay != null) {
                onStartPlay();
              }
            },
            onComplete: () {
              if (onComplete != null) {
                onComplete();
              }
              _onComplete();
            });
      });
    }
    if (_overlayEntry != null) {
      overlayState.insert(_overlayEntry!);
    }
  }

  static _onComplete() {
    Log.d('_onComplete-----------------------');
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  static dismiss() {
    _onComplete();
  }
}

class RoomVapOverlayState extends State<RoomVapOverlay> {
  final double _giftRatio = 1624.0 / 750.0;

  double get giftRatio => _giftRatio;
  late double giftWidth, giftHeight, offsetHorizontal, offsetVertical;
  File? _vapFile;

  @override
  void initState() {
    super.initState();

    init();
  }

  void init() async {
    final width = Util.width;
    final height = Util.height;
    if (height / width >= giftRatio) {
      giftHeight = height;
      giftWidth = giftHeight / giftRatio;
      offsetHorizontal = -(giftWidth - width) / 2;
      offsetVertical = 0;
    } else {
      giftWidth = width;
      giftHeight = giftWidth * giftRatio;
      offsetHorizontal = 0;
      offsetVertical = -(giftHeight - height) / 2;
    }

    _vapFile = await getCpMatchFile(widget.vapUrl);
    if (_vapFile != null && await _vapFile!.exists()) {
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_vapFile == null) return const SizedBox.shrink();

    Widget child;
    if (Constant.isDevMode && Util.isIOSSimulator) {
      child =
          VapSimulatorWidget(onComplete: widget.onComplete); // 拦截iOS模拟器播放VAP动画
    } else {
      child = Stack(
        children: [
          PositionedDirectional(
            start: offsetHorizontal,
            end: offsetHorizontal,
            top: offsetVertical,
            bottom: offsetVertical,
            child: VapWidget(
              hybridComposition: !Util.cantHybridComposition(),
              onPlatformViewCreated: (FlutterVapController controller) async {
                String filePath = _vapFile!.path;
                List<String>? imgList;
                if (Util.validList(widget.imageList)) {
                  imgList = [];
                  for (var image in widget.imageList!) {
                    imgList.add(CachedImageManager.instance()
                        .getFileByUrl(Util.getRemoteImgUrl(image))
                        .path);
                  }
                }
                controller.startPlay(filePath,
                    textList: widget.textList, imgList: imgList);
                if (widget.onStartPlay != null) {
                  widget.onStartPlay!();
                }
              },
              onRenderFrame: (int frameIndex, int frameTotal) {
                /// do nothing
              },
              onComplete: () {
                Log.d('_DisplayItemGiftState._renderFullscreenVap');
                if (!mounted) {
                  return;
                }
                if (widget.onComplete != null) {
                  widget.onComplete!();
                }
              },
            ),
          ),
        ],
      );
    }
    return IgnorePointer(child: child);
  }
}
