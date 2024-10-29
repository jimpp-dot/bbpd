import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../k.dart';

class DestroyCpHouseDialog extends StatelessWidget {
  final VoidCallback cancelCallback;
  final VoidCallback confirmCallback;

  const DestroyCpHouseDialog(
      {Key? key, required this.cancelCallback, required this.confirmCallback})
      : super(key: key);

  static Future<void> show(BuildContext context,
      {required VoidCallback cancelCallback,
      required VoidCallback confirmCallback}) async {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          insetPadding: EdgeInsets.zero,
          content: DestroyCpHouseDialog(
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
      width: Util.width - 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              K.personaldata_confirm_destroy_cp_house_tip,
              style: TextStyle(
                  color: R.color.unionRankText1,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: cancelCallback,
                child: Container(
                  width: 130,
                  height: 48,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Text(
                    K.cancel,
                    style: TextStyle(
                        color: R.color.unionRankText1.withOpacity(0.7),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: confirmCallback,
                child: Container(
                  width: 130,
                  height: 48,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: R.color.mainBrandGradientColors),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Text(
                    K.sure,
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
