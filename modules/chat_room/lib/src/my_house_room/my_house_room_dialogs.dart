import '../../k.dart';
import 'package:shared/shared.dart';
import 'package:shared/k.dart' as coreK;
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/src/protobuf/generated/brother_room.pb.dart';

/// 大哥房升级弹窗、说明弹窗、各种
class MyHouseLevelUpDialog extends StatelessWidget {
  final String text;

  const MyHouseLevelUpDialog({Key? key, required this.text}) : super(key: key);

  static Future<T?> show<T>(BuildContext context, String text) async {
    return await showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(child: MyHouseLevelUpDialog(text: text));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 36),
          Padding(
            padding:
                const EdgeInsets.only(left: 26, right: 26, top: 8, bottom: 20),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF202020),
                  fontWeight: FontWeight.w500),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: Ink(
              width: 180,
              height: 52,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF9669), Color(0xFFFFC977)],
                  begin: AlignmentDirectional.centerStart,
                  end: AlignmentDirectional.centerEnd,
                ),
                borderRadius: BorderRadius.circular(26),
              ),
              child: InkWell(
                onTap: () => Navigator.of(context).maybePop(),
                borderRadius: BorderRadius.circular(17),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    coreK.K.sure,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24)
        ],
      ),
    );
  }
}

class MyHouseLevelInfoDialog extends StatelessWidget {
  final ChatRoomData room;
  final BrotherConfigMessage info;

  const MyHouseLevelInfoDialog(
      {Key? key, required this.room, required this.info})
      : super(key: key);

  static Future<T?> show<T>(BuildContext context, ChatRoomData room,
      BrotherConfigMessage info) async {
    return await showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(child: MyHouseLevelInfoDialog(room: room, info: info));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 54,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  K.room_mh_room_name_pre + room.config!.name,
                  style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF202020),
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => BaseWebviewScreen.show(context,
                      url: Util.getHelpUrlWithQStr('k159')),
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        Text(
                          K.rule_description,
                          style: const TextStyle(
                              fontSize: 11, color: Color(0x99202020)),
                        ),
                        const SizedBox(width: 2),
                        const Icon(Icons.keyboard_arrow_right,
                            size: 12, color: Color(0x99202020))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          CommonAvatar(
            path: info.master.icon,
            size: 68,
            shape: BoxShape.circle,
          ),
          const SizedBox(height: 8),
          Text(
            K.room_mh_level_title_cn([info.room.level.toString()]),
            style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF202020),
                fontWeight: FontWeight.w500),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 12, bottom: 31),
            child: Text(
              info.room.levelInfo,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0x99202020),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
