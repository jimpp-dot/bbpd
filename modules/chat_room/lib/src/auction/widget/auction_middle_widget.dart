import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/protobuf/generated/auction.pb.dart';
import 'package:flutter/material.dart';

import '../../../assets.dart';
import '../../../chat_room.dart';
import 'auction_check_define_dialog.dart';

/// 拍卖模块中间的UI
class AuctionMiddleWidget extends StatefulWidget {
  final AuctionConfigMessage auctionData;
  final ChatRoomData room;

  const AuctionMiddleWidget(
      {super.key, required this.auctionData, required this.room});

  @override
  State<StatefulWidget> createState() => _AuctionMiddleState();
}

class _AuctionMiddleState extends State<AuctionMiddleWidget> {
  @override
  Widget build(BuildContext context) {
    AuctionStatus status = widget.auctionData.status;
    if (status == AuctionStatus.WAIT || status == AuctionStatus.SETTING) {
      return _buildWait();
    } else if (status == AuctionStatus.AUCTION) {
      return _buildIng();
    } else if (status == AuctionStatus.UPGRADE) {
      return _buildUpgrade();
    }
    return const SizedBox.shrink();
  }

  /// status == wait
  Widget _buildWait() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 10),
          child: Text(
            K.room_auction_object,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        R.img(
          RoomAssets.chat_room$auction_ic_unknown_svg,
          width: 33,
          height: 22,
          fit: BoxFit.contain,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 12, bottom: 10),
          child: Text(
            K.room_auction_starting_gift,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        R.img(
          RoomAssets.chat_room$auction_ic_unknown_svg,
          width: 33,
          height: 22,
          fit: BoxFit.contain,
        ),
      ],
    );
  }

  /// status == auction
  Widget _buildIng() {
    int giftId = widget.auctionData.commodity.giftId;
    String giftIcon = Util.giftImgUrl(giftId);

    String commodity = widget.auctionData.commodity.commodity;

    /// 此拍品 可以 修改
    bool canEdit = widget.auctionData.mode != 0 &&
        widget.auctionData.commodity.editable == 1;

    /// 此拍品 需要 接待确认
    bool needCheck = canEdit && widget.auctionData.commodity.checked != 1;

    /// 此人 是 接待
    bool hasPermission =
        widget.room.isReception || Session.uid == widget.room.positions[0].uid;
    if (needCheck) {
      if (hasPermission) {
        commodity = K.room_auction_define_check;
      } else {
        commodity = K.room_auction_define_check_await;
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 10),
          child: Text(
            K.room_auction_object,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        (widget.auctionData.mode == 0)
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // AuctionRelationTag(
                  //   name: commodity,
                  //   level: 0,
                  //   width: 65,
                  //   height: 17,
                  // ),
                  GradientBorder(
                    borderRadius: 12,
                    borderWidth: 1,
                    borderGradient: const LinearGradient(
                      colors: [Color(0xFFC5DAFF), Color(0xFF6851E9)],
                    ),
                    child: Container(
                      height: 22,
                      padding:
                          const EdgeInsetsDirectional.only(start: 6, end: 6),
                      margin: const EdgeInsets.all(1),
                      decoration: const ShapeDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFA190FF), Color(0xFF5A41E0)],
                        ),
                        shape: StadiumBorder(),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            commodity,
                            style: TextStyle(
                              color: (needCheck && !hasPermission)
                                  ? const Color(0x80FEFEFE)
                                  : Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (widget.auctionData.commodity.days.isNotEmpty == true)
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 6),
                      child: Text(
                        'x${widget.auctionData.commodity.days}',
                        style: const TextStyle(
                          color: Color(0xFFFFEBEF),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    ),
                ],
              )
            : GestureDetector(
                onTap: () {
                  if (canEdit && hasPermission) {
                    AuctionCheckDefineDialog.show(context,
                        rid: widget.room.realRid,
                        vvc: widget.auctionData.vvc,
                        define: widget.auctionData.commodity.commodity);
                  }
                },
                child: GradientBorder(
                  borderRadius: 12,
                  borderWidth: 1,
                  borderGradient: LinearGradient(
                    colors: (needCheck && !hasPermission)
                        ? [const Color(0x80C5DAFF), const Color(0x806851E9)]
                        : [const Color(0xFFC5DAFF), const Color(0xFF6851E9)],
                  ),
                  child: Container(
                    height: 22,
                    padding: const EdgeInsetsDirectional.only(start: 6, end: 6),
                    margin: const EdgeInsets.all(1),
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        colors: (needCheck && !hasPermission)
                            ? [const Color(0x80A190FF), const Color(0x805A41E0)]
                            : [
                                const Color(0xFFA190FF),
                                const Color(0xFF5A41E0)
                              ],
                      ),
                      shape: const StadiumBorder(),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          commodity,
                          style: TextStyle(
                            color: (needCheck && !hasPermission)
                                ? const Color(0x80FEFEFE)
                                : Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (canEdit && hasPermission) ...[
                          const SizedBox(width: 2),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 10,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 12, bottom: 4),
          child: Text(
            K.room_auction_starting_gift,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              imageUrl: giftIcon,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 6),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.auctionData.commodity.giftName,
                    style: const TextStyle(
                      color: Color(0xFFFFEBEF),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 4),
                    child: Text(
                      '${widget.auctionData.commodity.giftPrice}${MoneyConfig.moneyName}',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// status == upgrade
  Widget _buildUpgrade() {
    int currentValue = widget.auctionData.currentProgress.current;
    List<AuctionRelationCurrentProgressItem> list =
        widget.auctionData.currentProgress.list;
    AuctionRelationCurrentProgressItem? item =
        list.lastWhereOrNull((e) => currentValue < e.value);
    if (item == null) return const SizedBox.shrink();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CachedNetworkImage(
          imageUrl: Util.getRemoteImgUrl(item.giftIcon),
          width: 80,
          height: 80,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 8),
        CurrentProgressBar(
          width: 100 / 375 * Util.width,
          height: 4,
          nodes: list.map((e) => e.value).toList(),
          currentValue: currentValue,
        ),
        const SizedBox(height: 8),
        Text(
          '$currentValue/${item.value}',
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          item.giftName,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class CurrentProgressBar extends StatelessWidget {
  final double width;
  final double height;
  final List<int> nodes; // 节点
  final int currentValue; // 当前值

  const CurrentProgressBar({
    Key? key,
    required this.width,
    required this.height,
    required this.nodes,
    required this.currentValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> nodeWidgets = [];
    int activeIndex = -1;
    final double nodeWidth = width / (nodes.length - 1); // 单节宽度
    for (int i = 0, l = nodes.length; i < l; i++) {
      String asset = RoomAssets.chat_room$auction_current_progress_light_webp;
      int value = nodes[i];
      if (i != l - 1) {
        if (currentValue < value) {
          asset = RoomAssets.chat_room$auction_current_progress_grey_webp;
        } else if (currentValue >= value && currentValue < nodes[i + 1]) {
          asset = RoomAssets.chat_room$auction_current_progress_hot_webp;
          activeIndex = i;
        } else if (currentValue >= nodes[i + 1]) {
          asset = RoomAssets.chat_room$auction_current_progress_light_webp;
        }
      } else {
        // 最后一个节点
        if (currentValue < value) {
          asset = RoomAssets.chat_room$auction_current_progress_grey_webp;
        } else {
          asset = RoomAssets.chat_room$auction_current_progress_hot_webp;
          activeIndex = i;
        }
      }

      bool active = activeIndex == i;
      if (active) {
        double w = height * 2;
        nodeWidgets.add(PositionedDirectional(
          start: nodeWidth * i - w / 2,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 2),
            child: R.img(
              asset,
              width: w,
              height: height * 3.5,
              fit: BoxFit.contain,
            ),
          ),
        ));
      } else {
        double w = height * 2;
        nodeWidgets.add(PositionedDirectional(
          start: nodeWidth * i - w / 2,
          child: R.img(
            asset,
            width: w,
            height: w,
            fit: BoxFit.contain,
          ),
        ));
      }
    }

    double activeWidth = currentValue < nodes.last
        ? nodeWidth *
            (activeIndex +
                (currentValue - nodes[activeIndex]) /
                    (nodes[activeIndex + 1] - nodes[activeIndex]))
        : width;

    return SizedBox(
      width: width,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.centerStart,
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height / 2),
              color: const Color(0x66D8D8D8),
            ),
          ),
          Container(
            width: activeWidth,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height / 2),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFFF28D4),
                  Color(0xFFFF89F5),
                ],
              ),
            ),
          ),
          ...nodeWidgets,
        ],
      ),
    );
  }
}
