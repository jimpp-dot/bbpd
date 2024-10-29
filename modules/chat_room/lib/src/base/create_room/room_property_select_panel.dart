import 'package:shared/shared.dart';
import 'package:chat_room/src/base/model/room_purview_model.dart';
import 'package:flutter/material.dart';

/// 房间属性选择面板（合作房、个人房、家族房等）
///
class RoomPropertySelectPanel extends StatelessWidget {
  static Future<OperateConfig?> show(
      BuildContext context, List<OperateConfig> data) {
    return displayModalBottomSheet(
      context: context,
      backgroundColor: R.colors.mainBgColor,
      disableTapDismissible: true,
      builder: (BuildContext context) {
        return RoomPropertySelectPanel(data);
      },
    );
  }

  final List<OperateConfig> data;

  const RoomPropertySelectPanel(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0 + Util.iphoneXBottom,
      padding: EdgeInsetsDirectional.only(bottom: Util.iphoneXBottom),
      decoration: BoxDecoration(
        color: R.color.secondBgColor,
        borderRadius:
            const BorderRadiusDirectional.vertical(top: Radius.circular(10.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: data.map((OperateConfig config) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pop(config),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      top: 18.0, bottom: 12.0, start: 14.0, end: 14.0),
                  child: CachedNetworkImage(
                    width: 60,
                    height: 60,
                    imageUrl: Util.parseIcon(config.icon),
                    errorWidget: R.img(
                      'room_${config.display == 'vip' ? 'private' : config.display}.webp',
                      package: ComponentManager.MANAGER_BASE_ROOM,
                      width: 60.0,
                      height: 60.0,
                    ),
                  ),
                ),
                Text(
                  config.name,
                  style: const TextStyle(fontSize: 12.0, color: Colors.white),
                )
              ],
            ),
          );
        }).toList(growable: false),
      ),
    );
  }
}
