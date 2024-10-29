import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/chatRoomUtil.dart';
import 'package:chat_room/src/chat_room_screen.dart';

import 'room_loading_ani_widget.dart';

class RoomLoadingPage extends StatefulWidget {
  static const left = 0;
  static const room = 1;
  static const right = 2;

  final int? index;
  final bool hideContent;

  const RoomLoadingPage({super.key, this.index, this.hideContent = false});

  @override
  RoomLoadingPageState createState() => RoomLoadingPageState();
}

class RoomLoadingPageState extends State<RoomLoadingPage> {
  bool get isMic {
    return ChatRoomUtil.isMic;
  }

  bool get isLast {
    if (widget.index != RoomLoadingPage.right) return false;

    return ChatRoomScreen.isLast;
  }

  bool get isFirst {
    if (widget.index != RoomLoadingPage.left) return false;

    return ChatRoomScreen.isFirst;
  }

  bool get showLeftIndicator {
    return widget.index == RoomLoadingPage.right && !ChatRoomScreen.isLoading;
  }

  bool get showLoading {
    return widget.index == RoomLoadingPage.room || ChatRoomScreen.isLoading;
  }

  bool get showRightIndicator {
    return widget.index == RoomLoadingPage.left && !ChatRoomScreen.isLoading;
  }

  @override
  Widget build(BuildContext context) {
    if (showLoading) {
      return SizedBox(
        width: Util.width,
        height: Util.width,
        child: Stack(
          children: [
            _buildLoadingContent(),
            PositionedDirectional(
              top: 50,
              end: 12,
              child: _buildClose(),
            ),
          ],
        ),
      );
    }

    return _buildLoadingContent();
  }

  Widget _buildLoadingContent() {
    return Container(
      width: Util.width,
      height: Util.height,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(R.imagePath('room_bg.png',
                package: ComponentManager.MANAGER_BASE_ROOM)),
            fit: BoxFit.fill),
      ),
      child: widget.hideContent
          ? const SizedBox.shrink()
          : Row(
              children: <Widget>[
                if (showLeftIndicator)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 8, end: 16),
                    child: R.img('arrow_l.svg',
                        package: ComponentManager.MANAGER_BASE_ROOM, width: 10),
                  ),
                if (showLeftIndicator)
                  SizedBox(
                    width: 13,
                    child: Text(
                      (isLast ? K.room_switch_no_more : K.room_switch_left),
                      style: R.textStyle.caption
                          .copyWith(color: const Color(0x80FFFFFF)),
                    ),
                  ),
                Expanded(
                    child: showLoading ? _buildLoading(context) : Container()),
                if (showRightIndicator)
                  SizedBox(
                    width: 13,
                    child: Text(
                      (isFirst ? K.room_switch_no_more : K.room_switch_right),
                      style: R.textStyle.caption
                          .copyWith(color: const Color(0x80FFFFFF)),
                    ),
                  ),
                if (showRightIndicator)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 16, end: 8),
                    child: R.img('arrow_r.svg',
                        package: ComponentManager.MANAGER_BASE_ROOM, width: 10),
                  ),
              ],
            ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '〈〈〈  ',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.4),
                    fontFamily: Util.fontFamily,
                  ),
                ),
                TextSpan(
                  text: "正在进入房间",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: Util.fontFamily,
                  ),
                ),
                TextSpan(
                  text: '  〉〉〉',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.4),
                    fontFamily: Util.fontFamily,
                  ),
                ),
              ],
            ),
          ),
          const PositionedDirectional(
            bottom: -12,
            child: RepaintBoundary(
              child: RoomLoadingAniWidget(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClose() {
    return GestureDetector(
      onTap: () async {
        Navigator.of(context).maybePop();
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white12,
        ),
        alignment: AlignmentDirectional.center,
        child: R.img(
          'ic_close.webp',
          width: 20,
          height: 20,
          package: ComponentManager.MANAGER_BASE_ROOM,
        ),
      ),
    );
  }
}
