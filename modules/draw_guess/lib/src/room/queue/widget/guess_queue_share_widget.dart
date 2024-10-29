import 'package:shared/shared.dart';
import 'package:draw_guess/assets.dart';
import 'package:flutter/material.dart';

import '../../../../k.dart';

class GuessQueueShareWidget extends StatelessWidget {
  final int rid;
  final int lineId;

  const GuessQueueShareWidget(this.rid, this.lineId, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _share,
      child: Container(
        width: 184,
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFFFE9153),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          border: Border.all(color: const Color(0xFF343434), width: 3),
        ),
        alignment: AlignmentDirectional.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            R.img(
              Assets.draw_guess$ic_share_icon_webp,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 2),
            Text(
              K.guess_share_tip,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _share() {
    ISettingManager settingManager =
        ComponentManager.instance.getManager(ComponentManager.MANAGER_SETTINGS);
    settingManager.share(System.context, Session.uid,
        rid: rid, tp: 202, lineId: lineId);
  }
}
