import 'package:shared/shared.dart';
import 'package:chat/chat.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';

class CommodityAnimateWidget extends StatefulWidget {
  final GiftConfig config;

  const CommodityAnimateWidget({super.key, required this.config});

  static Future show(BuildContext context, GiftConfig config, {Key? key}) {
    return displayModalBottomSheet(
      isBarrierDismissible: false,
      context: context,
      builder: (context) {
        return CommodityAnimateWidget(key: key, config: config);
      },
      defineBarrierColor: Colors.black.withOpacity(0.4),
      maxHeightRatio: 1,
    );
  }

  @override
  _CommodityAnimateWidgetState createState() => _CommodityAnimateWidgetState();
}

class _CommodityAnimateWidgetState extends State<CommodityAnimateWidget> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loading = true;
  }

  _onComplete(GiftConfig config) {
    Navigator.of(context).pop();
  }

  _onError() {
    Fluttertoast.showToast(msg: K.vip_effect_play_failed);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // do nothing，拦截点击事件,
      },
      child: Container(
        width: Util.width,
        height: Util.height,
        color: Colors.black.withOpacity(0.01),
        alignment: AlignmentDirectional.center,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildAnimWidget(),
            if (widget.config.type != DisplayGiftType.Vap && _loading)
              const Loading(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimWidget() {
    if (widget.config.type == DisplayGiftType.Vap) {
      return DecorateDisplayWidget(
        effect: Decorate(widget.config.id, widget.config.giftSize),
        repeat: false,
        onComplete: () => _onComplete(widget.config),
        onError: _onError,
      );
    } else {
      return DisplayGift(
        key: widget.config.key,
        config: widget.config,
        onComplete: _onComplete,
        onLoadComplete: () {
          if (mounted) {
            setState(() {
              _loading = false;
            });
          }
        },
      );
    }
  }
}
