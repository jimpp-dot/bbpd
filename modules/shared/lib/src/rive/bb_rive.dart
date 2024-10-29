import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'rive_cache_manager.dart';

const String _tag = 'BBRive';

/// Specifies whether a source is from an asset bundle or http
enum _Source {
  asset,
  network,
  file,
}

class BBRive extends StatefulWidget {
  /// The asset name or url
  final String name;

  /// The type of source used to retrieve the asset
  late _Source src;

  /// if src is network, we can use if need cache.
  final bool useCache;

  /// The name of the artboard to use; default artboard if not specified
  final String? artboard;

  /// List of animations to play; default animation if not specified
  final List<String> animations;

  /// List of state machines to play; none will play if not specified
  final List<String> stateMachines;

  /// Fit for the animation in the widget
  final BoxFit? fit;

  /// Alignment for the animation in the widget
  final Alignment? alignment;

  /// Widget displayed while the rive is loading
  final Widget? placeHolder;

  /// Enable/disable antialiasing when rendering
  final bool antialiasing;

  /// Controllers for instanced animations and state machines; use this
  /// to directly control animation states instead of passing names.
  final List<RiveAnimationController> controllers;

  /// Callback fired when Riveanimation has initialized
  final OnInitCallback? onInit;

  /// Creates a new RiveAnimation from an asset bundle
  BBRive.asset(
    Key? key,
    this.name, {
    this.artboard,
    this.animations = const [],
    this.stateMachines = const [],
    this.fit,
    this.alignment,
    this.placeHolder,
    this.antialiasing = true,
    this.controllers = const [],
    this.onInit,
    this.useCache = false,
  }) : super(key: key) {
    src = _Source.asset;
  }

  BBRive.network(
    Key? key,
    this.name, {
    this.artboard,
    this.animations = const [],
    this.stateMachines = const [],
    this.fit,
    this.alignment,
    this.placeHolder,
    this.antialiasing = true,
    this.controllers = const [],
    this.onInit,
    this.useCache = true,
  }) : super(key: key) {
    src = _Source.network;
  }

  BBRive.file(
    Key? key,
    this.name, {
    this.artboard,
    this.animations = const [],
    this.stateMachines = const [],
    this.fit,
    this.alignment,
    this.placeHolder,
    this.antialiasing = true,
    this.controllers = const [],
    this.onInit,
    this.useCache = true,
  }) : super(key: key) {
    src = _Source.file;
  }

  @override
  State<BBRive> createState() => _BBRiveState();
}

class _BBRiveState extends State<BBRive> {
  File? _netWorkLocalFile;

  @override
  void initState() {
    super.initState();

    _loadNetWorkFileIfNeed();
  }

  _loadNetWorkFileIfNeed() async {
    if (widget.src == _Source.network && widget.useCache) {
      var start = DateTime.now().millisecondsSinceEpoch;
      _netWorkLocalFile =
          await RiveCacheManager.instance.getSingleFile(widget.name);
      var end = DateTime.now().millisecondsSinceEpoch;

      _refresh();
    }
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.src == _Source.asset) {
      return RiveAnimation.asset(
        widget.name,
        artboard: widget.artboard,
        animations: widget.animations,
        stateMachines: widget.stateMachines,
        fit: widget.fit,
        alignment: widget.alignment,
        placeHolder: widget.placeHolder,
        antialiasing: widget.antialiasing,
        controllers: widget.controllers,
        onInit: widget.onInit,
      );
    } else if (widget.src == _Source.network) {
      if (widget.useCache) {
        if (_netWorkLocalFile != null) {
          return _buildFromFile(_netWorkLocalFile!.path);
        } else if (widget.placeHolder != null) {
          return widget.placeHolder!;
        } else {
          return const SizedBox.shrink();
        }
      } else {
        return RiveAnimation.network(
          widget.name,
          artboard: widget.artboard,
          animations: widget.animations,
          stateMachines: widget.stateMachines,
          fit: widget.fit,
          alignment: widget.alignment,
          placeHolder: widget.placeHolder,
          antialiasing: widget.antialiasing,
          controllers: widget.controllers,
          onInit: widget.onInit,
        );
      }
    } else if (widget.src == _Source.file) {
      return _buildFromFile(widget.name);
    }
    return Container();
  }

  Widget _buildFromFile(String path) {
    return RiveAnimation.file(
      path,
      artboard: widget.artboard,
      animations: widget.animations,
      stateMachines: widget.stateMachines,
      fit: widget.fit,
      alignment: widget.alignment,
      placeHolder: widget.placeHolder,
      antialiasing: widget.antialiasing,
      controllers: widget.controllers,
      onInit: widget.onInit,
    );
  }
}
