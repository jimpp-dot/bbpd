import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:moment/k.dart';

enum SmallMoodDialogType {
  KindlyReminder, // 首次温馨提示一次
  ExitReminder, // 退出时首次提示一次
  TradeOffReminder // 换掉时每日提示一次
}

class SmallMoodKindlyReminderDialog extends StatelessWidget {
  final SmallMoodDialogType type;
  final VoidCallback? onCancelTap;
  final VoidCallback? onConfirmTap;

  const SmallMoodKindlyReminderDialog(
    this.type, {
    Key? key,
    this.onCancelTap,
    this.onConfirmTap,
  }) : super(key: key);

  static Future<void> show(
    BuildContext? context,
    SmallMoodDialogType type, {
    VoidCallback? onCancelTap,
    VoidCallback? onConfirmTap,
  }) async {
    showDialog(
      context: context ?? System.context,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: EdgeInsets.zero,
          content: SmallMoodKindlyReminderDialog(
            type,
            onCancelTap: onCancelTap,
            onConfirmTap: onConfirmTap,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Util.width - 60,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          Text(
            K.message_tips,
            style: TextStyle(
                color: R.color.unionRankText1,
                fontSize: 17,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              _getContentText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: R.color.unionRankText1.withOpacity(0.6), fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: _buildBottomButtonWidget(context),
          ),
        ],
      ),
    );
  }

  String _getContentText() {
    if (type == SmallMoodDialogType.KindlyReminder) {
      return K.moment_small_mood_kindly_reminder;
    } else if (type == SmallMoodDialogType.ExitReminder) {
      return K.moment_small_mood_exit_reminder;
    } else if (type == SmallMoodDialogType.TradeOffReminder) {
      return K.moment_small_mood_krade_off_reminder;
    }
    return '';
  }

  Widget _buildBottomButtonWidget(BuildContext context) {
    if (type == SmallMoodDialogType.KindlyReminder) {
      return GestureDetector(
        onTap: () {
          onCancelTap?.call();
          Navigator.of(context).pop();
        },
        child: Container(
          height: 48,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28.0),
              gradient:
                  LinearGradient(colors: R.color.mainBrandGradientColors)),
          child: Text(
            K.moment_got_it,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              onConfirmTap?.call();
              Navigator.of(context).pop();
            },
            child: Container(
              width: (Util.width - 120) / 2,
              height: 48,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                border: Border.all(color: R.color.dividerColor, width: 0.5),
                color: Colors.white,
                borderRadius: BorderRadius.circular(28.0),
              ),
              child: Text(
                type == SmallMoodDialogType.TradeOffReminder
                    ? K.moment_change
                    : K.moment_exit,
                style: TextStyle(
                    color: R.color.unionRankText1,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              onCancelTap?.call();
              Navigator.of(context).pop();
            },
            child: Container(
              width: (Util.width - 120) / 2,
              height: 48,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28.0),
                  gradient:
                      LinearGradient(colors: R.color.mainBrandGradientColors)),
              child: Text(
                K.moment_think_again,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      );
    }
  }
}
