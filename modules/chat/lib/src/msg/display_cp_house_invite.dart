import 'package:chat/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class DisplayCpHouseInvite extends StatelessWidget {
  final MessageContent message;
  final Map? extra;

  const DisplayCpHouseInvite({super.key, required this.message, this.extra});

  bool get isSender => message.senderId == Session.uid.toString();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [Color(0xFFFFEBF2), Color(0xFFF8E1EF)],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                const Color(0xFFFFF470).withOpacity(0.5),
                Colors.white.withOpacity(0)
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  isSender ? K.chat_invite_ta_create_cp_house : message.content,
                  style:
                      const TextStyle(color: Color(0xFF6121B3), fontSize: 16),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    if (!Session.isLogined) return;
                    IPersonalDataManager manager = ComponentManager.instance
                        .getManager(ComponentManager.MANAGER_PERSONALDATA);
                    manager.showCpHouseMainPage(
                        context, Session.uid, isSender ? 0 : 1);
                  },
                  child: Container(
                    width: 98,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border:
                          Border.all(color: const Color(0xFFFF6C8B), width: 1),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 1,
                          spreadRadius: 0,
                          color: Color(0xFFFF6C82),
                        ),
                      ],
                      gradient: const LinearGradient(
                        begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter,
                        colors: [Color(0xFFFFC1D7), Color(0xFFFF2F4B)],
                      ),
                    ),
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: LinearGradient(
                          begin: AlignmentDirectional.topStart,
                          end: AlignmentDirectional.bottomEnd,
                          colors: [
                            const Color(0xFFFFF470).withOpacity(0.5),
                            Colors.white.withOpacity(0)
                          ],
                        ),
                      ),
                      child: Text(
                        K.chat_go_immediately,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ));
  }
}
