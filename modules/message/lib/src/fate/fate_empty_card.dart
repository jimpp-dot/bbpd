import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:message/k.dart';

/// 今日缘分：次数已用完卡片
class FateEmptyCard extends StatelessWidget {
  const FateEmptyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 119),
        R.img('bb_null.webp',
            package: ComponentManager.MANAGER_BASE_CORE,
            width: 170,
            height: 170,
            fit: BoxFit.fill),
        const SizedBox(height: 13),
        Text(
          K.msg_fate_empty_tips_1,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF313131),
              height: 1.1),
        ),
        const SizedBox(height: 12),
        Text(
          K.msg_fate_empty_tips_2,
          style: const TextStyle(
              fontSize: 14, color: Color(0x99313131), height: 1.1),
        ),
      ],
    );
  }
}
