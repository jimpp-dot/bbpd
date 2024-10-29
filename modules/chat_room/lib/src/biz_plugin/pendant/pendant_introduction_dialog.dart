import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

import 'pendant_util.dart';

/// 说明介绍弹框
class PendantIntroductionDialog extends StatefulWidget {
  final ChatRoomData room;
  final String bgIcon;
  final String url;

  const PendantIntroductionDialog(
      {super.key, required this.room, required this.bgIcon, required this.url});

  static void show(BuildContext context,
      {required ChatRoomData room, required Map extra}) {
    String bgIcon = extra['bg_icon'];
    String url = extra['url'];
    if (Util.isStringEmpty(bgIcon) || Util.isStringEmpty(url)) return;
    showDialog(
      context: context,
      builder: (_) =>
          PendantIntroductionDialog(room: room, bgIcon: bgIcon, url: url),
    );
  }

  @override
  State<StatefulWidget> createState() => _PendantIntroductionDialogState();
}

class _PendantIntroductionDialogState extends State<PendantIntroductionDialog> {
  @override
  void initState() {
    super.initState();
    widget.room.addListener(roomTopmostEffectKey, _onEvent);
  }

  @override
  void dispose() {
    widget.room.removeListener(roomTopmostEffectKey, _onEvent);
    super.dispose();
  }

  void _onEvent(String type, dynamic data) => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildContent(),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: R.img(RoomAssets.chat_room$confess_v2_ic_dialog_close_webp,
                width: 48, height: 48),
          )
        ],
      ),
    );
  }

  Widget _buildContent() {
    return SizedBox(
      width: 280,
      height: 428,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          R.img(Util.getRemoteImgUrl(widget.bgIcon), width: 280, height: 428),
          PositionedDirectional(
            top: 168,
            child: Container(
              width: 230,
              height: 220,
              alignment: AlignmentDirectional.center,
              child: BaseWebviewScreen(
                  url: widget.url, transparent: true, embeddedWidget: true),
            ),
          ),
        ],
      ),
    );
  }
}
