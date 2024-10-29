import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class VapAnimateWidget extends StatefulWidget {
  final int giftId;
  final int vapSize;

  const VapAnimateWidget(
      {super.key, required this.giftId, required this.vapSize});

  static Future show(BuildContext context, int giftId, int vapSize,
      {Key? key}) {
    return displayModalBottomSheet(
      isBarrierDismissible: false,
      context: context,
      builder: (context) {
        return VapAnimateWidget(
          key: key,
          giftId: giftId,
          vapSize: vapSize,
        );
      },
      defineBarrierColor: Colors.black.withOpacity(0.4),
      maxHeightRatio: 1,
    );
  }

  @override
  _VapAnimateWidgetState createState() => _VapAnimateWidgetState();
}

class _VapAnimateWidgetState extends State<VapAnimateWidget> {
  _onComplete() {
    Navigator.of(context).pop();
  }

  _onError() {
    Fluttertoast.showToast(msg: "播放失败");
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
        child: _buildAnimWidget(),
      ),
    );
  }

  Widget _buildAnimWidget() {
    return DecorateDisplayWidget(
      effect: Decorate(widget.giftId, widget.vapSize),
      repeat: false,
      onComplete: () => _onComplete(),
      onError: _onError,
    );
  }
}
