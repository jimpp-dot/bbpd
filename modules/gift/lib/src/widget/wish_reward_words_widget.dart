import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:gift/k.dart';

import '../../assets.dart';
import '../wish_gift/wish_help_rank_bottom_sheet.dart';

/// 心愿答谢榜单

class WishRewardWorldsWidget extends StatefulWidget {
  final int rid; // 房间ID

  final List<String>? topSenders; // 助力榜单头像

  final int senderNum; // 总的助力人数

  const WishRewardWorldsWidget({
    Key? key,
    required this.rid,
    this.topSenders,
    this.senderNum = 0,
  }) : super(key: key);

  @override
  State<WishRewardWorldsWidget> createState() => _WishRewardWorldsWidgetState();
}

class _WishRewardWorldsWidgetState extends State<WishRewardWorldsWidget> {
  @override
  Widget build(BuildContext context) {
    return Util.validList(widget.topSenders)
        ? InkWell(
            onTap: () {
              WishHelpRankBottomSheet.show(context, rid: widget.rid);
            },
            child: Container(
              padding: const EdgeInsetsDirectional.only(
                  top: 10, bottom: 15, start: 16, end: 10),
              child: SizedBox(
                height: 26,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      K.gift_accomplish_reward_words,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6), fontSize: 13),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 26 * 3 - 4 * 2,
                          height: 26,
                          child: Stack(
                            children: [
                              if (Util.parseInt(
                                      widget.topSenders?.take(3).length) >=
                                  3)
                                PositionedDirectional(
                                  top: 0,
                                  bottom: 0,
                                  start: 0 * 22,
                                  child: _buildAvatarItem(
                                      widget.topSenders?[2] ?? ''),
                                ),
                              if (Util.parseInt(
                                      widget.topSenders?.take(3).length) >=
                                  2)
                                PositionedDirectional(
                                  top: 0,
                                  bottom: 0,
                                  start: 1 * 22,
                                  child: _buildAvatarItem(
                                      widget.topSenders?[1] ?? ''),
                                ),
                              if (Util.parseInt(
                                      widget.topSenders?.take(3).length) >=
                                  1)
                                PositionedDirectional(
                                  top: 0,
                                  bottom: 0,
                                  start: 2 * 22,
                                  child: _buildAvatarItem(
                                      widget.topSenders?[0] ?? ''),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${Util.parseInt(widget.senderNum)}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 11),
                        ),
                        Text(
                          K.gift_who_many_people_help_wish,
                          style: const TextStyle(
                              color: Color(0x80FFFFFF), fontSize: 11),
                        ),
                        const SizedBox(width: 6),
                        R.img(
                          Assets.ic_next_small_svg,
                          width: 16,
                          height: 16,
                          package: ComponentManager.MANAGER_GIFT,
                          color: const Color(0x80FFFFFF),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        : const SizedBox(height: 12);
  }

  Widget _buildAvatarItem(String url) {
    return Container(
      width: 26,
      height: 26,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(13),
        color: Colors.white,
      ),
      child: CommonAvatar(
        path: url,
        size: 25,
        shape: BoxShape.circle,
      ),
    );
  }
}
