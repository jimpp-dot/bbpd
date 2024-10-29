import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/chat_room.dart';
import 'package:were_wolf/k.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_base_button.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_select_target_user_widget.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_user_icon.dart';

///
///
class WolfGuideSelectTargetActionWidget extends StatelessWidget {
  final List<RoomPosition>? actionPositions;

  final String actionTitle;
  final String buttonText;
  final VoidCallback? onButtonTap;
  final int opFlag; //0默认 1毒药 2解药

  const WolfGuideSelectTargetActionWidget({
    super.key,
    this.actionPositions,
    required this.actionTitle,
    required this.buttonText,
    this.onButtonTap,
    this.opFlag = 0,
  });

  Widget _buildTitle(double width) {
    return Container(
      width: width, //209.0,
      height: 29.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            R.imagePath('wolfv2/wolf_select_target_title_bg.webp',
                package: ComponentManager.MANAGER_WERE_WOLF),
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Text(
        actionTitle,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildContent() {
    List<Widget> res = [];
    if (actionPositions == null || actionPositions!.isEmpty) {
      res.add(
        Expanded(
          flex: 18,
          child: Container(),
        ),
      );
      res.add(
        R.img(
          'wolfv2/wolf_select_target_notice.webp',
          width: 23.0,
          height: 23.0,
          package: ComponentManager.MANAGER_WERE_WOLF,
        ),
      );
      res.add(
        Container(
          height: 16.0,
        ),
      );
      res.add(
        Text(
          K.wolf_v2_target_action_desc,
          style: TextStyle(
            fontSize: 10.0,
            color: const Color(0xFF202020).withOpacity(0.6),
          ),
        ),
      );
      res.add(
        Expanded(
          flex: 31,
          child: Container(),
        ),
      );
    } else {
      res.add(
        Expanded(
          flex: 14,
          child: Container(),
        ),
      );
      res.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: actionPositions!
              .map((_) => WolfGuideSelectTargetUserWidget(
                    roomPosition: _,
                    opFlag: opFlag,
                  ))
              .toList(),
        ),
      );
      res.add(
        Expanded(
          flex: 22,
          child: Container(),
        ),
      );
    }

    return Expanded(
      child: Column(
        children: res,
      ),
    );
  }

  Widget _buildButton() {
    bool isReady = false;
    if (actionPositions != null && actionPositions!.isNotEmpty) {
      isReady = true;
    }

    return WolfGuideBaseButton(
      image: isReady
          ? 'wolfv2/wolf_btn_enable.webp'
          : 'wolfv2/wolf_btn_unenable.webp',
      width: 113,
      height: 37,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            buttonText,
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: Util.fontFamily,
            ),
          ),
          Container(
            height: 5.0,
          ),
        ],
      ),
      onTap: () {
        if (onButtonTap != null) {
          onButtonTap!();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double realWidth = MediaQuery.of(context).size.width -
        2 * (25.0 + 16.0 + WolfGuideUserIcon.iconSize) -
        2.0;
    double realHeight = realWidth * 185.0 / 217.0;
    return Container(
      width: realWidth,
      height: realHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            R.imagePath('wolfv2/wolf_select_target_bg.webp',
                package: ComponentManager.MANAGER_WERE_WOLF),
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 10.0,
          ),
          _buildTitle(
            realWidth - 12.0,
          ),
          _buildContent(),
          _buildButton(),
          Container(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
