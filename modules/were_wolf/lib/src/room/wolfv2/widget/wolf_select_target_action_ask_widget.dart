import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_base_button.dart';
import 'package:were_wolf/src/room/wolfv2/widget/wolf_user_icon.dart';

///选择目标询问框
class WolfSelectTargetActionAskWidget extends StatelessWidget {
  final String actionTitle;
  final String actionContentTitle;
  final String actionContentDescription;
  final String buttonLeftText;
  final String buttonRightText;
  final VoidCallback? onButtonLeftTap;
  final VoidCallback? onButtonRightTap;

  const WolfSelectTargetActionAskWidget({
    super.key,
    required this.actionTitle,
    required this.actionContentTitle,
    required this.actionContentDescription,
    required this.buttonLeftText,
    required this.buttonRightText,
    this.onButtonLeftTap,
    this.onButtonRightTap,
  });

  Widget _buildTitle(double width) {
    return Container(
      width: width,
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
    List<Widget> res = [
      Expanded(
        flex: 24,
        child: Container(),
      ),
      Text(
        actionContentTitle,
        style: const TextStyle(
          fontSize: 12.0,
          color: Color(0xFF202020),
        ),
      ),
      Container(
        height: 15.0,
      ),
      Text(
        actionContentDescription,
        style: TextStyle(
          fontSize: 10.0,
          color: const Color(0xFF202020).withOpacity(0.6),
        ),
      ),
      Expanded(
        flex: 31,
        child: Container(),
      ),
    ];

    return Expanded(
      child: Column(
        children: res,
      ),
    );
  }

  Widget _buildButton() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(),
        ),
        WolfBaseButton(
          image: 'wolfv2/wolf_select_target_btn_left.webp',
          width: 82.0,
          height: 32.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                buttonLeftText,
                style: TextStyle(
                  fontSize: 15,
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
            if (onButtonLeftTap != null) {
              onButtonLeftTap!();
            }
          },
        ),
        Container(
          width: 13.0,
        ),
        WolfBaseButton(
          image: 'wolfv2/wolf_select_target_btn_right.webp',
          width: 82.0,
          height: 32.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                buttonRightText,
                style: TextStyle(
                  fontSize: 15,
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
            if (onButtonRightTap != null) {
              onButtonRightTap!();
            }
          },
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double realWidth = MediaQuery.of(context).size.width -
        2 * (25.0 + 16.0 + WolfUserIcon.iconSize) -
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
        mainAxisSize: MainAxisSize.min,
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
