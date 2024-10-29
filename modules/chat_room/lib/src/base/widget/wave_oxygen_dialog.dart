import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/chat_room.dart';
import 'package:flutter/material.dart';

class WaveOxygenTipDialog extends StatelessWidget {
  final ChatRoomData room;

  const WaveOxygenTipDialog(this.room, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 312,
        height: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  K.room_wave_oxygen_title,
                  style: const TextStyle(
                    color: Color(0xFF202020),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    K.room_wave_oxygen_tip,
                    style: TextStyle(
                      color: R.color.mainTextColor,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    BaseWebviewScreen.show(System.context,
                        url: Util.getHelpUrlWithQStr('k105'));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          K.room_detail_rule,
                          style: TextStyle(
                            color: R.color.mainBrandColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: R.color.mainBrandColor,
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    IGiftManager giftManager = ComponentManager.instance
                        .getManager(ComponentManager.MANAGER_GIFT);
                    giftManager.showRoomGiftPanel(context, room: room);
                  },
                  child: Container(
                    width: 200,
                    height: 48,
                    decoration: ShapeDecoration(
                      shape: const StadiumBorder(),
                      gradient: LinearGradient(
                        colors: R.color.mainBrandGradientColors,
                      ),
                    ),
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      K.room_wave_send_gift,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
            PositionedDirectional(
              top: 0,
              end: 0,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close,
                  size: 24,
                  color: R.color.thirdTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future show(BuildContext context, ChatRoomData room) {
    return showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => WaveOxygenTipDialog(room),
    );
  }
}
