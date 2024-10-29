import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/src/auction/auction_util.dart';

import '../../../chat_room.dart';
import '../../protobuf/generated/auction.pb.dart';
import '../../protobuf/generated/cplink.pb.dart';
import 'cplink_diy_relation_dialog.dart';

/// 连连看关系总进度条
class CpLinkTotalProgressWidget extends StatefulWidget {
  final ChatRoomData room;
  final CplinkMessage? relationData;

  const CpLinkTotalProgressWidget(
      {Key? key, required this.room, required this.relationData})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CpLinkTotalProgressState();
}

class CpLinkTotalProgressState extends State<CpLinkTotalProgressWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.relationData == null) return const SizedBox();

    int currentValue = widget.relationData!.progress.current;

    List<AuctionRelationTotalProgressItem> list =
        widget.relationData!.progress.list;
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
                    fontSize: 10,
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
                    if ((item.diyStatus) != 0)
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
      height: 102,
      margin: EdgeInsetsDirectional.only(
          start: margin - 1, end: margin - 1, top: 10),
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
          alignment: AlignmentDirectional.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              _buildRelationInfo(),
              SizedBox(
                width: double.infinity,
                height: 69,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    Container(
                      height: 12,
                      margin: EdgeInsetsDirectional.only(
                          start: offset, end: offset),
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
                      margin: EdgeInsetsDirectional.only(
                          start: offset, end: offset),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRelationInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 15),
        Container(
          height: 21,
          decoration: const ShapeDecoration(
            shape: StadiumBorder(),
            gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [Color(0xFFFF96F4), Color(0xFFFF61D6)],
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: AlignmentDirectional.center,
          child: Text(
            widget.relationData?.relation.relationName ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Container(
          height: 21,
          decoration: const ShapeDecoration(
            shape: StadiumBorder(),
            color: Color(0x33000000),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          alignment: AlignmentDirectional.center,
          child: Text(
            K.room_few_day(
                ['${widget.relationData?.relation.currentDays ?? 0}']),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
            ),
          ),
        ),
        const Spacer(),
        if ((widget.relationData?.relation.nextDays ?? 0) > 0)
          Text(
            K.room_cplink_relation_sill_middle([
              '${widget.relationData?.relation.nextDays ?? 0}',
              '${widget.relationData?.relation.nextDaysScoreNeed ?? 0}'
            ]),
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 11,
            ),
          ),
        const SizedBox(width: 15),
      ],
    );
  }

  void _onDiyRelation(AuctionRelationTotalProgressItem item) {
    if (item.diyStatus != 0) {
      if (item.diyStatus == 1) {
        // 任务 未完成。所有人可点击
        CpLinkDiyRelationStatusDialog.show(context, widget.room, item);
      } else if (item.diyStatus == 2) {
        // 任务 已完成。仅拍卖双方可点击
        if (Session.uid == (widget.room.positions[2].uid) ||
            Session.uid == (widget.room.positions[5].uid)) {
          CpLinkDiyRelationStatusDialog.show(context, widget.room, item);
        }
      } else {
        // DIY 审核中/审核失败/审核成功。所有人可点击
        CpLinkDiyRelationStatusDialog.show(context, widget.room, item);
      }
    }
  }
}
