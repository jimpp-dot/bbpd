import 'dart:async';

import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/cplink/model/cplink_repo.dart';
import 'package:flutter/material.dart';

import '../../protobuf/generated/auction.pb.dart';

class CpLinkDiyApplyDialog extends StatefulWidget {
  final AuctionDefendDiyEmitMessage data;

  const CpLinkDiyApplyDialog({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => CpLinkDiyApplyState();

  static Future show(BuildContext context,
      {required AuctionDefendDiyEmitMessage data}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CpLinkDiyApplyDialog(data: data),
    );
  }
}

class CpLinkDiyApplyState extends State<CpLinkDiyApplyDialog> {
  int _second = 10;

  Timer? timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initTimer();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void initTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _second--;
      refresh();
      if (_second <= 0) {
        timer.cancel();
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 312,
        height: 240,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              K.room_auction_diy_apply_title,
              style: const TextStyle(
                color: Color(0xFF202020),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 100,
                  ),
                  child: Text(
                    widget.data.name,
                    style: TextStyle(
                      color: R.color.mainTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  K.room_auction_diy_apply_change,
                  style: TextStyle(
                    color: R.color.mainTextColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildDiyName(),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _onTap(0);
                    },
                    child: Container(
                      height: 48,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFF5F5F5),
                        shape: StadiumBorder(),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        R.string('refuse'),
                        style: const TextStyle(
                          color: Color(0xB3202020),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _onTap(1);
                    },
                    child: Container(
                      height: 48,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                            colors: R.color.mainBrandGradientColors),
                        shape: const StadiumBorder(),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        '${R.string('base_agree')}(${_second}s)',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildDiyName() {
    Color textColor = Colors.white;
    if (widget.data.defendLevel == 2) {
      textColor = const Color(0xFF8A3E1B);
    } else if (widget.data.defendLevel == 3) {
      textColor = const Color(0xFF25234B);
    }
    return Container(
      width: 64,
      height: 22,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            R.imagePath(
              RoomAssets.defend_ic_defend_tips_x_webp(widget.data.defendLevel),
              package: ComponentManager.MANAGER_BASE_ROOM,
            ),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${widget.data.defendTitle}${widget.data.diyName}",
            style: R.textStyle.medium12.copyWith(fontSize: 9, color: textColor),
          ),
        ],
      ),
    );
  }

  void _onTap(int agree) async {
    NormalNull res = await CpLinkRepo.replayDiyRelation(
        rid: widget.data.rid,
        agree: agree,
        diyName: widget.data.diyName,
        version: widget.data.version);
    if (res.success) {
      Navigator.of(context).pop();
    } else {
      Fluttertoast.showCenter(msg: res.msg);
    }
  }
}
