import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';
import '../model/club_bean.dart';

/// 入驻主播
///
class ClubGameAnchorWidget extends StatelessWidget {
  final List<AnchorInfo> users;

  const ClubGameAnchorWidget({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Util.isCollectionEmpty(users)) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 20.0),
          child: Text(
            K.moment_anchor,
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
          height: 96,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) {
              return GameAnchorItem(item: users[index]);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 16);
            },
            itemCount: users.length,
          ),
        ),
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:
              Divider(height: 1, color: R.color.dividerColor.withOpacity(0.08)),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class GameAnchorItem extends StatelessWidget {
  final AnchorInfo item;

  const GameAnchorItem({Key? key, required this.item}) : super(key: key);

  _onIconTaped(BuildContext context) {
    if (item.isPlaying) {
      IRoomManager manager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      manager.openChatRoomScreenShow(context, item.rid,
          refer: 'ClubDetailScreen');
    } else {
      IPersonalDataManager manager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_PERSONALDATA);
      manager.openImageScreen(context, item.uid,
          refer: const PageRefer('ClubDetailScreen'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onIconTaped(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 64,
            height: 64,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                if (item.isPlaying)
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: _getGradientColor(),
                    ),
                  ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: R.color.mainBgColor),
                  ),
                ),
                CommonAvatar(
                  path: item.icon,
                  size: 56,
                  shape: BoxShape.circle,
                ),
                if (item.isPlaying)
                  PositionedDirectional(bottom: -4, child: _buildDes())
                else if (!Util.isStringEmpty(item.sicon))
                  PositionedDirectional(
                    bottom: 0,
                    child: CachedNetworkImage(
                        imageUrl: item.sicon,
                        height: 14,
                        fit: BoxFit.fitHeight),
                  )
                else if (item.isOnline)
                  PositionedDirectional(
                    end: 4,
                    bottom: 0,
                    child: Container(
                      height: 12,
                      width: 12,
                      alignment: AlignmentDirectional.center,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF2EFECE),
                        shape: CircleBorder(
                            side: BorderSide(color: Colors.white, width: 2)),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          LimitedBox(
            maxWidth: 66,
            child: Text(
              '${item.name}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: R.color.secondTextColor, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDes() {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
      height: 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        border: Border.all(width: 2, color: R.color.mainBgColor),
        gradient: _getGradientColor(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.roomTag ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 8,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  _getGradientColor() {
    if (item.isGame == 1) {
      return const LinearGradient(
        begin: AlignmentDirectional.centerStart,
        end: AlignmentDirectional.centerEnd,
        colors: [
          Color(0xFFE470FF),
          Color(0xFF81DAFF),
        ],
      );
    } else {
      return const LinearGradient(
        begin: AlignmentDirectional.centerStart,
        end: AlignmentDirectional.centerEnd,
        colors: [
          Color(0xFFFE62A5),
          Color(0xFFFFC96A),
        ],
      );
    }
  }
}
