import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/wedding/mode/room_wedding_beans.dart';
import 'package:chat_room/src/wedding/mode/room_wedding_view_mode.dart';
import 'package:chat_room/src/wedding/util/wedding_photo_manager.dart';
import 'package:provider/provider.dart' hide Selector;

/// 婚礼截图
class WeddingScreenshot extends StatefulWidget {
  final WeddingData weddingData;
  final ScreenshotController screenshotController;

  const WeddingScreenshot(
      {super.key,
      required this.weddingData,
      required this.screenshotController});

  @override
  _WeddingScreenshotState createState() => _WeddingScreenshotState();
}

class _WeddingScreenshotState extends State<WeddingScreenshot> {
  late WeddingState _state;

  @override
  void initState() {
    super.initState();
    _state = widget.weddingData.stage;
  }

  @override
  Widget build(BuildContext context) {
    WeddingState? state =
        context.select((RoomWeddingViewModel value) => value.weddingState);
    if (_state != state && state != null) {
      _state = state;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (!mounted) return;
        saveAndUploadPhoto(
            controller: widget.screenshotController,
            wid: widget.weddingData.wid,
            weddingState: _state,
            effectUrl: weddingEffectCover);
      });
    }
    return Container();
  }

  /// 婚礼当前流程的特效封面
  String? get weddingEffectCover {
    WeddingData weddingData = widget.weddingData;
    if (weddingData.effect.isNotEmpty) {
      for (WeddingEffect effect in weddingData.effect) {
        if (effect.stage == weddingData.stage) {
          return effect.cover;
        }
      }
    }
    return null;
  }
}
