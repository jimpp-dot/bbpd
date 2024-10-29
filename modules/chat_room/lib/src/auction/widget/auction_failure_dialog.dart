import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/protobuf/generated/auction.pb.dart';

class AuctionFailureDialog /*extends StatefulWidget*/ {
  // final AuctionStageEffectMessage data;
  //
  // const AuctionFailureDialog({Key key, @required this.data}) : super(key: key);

  // @override
  // _AuctionFailureDialogState createState() => _AuctionFailureDialogState();

  static show(BuildContext context, AuctionStageEffectMessage data) {
    // return Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    //   return AuctionFailureDialog(data: data);
    // }));

    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return MultiframeImage.network(
        Util.getImgUrl(data.url),
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
    AudioPlayHelper.instance().playAudio('auction_fail_audio.mp3',
        path: 'packages/chat_room/assets/sound/');
  }
}

// class _AuctionFailureDialogState extends State<AuctionFailureDialog> {
//   Timer _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     AudioPlayHelper.instance().playAudio('auction_fail_audio.mp3',
//         path: 'packages/chat_room/assets/sound/');
//     _timer = Timer(Duration(seconds: 3), () {
//       if (mounted) {
//         Navigator.maybePop(context);
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     _timer = null;
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: MultiframeImage.network(
//         Util.getImgUrl(widget.data.url),
//         'room',
//         width: Util.width,
//         height: Util.height,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }
