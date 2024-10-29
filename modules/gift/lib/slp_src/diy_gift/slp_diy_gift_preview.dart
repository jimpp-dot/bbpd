import 'dart:async';
import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vap_texture/flutter_vap_texture.dart';
import 'package:path/path.dart';
import 'package:video_player/video_player.dart';

/// DIY礼物预览
class SlpDiyGiftPreview extends StatefulWidget {
  final String giftBg;

  /// 礼物预览背景
  final int giftBgSize;

  /// 礼物背景size
  final String giftPreview;

  /// 礼物预览mp4
  final int giftPreviewSize;

  /// 礼物预览Size
  final List<String> giftAvatars;

  /// 礼物头像列表
  final String giftSign;

  /// 礼物签名

  const SlpDiyGiftPreview(
      {Key? key,
      required this.giftAvatars,
      required this.giftBg,
      required this.giftPreview,
      required this.giftSign,
      required this.giftBgSize,
      required this.giftPreviewSize})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SlpDiyGiftPreviewState();
  }
}

class SlpDiyGiftPreviewState extends State<SlpDiyGiftPreview> {
  final String _tag = 'DiyGiftPreview';
  VideoPlayerController? _videoPlayerController;
  String? _bgFilePath;
  String? _previewFilePath;
  final List<String> _avatarList = [];
  String? _sign;
  bool _isLoading = true;
  double previewWidth = 0;
  double previewHeight = 0;
  GlobalKey? vapKey;
  GlobalKey? bgKey;
  int vapIndex = 0;
  int bgIndex = 0;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (Util.width >= 375) {
      previewWidth = 375;
      previewHeight = 335;
    } else {
      previewWidth = Util.width;
      previewHeight = previewWidth * 375 / 335;
    }

    preloadFile();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    _stopBgVideo();
    super.dispose();
  }

  void initData() {
    _sign = widget.giftSign;
    _avatarList.clear();
    for (var element in widget.giftAvatars) {
      _avatarList.add(CachedImageManager.instance()
          .getFileByUrl(Util.getUserIconUrl(element)!)
          .path);
    }

    preloadFile();
  }

  void preloadFile() async {
    _isLoading = true;
    _refresh();

    vapKey = GlobalKey(debugLabel: '${vapIndex++}');

    String baseDir = join(Constant.documentsDirectory.path, giftSubDir);
    String path = join(baseDir, '${Util.md5Encryption(widget.giftBg)}.mp4');
    if (_bgFilePath != path) {
      _stopBgVideo();
      bgKey = GlobalKey(debugLabel: '${bgIndex++}');
    }
    _bgFilePath = path;
    Log.d('$_tag _bgFilePath: ${widget.giftBg}');
    Log.d('$_tag _bgFilePath: $_bgFilePath');
    await _cacheFile(widget.giftBg, _bgFilePath ?? '', widget.giftBgSize);

    _previewFilePath =
        join(baseDir, '${Util.md5Encryption(widget.giftPreview)}.mp4');
    Log.d('$_tag _previewFilePath: $_previewFilePath');
    await _cacheFile(
        widget.giftPreview, _previewFilePath ?? '', widget.giftPreviewSize);
    _videoPlayerController =
        VideoPlayerController.file(File(_bgFilePath ?? ''));
    _videoPlayerController!.initialize().then((value) {
      _play();
    });
    _isLoading = false;
    _refresh();
  }

  Future<bool> _cacheFile(String url, String path, int size) async {
    String baseDir = join(Constant.documentsDirectory.path, giftSubDir);
    await Directory(baseDir).create(recursive: true);
    File file = File(path);

    if (await file.exists()) {
      FileStat stat = await file.stat();
      if (stat.size == size) {
        return true;
      }
      await file.delete();
    }

    await DownloadManager.download(url, file.path);

    if (await file.exists()) {
      FileStat stat = await file.stat();
      if (stat.size == size) {
        return true;
      }
      await file.delete();
    }
    return false;
  }

  void _play() async {
    if (_videoPlayerController == null) return;
    await _videoPlayerController?.setLooping(true);
    if (_videoPlayerController?.value.isPlaying == false) {
      await _videoPlayerController?.play();
    }

    if (mounted) {
      setState(() {});
    }
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  bool isDifferent(List<String> old, List<String> now) {
    int oldLength = old.length;
    int nowLength = now.length;

    if (oldLength != nowLength) {
      return true;
    } else {
      if (oldLength == 0 && nowLength == 0) {
        return false;
      } else {
        for (int i = 0; i < oldLength; i++) {
          if (old[i] != now[i]) {
            return true;
          }
        }
      }
    }

    return false;
  }

  void resetSource() {
    /// 延时刷新，防止用户频繁操作
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }

    _timer = Timer(const Duration(milliseconds: 1000), () {
      initData();
    });
  }

  @override
  void didUpdateWidget(covariant SlpDiyGiftPreview oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.giftBg != widget.giftBg ||
        oldWidget.giftPreview != widget.giftPreview ||
        oldWidget.giftSign != widget.giftSign ||
        isDifferent(oldWidget.giftAvatars, widget.giftAvatars)) {
      resetSource();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (_isLoading) {
      child = const SizedBox.shrink();
    } else if (Constant.isDevMode && Util.isIOSSimulator) {
      child = const VapSimulatorWidget(); // 拦截iOS模拟器播放VAP动画
    } else {
      child = Stack(
        children: [
          if (_videoPlayerController?.value.isInitialized ?? false)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: VideoPlayer(_videoPlayerController!, key: bgKey),
            ),
          Align(
            alignment: AlignmentDirectional.center,
            child: SizedBox(
              width: previewWidth,
              height: previewHeight,
              child: VapWidget(
                hybridComposition: !Util.cantHybridComposition(),
                key: vapKey,
                onPlatformViewCreated: (FlutterVapController controller) async {
                  Log.d(
                      '$_tag preview onPlatformViewCreated'); // vap_text_1.mp4   vapx.mp4
                  controller.startPlay(
                    _previewFilePath ?? '',
                    repeatCount: -1,
                    imgList: _avatarList,
                    textList: [_sign ?? ''],
                  );
                },
                onComplete: () {
                  Log.d('$_tag preview onComplete');
                  if (!mounted) {
                    return;
                  }
                },
              ),
            ),
          ),
        ],
      );
    }
    return Container(
      width: Util.width,
      height: 335,
      color: Colors.black,
      child: child,
    );
  }

  void _stopBgVideo() async {
    if (_videoPlayerController != null) {
      Log.d('$_tag bg _stopVideo');
      _videoPlayerController?.dispose();
      _videoPlayerController = null;
    }
  }
}
