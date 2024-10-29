import 'package:shared/assets.dart';
import 'package:rank/assets.dart';
import 'package:rank/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:keframe/keframe.dart';
import 'room_item_widget_avatars.dart';
import 'package:provider/provider.dart' hide Selector;

enum ItemPriority {
  normal,
  roomIcon,
  roomType,
  roomName,
}

class HomeRoomItemWidgetV2 extends StatelessWidget {
  final RoomListItem item;
  final RoomFrom? roomFrom;
  final String? refer;
  final VoidCallback? onItemClick;
  double? width;

  HomeRoomItemWidgetV2({
    super.key,
    required this.item,
    this.roomFrom,
    this.refer,
    this.onItemClick,
    this.width,
  }) {
    width ??= (Util.width - 12.dp * 2) / 2.0;
  }

  String _cover375(String icon) {
    /// 海报支持webp
    if (icon.endsWith('webp')) {
      return Util.getRemoteImgUrl(icon);
    }
    return Util.cover375(icon) ?? '';
  }

  final double offset = 4.dp; // 阴影向外扩边距

  @override
  Widget build(BuildContext context) {
    String icon =
        Util.validStr(item.liveCoverIcon) ? item.liveCoverIcon : item.icon;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onTapItem(item, context),
      child: SizedBox(
        width: width,
        height: width! + 34,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              width: width,
              height: width,
              padding: EdgeInsets.all(offset),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.dp),
                child: FrameSeparateWidget(
                  priorityBaseOffset: ItemPriority.roomIcon.index,
                  placeHolder: SizedBox(width: width, height: width),
                  child: CachedNetworkImage(
                    width: width,
                    height: width,
                    imageUrl: _cover375(icon),
                    fit: BoxFit.cover,
                    onlyFirstFrame: true,
                  ),
                ),
              ),
            ),
            if (Util.validStr(item.fixFrameUrl2))
              CachedNetworkImage(
                  imageUrl: item.fixFrameUrl2,
                  width: width,
                  height: width,
                  supportDark: true),
            if (Util.validStr(item.fixTagUrl2))
              PositionedDirectional(
                end: offset + 1.dp,
                top: offset + 1.dp,
                child: CachedNetworkImage(
                    imageUrl: item.fixTagUrl2,
                    height: 20.dp,
                    fit: BoxFit.fitHeight,
                    supportDark: true),
              ),
            Container(
              width: width,
              height: width,
              padding: EdgeInsets.all(offset),
              child: Stack(
                children: [
                  PositionedDirectional(
                    start: 8,
                    top: 8,
                    child: _buildRoomCategory(),
                  ),
                  PositionedDirectional(
                    start: 0,
                    end: 0,
                    bottom: 0,
                    child: _buildInfo(context),
                  ),
                  if (item.topRightIcon.isNotEmpty &&
                      Util.isStringEmpty(item.fixFrameUrl2) &&
                      Util.isStringEmpty(item.fixTagUrl2))
                    PositionedDirectional(
                      top: 0,
                      end: 0,
                      child: _buildTopEnd(),
                    ),
                ],
              ),
            ),
            Container(
              width: width,
              height: 34,
              alignment: AlignmentDirectional.centerStart,
              margin: EdgeInsetsDirectional.only(top: width! - offset),
              padding: EdgeInsetsDirectional.only(
                  start: offset, end: offset, bottom: 2),
              child: Text(
                item.ticketMark +
                    (Util.validStr(item.ticketMark) && Util.validStr(item.name)
                        ? ' | ${item.name}'
                        : item.name),
                style: TextStyle(
                  fontSize: 14,
                  color: Util.validStr(item.ticketMark)
                      ? const Color(0xFFFFBF4E)
                      : R.colors.mainTextColor,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: Util.validStr(item.fixFrameUrl2) // frame图自带蒙层
          ? null
          : const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
              gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [Color(0x00000000), Color(0x80000000)],
              ),
            ),
      alignment: AlignmentDirectional.bottomCenter,
      padding: const EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 8),
      child: Container(
        height: 24,
        alignment: AlignmentDirectional.bottomCenter,
        child: _buildSubInfo(context),
      ),
    );
  }

  Widget _buildTopEnd() {
    return CachedNetworkImage(
      imageUrl: item.topRightIcon,
      height: 18,
      fit: BoxFit.fitHeight,
    );
  }

  Widget _buildRoomCategory() {
    var roomCategory = Container(
      height: 20,
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsetsDirectional.only(start: 4, end: 4, bottom: 0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: R.color.secondTextColor,
      ),
      child: GradientText(
        item.typeName.show,
        gradient: LinearGradient(colors: Util.parseColors(item.typeName.bg)),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    if (item.prettyRid == 0) {
      // 非靓号房
      return roomCategory;
    }

    if (Util.validStr(item.fixTagUrl2)) {
      // 靓号房并且有房间标签
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          roomCategory,
          const SizedBox(height: 6),
          PrettyIdWidget(prettyId: item.prettyRid.toString()),
        ],
      );
    }

    // 靓号房无房间标签
    return Row(
      children: [
        roomCategory,
        const SizedBox(width: 6),
        PrettyIdWidget(prettyId: item.prettyRid.toString()),
      ],
    );
  }

  Widget _buildSubInfo(BuildContext context) {
    String? bonusIcon;
    try {
      BonusMapModel? model = context.watch<BonusMapModel>();
      bonusIcon = model.bonusRoomMap[item.rid];
    } on Exception {}

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

    if (item.roomUiStyle == HomeRoomUiStyle.RoomUiStyleNormal) {
      return _buildNormalSubInfo();
    } else if (item.roomUiStyle == HomeRoomUiStyle.RoomUiStyleAnchor) {
      return _buildLiveSubInfo();
    } else if (item.roomUiStyle == HomeRoomUiStyle.RoomUiStyleGameRecruit) {
      return _buildGameRecruitSubInfo();
    }
    return _buildNormalSubInfo();
  }

  //房间红包标签
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
              image: AssetImage(R.imagePath(Assets.home_hour_rank_bg_webp,
                  package: ComponentManager.MANAGER_RANK)),
              fit: BoxFit.cover,
            ),
          ),
          alignment: AlignmentDirectional.center,
          child: Text(
            K.rank_hour_num([item.hourRank.toString()]),
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w500,
              color: R.dColor.mainTextColor,
              height: 1.0,
            ),
          ),
        ),
        const Spacer(),
        _buildHot(),
      ],
    );
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

  Widget _buildGameRecruitSubInfo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Container(
            height: 20,
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
        ),
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
          child: Text(
            '$prefix${item.uname}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              color: R.dColor.mainTextColor,
              height: 1.2,
              shadows: [
                Shadow(
                    color: R.color.secondTextColor,
                    offset: const Offset(0, 0.5))
              ],
            ),
          ),
        ),
        const SizedBox(width: 4),
        _buildHot(),
      ],
    );
  }

  Widget _buildNormalSubInfo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (item.paier > 0) _buildBossIcon(),
        if (item.paier > 0 && item.micIcons.isNotEmpty)
          const SizedBox(
            width: 4,
            height: 2,
          ),
        if (item.micIcons.isNotEmpty)
          RoomItemWidgetAvatars(micIcons: item.micIcons),
        const Spacer(),
        _buildHot(),
      ],
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
          shape:
              StadiumBorder(side: BorderSide(color: Colors.white, width: 0.5)),
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
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w500,
              color: R.dColor.mainTextColor,
              height: 1,
              shadows: [
                Shadow(
                    color: R.color.secondTextColor,
                    offset: const Offset(0, 0.5))
              ],
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
      constraints: const BoxConstraints(maxWidth: 60),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          R.img(
            BaseAssets.ic_home_hot_webp,
            width: 16,
            height: 16,
            package: ComponentManager.MANAGER_BASE_CORE,
          ),
          const SizedBox(width: 2),
          NumText(
            '${item.hot}',
            style: TextStyle(
              fontSize: 16,
              color: R.dColor.mainTextColor,
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
