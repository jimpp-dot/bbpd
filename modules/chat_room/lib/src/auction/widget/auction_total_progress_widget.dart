import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/auction/auction_util.dart';
import 'package:chat_room/src/protobuf/generated/auction.pb.dart';

import 'auction_diy_relation_dialog.dart';

/// 拍卖关系总进度条
class AuctionTotalProgressWidget extends StatefulWidget {
  final AuctionConfigMessage auctionData;

  const AuctionTotalProgressWidget({Key? key, required this.auctionData})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => AuctionTotalProgressState();
}

class AuctionTotalProgressState extends State<AuctionTotalProgressWidget> {
  @override
  Widget build(BuildContext context) {
    int currentValue = widget.auctionData.totalProgress.current;

    List<AuctionRelationTotalProgressItem> list =
        widget.auctionData.totalProgress.list;
    double offset = 20;
    double margin = 12;
    double maxTextWidth = (Util.width - margin * 2) / list.length;

    List<Widget> nodeWidgets = [];
    int activeIndex = 0;
    for (int i = 0, l = list.length; i < l; i++) {
      String asset = RoomAssets.chat_room$auction_total_progress_grey_webp;
      AuctionRelationTotalProgressItem item = list[i];
      int value = item.value;
      if (currentValue < value) {
        asset = RoomAssets.chat_room$auction_total_progress_grey_webp;
      } else {
        asset = RoomAssets.chat_room$auction_total_progress_light_webp;
        activeIndex = i;
      }

      String showName = item.name;
      if ((item.diyStatus) != 0) {
        showName = K.room_auction_diy_click_text;
      }
      nodeWidgets.add(
        Expanded(
          child: GestureDetector(
            onTap: () {
              _onDiyRelation(item);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  Util.numberToSizeString(value, fix: 1),
                  style: const TextStyle(
                    color: Color(0xB3FEFEFE),
                    fontSize: 9,
                  ),
                ),
                const SizedBox(height: 3),
                R.img(
                  asset,
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: maxTextWidth,
                      ),
                      child: GradientText(
                        showName,
                        maxLines: 1,
                        gradient: LinearGradient(
                          colors: AuctionUtil.getRelationTextGradientColors(i),
                        ),
                        style: const TextStyle(
                          fontSize: 9,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    if (item.diyStatus != 0)
                      R.img(
                        RoomAssets
                            .chat_room$auction_auction_progress_item_arrow_webp,
                        width: 12,
                        height: 12,
                        package: ComponentManager.MANAGER_BASE_ROOM,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    double barTotalWidth = Util.width - offset * 2 - margin * 2;
    double nodeWidth = barTotalWidth / (list.length - 1); // 单节宽度
    double activeWidth = activeIndex < (list.length - 1)
        ? nodeWidth *
            (activeIndex +
                (currentValue - list[activeIndex].value) /
                    (list[activeIndex + 1].value - list[activeIndex].value))
        : barTotalWidth;
    return Container(
      width: double.infinity,
      height: 71,
      margin: EdgeInsetsDirectional.only(
          start: margin - 1, end: margin - 1, top: 5),
      child: GradientBorder(
        borderRadius: 15,
        borderGradient: const LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: [Color(0xFF7E97FD), Color(0xFFDA5EFF)],
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: const LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [Color(0xE64122A9), Color(0xE66129D9)],
            ),
          ),
          alignment: AlignmentDirectional.center,
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Container(
                height: 12,
                margin: EdgeInsetsDirectional.only(start: offset, end: offset),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0x1F008CFB),
                      Color(0x2600F9FA),
                    ],
                  ),
                ),
              ),
              Container(
                height: 12,
                width: activeWidth,
                margin: EdgeInsetsDirectional.only(start: offset, end: offset),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF00DBDE),
                      Color(0xFFFC00FF),
                    ],
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: nodeWidgets,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onDiyRelation(AuctionRelationTotalProgressItem item) {
    if (item.diyStatus != 0) {
      if (item.diyStatus == 1) {
        // 任务 未完成。所有人可点击
        AuctionDiyRelationStatusDialog.show(context, widget.auctionData, item);
      } else if (item.diyStatus == 2) {
        // 任务 已完成。仅拍卖双方可点击
        if (Session.uid == (widget.auctionData.auctionUser.uid) ||
            Session.uid == (widget.auctionData.defendUser.uid)) {
          AuctionDiyRelationStatusDialog.show(
              context, widget.auctionData, item);
        }
      } else {
        // DIY 审核中/审核失败/审核成功。所有人可点击
        AuctionDiyRelationStatusDialog.show(context, widget.auctionData, item);
      }
    }
  }
}
