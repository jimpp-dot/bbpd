import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';

import '../models/InvisiblePckWrapper.dart';

class InvisibleManShopCartItem extends StatefulWidget {
  final InvisiblePckWrapper item;
  final String desc;
  final int index;
  final VoidCallback? onAddTapped;
  final VoidCallback? onDeleteTapped;
  const InvisibleManShopCartItem(
      {Key? key,
      required this.item,
      this.desc = '',
      this.index = 0,
      this.onAddTapped,
      this.onDeleteTapped})
      : super(key: key);

  @override
  State<InvisibleManShopCartItem> createState() =>
      _InvisibleManShopCartItemState();
}

class _InvisibleManShopCartItemState extends State<InvisibleManShopCartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsetsDirectional.only(start: 20, end: 15),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  child: Text(
                    '${widget.index + 1}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.item.pck.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.desc,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6), fontSize: 11),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: Util.width - 75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                MoneyConfig.moneyNum(
                                    widget.item.pck.price * widget.item.num),
                                style: const TextStyle(
                                    color: Color(0xFF5AEDFF),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(width: 2),
                              Image.asset(MoneyConfig.moneyIcon,
                                  width: 20, height: 20),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.item.num > 0) ...[
                                GestureDetector(
                                  onTap: widget.onDeleteTapped,
                                  child: R.img(
                                      RoomAssets
                                          .chat_room$invisible_man_ic_delete_webp,
                                      width: 26,
                                      height: 26),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '${widget.item.num}',
                                  style: const TextStyle(
                                      color: Color(0xFFFFC936),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(width: 10),
                              ],
                              GestureDetector(
                                onTap: widget.onAddTapped,
                                child: R.img(
                                    RoomAssets
                                        .chat_room$invisible_man_ic_add_webp,
                                    width: 26,
                                    height: 26),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: Colors.white.withOpacity(0.3),
            height: 0.5,
          )
        ],
      ),
    );
  }
}
