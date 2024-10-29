import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class PkSkillsConfirmDialog extends StatelessWidget {
  final String mainTitle;
  final String subTitle;
  final String cancelButtonText;
  final String confirmButtonText;
  final VoidCallback? cancelCallback;
  final VoidCallback? confirmCallback;

  const PkSkillsConfirmDialog({
    Key? key,
    this.mainTitle = '',
    this.subTitle = '',
    this.cancelButtonText = '',
    this.confirmButtonText = '',
    this.cancelCallback,
    this.confirmCallback,
  }) : super(key: key);

  static Future<void> show(
    BuildContext context, {
    String mainTitle = '',
    String subTitle = '',
    String cancelButtonText = '',
    String confirmButtonText = '',
    VoidCallback? cancelCallback,
    VoidCallback? confirmCallback,
  }) async {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: EdgeInsets.zero,
          content: PkSkillsConfirmDialog(
            mainTitle: mainTitle,
            subTitle: subTitle,
            cancelButtonText: cancelButtonText,
            confirmButtonText: confirmButtonText,
            cancelCallback: cancelCallback,
            confirmCallback: confirmCallback,
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
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          Text(
            mainTitle,
            style: TextStyle(
                color: R.color.unionRankText1,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              subTitle,
              style: TextStyle(
                  color: R.color.unionRankText1.withOpacity(0.6), fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  cancelCallback?.call();
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 130,
                  height: 48,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: const Color(0xFFF5F5F5),
                  ),
                  child: Text(
                    cancelButtonText,
                    style: TextStyle(
                        color: R.color.unionRankText1.withOpacity(0.7),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              InkWell(
                onTap: () {
                  confirmCallback?.call();
                },
                child: Container(
                  width: 130,
                  height: 48,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: LinearGradient(
                      colors: R.color.mainBrandGradientColors,
                    ),
                  ),
                  child: Text(
                    confirmButtonText,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
