import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:flutter/material.dart';

class WelcomeOfferPriceItem extends StatelessWidget {
  final Welcome welcomeInfo;

  const WelcomeOfferPriceItem(this.welcomeInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 48,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xFFB281F5), Color(0xFF7863FF)]),
          borderRadius: BorderRadius.circular(24)),
      child: Row(
        children: [
          const SizedBox(
            width: 2,
          ),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(width: 2, color: Colors.white),
            ),
            child: CommonAvatar(
              path: welcomeInfo.icon,
              shape: BoxShape.circle,
              size: 44,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: Text(
                  welcomeInfo.name ?? '',
                  maxLines: 1,
                  style: R.textStyle.regular14
                      .copyWith(fontSize: 15, color: Colors.white),
                )),
                Flexible(
                    child: Text(
                  K.room_offer_price,
                  maxLines: 1,
                  style: R.textStyle.regular12.copyWith(color: Colors.white),
                )),
              ],
            ),
          ),
          R.img(MoneyConfig.moneyIcon, width: 24, height: 24),
          Text(
            '${welcomeInfo.giftPrice}',
            maxLines: 1,
            style: R.textStyle.moneyNumStyle.copyWith(color: Colors.white),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
