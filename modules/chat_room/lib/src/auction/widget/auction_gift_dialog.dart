import 'dart:async';

import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:chat_room/src/auction/model/auction_gift_bean.dart';

/// 收到赠送的背包礼物
class AuctionGiftDialog extends StatefulWidget {
  final AuctionGiftBean data;

  const AuctionGiftDialog({Key? key, required this.data}) : super(key: key);

  @override
  _AuctionGiftDialogState createState() {
    return _AuctionGiftDialogState();
  }
}

class _AuctionGiftDialogState extends State<AuctionGiftDialog> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.of(context).maybePop();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: R.color.mainBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              K.room_congratulations_you_get,
              style: TextStyle(
                color: R.color.mainTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsetsDirectional.only(top: 16, bottom: 6),
            decoration: BoxDecoration(
              color: R.color.secondBgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: CachedNetworkImage(
              imageUrl: Util.getRemoteImgUrl(widget.data.c_url),
              width: 65,
              height: 65,
            ),
          ),
          Text(
            widget.data.c_name,
            style: TextStyle(
              fontSize: 13,
              color: R.color.secondTextColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 24),
            child: GradientButton(
              K.sure,
              width: 200,
              height: 48,
              onTap: () {
                Navigator.of(context).maybePop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
