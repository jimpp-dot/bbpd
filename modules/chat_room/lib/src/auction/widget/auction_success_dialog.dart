import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/protobuf/generated/auction.pb.dart';

/// 拍卖成功对话框
class AuctionSuccessDialog extends StatefulWidget {
  final AuctionStageEffectMessage data;

  const AuctionSuccessDialog({Key? key, required this.data}) : super(key: key);

  @override
  _AuctionSuccessDialogState createState() {
    return _AuctionSuccessDialogState();
  }

  static Future show(BuildContext context, AuctionStageEffectMessage data) {
    return showDialog(
      context: context,
      builder: (context) {
        return AuctionSuccessDialog(data: data);
      },
    );
  }
}

class _AuctionSuccessDialogState extends State<AuctionSuccessDialog> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    AudioPlayHelper.instance().playAudio('auction_succ_cheer_audio.mp3',
        path: 'packages/chat_room/assets/sound/');
    if (widget.data.url.isNotEmpty) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        OverlayState? overlayState = Overlay.of(context);
        OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
          return MultiframeImage.network(
            Util.getImgUrl(widget.data.url),
            'room',
            width: Util.width,
            height: Util.height,
            fit: BoxFit.cover,
          );
        });
        overlayState.insert(overlayEntry);
        Future.delayed(const Duration(seconds: 3), () {
          overlayEntry.remove();
        });
      });
    }

    _timer = Timer(const Duration(seconds: 8), () {
      if (mounted) {
        Navigator.maybePop(context);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 272.dp,
        height: 286.dp,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.center,
          children: [
            R.img(
              RoomAssets.chat_room$auction_auction_success_bg_webp,
              width: 272.dp,
              height: 286.dp,
              fit: BoxFit.fill,
            ),
            PositionedDirectional(
              top: -107.dp,
              child: R.img(
                RoomAssets.chat_room$auction_auction_success_title_webp,
                width: 262.dp,
                height: 152.dp,
                fit: BoxFit.fill,
              ),
            ),
            PositionedDirectional(
              top: 12.dp,
              end: 12.dp,
              child: IconButton(
                icon: const Icon(Icons.close),
                color: const Color(0xFFDDAB3E),
                iconSize: 20,
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.maybePop(context);
                },
              ),
            ),
            PositionedDirectional(
              top: 70.dp,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildCombineIcons(),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 8.dp,
                      start: 8.dp,
                      end: 8.dp,
                    ),
                    child: Text(
                      K.room_auction_succ_title(
                          [widget.data.config.defendUser.name]),
                      style: const TextStyle(
                        color: Color(0x99313131),
                        fontSize: 13,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // RichText(
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  //   text: TextSpan(
                  //     style: TextStyle(
                  //       color: Color(0x99313131),
                  //       fontSize: 13,
                  //       height: 1,
                  //       fontFamily: Util.fontFamily,
                  //     ),
                  //     children: [
                  //       TextSpan(K.room_congratulations),
                  //       TextSpan(
                  //         text: widget.data.config.defendUser.name,
                  //         style: TextStyle(
                  //           color: Color(0xFF313131),
                  //         ),
                  //       ),
                  //       TextSpan('成功完成竞价!'),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            PositionedDirectional(
              bottom: 36.dp,
              child: Container(
                width: 256.dp,
                height: 50.dp,
                alignment: AlignmentDirectional.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      K.room_auction_succ_content(
                          [widget.data.config.commodity.commodity]),
                      style: TextStyle(
                        color: const Color(0xFFB6811B),
                        fontWeight: FontWeight.w600,
                        fontSize: 15.dp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (widget.data.config.commodity.days.isNotEmpty == true)
                      Text(
                        K.room_auction_succ_duration(
                            [widget.data.config.commodity.days]),
                        style: TextStyle(
                          color: const Color(0xFFB6811B),
                          fontWeight: FontWeight.w600,
                          fontSize: 15.dp,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            PositionedDirectional(
              bottom: 18.dp,
              child: Text(
                K.room_auction_succ_time([
                  Utility.formatDate(
                      DateTime.now().millisecondsSinceEpoch ~/ 1000)
                ]),
                style: TextStyle(
                  color: const Color(0xFFB6811B),
                  fontSize: 13.dp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCombineIcons() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        PositionedDirectional(
          start: 0,
          child: _buildSingleIcon(widget.data.config.auctionUser),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 72.dp),
          child: _buildSingleIcon(widget.data.config.defendUser),
        ),
      ],
    );
  }

  Widget _buildSingleIcon(AuctionUser user) {
    return Container(
      width: 80.dp,
      height: 80.dp,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(width: 2.dp, color: const Color(0xFFFEE9D6)),
      ),
      child: CommonAvatar(
        path: user.icon,
        size: 72.dp,
        shape: BoxShape.circle,
        sex: user.sex,
        // onTap: () {
        //   _manager.openImageScreen(context, user.uid);
        // },
      ),
    );
  }
}
