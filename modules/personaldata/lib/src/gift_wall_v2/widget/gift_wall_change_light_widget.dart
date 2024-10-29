import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:personaldata/assets.dart';

class GiftWallChangeLightWidget extends StatefulWidget {
  final void Function(int index)? finishChoose;
  const GiftWallChangeLightWidget({super.key, this.finishChoose});

  @override
  State<GiftWallChangeLightWidget> createState() =>
      _GiftWallChangeLightWidgetState();
}

class _GiftWallChangeLightWidgetState extends State<GiftWallChangeLightWidget> {
  int _selectIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///默认觉醒模式
    Tracker.instance
        .track(TrackEvent.awaken_exposere, properties: {'uid': Session.uid});
  }

  @override
  Widget build(BuildContext context) {
    double width = 70.dp;
    return GestureDetector(
      onTap: () {
        _selectIndex = _selectIndex == 0 ? 1 : 0;
        setState(() {});
        if (widget.finishChoose != null) {
          widget.finishChoose!(_selectIndex);
        }
        if (_selectIndex == 0) {
          Tracker.instance.track(TrackEvent.awaken_exposere,
              properties: {'uid': Session.uid});
        } else {
          Tracker.instance.track(TrackEvent.lighten_exposure,
              properties: {'uid': Session.uid});
        }
      },
      child: Container(
        width: 70.dp,
        height: 24.dp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.dp),
          border: Border.all(color: Colors.white.withOpacity(0.72), width: 0.5),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            PositionedDirectional(
                start: _selectIndex * (width - 2.dp) / 2 + 1.dp,
                child: Container(
                  width: 33.5.dp,
                  height: 21.dp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.5.dp),
                    color: Colors.white,
                  ),
                )),
            Row(
              children: [
                Container(
                  width: 34.dp,
                  height: 24.dp,
                  alignment: Alignment.center,
                  child: R.img(
                    Assets.personaldata$gift_wall_gift_awake_text_webp,
                    width: 18.dp,
                    height: 12.dp,
                    color: _selectIndex == 0 ? Colors.black : Colors.white,
                  ),
                ),
                Container(
                  width: 34.dp,
                  height: 24.dp,
                  alignment: Alignment.center,
                  child: R.img(
                    Assets.personaldata$gift_wall_gift_light_text_webp,
                    width: 18.dp,
                    height: 12.dp,
                    color: _selectIndex == 1 ? Colors.black : Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
