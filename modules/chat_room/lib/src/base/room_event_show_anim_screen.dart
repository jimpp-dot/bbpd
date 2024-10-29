import 'package:flutter/material.dart';
import 'package:shared/shared.dart' hide MessageContent, MessageType;
import 'package:chat_room/chat_room.dart';

/// 事件出发，播放房间动画，例如：加入粉丝团，开通守护
class RoomEventShowAnimScreen extends StatefulWidget {
  const RoomEventShowAnimScreen({super.key});

  @override
  _State createState() => _State();
}

class _State extends State<RoomEventShowAnimScreen> {
  bool _show = false;

  MultiImageInfo? _imageInfo;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(
        RoomConstant.EVENT_SHOW_ROOM_SCREEN_ANIMATION, _onJoinSuccessEvent);
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        RoomConstant.EVENT_SHOW_ROOM_SCREEN_ANIMATION, _onJoinSuccessEvent);
    super.dispose();
  }

  void _onJoinSuccessEvent(String type, dynamic data) async {
    if (_show == true) {
      return;
    }

    if (data == null) {
      return;
    }

    if (data is! MultiImageInfo) {
      return;
    }

    _imageInfo = data;

    _show = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_show == false || _imageInfo == null) {
      return const SizedBox.shrink();
    }

    return IgnorePointer(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: (_imageInfo?.width != null && _imageInfo!.width > 0)
              ? _imageInfo!.width
              : Util.width,
          height: (_imageInfo?.height != null && _imageInfo!.height > 0)
              ? _imageInfo!.height
              : Util.height,
          child: MultiframeImage.network(
            Util.getRemoteImgUrl(_imageInfo!.imgUrl),
            'fans_group',
            onComplete: () {
              _show = false;
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}

class MultiImageInfo {
  final double width;

  final double height;

  final String imgUrl;

  MultiImageInfo(this.width, this.height, this.imgUrl);
}

class RoomEventAnimationUtil {
  /// 开通守护成功后展示一个动画
  static void handleDefendMsg(MessageContent message) {
    if (message.type != MessageType.Package) {
      return;
    }

    if (message.extra == null) {
      return;
    }

    Map? extra = message.extra;

    int defendLevel = Util.parseInt(extra?['defend']);

    if (defendLevel > 0 && defendLevel <= 3) {
      MultiImageInfo info = MultiImageInfo(Util.width, Util.height,
          Util.getRemoteImgUrl('static/defend/$defendLevel.webp'));
      eventCenter.emit(RoomConstant.EVENT_SHOW_ROOM_SCREEN_ANIMATION, info);
    }
  }

  /// 卡通守护后，播放动画
  static void joinFansGroup(String img) {
    MultiImageInfo info = MultiImageInfo(Util.width, Util.width, img);
    eventCenter.emit(RoomConstant.EVENT_SHOW_ROOM_SCREEN_ANIMATION, info);
  }

  static void testDefend(int defendLevel) {
    MultiImageInfo info = MultiImageInfo(Util.width, Util.height,
        Util.getRemoteImgUrl('static/defend/$defendLevel.webp'));
    eventCenter.emit(RoomConstant.EVENT_SHOW_ROOM_SCREEN_ANIMATION, info);
  }
}
