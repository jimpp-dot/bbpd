import 'package:shared/shared.dart';
import 'package:flutter/material.dart';
import '../../../k.dart';
import '../../protobuf/generated/piadrama.pb.dart';

typedef OnItemOrder = void Function(int index);

/// 剧本-剧单item
class OrderDramaItem extends StatelessWidget {
  final int index;
  final PiaJuBen juben;
  final OnItemOrder onItemOrder;

  const OrderDramaItem(
      {Key? key,
      required this.index,
      required this.juben,
      required this.onItemOrder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 28,
            child: Text(
              '${index + 1}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
          Expanded(
            child: Text(
              juben.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Tracker.instance.track(TrackEvent.click,
                  properties: {'click_page': 'click_oderbook'});
              onItemOrder(index);
            },
            child: Container(
              width: 68,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(15),
                gradient:
                    LinearGradient(colors: R.color.mainBrandGradientColors),
              ),
              alignment: AlignmentDirectional.center,
              child: Text(
                K.room_order_drama,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
