import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

///
/// 主题样式-背景设置列表
///
class RoomSettingThemeTemplateSheet extends StatefulWidget {
  final int rid;

  const RoomSettingThemeTemplateSheet({Key? key, required this.rid})
      : super(key: key);

  @override
  _RoomSettingThemeTemplateSheetState createState() =>
      _RoomSettingThemeTemplateSheetState();
}

class _RoomSettingThemeTemplateSheetState
    extends State<RoomSettingThemeTemplateSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double titleHeight = 57; //标题高度
    double itemWidth =
        MediaQuery.of(context).size.width * (108.0 / 375.0); //图片宽度
    double itemHeight = 4.0 / 3.0 * itemWidth; //图片高度
    double maxHeight =
        MediaQuery.of(context).size.width * 4.0 / 3.0; //包含标题的最大高度

    TextStyle currentUseStyle = const TextStyle(
      color: Colors.white,
      fontSize: 11,
    ); //当前使用 style
    return Container(
      height: maxHeight + Util.iphoneXBottom,
      margin: const EdgeInsets.only(
        bottom: 0,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(18.0), topEnd: Radius.circular(18.0)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: titleHeight,
            alignment: AlignmentDirectional.center,
            child: Text(
              K.room_theme_template,
              style: const TextStyle(
                color: Color(0xFF313131),
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
