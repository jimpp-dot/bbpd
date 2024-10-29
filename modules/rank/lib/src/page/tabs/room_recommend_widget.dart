import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class RoomRecommendWidget extends StatelessWidget {
  final TopRoomListData roomListData;

  RoomRecommendWidget({super.key, required this.roomListData});

  @override
  Widget build(BuildContext context) {
    double width = (Util.width - 32 - 30) / 4;
    double height = width * 122 / 80;

    Log.d(
        'itemData.frameUrl: ${Util.getRemoteImgUrl(roomListData.list[0].frameUrl)}');

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          roomListData.tile,
          style: TextStyle(
            color: darkMode ? Colors.white.withOpacity(0.9) : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: Util.width,
          height: height,
          child: ListView.builder(
            physics: roomListData.list.length <= 4
                ? const NeverScrollableScrollPhysics()
                : null,
            clipBehavior: Clip.none,
            padding: const EdgeInsetsDirectional.all(0),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              TopRoomItem itemData = roomListData.list[index];
              return GestureDetector(
                onTap: () {
                  _itemOnTap(itemData.rid, context);
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: width,
                      height: height,
                      margin: const EdgeInsetsDirectional.only(end: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.dp),
                      ),
                      child: Rext.themeCardContainer(
                        width: double.infinity,
                        height: double.infinity,
                        cornerRadius: 12.dp,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 9,
                            ),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                CommonAvatar(
                                  path: itemData.roomIcon,
                                  suffix: Util.squareResizeSuffix(240),
                                  size: width - 18,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(14),
                                  onlyFirstFrame: true,
                                ),
                                if (itemData.activeIcon)
                                  PositionedDirectional(
                                    bottom: -2,
                                    end: -2,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 22,
                                      height: 22,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: darkMode
                                                ? const Color(0xFF221B5B)
                                                : const Color(0xFFEAEAFF),
                                            width: 2),
                                        borderRadius: BorderRadius.circular(11),
                                        color: darkMode
                                            ? R.colors.homeBgColor
                                            : null,
                                        gradient: darkMode
                                            ? null
                                            : const LinearGradient(
                                                colors: [
                                                    Color(0xFF99FFBC),
                                                    Color(0xFF26C4FF),
                                                    Color(0xFF926AFF)
                                                  ],
                                                begin: AlignmentDirectional
                                                    .topStart,
                                                end: AlignmentDirectional
                                                    .bottomEnd),
                                      ),
                                      child: darkMode
                                          ? RepaintBoundary(
                                              child: R.img(
                                                  'in_room_status.webp',
                                                  package: ComponentManager
                                                      .MANAGER_BASE_CORE,
                                                  width: 15,
                                                  height: 15),
                                            )
                                          : RepaintBoundary(
                                              child: R.img(
                                                  'in_room_status_dark.webp',
                                                  package: ComponentManager
                                                      .MANAGER_BASE_CORE,
                                                  width: 15,
                                                  height: 15),
                                            ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 5, end: 5),
                                child: Text(
                                  itemData.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: darkMode
                                        ? Colors.white.withOpacity(0.9)
                                        : Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (Util.validStr(itemData.frameUrl))
                      PositionedDirectional(
                          top: -5,
                          bottom: -5,
                          start: -5,
                          end: 5,
                          child: CachedNetworkImage(
                            imageUrl: Util.getRemoteImgUrl(itemData.frameUrl),
                            fit: BoxFit.fill,
                          )),
                  ],
                ),
              );
            },
            itemCount: roomListData.list.length,
          ),
        )
      ],
    );
  }

  bool _isLoading = false;

  Future<void> _itemOnTap(int rid, BuildContext context) async {
    if (_isLoading) return;
    _isLoading = true;
    ResTopRoomJump roomJumpData =
        await BaseRequestManager.checkRoomCanActivity(rid);
    _isLoading = false;
    if (roomJumpData.success) {
      if (roomJumpData.data.inRoom) {
        IRoomManager roomManager = ComponentManager.instance
            .getManager(ComponentManager.MANAGER_BASE_ROOM);
        roomManager.openChatRoomScreenShow(context, rid);
      } else {
        if (roomJumpData.data.jumpId > 0) {
          IPersonalDataManager manager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_PERSONALDATA);
          manager.openImageScreen(context, roomJumpData.data.jumpId);
        }
      }
    }
  }
}
