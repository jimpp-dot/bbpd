import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:rank/assets.dart';
import 'package:provider/provider.dart' hide Selector;

import '../../k.dart';

class RoomItemWidget extends StatelessWidget {
  final RoomItemModel item;
  final RoomFrom? roomFrom;
  final String? refer;
  final VoidCallback? onItemClick;
  final double sideMargin;

  const RoomItemWidget(
      {super.key,
      required this.item,
      this.roomFrom,
      this.refer,
      this.onItemClick,
      this.sideMargin = 20});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onTapItem(item, context);
      },
      child: Container(
        height: 100,
        width: Util.width - 40,
        margin: EdgeInsetsDirectional.only(
            top: 5, bottom: 5, start: sideMargin, end: sideMargin),
        decoration: BoxDecoration(
          color: R.color.mainBgColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            getHomeBoxShadow(),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRoomAvatar(),
            Expanded(
              child: _buildInfo(context),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(top: 10),
              width: 0.5,
              height: 80,
              color: R.color.secondBgColor,
            ),
            _buildHot(),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomAvatar() {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 15.5, end: 12, top: 13.5),
      width: 73,
      height: 73,
      decoration: BoxDecoration(
        border: Border.all(color: R.color.secondBgColor, width: 0.5),
        borderRadius: const BorderRadius.all(Radius.circular(36.5)),
      ),
      child: CommonAvatar(
        path: item.roomIcon,
        sex: item.sex,
        size: 72,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    String roomTagIcon = item.tag.tagIcon ?? '';
    if (!roomTagIcon.startsWith(RegExp(r'http(s?):\/\/'))) {
      roomTagIcon = System.imageDomain + roomTagIcon;
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 19,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 1),
              child: CachedNetworkImage(
                imageUrl: roomTagIcon,
                width: 14,
                height: 14,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              item.tag.show ?? '',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: item.tag.tagColor,
                height: 1.2,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          constraints: BoxConstraints(
            maxWidth: Util.width - 40 - 16 - 73 - 66 - 12 - 24,
          ),
          child: Text(
            item.roomName,
            style: TextStyle(
              fontSize: 16,
              color: R.color.mainTextColor,
              height: 1.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        _buildSubInfo(context),
      ],
    );
  }

  Widget _buildSubInfo(BuildContext context) {
    String? bonusIcon;
    try {
      BonusMapModel model = context.watch<BonusMapModel>();
      bonusIcon = model.bonusRoomMap[item.rid];
    } on Exception {}

    if (bonusIcon?.isNotEmpty ?? false) {
      return _buildPacketIcon(bonusIcon!);
    }

    if (item.hourRank > 0) {
      // 有小时榜优先展示
      return _buildHourRank();
    }

    if (showOperationLabel) {
      return _buildOperationLabel();
    }

    if (item.roomUiStyle == HomeRoomUiStyle.RoomUiStyleNormal) {
      return _buildNormalSubInfo();
    } else if (item.roomUiStyle == HomeRoomUiStyle.RoomUiStyleAnchor) {
      return _buildLiveSubInfo();
    } else {
      return _buildGameSubInfo();
    }
  }

  //房间红包标签
  Widget _buildPacketIcon(String icon) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 2),
      child: CachedNetworkImage(
        width: 64,
        height: 24,
        imageUrl: icon,
      ),
    );
  }

  Widget _buildHourRank() {
    return Container(
      width: 63,
      height: 14,
      margin: const EdgeInsetsDirectional.only(top: 8),
      padding: const EdgeInsetsDirectional.only(top: 1),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(R.imagePath(Assets.home_hour_rank_bg_webp,
              package: ComponentManager.MANAGER_RANK)),
          fit: BoxFit.cover,
        ),
      ),
      alignment: AlignmentDirectional.center,
      child: Text(
        K.rank_hour_num([item.hourRank.toString()]),
        style: const TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          height: 1.0,
        ),
      ),
    );
  }

  Widget _buildGameSubInfo() {
    String prefix =
        '[${K.rank_in_room_num(['${item.numGirl + item.numBoy}'])}]';
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 7),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: Util.width - 40 - 16 - 73 - 12 - 24 - 66,
            ),
            child: Text(
              '$prefix${item.gameStatus == 0 ? K.rank_in_preparation : K.rank_gaming}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: R.color.secondTextColor,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLiveSubInfo() {
    String prefix = '';
    if (item.isGameRoom || item.types == 'auto') {
      prefix = '';
    } else if (item.types == 'radio-defend' || item.types == 'live') {
      prefix = '[${K.rank_anchor}]';
    } else if (item.type == 'ktv') {
      prefix = '[${K.rank_role_creator}]';
    } else {
      prefix = '[${K.rank_reception}]';
    }
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 7),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: Util.width - 40 - 16 - 73 - 12 - 24 - 66,
        ),
        child: Text(
          '$prefix${item.userName}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            color: R.color.secondTextColor,
            height: 1.2,
          ),
        ),
      ),
    );
  }

  Widget _buildNormalSubInfo() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (item.paier == 1) _buildBossIcon(),
          if (item.paier == 1 && item.micIcons.isNotEmpty)
            Container(
              margin: const EdgeInsetsDirectional.only(start: 2.5, end: 2.5),
              width: 2,
              height: 2,
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: R.color.mainTextColor.withOpacity(0.1),
              ),
            ),
          if (item.micIcons.isNotEmpty) _buildAvatars(),
        ],
      ),
    );
  }

  Widget _buildBossIcon() {
    if (item.bossIcon.isNotEmpty) {
      return _buildAvatar(item.bossIcon);
    } else {
      return Container(
        width: 21,
        height: 21,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.5)),
          border: Border.all(color: R.color.mainBgColor, width: 1.5),
        ),
        alignment: AlignmentDirectional.center,
        child: Container(
          width: 18,
          height: 18,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(9)),
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [Color(0xFFFF8000), Color(0xFFFFC659)],
            ),
          ),
          alignment: AlignmentDirectional.center,
          child: R.img(
            Assets.ic_boss_seat_svg,
            width: 12,
            height: 12,
            package: ComponentManager.MANAGER_RANK,
          ),
        ),
      );
    }
  }

  Widget _buildAvatar(String url) {
    return Container(
      width: 21,
      height: 21,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.5)),
        border: Border.all(color: R.color.mainBgColor, width: 1.5),
      ),
      child: CommonAvatar(
        path: url,
        suffix: '!head100',
        size: 18,
        shape: BoxShape.circle,
        resizeCacheWidth: true,
      ),
    );
  }

  Widget _buildAvatars() {
    List<Widget> widgets = [];

    // 根据剩余空间展示麦上头像个数
    double maxLength =
        Util.width - 40 - 16 - 73 - 66 - 12 - 24 - (item.paier == 1 ? 28 : 0);
    double totalWidth = 0;
    List<String> showIcons = [];
    for (int index = 0; index < item.micIcons.length; index++) {
      int addWidth = (index == 0 ? 21 : 16);
      if (totalWidth + addWidth > maxLength) {
        break;
      }

      totalWidth += addWidth;
      showIcons.add(item.micIcons[index]);
    }

    for (int index = showIcons.length - 1; index >= 0; index--) {
      widgets.add(
        PositionedDirectional(
          start: 16.0 * index,
          child: _buildAvatar(showIcons[index]),
        ),
      );
    }
    return SizedBox(
      width: totalWidth,
      height: 21,
      child: Stack(
        children: widgets,
      ),
    );
  }

  Widget _buildOperationLabel() {
    return Container(
      width: 48,
      height: 14,
      margin: const EdgeInsetsDirectional.only(top: 8),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        image: DecorationImage(
          image: NetworkImage(item.operationBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 1),
        child: Text(
          item.operationLabel,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            height: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildHot() {
    return SizedBox(
      width: 66,
      height: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 35,
          ),
          R.img(
            BaseAssets.ic_hot_svg,
            width: 16,
            height: 16,
            package: ComponentManager.MANAGER_BASE_CORE,
          ),
          const SizedBox(
            height: 4,
          ),
          NumText(
            Utility.getRoundOnline(item.onlineNum, item.realNum, item.types)
                .toString(),
            style: TextStyle(
              color: R.color.mainTextColor.withOpacity(0.2),
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  void _onTapItem(RoomItemModel room, BuildContext context) {
    int rid = room.rid;
    IRoomManager roomManager = ComponentManager.instance
        .getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openChatRoomScreenShow(context, rid,
        from: roomFrom, refer: refer);

    if (onItemClick != null) {
      onItemClick!();
    }
  }

  bool get showOperationLabel {
    return item.operationLabel.isNotEmpty && item.operationBg.isNotEmpty;
  }
}
