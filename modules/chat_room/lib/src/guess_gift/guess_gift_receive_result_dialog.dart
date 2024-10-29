import 'dart:async';

import 'package:chat_room/k.dart';
import 'package:shared/shared.dart';
import 'package:chat_room/src/protobuf/generated/guess_gift.pb.dart';
import 'package:flutter/material.dart';

/// 礼物猜猜乐 - 收礼结果
class GuessGiftReceiveResultDialog extends StatelessWidget {
  final GuessGiftBox data;

  const GuessGiftReceiveResultDialog({Key? key, required this.data})
      : super(key: key);

  static Future show(BuildContext context, GuessGiftBox data) async {
    return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => GuessGiftReceiveResultDialog(data: data),
    );
  }

  @override
  Widget build(BuildContext context) {
    String title = '';
    String subTitle =
        K.room_guess_gift_receive_result_sub_title(['$_calcTotalPrice']);
    if (data.maxBox == 1 && data.boxTacit > 0) {
      title = K.room_guess_gift_receive_result_title_1;
      subTitle += K
          .room_guess_gift_receive_result_sub_title_extra(['${data.boxTacit}']);
    } else {
      title = K.room_guess_gift_receive_result_title_2;
    }
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 312,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 25),
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF42177A),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    subTitle,
                    style: const TextStyle(
                      color: Color(0xFF42177A),
                      fontSize: 13,
                    ),
                  ),
                ),
                if (data.list.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 110,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: AlignmentDirectional.center,
                    child: (data.list.length > 2)
                        ? ListView.separated(
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: data.list.length,
                            itemBuilder: (context, index) {
                              return _buildGiftItem(data.list[index]);
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 6);
                            },
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildGiftItem(data.list[0]),
                              if (data.list.length > 1) ...[
                                const SizedBox(width: 6),
                                _buildGiftItem(data.list[1]),
                              ],
                            ],
                          ),
                  ),
                ],
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const ShapeDecoration(
                      shape: StadiumBorder(),
                      gradient: LinearGradient(
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                        colors: [
                          Color(0xFFFFF5D8),
                          Color(0xFFE694FF),
                          Color(0xFFC554F9),
                          Color(0xFFB057FF),
                          Color(0xFFA589FF),
                          Color(0xFFB9B3FC),
                          Color(0xFFB2FFF9)
                        ],
                      ),
                    ),
                    alignment: AlignmentDirectional.center,
                    child: Text(K.room_known,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15)),
                  ),
                ),
                const SizedBox(height: 30),
              ],
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
      ),
    );
  }

  Widget _buildGiftItem(GuessGiftBoxGiftItem item) {
    String giftIcon =
        !Util.isStringEmpty(item.url) ? item.url : Util.giftImgUrl(item.giftId);
    return Stack(
      children: [
        Container(
          width: 80,
          height: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0x1ADF77FF),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: AlignmentDirectional.topCenter,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CachedNetworkImage(imageUrl: giftIcon, width: 60, height: 60),
              const SizedBox(height: 2),
              Text(item.name,
                  style:
                      const TextStyle(color: Color(0xFF42177A), fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              Expanded(
                child: Container(
                  alignment: AlignmentDirectional.center,
                  child: _buildPrice(item.price),
                ),
              ),
            ],
          ),
        ),
        if (item.giftNum > 0)
          PositionedDirectional(
            start: 0,
            top: 0,
            child: Container(
              height: 16,
              decoration: BoxDecoration(
                borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(8),
                    bottomEnd: Radius.circular(6)),
                color: const Color(0xFFDF77FF).withOpacity(0.3),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              alignment: AlignmentDirectional.center,
              child: Text('x${item.giftNum}',
                  style: const TextStyle(
                      color: Color(0xFF42177A),
                      fontSize: 9,
                      fontWeight: FontWeight.w500)),
            ),
          ),
      ],
    );
  }

  Widget _buildPrice(int price) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(MoneyConfig.moneyIcon, width: 12, height: 12),
        const SizedBox(width: 2),
        Text('$price',
            style: const TextStyle(color: Color(0xB36E2CE4), fontSize: 11)),
      ],
    );
  }

  int get _calcTotalPrice {
    int totalPrice = 0;
    for (GuessGiftBoxGiftItem gift in data.list) {
      totalPrice += gift.giftNum * gift.price;
    }
    return totalPrice;
  }
}
