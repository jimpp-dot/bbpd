import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:were_wolf/k.dart';
import 'package:were_wolf/src/room/guide/room/wolfGuideConfig.dart';
import 'package:were_wolf/src/room/guide/room/wolf_cycle_move_widget.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_controller_icon_widget.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_main.dart';
import 'package:were_wolf/src/room/guide/room/wolf_model.dart';
import 'package:provider/provider.dart' hide Selector;

///
///
class WolfGuideController extends StatelessWidget {
  const WolfGuideController({super.key});

  ///
  /// done
  /// 过麦-菜单
  ///
  static Widget _renderPass(WolfModel wolfModel) {
    return WolfControllerIconWidget(
      style: 0,
      wholeWidth: 36.0,
      wholeHeight: 36.0,
      iconWidth: 36.0,
      iconHeight: 36.0,
      icon: 'wolfv2/controller/wolf_controller_btn_bg2.webp',
      text: K.wolf_v2_room_controller_pass,
      textColor: Colors.white,
      onClick: () async {
        wolfModel.data.isHasClickMute = true;
        wolfModel.passDesc();

        //发言点击埋点
        Tracker.instance
            .track(TrackEvent.wolf_ai_game_mute_click, properties: {'op': '3'});
      },
    );
  }

  ///
  /// 开关麦-菜单
  ///
  Widget _renderMute(WolfModel wolfModel) {
    bool isCurrentDesc = wolfModel.data.isCurrentDesc();

    double wholeHeight = 36.0;
    double iconWidth = 36.0;
    double iconHeight = 36.0;
    String icon;
    String text;
    Color textColor;

    bool disabled; //发言按钮是否可点击
    String disabledStr = ''; //不可点击对应的文案

    if (isCurrentDesc) {
      //发言阶段
      disabled = false;
      if (wolfModel.getMuteClose()) {
        //当前处于关麦状态
        icon = 'wolfv2/controller/wolf_controller_btn_mute2.webp';
        text = K.wolf_v2_room_controller_mute_1;
        textColor = const Color(0xff6B55D6);
      } else {
        icon = 'wolfv2/controller/wolf_controller_btn_mute3.webp';
        text = K.wolf_v2_room_controller_mute_2;
        textColor = const Color(0xff00D747);
      }
    } else {
      wolfModel.setMuteClose(true);
      disabled = true;
      disabledStr = K.wolf_v2_room_controller_mute_3;
      icon = 'wolfv2/controller/wolf_controller_btn_mute1.webp';
      text = K.wolf_v2_room_controller_mute_4;
      textColor = const Color(0xffA1A1A1);
    }

    return Expanded(
      key: wolfModel.data.muteKey,
      child: InkWell(
        borderRadius: BorderRadius.circular(iconHeight),
        onTap: () async {
          if (disabled) {
            Fluttertoast.showToast(
                msg: disabledStr, gravity: ToastGravity.CENTER);
            return;
          }

          if (isCurrentDesc) {
            wolfModel.setMuteClose(!wolfModel.getMuteClose());
            wolfModel.data.speakers![Session.uid] = !wolfModel.getMuteClose();
            wolfModel.data.isHasClickMute = true;
            eventCenter.emit(
                WolfGuideMain.DISPATCH_GAME_WOLF_GUIDE_PAGE_REFRESH_EVENT);

            //发言点击埋点
            Tracker.instance.track(TrackEvent.wolf_ai_game_mute_click,
                properties: {'op': wolfModel.getMuteClose() ? '2' : '1'});
          }
        },
        child: Container(
          height: wholeHeight,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(iconHeight),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              R.img(
                icon,
                width: iconWidth,
                height: iconHeight,
                package: ComponentManager.MANAGER_WERE_WOLF,
              ),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  /// 赠送礼物-菜单
  ///
  Widget _renderGift() {
    return WolfControllerIconWidget(
      style: 0,
      wholeWidth: 36.0,
      wholeHeight: 36.0,
      iconWidth: 36.0,
      iconHeight: 36.0,
      icon: 'wolfv2/controller/wolf_controller_btn_gift_unable.webp',
      text: '',
      textColor: Colors.white,
      onClick: () async {
        return;
      },
    );
  }

  ///
  /// 发送表情-菜单
  ///
  Widget _renderEmote() {
    return WolfControllerIconWidget(
      style: 0,
      wholeWidth: 36.0,
      wholeHeight: 36.0,
      iconWidth: 36.0,
      iconHeight: 36.0,
      icon: 'wolfv2/controller/wolf_controller_btn_emote_unable.webp',
      text: '',
      textColor: Colors.white,
      onClick: () async {},
    );
  }

  ///
  /// 发送消息-菜单
  ///
  Widget _renderMessage() {
    return WolfControllerIconWidget(
      style: 0,
      wholeWidth: 36.0,
      wholeHeight: 36.0,
      iconWidth: 36.0,
      iconHeight: 36.0,
      icon: 'wolfv2/controller/wolf_controller_btn_message_unable.webp',
      text: '',
      textColor: Colors.white,
      onClick: () async {},
    );
  }

  @override
  Widget build(BuildContext context) {
    WolfModel wolfModel = Provider.of<WolfModel>(context, listen: false);

    List<Widget> res = [];
    res.add(
      Container(
        width: 12.0,
      ),
    );

    //过麦菜单
    bool needPass = false;

    WolfGuideConfigState? state = wolfModel.data.currentState;
    if (state == WolfGuideConfigState.DaytimeDesc ||
        state == WolfGuideConfigState.DaytimeLastWords) {
      int index = wolfModel.data.positions!.indexWhere((element) {
        WolfGuidePosition wolfGuidePosition =
            element.positionExpendData as WolfGuidePosition;
        return !wolfGuidePosition.isDead && wolfGuidePosition.isDesc;
      });
      if (index >= 0) {
        RoomPosition roomPosition = wolfModel.data.positions![index];
        if (roomPosition.uid == Session.uid) {
          needPass = true;
        }
      }
    }

    if (needPass) {
      res.add(_renderPass(wolfModel));
      res.add(
        Container(
          width: 10.0,
        ),
      );
    } else {
      res.add(
        Container(
          width: 36.0,
        ),
      );
      res.add(
        Container(
          width: 10.0,
        ),
      );
    }

    res.add(
      _renderMute(wolfModel),
    );
    res.add(
      Container(
        width: 8.0,
      ),
    );
    res.add(_renderGift());
    res.add(
      Container(
        width: 8.0,
      ),
    );
    res.add(_renderEmote());
    res.add(
      Container(
        width: 8.0,
      ),
    );
    res.add(_renderMessage());
    res.add(
      Container(
        width: 12.0,
      ),
    );

    double left = 12.0 + 36.0 + 10.0;
    double right = 8.0 + 36.0 + 8.0 + 36.0 + 8.0 + 36.0 + 12.0;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 50.0,
          margin: EdgeInsets.only(
            bottom: Util.iphoneXBottom,
          ),
          child: Row(
            children: res,
          ),
        ),
        if (wolfModel.data.needShowDescTip())
          WolfCycleMoveWidget(
            childWidget: Container(
              width: 124.0,
              height: 52.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(R.imagePath("ic_good_guide_tis_1.png",
                      package: ComponentManager.MANAGER_WERE_WOLF)),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(
                K.wolf_v2_room_controller_mute_1,
                style: const TextStyle(
                  color: Color(0xff4A3429),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            dx: left +
                (MediaQuery.of(context).size.width - left - right - 124.0) /
                    2, //12+36+10
            dy: -52.0,
          ),
      ],
    );
  }
}
