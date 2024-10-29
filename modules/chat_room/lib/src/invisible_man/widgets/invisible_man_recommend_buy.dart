import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:chat_room/k.dart';
import 'package:flutter/material.dart';

import '../models/InvisiblePckWrapper.dart';

/// 隐形侠-->推荐购买套餐(未购买权益)

class InvisibleManRecommendBuy extends StatefulWidget {
  final InvisiblePckWrapper? data;
  final void Function(InvisiblePckWrapper?)? onBuyTapped;
  const InvisibleManRecommendBuy({Key? key, this.data, this.onBuyTapped})
      : super(key: key);

  @override
  State<InvisibleManRecommendBuy> createState() =>
      _InvisibleManRecommendBuyState();
}

class _InvisibleManRecommendBuyState extends State<InvisibleManRecommendBuy> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Row(
          children: [
            const SizedBox(width: 8),
            R.img(RoomAssets.chat_room$invisible_man_ic_invisible_man_head_webp,
                width: 64, height: 64),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${K.room_menu_invisible_man}${widget.data?.pck.name ?? ''}',
                    style: const TextStyle(
                        color: Color(0xFF4D3DFD),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.data?.pck.desc ?? '',
                    style: const TextStyle(
                        color: Color(0xFF4D3DFD),
                        fontSize: 11,
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (widget.onBuyTapped != null) {
                  widget.onBuyTapped!(widget.data);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(8),
                  border:
                      Border.all(color: const Color(0xFFD0FFFD), width: 0.5),
                  gradient: const LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: [Color(0xFFAC41FF), Color(0xFF006FFC)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 7.0),
                  child: Text(
                    K.room_fans_privilege_bag_buy,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
        PositionedDirectional(
          top: 0,
          end: 0,
          child: Container(
            width: 38,
            height: 20,
            alignment: AlignmentDirectional.center,
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(1),
                topEnd: Radius.circular(8),
                bottomStart: Radius.circular(10),
                bottomEnd: Radius.circular(0),
              ),
              gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [Color(0xFFFFDC41), Color(0xFFFF991C)],
              ),
            ),
            child: Text(
              K.room_vehicle_recommend,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    );
  }
}
