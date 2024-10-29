import 'package:shared/shared.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/cupertino.dart';
import 'package:rank/assets.dart';

class GiftWeekEmptyWidget extends StatelessWidget {
  const GiftWeekEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        R.img(Assets.gift_week_gift_week_rank_empty_webp,
            width: 144, height: 106, package: ComponentManager.MANAGER_RANK),
        const SizedBox(
          height: 12,
        ),
        Text(
          K.room_cplink_user_label_empty,
          style: R.textStyle.regular16
              .copyWith(color: const Color(0xFFFFCAA9).withOpacity(0.4)),
        ),
      ],
    );
  }
}
