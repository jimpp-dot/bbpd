import 'package:chat_room/k.dart';
import 'dart:async';

import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:chat_room/src/ktv/rank/ktv_pk_rank_widget.dart';
import 'package:chat_room/src/ktv/utils/time_util.dart';
import 'package:flutter/material.dart';

/// ktv pk 礼物弹窗
///
class KtvPkGiftDialog extends StatefulWidget {
  final ChatRoomData room;
  final KtvInfo ktvInfo;

  const KtvPkGiftDialog({Key? key, required this.room, required this.ktvInfo})
      : super(key: key);

  @override
  _KtvPkGiftDialogState createState() => _KtvPkGiftDialogState();

  static Future<bool?> show(
      BuildContext context, ChatRoomData room, KtvInfo ktvInfo) {
    return displayModalBottomSheet(
      context: context,
      isBarrierDismissible: true,
      maxHeightRatio: 0.6,
      builder: (BuildContext context) {
        return KtvPkGiftDialog(room: room, ktvInfo: ktvInfo);
      },
    );
  }
}

class _KtvPkGiftDialogState extends State<KtvPkGiftDialog> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 8), _pop);
  }

  void _pop() {
    if (mounted && Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    int score = (widget.room.ktvPkRank?.beforeScore ?? 0) -
        (widget.room.ktvPkRank?.currentScore ?? 0);
    return Container(
      height: 114 + Util.iphoneXBottom + 12,
      padding: EdgeInsetsDirectional.only(
          bottom: Util.iphoneXBottom + 12, start: 16, end: 16),
      decoration: BoxDecoration(
        color: R.color.mainBgColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Row(
              children: [
                Text(
                  K.room_ktv_support_singer_tips,
                  style: TextStyle(
                      color: R.color.mainTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                InkWell(
                  onTap: _openPkRankPage,
                  child: Container(
                    height: 28,
                    padding:
                        const EdgeInsetsDirectional.only(start: 10, end: 10),
                    decoration: ShapeDecoration(
                      shape: StadiumBorder(
                          side: BorderSide(color: R.color.thirdBgColor)),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          R.img('ktv/ktv_ic_pk_mode_rank.png',
                              width: 18,
                              height: 18,
                              package: ComponentManager.MANAGER_BASE_ROOM),
                          Text(
                            K.room_pk_rank,
                            style: TextStyle(
                                color: R.color.mainTextColor, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              CommonAvatar(
                path: widget.ktvInfo.currentSong?.icon ?? '',
                size: 42,
                shape: BoxShape.circle,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.ktvInfo.currentSong?.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(color: R.color.mainTextColor, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    K.room_ktv_score_diff([
                      '${widget.room.ktvPkRank?.currentScore}',
                      (KtvTimeUtil.getMusicNum(score < 0 ? 0 : score))
                    ]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(color: R.color.secondTextColor, fontSize: 12),
                  ),
                ],
              ),
              const Spacer(),
              const SizedBox(width: 4),
              GradientButton(
                K.room_talent_support,
                width: 64,
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
                height: 28,
                onTap: _openGiftPanel,
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _openPkRankPage() {
    _timer.cancel();
    KtvPkRankWidget.show(context, widget.room);
  }

  void _openGiftPanel() {
    Navigator.of(context).pop();
    IGiftManager giftManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_GIFT);
    giftManager.showRoomGiftPanel(context,
        room: widget.room, uid: widget.ktvInfo.currentSong!.uid);
  }
}
