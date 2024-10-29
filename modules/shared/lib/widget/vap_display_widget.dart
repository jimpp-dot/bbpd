import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vap_texture/flutter_vap_texture.dart';
import 'package:path/path.dart';
import 'package:vap_player/vap_player.dart';

import '../shared.dart';

String get _vapSubDir => 'vap_big'; //新版本改为统一只访问gift_big目录

Future<bool> _cacheVapWithTry(String url, int size) async {
  for (int i = 0; i < 3; i++) {
    bool r = await _cacheVapFile(url, size);
    if (r == true) return true;
  }
  return false;
}

Future<bool> _cacheVapFile(String vapUrl, int size) async {
  String baseDir = join(Constant.documentsDirectory.path, giftSubDir);
  await Directory(baseDir).create(recursive: true);
  File file = _getVapFile(vapUrl);
  if (await _checkFileValid(file, size) == true) {
    return true;
  }

  await _downloadGift(size, vapUrl, file);

  if (await _checkFileValid(file, size) == true) {
    return true;
  }
  return false;
}

Future _downloadGift(int size, String url, File file) async {
  Log.d('_downloadVap, DownloadManager.download start: $url');
  if (size < 1 * 1000000) {
    // 小于1MB直接下载
    try {
      await DownloadManager.download(url, file.path);
    } catch (e) {
      Log.d('_downloadVap, DownloadManager.download error: $e');
    }
  } else {
    // 大于1MB并发下载以提高速度
    try {
      await DownloadManager.downloadWithChunks(url, file.path, size: size);
    } catch (e) {
      Log.d('_downloadVap, DownloadManager.downloadWithChunks error: $e');
    }
  }
}

Future<bool> _checkFileValid(File file, int size) async {
  if (await file.exists()) {
    FileStat stat = await file.stat();
    if (stat.size == size) {
      return true;
    } else {
      Log.e('vap size error');
      await file.delete();
      return false;
    }
  }
  return false;
}

File _getVapFile(String url) {
  final String baseDir = join(Constant.documentsDirectory.path, _vapSubDir);
  final String fileName = _generateMd5(url);
  File file = File(join(baseDir, '$fileName.mp4'));
  return file;
}

String _generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

class Vap {
  final String url;
  final int size;

  const Vap({this.url = '', this.size = 0});
}

class VapDisplayWidget extends StatefulWidget {
  final VoidCallback? onComplete;
  final VoidCallback? onError;
  final bool repeat;
  final Vap vap;

  const VapDisplayWidget({
    super.key,
    required this.vap,
    this.onComplete,
    this.onError,
    this.repeat = false,
  });

  @override
  _VapDisplayWidgetState createState() => _VapDisplayWidgetState();
}

class _VapDisplayWidgetState extends State<VapDisplayWidget> with WidgetsBindingObserver {
  bool _loadSuccess = false;
  String? _vapUrl;
  int? _vapSize;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Log.d('_VapDisplayWidgetState init');
    _loadVap();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    Log.d('_VapDisplayWidgetState dispose');
  }

  void _loadVap() async {
    _loadSuccess = false;
    _vapUrl = widget.vap.url;
    _vapSize = widget.vap.size;
    bool success = await _cacheVapWithTry(widget.vap.url, widget.vap.size);
    Log.d('_VapDisplayWidgetState _loadVap ${widget.vap.url} result: $success');
    if (success && mounted) {
      setState(() {
        _loadSuccess = true;
      });
    } else {
      if (widget.onError != null) {
        widget.onError!();
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
    if (mounted) setState(() {});
  }

  @override
  void didUpdateWidget(covariant VapDisplayWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.vap.size != _vapSize || widget.vap.url != _vapUrl) {
      _loadVap();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_loadSuccess) {
      return const SizedBox.shrink();
    }
    if (Constant.isDevMode && Util.isIOSSimulator) {
      return VapSimulatorWidget(onComplete: _onPlayGiftComplete); // 拦截iOS模拟器播放VAP动画
    }

    return IgnorePointer(
      child: ((Util.isAndroid || Util.isIOS) && (System.debug || !AppConfig.closeNewVap)) ? _buildVapView() : _buildVapWidget(),
    );
  }

  VapView _buildVapView() {
    File vapFile = _getVapFile(widget.vap.url);
    return VapView(
      filePath: vapFile.path,
      repeatCount: widget.repeat ? -1 : 0,
      onComplete: () {
        Log.d(tag: 'EnterEffectDisplayWidget', "Vap onComplete");
        if (!mounted) {
          return;
        }
        _onPlayGiftComplete();
      },
    );
  }

  VapWidget _buildVapWidget() {
    File vapFile = _getVapFile(widget.vap.url);
    Log.d('VapDisplayWidget build vapFile: $vapFile');
    return VapWidget(
      // key: _key,
      hybridComposition: !Util.cantHybridComposition(),
      onPlatformViewCreated: (FlutterVapController controller) async {
        String filePath = vapFile.path;
        Log.d(tag: 'EnterEffectDisplayWidget', "onPlatformViewCreated and filePath = $filePath");
        controller.startPlay(filePath, repeatCount: widget.repeat ? -1 : 0);
      },
      onComplete: () {
        Log.d(tag: 'EnterEffectDisplayWidget', "Vap onComplete");
        if (!mounted) {
          return;
        }
        _onPlayGiftComplete();
      },
    );
  }

  _onPlayGiftComplete() {
    Log.d(tag: 'EnterEffectDisplayWidget', "_onPlayGiftComplete");
    if (widget.onComplete != null) {
      widget.onComplete!();
    }
  }
}
