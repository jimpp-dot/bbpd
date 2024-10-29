import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/src/room/wolfv2/wolfOpUtil.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_beans.dart';
import 'package:were_wolf/src/room/wolfv2/model/wolf_model.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_user_icon.dart';
import 'package:provider/provider.dart' hide Selector;

///
///狼人12人游戏内容顶部
///
class WolfCenterTopWidget extends StatefulWidget {
  final ChatRoomData? room;

  const WolfCenterTopWidget({super.key, this.room});

  @override
  State createState() {
    return WolfCenterTopWidgetState();
  }
}

class WolfCenterTopWidgetState extends State<WolfCenterTopWidget>
    with TickerProviderStateMixin<WolfCenterTopWidget> {
  late AnimationController _aniController;
  late Animation _messageSlideInHeightAni;
  late Animation _messageSlideOutHeightAni;
  bool _scale = false;

  @override
  void initState() {
    super.initState();
    _aniController = AnimationController(
      duration: const Duration(milliseconds: 50),
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
    WolfConfigData? wolfConfigData =
        widget.room?.config?.configExpendData as WolfConfigData?;
    String imgPath1 = '';
    String imgPath2 = '';
    String imgPath3 = '';
    if (wolfConfigData?.state != WolfState.Wait) {
      WolfModel wolfModel = Provider.of<WolfModel>(context, listen: true);
      wolfModel.messageHight = 0;
      _scale = false;
    }

    if (wolfConfigData?.stateType == WolfStateType.day ||
        wolfConfigData?.stateType == WolfStateType.night) {
      //进入黑夜或者白天
      if (wolfConfigData!.count + 1 < 22 && wolfConfigData.count + 1 > 0) {
        imgPath1 = 'wolfv2/day/wolf_day_${wolfConfigData.count + 1}.webp';
      }
      if (wolfConfigData.stateType == WolfStateType.day) {
        imgPath2 = 'wolfv2/day/wolf_daytime.webp';
      } else if (wolfConfigData.stateType == WolfStateType.night) {
        imgPath2 = 'wolfv2/day/wolf_night.webp';
      }
    } else if (wolfConfigData?.state == WolfState.Wait) {
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
                          (WolfUserIcon.left +
                              WolfUserIcon.iconSize +
                              WolfUserIcon.right),
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
    _aniController.dispose();
    super.dispose();
  }
}
