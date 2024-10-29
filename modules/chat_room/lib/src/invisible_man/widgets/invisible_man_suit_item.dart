import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';

import '../models/InvisiblePckWrapper.dart';

class InvisibleManSuitItem extends StatefulWidget {
  final InvisiblePckWrapper item;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onAddTapped;
  final VoidCallback? onDeleteTapped;

  const InvisibleManSuitItem({
    Key? key,
    required this.item,
    this.padding = const EdgeInsetsDirectional.only(start: 8, end: 8, top: 8),
    this.onAddTapped,
    this.onDeleteTapped,
  }) : super(key: key);

  @override
  State<InvisibleManSuitItem> createState() => _InvisibleManSuitItemState();
}

class _InvisibleManSuitItemState extends State<InvisibleManSuitItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          gradient: const LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [Color(0xFF6968FF), Color(0xFF9274FF)],
          ),
          image: const DecorationImage(
            image: AssetImage(
                RoomAssets.invisible_man_ic_suit_card_mask_bg_webp,
                package: ComponentManager.MANAGER_BASE_ROOM),
            fit: BoxFit.fill,
          ),
        ),
        child: GradientBorder(
          borderWidth: 1.5,
          borderRadius: 12.0,
          borderGradient: const LinearGradient(
            colors: [Color(0xFF8AF1FF), Color(0xFFFFF3A4)],
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 34,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.item.pck.name,
                        style: const TextStyle(
                            color: Color(0xFFFFC936),
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        widget.item.pck.desc,
                        style: const TextStyle(
                            color: Color(0xFFFFEA82), fontSize: 11.0),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.white.withOpacity(0.3), height: 0.5),
                ...widget.item.pck.invisibleList
                    .map(
                      (e) => SizedBox(
                        width: Util.width - 36 - 40 - 72,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              e.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              e.desc,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w500),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${MoneyConfig.moneyNum(widget.item.pck.price)}/${widget.item.pck.unit}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500),
                          ),
                          Image.asset(MoneyConfig.moneyIcon,
                              width: 12, height: 12),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.item.num > 0) ...[
                            GestureDetector(
                              onTap: widget.onDeleteTapped,
                              child: Container(
                                width: 22,
                                height: 22,
                                alignment: AlignmentDirectional.center,
                                child: R.img(
                                    RoomAssets
                                        .chat_room$invisible_man_ic_delete_webp,
                                    width: 18,
                                    height: 18),
                              ),
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
                            child: Container(
                              width: 22,
                              height: 22,
                              alignment: AlignmentDirectional.center,
                              child: R.img(
                                  RoomAssets
                                      .chat_room$invisible_man_ic_add_webp,
                                  width: 18,
                                  height: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
