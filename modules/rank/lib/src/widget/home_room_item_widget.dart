import 'package:flutter/material.dart';
import 'package:keframe/keframe.dart';
import 'package:provider/provider.dart' hide Selector;
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:shared/shared.dart';

import 'room_item_widget_avatars.dart';

enum ItemPriority {
  normal,
  roomIcon,
  roomType,
  roomName,
}

class HomeRoomItemWidget extends StatelessWidget {
  final RoomListItem item;
  final RoomFrom? roomFrom;
  final String? refer;
  final VoidCallback? onItemClick;

  HomeRoomItemWidget({
    super.key,
    required this.item,
    this.roomFrom,
    this.refer,
    this.onItemClick,
  });

  final double ratio = 98 / 353;
  final double offset = 5.dp; // 阴影向外扩边距

  @override
  Widget build(BuildContext context) {
    double width = Util.width - 11.dp * 2;
    double height = width * ratio;
    // Log.d('item prettyRid:${item.prettyRid}');

    return GestureDetector(
      onTap: () {
        _onTapItem(item, context);
      },
      child: Container(
        width: width,
        height: height,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white.withOpacity(0.07), Colors.white.withOpacity(0.07)],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd),
            borderRadius: BorderRadiusDirectional.circular(14)),
        margin: const EdgeInsetsDirectional.only(top: 4, bottom: 4),
        child: Stack(
          children: [
            _buildRoom(context),
            // Padding(
            //   padding: EdgeInsets.all(offset),
            //   child: Rext.themeCardContainer(
            //     width: double.infinity,
            //     height: double.infinity,
            //     cornerRadius: 16.dp,
            //     child: _buildRoom(context),
            //   ),
            // ),
            if (Util.validStr(item.fixFrameUrl1))
              CachedNetworkImage(imageUrl: item.fixFrameUrl1, width: width, height: height, supportDark: true),
            if (Util.validStr(item.fixTagUrl1))
              PositionedDirectional(
                end: offset + 1.dp,
                top: offset + 1.dp,
                child: CachedNetworkImage(
                  imageUrl: item.fixTagUrl1,
                  height: 20.dp,
                  fit: BoxFit.fitHeight,
                  supportDark: true,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoom(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            _buildRoomAvatar(),
            const SizedBox(width: 10),
            Expanded(
              child: _buildInfo(context),
            ),
            const SizedBox(width: 15),
          ],
        ),
        if (item.topRightIcon.isNotEmpty && Util.isStringEmpty(item.fixFrameUrl1) && Util.isStringEmpty(item.fixTagUrl1))
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: CachedNetworkImage(
              imageUrl: item.topRightIcon,
              height: 18,
              fit: BoxFit.fitHeight,
            ),
          )
      ],
    );
  }

  Widget _buildRoomAvatar() {
    String icon = Util.validStr(item.liveCoverIcon) ? item.liveCoverIcon : item.icon;
    // Log.d('item:' + item.toString());

    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      double height = constraints.maxHeight - 8 * 3;
      return Container(
        width: height,
        height: height,
        margin: const EdgeInsets.only(left: 5),
        child: FrameSeparateWidget(
          priorityBaseOffset: ItemPriority.roomIcon.index,
          placeHolder: SizedBox(width: height, height: height),
          child: CommonAvatar(
            path: icon,
            suffix: Util.squareResizeSuffix(240),
            sex: item.sex,
            size: height,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(14),
            onlyFirstFrame: true,
          ),
        ),
      );
    });
  }

  Widget _buildInfo(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 14,
        ),
        Text(
          item.ticketMark + (Util.validStr(item.ticketMark) && Util.validStr(item.name) ? ' | ${item.name}' : item.name),
          style: const TextStyle(
            fontSize: 16,
            // color: Util.validStr(item.ticketMark) ? const Color(0xFFFFBF4E) : R.colors.mainTextColor,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 6),
        _buildRoomCategory(),
        Container(
          height: 24,
          margin: const EdgeInsets.only(top: 6),
          alignment: AlignmentDirectional.bottomCenter,
          child: _buildSubInfo(context),
        ),
      ],
    );
  }

  Widget _buildRoomCategory() {
    return Row(
      children: [
        RoomTagChip(text: item.typeName.show, backgroundColor: Util.parseColors(item.typeName.bg).last),
        const SizedBox(width: 6),
        if (item.prettyRid > 0) PrettyIdWidget(prettyId: item.prettyRid.toString()),
      ],
    );
  }

  Widget _buildSubInfo(BuildContext context) {
    String? bonusIcon;
    try {
      BonusMapModel? model = context.watch<BonusMapModel>();
      bonusIcon = model.bonusRoomMap[item.rid];
    } catch (_) {}

    return _buildRealSubInfo(bonusIcon);
  }

  Widget _buildRealSubInfo(String? bonusIcon) {
    if (bonusIcon?.isNotEmpty ?? false) {
      return _buildPacketIcon(bonusIcon!);
    }
    if (item.hourRank > 0) {
      // 有小时榜优先展示
      return _buildHourRank();
    }

    if (Util.validList(item.tagIcon)) {
      /// 新频道标签，最多支持两个
      return _buildTagIcon();
    }
    if (showOperationLabel) {
      return _buildOperationLabel();
    }

    // Log.d('roomUiStyle: ${item.roomUiStyle}');
    if (item.roomUiStyle == HomeRoomUiStyle.RoomUiStyleNormal) {
      return _buildNormalSubInfo();
    } else if (item.roomUiStyle == HomeRoomUiStyle.RoomUiStyleAnchor) {
      return _buildLiveSubInfo();
    } else if (item.roomUiStyle == HomeRoomUiStyle.RoomUiStyleGameRecruit) {
      return _buildGameRecruitSubInfo();
    }
    return _buildNormalSubInfo();
  }

  /// 新频道标签，最多展示两个
  Widget _buildTagIcon() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CachedNetworkImage(
          imageUrl: Util.getRemoteImgUrl(item.tagIcon[0]),
          height: 22,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 4),
        if (item.tagIcon.length > 1)
          CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(item.tagIcon[1]),
            height: 22,
            fit: BoxFit.contain,
          ),
        const Spacer(),
        _buildHot()
      ],
    );
  }

  /// 房间红包标签
  Widget _buildPacketIcon(String icon) {
    return Row(
      children: [
        CachedNetworkImage(imageUrl: icon, width: 56, height: 21),
        const Spacer(),
        _buildHot(),
      ],
    );
  }

  Widget _buildHourRank() {
    return Row(
      children: [
        Container(
          width: 63,
          height: 14,
          padding: const EdgeInsetsDirectional.only(top: 1),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(R.imagePath(Assets.home_hour_rank_bg_webp, package: ComponentManager.MANAGER_RANK)),
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
        ),
        const Spacer(),
        _buildHot(),
      ],
    );
  }

  Widget _buildGameRecruitSubInfo() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 20,
          constraints: const BoxConstraints(maxWidth: 240),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: R.color.mainBrandColor.withOpacity(0.1),
          ),
          padding: const EdgeInsetsDirectional.only(start: 6, end: 6, top: 2),
          child: Text(
            item.recruitDesc,
            style: TextStyle(
              fontSize: 13,
              color: R.color.mainBrandColor,
              height: 1.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(),
        const SizedBox(width: 4),
        _buildHot(),
      ],
    );
  }

  Widget _buildLiveSubInfo() {
    String prefix = '';
    if (item.isGame == true || item.types == 'auto') {
      prefix = '';
    } else if (item.types == 'radio-defend' || item.types == 'live') {
      prefix = '[${K.rank_anchor}]';
    } else if (item.type == 'ktv') {
      prefix = '[${K.rank_role_creator}]';
    } else {
      prefix = '[${K.rank_reception}]';
    }
    return Row(
      children: [
        Expanded(
          child: Visibility(
            visible: false,
            child: Text(
              '$prefix${item.uname}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                color: R.colors.secondTextColor,
                height: 1.2,
              ),
            ),
          ),
        ),
        const SizedBox(width: 4),
        _buildHot(),
      ],
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
            const SizedBox(
              width: 4,
              height: 2,
            ),
          if (item.micIcons.isNotEmpty) RoomItemWidgetAvatars(micIcons: item.micIcons),
          const Spacer(),
          _buildHot(),
        ],
      ),
    );
  }

  Widget _buildBossIcon() {
    if (item.bossIcon.isNotEmpty) {
      return _buildAvatar(item.bossIcon);
    } else {
      return Container(
        width: 18,
        height: 18,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [Color(0xFFFF8000), Color(0xFFFFC659)],
          ),
        ),
        foregroundDecoration: const ShapeDecoration(
          shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 0.5)),
          color: Colors.transparent,
        ),
        alignment: AlignmentDirectional.center,
        child: R.img(
          Assets.ic_boss_seat_svg,
          width: 12,
          height: 12,
          package: ComponentManager.MANAGER_RANK,
        ),
      );
    }
  }

  Widget _buildAvatar(String url) {
    return Container(
      width: 18,
      height: 18,
      foregroundDecoration: const ShapeDecoration(
        shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 0.5)),
        color: Colors.transparent,
      ),
      alignment: AlignmentDirectional.center,
      child: CommonAvatar(
        path: url,
        suffix: Util.squareResizeSuffix(50),
        size: 18,
        shape: BoxShape.circle,
        resizeCacheWidth: true,
      ),
    );
  }

  Widget _buildOperationLabel() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          constraints: const BoxConstraints(minWidth: 48),
          height: 16,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            image: DecorationImage(
              image: NetworkImage(Util.getRemoteImgUrl(item.operationBg)),
              fit: BoxFit.fill,
            ),
          ),
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
        const Spacer(),
        _buildHot(),
      ],
    );
  }

  Widget _buildHot() {
    if (item.fixHideHot) {
      return const SizedBox(); // 隐藏热度值
    }
    return Container(
      constraints: const BoxConstraints(maxWidth: 100),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          R.img(
            'room_hot.webp',
            width: 16,
            height: 16,
            package: ComponentManager.MANAGER_BASE_CORE,
          ),
          const SizedBox(width: 2),
          NumText(
            '${item.hot}',
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: Util.numFontFamily,
              package: ComponentManager.MANAGER_BASE_CORE,
            ),
          ),
        ],
      ),
    );
  }

  void _onTapItem(RoomListItem room, BuildContext context) {
    int rid = room.rid;
    IRoomManager roomManager = ComponentManager.instance.getManager(ComponentManager.MANAGER_BASE_ROOM);
    roomManager.openChatRoomScreenShow(context, rid, from: roomFrom, refer: refer);

    if (onItemClick != null) {
      onItemClick!();
    }
  }

  bool get showOperationLabel {
    return item.operationLabel.isNotEmpty && item.operationBg.isNotEmpty;
  }
}

class RoomTagChip extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;

  const RoomTagChip({
    Key? key,
    required this.text,
    this.backgroundColor = const Color(0xFFE6F2FF), // Light blue color
    this.textColor = Colors.black,
    this.borderRadius = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(color: textColor, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
