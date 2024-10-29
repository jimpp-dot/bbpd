import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';

/// 游戏大厅
///
class ClubGameRoomWidget extends StatelessWidget {
  final List<PartyRoomGridItem> rooms;
  final String? title;
  final bool showDivider;

  const ClubGameRoomWidget(
      {Key? key, required this.rooms, this.showDivider = true, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Util.isCollectionEmpty(rooms)) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 20.0),
          child: Text(
            title ?? K.moment_game_hall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 90,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: _itemBuilder,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 12);
            },
            itemCount: rooms.length,
          ),
        ),
        const SizedBox(height: 24),
        if (showDivider)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
                height: 1, color: R.color.dividerColor.withOpacity(0.08)),
          ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    PartyRoomGridItem item = rooms[index];
    return _ClubRoomWidget(
      item: item,
      key: ValueKey('${item.rid}_${item.name}'),
    );
  }
}

class _ClubRoomWidget extends StatelessWidget {
  final PartyRoomGridItem item;

  const _ClubRoomWidget({Key? key, required this.item}) : super(key: key);

  _onRoomTaped(BuildContext context) {
    IRoomManager manager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    manager.openChatRoomScreenShow(context, item.rid, uid: item.uid);
  }

  @override
  Widget build(BuildContext context) {
    const double width = 160;
    const double height = 90;

    return GestureDetector(
      onTap: () => _onRoomTaped(context),
      child: SizedBox(
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              CachedNetworkImage(
                width: width,
                height: height,
                imageUrl: '${item.cover375}',
                fit: BoxFit.cover,
              ),
              if (!Util.isStringEmpty(item.leftFrame))
                PositionedDirectional(
                  top: 0,
                  start: 0,
                  child: CachedNetworkImage(
                    imageUrl: item.cornerImage,
                    fit: BoxFit.fitHeight,
                    height: 15,
                  ),
                ),
              PositionedDirectional(
                bottom: 0,
                child: Container(
                  width: width,
                  height: 32,
                  alignment: AlignmentDirectional.bottomStart,
                  padding: const EdgeInsetsDirectional.fromSTEB(6, 0, 6, 4),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black.withOpacity(0), Colors.black],
                    ),
                  ),
                  child: Row(
                    children: [
                      RepaintBoundary(
                        child: R.img('in_room_status.webp',
                            package: ComponentManager.MANAGER_BASE_CORE,
                            width: 15,
                            height: 15),
                      ),
                      Expanded(
                        child: Text(
                          item.name ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              height: 1.3),
                        ),
                      ),
                      if (!Util.isCollectionEmpty(item.onlineUserIcons))
                        _buildAvatars(item.onlineUserIcons),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatars(List<String?>? icons) {
    List<Widget> widgets = [];

    int displayNum = min(3, icons?.length ?? 0);
    for (int index = displayNum - 1; index >= 0; index--) {
      widgets.add(
        PositionedDirectional(
          start: 16.0 * index,
          child: CommonAvatar(
            path: icons![index],
            suffix: '!head100',
            size: 18,
            shape: BoxShape.circle,
            resizeCacheWidth: true,
          ),
        ),
      );
    }

    return SizedBox(
      height: 18,
      width: displayNum * 18.0,
      child: Stack(
        children: widgets,
      ),
    );
  }
}
