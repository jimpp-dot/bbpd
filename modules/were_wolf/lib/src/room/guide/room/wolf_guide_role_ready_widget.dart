import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:were_wolf/src/room/guide/room/wolf_guide_base_button.dart';

///
///
class WolfGuideRoleReadyWidget extends StatelessWidget {
  const WolfGuideRoleReadyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 10.0,
          ),
          WolfGuideBaseButton(
            image: 'wolfv2/wolf_btn_unenable.webp',
            width: 113,
            height: 37,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  K.was_ready,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: Util.fontFamily,
                  ),
                ),
                Container(
                  height: 2.0,
                ),
              ],
            ),
            onTap: () {},
          ),
          Container(
            height: 3.0,
          ),
        ],
      ),
    );
  }
}
