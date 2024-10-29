import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_main.dart';
import 'package:were_wolf/src/room/wolfv2/wolfOpUtil.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_user_icon.dart';
import 'package:were_wolf/src/room/guide/room/wolfGuideConfig.dart';
import 'package:were_wolf/src/room/guide/room/wolfGuideData.dart';
import 'package:were_wolf/src/room/guide/room/wolf_model.dart';
import 'package:provider/provider.dart' hide Selector;

///
///
class WolfGuideCenterTopWidget extends StatefulWidget {
  const WolfGuideCenterTopWidget({super.key});

  @override
  State createState() {
    return WolfGuideCenterTopWidgetState();
  }
}

class WolfGuideCenterTopWidgetState extends State<WolfGuideCenterTopWidget>
    with TickerProviderStateMixin<WolfGuideCenterTopWidget> {
  late AnimationController _aniController;
  late Animation _messageSlideInHeightAni;
  late Animation _messageSlideOutHeightAni;
  bool _scale = true;

  @override
  void initState() {
    super.initState();
    eventCenter.addListener(
        WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_MSG_BOARD_HIDE_EVENT,
        _onTapClick);
    _aniController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _messageSlideInHeightAni = Tween(
      begin: 0.0,
      end: WolfOpUtil.itemHeight * WolfOpUtil.sideCount +
          WolfOpUtil.spaceHeight * (WolfOpUtil.sideCount - 1),
    ).animate(
      CurvedAnimation(
        parent: _aniController,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );
    _messageSlideOutHeightAni = Tween(
      begin: WolfOpUtil.itemHeight * WolfOpUtil.sideCount +
          WolfOpUtil.spaceHeight * (WolfOpUtil.sideCount - 1),
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _aniController,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    _aniController.addListener(() {
      WolfModel wolfModel = Provider.of<WolfModel>(context, listen: false);
      if (_scale) {
        wolfModel.middleMessageHight = _messageSlideInHeightAni.value;
      } else {
        wolfModel.middleMessageHight = _messageSlideOutHeightAni.value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    WolfModel wolfModel = Provider.of<WolfModel>(context, listen: false);

    WolfGuideDayType? guideDayType = wolfModel.data.dayType;
    int day = wolfModel.data.dayCount ?? 0;
    WolfGuideConfigState? state = WolfGuideData.getInstance().currentState;

    String imgPath1 = '';
    String imgPath2 = '';
    String imgPath3 = '';
    if (state != WolfGuideConfigState.Wait) {
      WolfModel wolfModel = Provider.of<WolfModel>(context, listen: true);
      wolfModel.messageHight = 0;
      _scale = false;
    }

    if (guideDayType == WolfGuideDayType.day ||
        guideDayType == WolfGuideDayType.night) {
      //进入黑夜或者白天
      if (day + 1 < 22 && day + 1 > 0) {
        imgPath1 = 'wolfv2/day/wolf_day_${day + 1}.webp';
      }
      if (guideDayType == WolfGuideDayType.day) {
        imgPath2 = 'wolfv2/day/wolf_daytime.webp';
      } else if (guideDayType == WolfGuideDayType.night) {
        imgPath2 = 'wolfv2/day/wolf_night.webp';
      }
    } else if (state == WolfGuideConfigState.Wait) {
      if (_scale) {
        imgPath3 = 'wolfv2/message_shrink_icon.webp';
      } else {
        imgPath3 = 'wolfv2/message_scale_icon.webp';
      }
    }

    return Container(
      height: 44.0,
      alignment:
          imgPath3.isNotEmpty ? Alignment.bottomCenter : Alignment.center,
      child: imgPath3.isNotEmpty
          ? GestureDetector(
              onTap: () {
                setState(() {
                  _scale = !_scale;
                  _aniController.reset();
                  _aniController.forward();
                });
              },
              child: R.img(imgPath3,
                  width: Util.width -
                      2 *
                          (WolfGuideUserIcon.left +
                              WolfGuideUserIcon.iconSize +
                              WolfGuideUserIcon.right),
                  height: 20,
                  package: ComponentManager.MANAGER_WERE_WOLF),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                imgPath1.isNotEmpty
                    ? R.img(
                        imgPath1,
                        width: 110,
                        height: 24,
                        package: ComponentManager.MANAGER_WERE_WOLF,
                      )
                    : Container(),
                imgPath2.isNotEmpty
                    ? R.img(
                        imgPath2,
                        width: 38,
                        height: 20,
                        package: ComponentManager.MANAGER_WERE_WOLF,
                      )
                    : Container(),
              ],
            ),
    );
  }

  @override
  void dispose() {
    eventCenter.removeListener(
        WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_MSG_BOARD_HIDE_EVENT,
        _onTapClick);
    _aniController.dispose();
    super.dispose();
  }

  _onTapClick(String type, dynamic data) async {
    setState(() {
      _scale = !_scale;
      _aniController.reset();
      _aniController.forward();
    });
  }
}
