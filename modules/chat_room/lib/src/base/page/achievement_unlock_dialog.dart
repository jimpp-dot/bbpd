import 'package:shared/assets.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

/// 成就解锁弹窗
class AchievementUnlockDialog extends StatefulWidget {
  final String icon;
  final String name;

  const AchievementUnlockDialog(
      {super.key, required this.icon, required this.name});

  static Future show(BuildContext context,
      {required String icon, required String name}) async {
    if (Util.isStringEmpty(icon) || Util.isStringEmpty(name)) return;
    return DialogTransition.scaleShow(
      context: context,
      barrierDismissible: false,
      builder: (context) => AchievementUnlockDialog(icon: icon, name: name),
    );
  }

  @override
  _AchievementUnlockDialogState createState() =>
      _AchievementUnlockDialogState();
}

class _AchievementUnlockDialogState extends State<AchievementUnlockDialog> {
  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          K.room_unlock_achievement,
          style: TextStyle(
              fontSize: 18,
              color: R.color.mainTextColor,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        R.img(
          Util.parseIcon(widget.icon),
          width: 144,
          height: 144,
        ),
        Text(
          widget.name,
          style: TextStyle(fontSize: 13, color: R.color.secondTextColor),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: CustomAlertDialog(
        width: 312.dp,
        contentBuilder: (context) => _buildContent(),
        positiveButton: PositiveButton(
          onPressed: () => Navigator.of(context).pop(true),
          text: K.room_known,
          width: 216.dp,
          height: 48,
          useGradientBg: true,
          gradientBg: R.color.mainBrandGradientColors,
        ),
        closeWidget: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: R.img(
              BaseAssets.shared$ic_close_svg,
              width: 16,
              height: 16,
              color: R.color.secondTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
