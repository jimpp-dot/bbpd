import 'package:shared/shared.dart';
import 'package:chat_room/assets.dart';
import 'package:flutter/material.dart';
import 'package:chat_room/k.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import '../models/generated/common_invisible.pb.dart';

/// 隐形侠-->切换购买权益(已购买权益)

class InvisibleManSwitchBuyAuthority extends StatefulWidget {
  final VoidCallback? switchBuyTapped;
  final ValueNotifier<bool>? controller;
  final InvisibleItem? item;

  const InvisibleManSwitchBuyAuthority(
      {Key? key, this.switchBuyTapped, this.controller, this.item})
      : super(key: key);

  @override
  State<InvisibleManSwitchBuyAuthority> createState() =>
      _InvisibleManSwitchBuyAuthorityState();
}

class _InvisibleManSwitchBuyAuthorityState
    extends State<InvisibleManSwitchBuyAuthority> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(width: 4),
              R.img(
                  RoomAssets.chat_room$invisible_man_ic_invisible_man_head_webp,
                  width: 64,
                  height: 64),
              const SizedBox(width: 4),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    K.room_switch_buy_authority,
                    style: const TextStyle(
                        color: Color(0xFF4D3DFD),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: Util.width - (40 + 64 + 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            widget.switchBuyTapped?.call();
                          },
                          child: Container(
                            width: 138,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(8),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.4),
                                  width: 1),
                              color: Colors.white.withOpacity(0.3),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 6, end: 6),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.item?.name ?? '',
                                      style: const TextStyle(
                                          color: Color(0xFF4D3DFD),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  Container(
                                    width: 12,
                                    height: 12,
                                    alignment: AlignmentDirectional.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      gradient: const LinearGradient(
                                        begin: AlignmentDirectional.topStart,
                                        end: AlignmentDirectional.bottomEnd,
                                        colors: [
                                          Color(0xFFFFDC41),
                                          Color(0xFFFF991C)
                                        ],
                                      ),
                                    ),
                                    child: R.img(
                                        RoomAssets.chat_room$ic_arrow_down_png,
                                        width: 10,
                                        height: 10),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '${K.room_nobility_validity_to}${formatTime(widget.item?.expireTime ?? 0)}',
                          style: const TextStyle(
                              color: Color(0xFF3325E0), fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 4),
            ],
          ),
        ),
        PositionedDirectional(
          top: 12,
          end: 12,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                K.room_open_authority,
                style: const TextStyle(color: Color(0xFF3325E0), fontSize: 12),
              ),
              const SizedBox(width: 2),
              AdvancedSwitch(
                activeColor: const Color(0xFF006FFC),
                inactiveColor: Colors.grey.withOpacity(0.5),
                thumb: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    gradient: const LinearGradient(
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                      colors: [Color(0xFFFFDC41), Color(0xFFFF991C)],
                    ),
                  ),
                ),
                width: 28,
                height: 16,
                controller: widget.controller,
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// 格式化时间
  String formatTime(int time) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    String month =
        dateTime.month < 10 ? '0${dateTime.month}' : '${dateTime.month}';
    String day = dateTime.day < 10 ? '0${dateTime.day}' : '${dateTime.day}';
    return '${dateTime.year}.$month.$day';
  }
}
