import 'package:shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayGiftMessage extends StatefulWidget {
  final MessageContent message;
  final Map extra;

  const DisplayGiftMessage(
      {super.key, required this.message, required this.extra});

  @override
  _State createState() => _State();
}

class _State extends State<DisplayGiftMessage> {
  // 是否是开箱子赠送的礼物
  //bool _isBoxGift = false;
  // String? _boxType;

  static Set<MessageContent> autoPlayedSet = {};

  @override
  void initState() {
    super.initState();
    if (widget.message.inlineExtra != null &&
        widget.message.inlineExtra!.isNotEmpty) {
    } else {
      WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
        if (autoPlayedSet.contains(widget.message)) {
          return;
        }
        autoPlayedSet.add(widget.message);
        eventCenter.emit('UserChat.PlayGift', widget.message);
      });
    }

    // _boxType = widget.extra['boxType'];
    // if (_boxType != null) {
    //   if (_boxType == 'copper' || _boxType == 'silver' || _boxType == 'gold') {
    //     _isBoxGift = true;
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        eventCenter.emit("UserChat.PlayGift", widget.message);
      },
      child: Container(
        constraints: BoxConstraints(maxWidth: Util.width * 0.6),
        child: Stack(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl:
                      "${System.imageDomain}static/$giftSubDir/${widget.extra['giftId']}.png",
                  width: 60.0,
                  height: 60.0,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.extra['giftName'],
                        style: TextStyle(color: R.colors.mainTextColor),
                      ),
                      Text(
                        "x${widget.extra['giftNum']}",
                        style: TextStyle(color: R.colors.highlightColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
