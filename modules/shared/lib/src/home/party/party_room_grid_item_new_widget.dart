import 'dart:math';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';

// ignore: must_be_immutable
class PartyRoomGridItemNewWidget extends StatelessWidget {
  final PartyRoomGridItem? item;
  double? width;
  final RoomFrom? roomFrom;
  final String? refer;
  final VoidCallback? onItemClick;
  final bool autoGotoRoom;
  double offset = 4.dp; // 阴影向外扩边距

  PartyRoomGridItemNewWidget(
      {Key? key,
      this.item,
      this.width,
      this.roomFrom,
      this.refer,
      this.onItemClick,
      this.autoGotoRoom = true})
      : super(key: key) {
    if (width == null) {
      width = (Util.width - 16 * 2 - 8) / 2.0;
    } else {
      width = width;
    }
  }

  _onRoomTaped(BuildContext context) {
    if (autoGotoRoom) {
      IRoomManager manager = ComponentManager.instance
          .getManager(ComponentManager.MANAGER_BASE_ROOM);
      manager.openChatRoomScreenShow(context, item?.rid ?? 0,
          refer: refer ?? '', from: roomFrom, uid: item?.uid ?? 0);
    }
    if (onItemClick != null) {
      onItemClick!();
    }
  }

  bool get showOperationLabel {
    return item?.operationLabel != null &&
        item!.operationLabel!.isNotEmpty &&
        item?.operationBg != null &&
        item!.operationBg!.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    bool hasLabelName = !Util.isStringEmpty(item?.label);
    bool hasCornerImage = !Util.isStringEmpty(item?.leftFrameNew) ||
        !Util.isStringEmpty(item?.leftFrame);
    String? cornerImage;
    if (hasCornerImage) {
      cornerImage = !Util.isStringEmpty(item?.leftFrameNew)
          ? item?.leftFrameNew
          : item?.cornerImage;
    }
    bool hasBorder = !Util.isStringEmpty(item?.fixFrameUrl2);
    bool hasRoomTag = !Util.isStringEmpty(item?.fixTagUrl2);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onRoomTaped(context),
      child: SizedBox(
        width: width,
        height: width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Container(
                  padding: EdgeInsets.all(offset),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.dp),
                      child: CachedNetworkImage(
                        width: width,
                        height: width,
                        imageUrl: item?.coverNew375,
                        fit: BoxFit.cover,
                      ))),
              if (hasBorder)
                CachedNetworkImage(
                    imageUrl: item?.fixFrameUrl2,
                    width: width,
                    height: width,
                    fit: BoxFit.cover,
                    supportDark: true),
              if (hasRoomTag)
                PositionedDirectional(
                  end: offset,
                  top: offset,
                  child: CachedNetworkImage(
                      imageUrl: item?.fixTagUrl2,
                      height: 20.dp,
                      fit: BoxFit.fitHeight,
                      supportDark: true),
                ),
              if (hasCornerImage && !hasBorder && !hasRoomTag)
                PositionedDirectional(
                  top: offset,
                  end: offset,
                  child: CachedNetworkImage(
                    imageUrl: cornerImage,
                    fit: BoxFit.fitHeight,
                    height: 15,
                  ),
                ),
              // 房间标签
              if (!hasCornerImage && !hasBorder && !hasRoomTag)
                PositionedDirectional(
                  top: offset + 2,
                  end: offset + 2,
                  child: _buildRoomLabel(),
                ),
              PositionedDirectional(
                top: offset + 8,
                start: offset + 8,
                child: _buildTopStart(hasRoomTag ||
                    hasCornerImage ||
                    item?.packetIcon?.isNotEmpty == true ||
                    (item?.hourRank ?? 0) > 0 ||
                    showOperationLabel),
              ),
              PositionedDirectional(
                bottom: 0,
                start: 0,
                child: Container(
                  width: width,
                  alignment: AlignmentDirectional.bottomStart,
                  padding: EdgeInsets.symmetric(horizontal: 8 + offset),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x00000000),
                        Color(0x48000000),
                        Color(0x66000000)
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (hasLabelName) ...[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 16,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              alignment: AlignmentDirectional.center,
                              decoration: ShapeDecoration(
                                color: Colors.black.withOpacity(0.2),
                                shape: StadiumBorder(
                                  side: BorderSide(
                                    color: Colors.white.withOpacity(0.5),
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Text(
                                item?.label ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                      ],
                      Text(
                        item?.name ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          shadows: [
                            Shadow(
                              offset: Offset.zero,
                              blurRadius: 2,
                              color: Colors.black.withOpacity(0.5),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // 房间麦位头像
                          if (!Util.isCollectionEmpty(item?.onlineUserIcons))
                            _buildAvatars(item?.onlineUserIcons)
                          else ...[
                            RepaintBoundary(
                              child: R.img('in_room_status.webp',
                                  package: ComponentManager.MANAGER_BASE_CORE,
                                  width: 15,
                                  height: 15),
                            ),
                            Expanded(
                              child: Text(
                                item?.userName ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                          const SizedBox(width: 20),
                          R.img(
                            (item?.showHot ?? false)
                                ? 'hot_num.svg'
                                : 'online_num.svg',
                            width: 12,
                            height: 12,
                            package: ComponentManager.MANAGER_BASE_CORE,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '${item?.hotNum}',
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: Util.numFontFamily,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
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

  Widget _buildTopStart(bool vertical) {
    List<Widget> children = [];
    if (Util.validStr(item?.tag)) {
      children.add(
        Padding(
          padding: EdgeInsetsDirectional.only(
              bottom: vertical ? 6 : 0, end: !vertical ? 6 : 0),
          child: CachedNetworkImage(
            imageUrl: Util.getRemoteImgUrl(item?.tag),
            fit: BoxFit.fitHeight,
            height: 20,
          ),
        ),
      );
    }
    if (item != null && (item!.prettyRid ?? 0) > 0) {
      children.add(PrettyIdWidget(prettyId: item!.prettyRid.toString()));
    }
    if (children.isEmpty) return const SizedBox.shrink();
    if (vertical) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      );
    }
  }

  Widget _buildRoomLabel() {
    if (item?.packetIcon?.isNotEmpty ?? false) {
      return _buildPacketIcon();
    }

    if ((item?.hourRank ?? 0) > 0) {
      // 有小时榜优先展示
      return _buildHourRank();
    }

    if (showOperationLabel) {
      return _buildOperationLabel();
    }

    return const SizedBox.shrink();
  }

  Widget _buildOperationLabel() {
    return Container(
      width: 48,
      height: 14,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        image: DecorationImage(
          image: NetworkImage(item?.operationBg ?? ''),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(top: 1),
        child: Text(
          item?.operationLabel ?? '',
          style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 1),
        ),
      ),
    );
  }

  Widget _buildHourRank() {
    return Container(
      width: 63,
      height: 14,
      padding: const EdgeInsetsDirectional.only(top: 1),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(R.imagePath('home_hour_rank_bg.webp',
              package: ComponentManager.MANAGER_RANK)),
          fit: BoxFit.cover,
        ),
      ),
      alignment: AlignmentDirectional.center,
      child: Text(
        K.base_hour_rank([item?.hourRank.toString() ?? '']),
        style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            height: 1.0),
      ),
    );
  }

  //房间红包标签
  Widget _buildPacketIcon() {
    return CachedNetworkImage(
        width: 64, height: 24, imageUrl: item?.packetIcon);
  }

  Widget _buildAvatars(List<String?>? icons) {
    List<Widget> widgets = [];

    for (int index = min(4, (icons?.length ?? 0)) - 1; index >= 0; index--) {
      widgets.add(
        PositionedDirectional(
          start: 16.0 * index,
          child: CommonAvatar(
            path: icons?[index],
            suffix: '!head100',
            size: 18,
            shape: BoxShape.circle,
            resizeCacheWidth: true,
          ),
        ),
      );
    }

    return Expanded(
      child: SizedBox(
        height: 18,
        child: Stack(
          children: widgets,
        ),
      ),
    );
  }
}
