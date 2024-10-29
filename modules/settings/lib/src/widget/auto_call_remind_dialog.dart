import 'package:settings/assets.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings/k.dart';

class AutoCallRemindDialog extends StatelessWidget {
  const AutoCallRemindDialog({Key? key}) : super(key: key);

  static Future show(BuildContext context) {
    Tracker.instance.track(TrackEvent.sayhi_pop_display);
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => const AutoCallRemindDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            width: 312,
            height: 374,
            decoration: BoxDecoration(
              color: R.color.dialogBgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: AlignmentDirectional.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                R.img(Assets.icAutoCallRemindPng,
                    width: 169,
                    height: 135,
                    package: ComponentManager.MANAGER_MESSAGE),
                const SizedBox(height: 20),
                Text(K.setting_auto_call_dialog_title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                Text(
                  K.setting_auto_call_dialog_subtitle,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(K.setting_auto_call_dialog_tip,
                    style: const TextStyle(color: Colors.white, fontSize: 13)),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    Expanded(child: _buildConfirmBtn(context)),
                    const SizedBox(width: 20),
                  ],
                ),
              ],
            ),
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
    );
  }

  Widget _buildConfirmBtn(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          gradient: LinearGradient(
            colors: R.colors.darkGradientColors,
          ),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(K.setting_auto_call_dialog_open_btn,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
