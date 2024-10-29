import 'dart:math';

import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../protobuf/generated/auction.pb.dart';
import 'auction_diy_relation_dialog.dart';

class AuctionDiyRelationWidget extends StatefulWidget {
  final AuctionConfigMessage auctionData;

  const AuctionDiyRelationWidget({super.key, required this.auctionData});

  @override
  State<StatefulWidget> createState() => AuctionDiyRelationState();
}

class AuctionDiyRelationState extends State<AuctionDiyRelationWidget>
    with SingleTickerProviderStateMixin {
  AuctionRelationTotalProgressItem? item;

  int index = -1;
  int status = -1;

  Timer? timer;

  bool show = false;

  double margin = 12;
  double offset = 8;

  double bubbleBottom = 140;
  double bubbleEnd = 16;
  double arrowMarginEnd = 100;

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: const ElasticOutCurve(0.8)))
        .animate(animationController);
    animation.addListener(() {});
    animation.addStatusListener((status) {
      Log.d(status.toString());
      if (status == AnimationStatus.completed) {
      } else if (status == AnimationStatus.dismissed) {
        show = false;
        refresh();
      }
    });

    _diffRefresh();
  }

  @override
  void didUpdateWidget(covariant AuctionDiyRelationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _diffRefresh();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _diffRefresh() {
    List<AuctionRelationTotalProgressItem> list =
        widget.auctionData.totalProgress.list;
    if (index == -1) {
      for (int i = 0; i < list.length; i++) {
        AuctionRelationTotalProgressItem e = list[i];
        if (e.diyStatus != 0) {
          index = i;
          break;
        }
      }
    }
    if (index != -1) {
      AuctionRelationTotalProgressItem curItem = list[index];
      if (curItem.diyStatus != 0 && status != curItem.diyStatus) {
        /// 计算气泡所在位置
        double nodeWidth = (Util.width - margin * 2) / list.length;
        double arrowEnd =
            nodeWidth * (list.length - 1 - index) + nodeWidth * 0.5 + offset;
        bubbleEnd = max(arrowEnd - 100, 16);
        arrowMarginEnd = min(arrowEnd - 16, 100);

        item = curItem;
        status = curItem.diyStatus;
        startTimer();
      }
    }
  }

  void startTimer() {
    timer?.cancel();
    show = true;
    refresh();
    animationController.forward();
    timer = Timer(const Duration(seconds: 10), () {
      animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!show) {
      return const SizedBox();
    }
    String content = '';
    // item.diyStatus：4和5 为预留
    int bubbleWidth = 120;
    if (item?.diyStatus == 1) {
      content = K.room_auction_diy_click_task(['${item!.price}']);
      bubbleWidth = 144;
    } else if (item?.diyStatus == 2) {
      content = K.room_auction_diy_click_task_complete;
      bubbleWidth = 134;
    } else if (item?.diyStatus == 3) {
      content = K.room_auction_diy_click_checking;
    } else if (item?.diyStatus == 4) {
      content = K.room_auction_diy_click_check_failure;
    } else if (item?.diyStatus == 5) {
      content = K.room_auction_diy_click_check_success;
    }
    return PositionedDirectional(
      bottom: bubbleBottom,
      end: bubbleEnd,
      child: ScaleTransition(
        scale: animation,
        alignment: Alignment(1 - (arrowMarginEnd) * 2 / bubbleWidth, 1),
        child: FadeTransition(
          opacity: animation,
          child: GestureDetector(
            onTap: () {
              timer?.cancel();
              animationController.reverse();
              _onDiyRelation(item);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xD9000000),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 120,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  alignment: AlignmentDirectional.centerStart,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GradientText(
                        K.room_auction_diy_click_text,
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFFF88F5),
                            Color(0xFFFF3EDD),
                          ],
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        content,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(end: arrowMarginEnd),
                  child: R.img(
                    RoomAssets
                        .chat_room$auction_auction_diy_relation_arrow_webp,
                    width: 10,
                    height: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onDiyRelation(AuctionRelationTotalProgressItem? item) {
    if (item == null) return;
    if (item.diyStatus != 0) {
      if (item.diyStatus == 1) {
        // 任务 未完成。所有人可点击
        AuctionDiyRelationStatusDialog.show(context, widget.auctionData, item);
      } else if (item.diyStatus == 2) {
        // 任务 已完成。仅拍卖双方可点击
        if (Session.uid == widget.auctionData.auctionUser.uid ||
            Session.uid == widget.auctionData.defendUser.uid) {
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
