import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:gift/k.dart';

import '../../assets.dart';

/// 编辑答谢文案

class WishEditRewardWordsWidget extends StatefulWidget {
  final bool isCreatorOrReception; // 房主或接待

  final bool isEdit; // 是否可编辑，只有房主或接待才有编辑权限

  final String? rewardWords; // 答谢文案

  final VoidCallback? rewardWordsEditCallback; // 答谢文案编辑回调

  final EdgeInsetsGeometry padding;

  const WishEditRewardWordsWidget({
    Key? key,
    this.isCreatorOrReception = false,
    this.isEdit = false,
    this.rewardWords,
    this.rewardWordsEditCallback,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  State<WishEditRewardWordsWidget> createState() =>
      _WishEditRewardWordsWidgetState();
}

class _WishEditRewardWordsWidgetState extends State<WishEditRewardWordsWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.isCreatorOrReception) {
      // 房主或接待视觉
      return Padding(
        padding: widget.padding,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Util.validStr(widget.rewardWords)
                    ? '${widget.rewardWords}'
                    : K.gift_edit_reward_words,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
              if (widget.isEdit) ...[
                const SizedBox(width: 2),
                GestureDetector(
                  onTap: widget.rewardWordsEditCallback,
                  child: R.img(Assets.gift$ic_edit_webp, width: 16, height: 16),
                ),
              ]
            ],
          ),
        ),
      );
    } else {
      // 用户视觉
      if (Util.validStr(widget.rewardWords)) {
        return Padding(
          padding: widget.padding,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.rewardWords ?? '',
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    }
  }
}
