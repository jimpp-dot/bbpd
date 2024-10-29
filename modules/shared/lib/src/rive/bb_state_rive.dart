import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'rive_cache_manager.dart';

/// Specifies whether a source is from an asset bundle or http
enum _Source {
  asset,
  network,
  file,
}

/// 带状态的rive动画（支持单次/循环） /// riveValue：需要播放的状态 /// loop:是否循环 /// onComplete:播放完毕回调
class BbStateRive extends StatefulWidget {
  final String path;

  /// 多状态，由外部传进的riveValue值，播放不同的动效
  final double riveValue;

  /// The type of source used to retrieve the asset
  late _Source src;

  /// Fit for the animation in the widget
  final BoxFit? fit;

  /// Alignment for the animation in the widget
  final Alignment? alignment;

  /// Widget displayed while the rive is loading
  final Widget? placeHolder;
  final bool loop;
  final VoidCallback? onComplete;

  /// Creates a new RiveAnimation from an asset bundle
  BbStateRive.asset({
    required this.path,
    required this.riveValue,
    this.fit,
    this.alignment,
    this.placeHolder,
    this.loop = false,
    this.onComplete,
    Key? key,
  }) : super(key: key) {
    src = _Source.asset;
  }

  BbStateRive.network({
    required this.path,
    required this.riveValue,
    this.fit,
    this.alignment,
    this.placeHolder,
    this.loop = false,
    this.onComplete,
    Key? key,
  }) : super(key: key) {
    src = _Source.network;
  }

  BbStateRive.file({
    required this.path,
    required this.riveValue,
    this.fit,
    this.alignment,
    this.placeHolder,
    this.loop = false,
    this.onComplete,
    Key? key,
  }) : super(key: key) {
    src = _Source.file;
  }

  @override
  _BbStateRiveState createState() {
    return _BbStateRiveState();
  }
}

class _BbStateRiveState extends State<BbStateRive> {
  File? _netWorkLocalFile;

  @override
  void initState() {
    super.initState();
    _loadNetWorkFileIfNeed();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loadNetWorkFileIfNeed() async {
    if (widget.src == _Source.network) {
      _netWorkLocalFile =
          await RiveCacheManager.instance.getSingleFile(widget.path);
      _refresh();
    }
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.src == _Source.asset) {
      return RiveAnimation.asset(
        widget.path,
        fit: widget.fit,
        alignment: widget.alignment,
        placeHolder: widget.placeHolder,
        onInit: onInit,
      );
    } else if (widget.src == _Source.network) {
      if (_netWorkLocalFile != null) {
        return _buildFromFile(_netWorkLocalFile!.path);
      } else if (widget.placeHolder != null) {
        return widget.placeHolder!;
      } else {
        return const SizedBox.shrink();
      }
    } else if (widget.src == _Source.file) {
      return _buildFromFile(widget.path);
    }
    return const SizedBox.shrink();
  }

  Widget _buildFromFile(String path) {
    return RiveAnimation.file(
      path,
      fit: widget.fit,
      alignment: widget.alignment,
      placeHolder: widget.placeHolder,
      onInit: onInit,
    );
  }

  void onInit(Artboard artBoard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artBoard, 'bbStateMachine');
    if (controller != null) {
      artBoard.addController(controller);
      SMIInput<double>? input = controller.findInput<double>('bbInput');
      if (mounted && input != null) {
        input.value = widget.riveValue;
        controller.isActiveChanged.addListener(() {
          if (!controller.isActive) {
            if (widget.loop == false) {
              if (widget.onComplete != null) {
                Future.delayed(const Duration(milliseconds: 10), () {
                  if (!mounted) return;
                  widget.onComplete!();
                });
              }
            } else {
              /// 循环播放 controller.init(controller.core); controller.isActive = true;
            }
          }
        });
      }
    }
  }
}
