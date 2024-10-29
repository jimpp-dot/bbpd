import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// 商业婚礼房视频背景
class ChatRoomWeddingBg extends StatefulWidget {
  const ChatRoomWeddingBg({Key? key}) : super(key: key);

  @override
  ChatRoomWeddingBgState createState() {
    return ChatRoomWeddingBgState();
  }
}

class ChatRoomWeddingBgState extends State<ChatRoomWeddingBg> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        Util.getRemoteImgUrl('static/background/business_wedding_bg_3.mp4'))
      ..initialize().then((_) async {
        await _controller.setLooping(true);
        if (mounted) {
          setState(() {});
          _controller.play();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = 1104 / 510 * Util.width;
    if (height < Util.height) {
      height = Util.height;
    }
    return PositionedDirectional(
      top: 0,
      start: 0,
      end: 0,
      height: height,
      child: SizedBox(
        width: Util.width,
        height: height,
        child: _controller.value.isInitialized
            ? VideoPlayer(_controller)
            : const SizedBox.shrink(),
      ),
    );
  }
}
