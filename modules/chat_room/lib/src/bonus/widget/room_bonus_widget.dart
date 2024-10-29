import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/bonus/model/bonus_beans.dart';
import 'package:chat_room/src/bonus/model/bonus_model.dart';
import 'package:chat_room/src/bonus/widget/bonus_preview_widget.dart';
import 'package:chat_room/src/bonus/widget/bonus_result_widget.dart';

class RoomBonusWidget extends StatefulWidget {
  final ChatRoomData room;

  const RoomBonusWidget({Key? key, required this.room}) : super(key: key);

  @override
  _RoomBonusWidgetState createState() => _RoomBonusWidgetState();
}

class _RoomBonusWidgetState extends State<RoomBonusWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  int getTimer(BonusInfo? curBonus) {
    if (curBonus?.state == BonusState.grab) return 0;

    int seconds = (curBonus?.grabTime ?? 0) - (widget.room.timestamp);

    return max(seconds, 0);
  }

  String _getFormattedTimer(int duration) {
    twoDigits(int n) => n >= 10 ? '$n' : '0$n';

    int minutes = duration ~/ 60;
    int seconds = duration % 60;

    return '${twoDigits(minutes)}:${twoDigits(seconds)}';
  }

  Widget _buildCount(int leftCount) {
    return PositionedDirectional(
      top: 0,
      end: 0,
      child: Container(
        alignment: AlignmentDirectional.center,
        width: 19,
        height: 16,
        decoration: BoxDecoration(
          color: const Color(0xFFFF5F7D),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Text(
          '$leftCount',
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    );
  }

  Widget _buildTimer(BonusInfo? curBonus) {
    return PositionedDirectional(
      bottom: 2,
      child: TimerWidget(
        stop: Duration(seconds: getTimer(curBonus)),
        builder: (context) {
          return Container(
            width: 32,
            height: 14,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius:
                  const BorderRadiusDirectional.all(Radius.circular(7)),
            ),
            child: Text(
              _getFormattedTimer(getTimer(curBonus)),
              style: const TextStyle(
                fontSize: 9,
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildIcon(BonusInfo? curBonus) {
    if (curBonus?.icon?.isEmpty ?? true) return const SizedBox();

    Widget bonusIcon =
        CachedNetworkImage(width: 32, height: 32, imageUrl: curBonus?.icon);
    if (curBonus?.state == BonusState.grab) {
      animationController.repeat();
      return ScaleTransition(
        scale: animationController.drive(Tween<double>(begin: 0.7, end: 1.0)),
        child: bonusIcon,
      );
    } else {
      return bonusIcon;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<BonusData?>(
        valueListenable: context.watch<BonusModel>(),
        builder: (context, data, _) {
          if ((data?.curBonus?.id ?? 0) <= 0) return const SizedBox();

          int leftCount = data!.count;
          int timer = getTimer(data.curBonus);

          return GestureDetector(
            onTap: () {
              if (data.curBonus?.state == BonusState.finish ||
                  (data.curBonus?.grabbed ?? false)) {
                BonusResultDialog.show(
                    context, data.curBonus?.id ?? 0, widget.room.rid);
              } else if (data.curBonus?.state == BonusState.grab ||
                  data.curBonus?.state == BonusState.pending) {
                BonusPreviewDialog.show(
                    context, widget.room, data.curBonus?.id ?? 0);
              }
            },
            child: Container(
              width: 40.dp,
              height: 40.dp,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        RoomAssets.chat_room$bonus_bg_room_bonus_webp)),
              ),
              child: IgnorePointer(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentDirectional.center,
                  children: [
                    _buildIcon(data.curBonus),
                    if (leftCount > 0) _buildCount(leftCount),
                    if (timer > 0) _buildTimer(data.curBonus),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
