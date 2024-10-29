import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

/// 用于处理游戏自己绘制麦位的情况下，flutter处理麦位相关的功能
mixin MicMixin<T extends StatefulWidget> on State<T> {
  List<MicSpec>? _micSpecs;

  void syncMicPosFromGame(List? data) {
    if (data == null) {
      _micSpecs = null;
    } else {
      data.removeWhere((e) => e == null);
      _micSpecs = data.map((e) => MicSpec.fromJson(e)).toList(growable: false);
    }
    if (mounted) setState(() {});
  }

  MicSpec? _getMicSpecByPos(int pos) {
    if (_micSpecs != null) {
      try {
        return _micSpecs!.firstWhere((e) => e.pos == pos);
      } catch (e) {}
    }
    return null;
  }

  /// 获取 [EmoteAtMic] 控件列表
  List<Widget> getAllEmojiWidgets(ChatRoomData room) {
    List<Widget> result = [];
    if (_micSpecs != null && _micSpecs!.isNotEmpty) {
      for (var micSpec in _micSpecs!) {
        RoomPosition? position;
        try {
          position = room.positions
              .firstWhere((element) => element.position == micSpec.pos);
        } catch (_) {}
        if (position != null) {
          result.add(
            Positioned.directional(
              textDirection: TextDirection.ltr,
              start: micSpec.posX,
              top: micSpec.posY,
              width: micSpec.size,
              height: micSpec.size,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  EmoteAtMic(
                    uid: position.uid,
                    width: micSpec.size,
                  ),
                ],
              ),
            ),
          );
        }
      }
    }
    return result;
  }

  /// 用于 [DisplayGift] 寻找麦位坐标
  PositionOffset getPositionOffsetByUid(int uid) {
    UserIconStyle defaultStyle = UserIconStyle.Small;
    Size defaultSize = IconStyles[defaultStyle]!;
    PositionOffset defaultResult = PositionOffset(
        Offset(Util.width - 70.0, 50.0), defaultStyle, defaultSize, false);
    ChatRoomData? room = ChatRoomData.getInstance();
    if (room == null || room.positions.isEmpty) return defaultResult;
    MicSpec? micSpec;
    try {
      RoomPosition roomPosition =
          room.positions.firstWhere((position) => position.uid == uid);
      micSpec = _getMicSpecByPos(roomPosition.position);
    } catch (_) {}
    if (micSpec == null) return defaultResult;

    return PositionOffset(Offset(micSpec.posX, micSpec.posY),
        UserIconStyle.Small, Size.square(micSpec.size));
  }
}

class MicSpec {
  final int pos; // 索引
  final double size; // 麦位大小
  final double posX;
  final double posY;

  MicSpec(this.pos, this.size, this.posX, this.posY);

  factory MicSpec.fromJson(Map data) {
    int pos = data['position'];
    double size = Util.parseDouble(data['size']);
    double posX = Util.parseDouble(data['posX']);
    double posY = Util.parseDouble(data['posY']);
    return MicSpec(pos, size, posX, posY);
  }

  // 中心点坐标
  // Offset get center => Offset(posX + size / 2, posY + size / 2);

  @override
  String toString() {
    return 'MicSpec{pos: $pos, size: $size, posX: $posX, posY: $posY}';
  }
}
