import 'package:shared/shared.dart';
import 'package:shared/widget/bubble/bubble_tooltip.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:were_wolf/k.dart';

///狼人12人顶栏
class WolfTopHeader extends StatelessWidget {
  final ChatRoomData room;
  final VoidCallback? onSettingClick;

  const WolfTopHeader({super.key, required this.room, this.onSettingClick});

  @override
  Widget build(BuildContext context) {
    return _renderHeader(context);
  }

  Widget _renderHeader(BuildContext context) {
    List<Widget> res = [];
    res.add(
      InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: SizedBox(
          width: 36.0,
          height: kToolbarHeight,
          child: Center(
            child: R.img("back.svg",
                width: 24.0,
                height: 24.0,
                package: ComponentManager.MANAGER_BASE_ROOM),
          ),
        ),
      ),
    );

    res.add(
      RoomHeaderTitleWidget(level: room.config?.level, room: room),
    );

    res.add(
      InkWell(
        onTap: () {
          ISettingManager settingManager = ComponentManager.instance
              .getManager(ComponentManager.MANAGER_SETTINGS);
          settingManager.share(context, room.rid,
              tp: 1, needInApp: true, newShareInRoom: true, rid: room.rid);
        },
        child: Container(
          width: 44.0,
          height: 44.0,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            R.imagePath('share_invite.svg',
                package: ComponentManager.MANAGER_BASE_ROOM),
            width: 24,
            height: 24,
            color: Colors.white,
          ),
        ),
      ),
    );

    if (room.config?.game != Games.None || !room.isSenderRoom) {
      res.add(_renderHot(context));
    }

    if (room.config?.game != Games.None) {
      res.add(_renderDesc(context));
    }

    res.add(
      InkWell(
        onTap: onSettingClick,
        child: Container(
          width: 40.0,
          height: 40.0,
          alignment: Alignment.center,
          child: R.img("setting.svg",
              width: 24.0,
              height: 24.0,
              package: ComponentManager.MANAGER_BASE_ROOM),
        ),
      ),
    );

    return Container(
      height: 44,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        children: res,
      ),
    );
  }

  Widget _renderHot(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 6),
      child: RoomHotNewWidget(room),
    );
  }

  Widget _renderDesc(BuildContext context) {
    return InkWell(
      onTap: () {
        String url = Util.getHelpUrlWithQStr('k25');
        BaseWebviewScreen.show(context,
            url: url, title: K.wolf_v2_room_game_rules);
      },
      child: BubbleTooltip(
        message: K.wolf_v2_click_to_show_game_rule,
        padding: const EdgeInsetsDirectional.only(
            top: 10, bottom: 10, start: 12, end: 12),
        verticalOffset: 12,
        childPaddingBottom: 8,
        child: Container(
          width: 40.0,
          height: 40.0,
          alignment: Alignment.center,
          child: R.img("info.svg",
              width: 24,
              height: 24,
              package: ComponentManager.MANAGER_BASE_ROOM),
        ),
      ),
    );
  }
}
