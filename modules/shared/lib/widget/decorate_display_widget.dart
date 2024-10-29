import 'dart:io';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vap_texture/flutter_vap_texture.dart';
import 'package:vap_player/vap_player.dart';

class Decorate {
  final int giftId;
  final int size;
  final String? image;

  const Decorate(this.giftId, this.size, {this.image});
}

/// 个人主页装扮，只支持VAP格式
class DecorateDisplayWidget extends StatefulWidget {
  final VoidCallback? onComplete;
  final VoidCallback? onError;
  final Decorate effect;

  final bool repeat;

  const DecorateDisplayWidget(
      {super.key,
      required this.effect,
      this.onComplete,
      this.onError,
      this.repeat = true});

  @override
  _DecorateDisplayWidgetState createState() => _DecorateDisplayWidgetState();
}

class _DecorateDisplayWidgetState extends State<DecorateDisplayWidget>
    with WidgetsBindingObserver {
  bool _loadSuccess = false;

  int _mediaType = 0;

  @override
  void initState() {
    super.initState();
    if (widget.effect.giftId > 0) {
      _loadVap();
    } else {
      _mediaType = _judgeMediaInformation(widget.effect.image);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _loadVap() async {
    bool success = await cacheGiftWithTry(
        widget.effect.giftId, widget.effect.size,
        isVap: true);
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
  Widget build(BuildContext context) {
    if (widget.effect.giftId > 0) {
      if (!_loadSuccess) {
        Log.d('DecorateDisplayWidget load failed');
        return const SizedBox.shrink();
      }
      if (Constant.isDevMode && Util.isIOSSimulator) {
        return VapSimulatorWidget(
            onComplete: _onPlayGiftComplete); // 拦截iOS模拟器播放VAP动画
      }
      return IgnorePointer(
        child: ((Util.isAndroid || Util.isIOS) &&
                (System.debug || !AppConfig.closeNewVap))
            ? _buildVapView()
            : _buildVapWidget(),
      );
    }

    if (_mediaType == 1) {
      return IgnorePointer(
          child: VapDisplayWidget(
        vap: Vap(
            url: Util.getRemoteImgUrl(widget.effect.image),
            size: widget.effect.size),
        repeat: widget.repeat,
        onComplete: () {
          Log.d(tag: 'EnterEffectDisplayWidget', "Vap onComplete");
          if (!mounted) {
            return;
          }
          _onPlayGiftComplete();
        },
      ));
    } else if (_mediaType == 2) {
      return IgnorePointer(
        child: CachedNetworkImage(
          imageUrl: Util.getRemoteImgUrl(widget.effect.image),
          fit: BoxFit.fitWidth,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  VapView _buildVapView() {
    File vapFile = getVapGiftFile(widget.effect.giftId);
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
    File vapFile = getVapGiftFile(widget.effect.giftId);
    return VapWidget(
      hybridComposition: !Util.cantHybridComposition(),
      onPlatformViewCreated: (FlutterVapController controller) async {
        String filePath = vapFile.path;
        Log.d(
            tag: 'EnterEffectDisplayWidget',
            "onPlatformViewCreated and filePath = $filePath");
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

  //0 error 1 vap mp4 2 png/webp
  int _judgeMediaInformation(String? imageUrl) {
    if (imageUrl != null && imageUrl.isNotEmpty) {
      List<String> strings = imageUrl.split('.');
      if (strings.isNotEmpty) {
        String lastString = strings.last;
        if (lastString.toLowerCase() == 'vap' ||
            lastString.toLowerCase() == 'mp4') {
          return 1;
        } else if (lastString.toLowerCase() == 'png' ||
            lastString.toLowerCase() == 'jpg' ||
            lastString.toLowerCase() == 'webp') {
          return 2;
        } else {
          return 0;
        }
      }
    }
    return 0;
  }
}
