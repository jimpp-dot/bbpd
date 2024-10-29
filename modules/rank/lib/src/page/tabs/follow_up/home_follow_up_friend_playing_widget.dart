import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:rank/src/widget/home_friend_palying_item.dart';

class HomeFollowUpFriendPlayingItemWidget extends StatelessWidget {
  final BuildContext context;
  final int position;
  final HomeFriendItem itemData;

  const HomeFollowUpFriendPlayingItemWidget({
    Key? key,
    required this.context,
    required this.position,
    required this.itemData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTapItem,
      child: Rext.themeCardContainer(
        darkBgColors: [const Color(0xFF29282E), const Color(0xFF29282E)],
        width: Util.width,
        height: 88,
        margin: const EdgeInsetsDirectional.only(start: 16, top: 16, end: 16),
        cornerRadius: 16,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(width: 8),
        _buildAvatar(),
        const SizedBox(width: 10),
        Expanded(child: _buildInfo()),
        const SizedBox(width: 12),
      ],
    );
  }

  Widget _buildAvatar() {
    return CommonAvatar(
      path: itemData.roomIcon ?? '',
      sex: itemData.sex,
      size: 70,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(14),
      onlyFirstFrame: true,
    );
  }

  Widget _buildInfo() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRoomCategory(),
        const SizedBox(height: 6),
        _buildName(),
        const SizedBox(height: 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: _buildDesc()),
            const SizedBox(width: 10),
            _buildOnlineNum(),
          ],
        ),
      ],
    );
  }

  Widget _buildRoomCategory() {
    return GradientText(
      itemData.tag?.show ?? '',
      gradient: LinearGradient(colors: itemData.tag?.bgColors ?? []),
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
    // return Row(
    //   children: [
    //     Container(
    //       height: 16,
    //       decoration: ShapeDecoration(
    //         shape: StadiumBorder(),
    //         color: R.colors.moduleBgColor,
    //       ),
    //       foregroundDecoration: ShapeDecoration(
    //         shape: StadiumBorder(side: BorderSide(color: R.colors.secondTextColor, width: 0.5)),
    //         color: Colors.transparent,
    //       ),
    //       alignment: AlignmentDirectional.center,
    //       padding: const EdgeInsetsDirectional.only(start: 6, end: 6),
    //       child: Row(
    //         mainAxisSize: MainAxisSize.min,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           CachedNetworkImage(
    //             imageUrl: Util.getRemoteImgUrl(itemData.tag.tagIcon),
    //             width: 12,
    //             height: 12,
    //           ),
    //           const SizedBox(width: 2),
    //           Padding(
    //             padding: const EdgeInsets.only(bottom: 2),
    //             child: Text(
    //               itemData.tag?.show ?? '',
    //               style: TextStyle(
    //                 fontSize: 10,
    //                 fontWeight: FontWeight.bold,
    //                 color: R.colors.mainTextColor,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }

  Widget _buildName() {
    return Text(
      '${itemData.ticketMark}${Util.validStr(itemData.ticketMark) && Util.validStr(itemData.roomName) ? (' | ${itemData.roomName}') : itemData.roomName}',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Util.validStr(itemData.ticketMark)
            ? const Color(0xFFFFBF4E)
            : R.colors.mainTextColor,
        height: 1.2,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDesc() {
    return Text(
      itemData.followDesc,
      style:
          TextStyle(fontSize: 12, color: R.colors.secondTextColor, height: 1.2),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildOnlineNum() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        R.img(
          Assets.rank_room_online_user_webp,
          width: 16,
          height: 16,
          // color: R.colors.thirdTextColor,
          package: ComponentManager.MANAGER_RANK,
        ),
        const SizedBox(width: 2),
        Text(
          '${itemData.onlineNum}',
          style: TextStyle(
            color: R.colors.mainTextColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: Util.numFontFamily,
            package: ComponentManager.MANAGER_BASE_CORE,
          ),
        ),
      ],
    );
  }

  void _onTapItem() {
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openChatRoomScreenShow(context, itemData.rid ?? 0);
    _handleClickItemReport();
  }

  void _handleClickItemReport() {
    int relation = 0;
    if (itemData.relationType == UserRelationType.Friend) {
      relation = 1;
    } else if (itemData.relationType == UserRelationType.Follow) {
      relation = 2;
    } else if (itemData.relationType == UserRelationType.Accompany) {
      relation = 3;
    }

    Tracker.instance.track(
      TrackEvent.friendplaying_click,
      properties: {
        'refer': relation,
        'rid': itemData.rid,
        'to_uid': itemData.uid,
        'position': position,
        'is_biz': itemData.isBiz,
      },
    );
  }
}
