import 'package:chat_room/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class RoomHeaderSettingWidget extends StatelessWidget {
  const RoomHeaderSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return R.img(
      RoomAssets.chat_room$base_ic_room_setting_webp,
      width: 24.0,
      height: 24.0,
    );
  }
}
